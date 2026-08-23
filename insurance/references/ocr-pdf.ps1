param(
  [Parameter(Mandatory=$true)][string]$Pdf,
  [Parameter(Mandatory=$true)][string]$Out,
  [int]$First = 1,
  [int]$Last  = 0,
  [uint32]$Width = 2400,
  [int]$Cols = 210
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Runtime.WindowsRuntime | Out-Null
$null = [Windows.Storage.StorageFile,               Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Data.Pdf.PdfDocument,              Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Data.Pdf.PdfPageRenderOptions,     Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Storage.Streams.InMemoryRandomAccessStream, Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Graphics.Imaging.BitmapDecoder,    Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Graphics.Imaging.SoftwareBitmap,   Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Media.Ocr.OcrEngine,               Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Globalization.Language,             Windows.Foundation, ContentType=WindowsRuntime]

$mAsTaskT = ([System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
  $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and
  $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1' })[0]
$mAsTaskA = ([System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
  $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and
  $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncAction' })[0]

function Await($op, $t) {
  $task = $mAsTaskT.MakeGenericMethod($t).Invoke($null, @($op))
  $task.Wait(-1) | Out-Null; $task.Result
}
function AwaitAct($op) {
  $task = $mAsTaskA.Invoke($null, @($op)); $task.Wait(-1) | Out-Null
}

$engine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromLanguage((New-Object Windows.Globalization.Language 'en-US'))
if ($null -eq $engine) { throw 'khong tao duoc OcrEngine' }

$sf  = Await ([Windows.Storage.StorageFile]::GetFileFromPathAsync($Pdf)) ([Windows.Storage.StorageFile])
$doc = Await ([Windows.Data.Pdf.PdfDocument]::LoadFromFileAsync($sf))   ([Windows.Data.Pdf.PdfDocument])
$n = $doc.PageCount
if ($Last -le 0 -or $Last -gt $n) { $Last = $n }
Write-Output "PAGES_TOTAL=$n  doing $First..$Last"

$sb = New-Object System.Text.StringBuilder
for ($i = $First; $i -le $Last; $i++) {
  $page = $doc.GetPage([uint32]($i-1))
  $stream = New-Object Windows.Storage.Streams.InMemoryRandomAccessStream
  $opt = New-Object Windows.Data.Pdf.PdfPageRenderOptions
  $opt.DestinationWidth = $Width
  AwaitAct ($page.RenderToStreamAsync($stream, $opt))
  $dec = Await ([Windows.Graphics.Imaging.BitmapDecoder]::CreateAsync($stream)) ([Windows.Graphics.Imaging.BitmapDecoder])
  $bmp = Await ($dec.GetSoftwareBitmapAsync()) ([Windows.Graphics.Imaging.SoftwareBitmap])
  $res = Await ($engine.RecognizeAsync($bmp)) ([Windows.Media.Ocr.OcrResult])
  $imgW = [double]$dec.PixelWidth

  [void]$sb.AppendLine("")
  [void]$sb.AppendLine("========== PAGE $i ==========")
  foreach ($ln in $res.Lines) {
    $buf = New-Object System.Text.StringBuilder
    foreach ($w in $ln.Words) {
      $c = [int][Math]::Round(($w.BoundingRect.X / $imgW) * $Cols)
      if ($c -lt $buf.Length) { $c = $buf.Length + 1 }
      while ($buf.Length -lt $c) { [void]$buf.Append(' ') }
      [void]$buf.Append($w.Text)
    }
    [void]$sb.AppendLine($buf.ToString().TrimEnd())
  }
  $bmp.Dispose(); $stream.Dispose()
  if ($i % 10 -eq 0) { Write-Output "  ...page $i" }
}
[System.IO.File]::WriteAllText($Out, $sb.ToString(), (New-Object System.Text.UTF8Encoding $false))
Write-Output "WROTE $Out"
