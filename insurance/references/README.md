# references — tài liệu gốc (công ty neo: **Bảo Việt — BVH**)

Cùng luật với [banking/references](../../banking/references/README.md): mọi số `[CTY]`/`[BCTC]` phải
trích được về một file ở đây; chỉ tài liệu công khai; không commit file lớn.

Mọi số đã dùng đều có phép kiểm số học trong **[verification-bvh.md](verification-bvh.md)** — **60 phép
kiểm** trên 5 nguồn, kể cả các lỗi đã bắt được của từng nguồn và các thứ **không** tính được.

## Vì sao chọn BVH

Bảo Việt niêm yết HOSE, và là **tập đoàn có cả hai nửa của ngành** — nhân thọ (Bảo Việt Nhân thọ),
phi nhân thọ (Bảo hiểm Bảo Việt), cộng quản lý quỹ (BVF) và chứng khoán (BVSC). Cấu trúc này song song
với Techcombank ở phần banking, nên hai thư viện so sánh được với nhau.

Lưu ý về pháp nhân: **Tập đoàn Bảo Việt** (MST 0100111761, vốn điều lệ 7.423.227.640.000 đ,
742.322.764 cp) ngành nghề chính là *"đầu tư vốn vào các công ty con, công ty liên kết"* — nó là một
**holding**. Nghiệp vụ bảo hiểm nằm ở các công ty con, nên **BCTC riêng lẻ của Tập đoàn không chứa
nghiệp vụ bảo hiểm**.

## Trạng thái tài liệu

| # | Tài liệu | Cho cái gì | Đã có |
|---|---|---|:--:|
| 1 | **BCTC hợp nhất Q3/2025 + thuyết minh** *(trước soát xét)* | ⭐ Nguồn của gần như toàn bộ thư viện. Thuyết minh 4.16 (chính sách dự phòng của BVH) · 24 (dự phòng **tách nhân thọ/phi nhân thọ**) · 26 (phí và bồi thường **tách hai nửa**) · 35 (báo cáo bộ phận) | ✅ |
| 2 | **BCTC riêng lẻ Q3/2025** *(trước soát xét)* | ⚠️ Hoá ra **gần như không dùng được** — là báo cáo của công ty mẹ holding, chỉ có thu nhập đầu tư, không có nghiệp vụ bảo hiểm | ✅ *(giá trị thấp)* |
| 3 | **BCTC hợp nhất + riêng Q2/2026** *(trước soát xét)* | Kỳ **mới nhất**. Cùng cấu trúc thuyết minh 24/26 → tách nhân thọ / phi nhân thọ cho H1/2026. Bản riêng vẫn là holding, vẫn ít giá trị | ✅ |
| 4 | **Báo cáo thường niên 2025** (346 tr., **có lớp text**) | ⭐ Nguồn duy nhất cho **tầng thị trường**: quy mô ngành 237,2 nghìn tỷ, tách nhân thọ/phi nhân thọ, tăng trưởng theo nghiệp vụ, thị phần, và **kết quả từng pháp nhân** (BVNT · BHBV · BVF · công ty mẹ) | ✅ |
| 5 | **4 file `.xls`** (KQKD · CĐKT · LCTT · tóm tắt) | Chuỗi **4 quý Q3/2025→Q2/2026**, máy đọc được. Dùng làm **đối chứng độc lập** cho bản OCR — hơn 30 dòng khớp tuyệt đối. ⚠️ Có 3 lỗi, xem §6 verification | ✅ |
| 6 | **BCTC riêng của Bảo hiểm Bảo Việt** (công ty con phi nhân thọ) | 🔴 **Thứ còn thiếu quan trọng nhất.** Là điều kiện duy nhất để tính **expense ratio và combined ratio phi nhân thọ**. Thay thế gần nhất hiện có: biên LNST 2,32% của BHBV | ☐ |
| 7 | **BCTC năm 2025 đã kiểm toán** | Bản quý là *trước soát xét*, và thuyết minh chính sách bản năm đầy đủ hơn | ☐ |
| 8 | **Thông tư 67/2023/TT-BTC** + **Nghị định 46/2023/NĐ-CP** | `[QĐ]` — công thức và ngưỡng **tỷ lệ an toàn vốn** mới. **Cả BCTC quý lẫn báo cáo thường niên đều không công bố** chỉ số này | ☐ |
| 9 | Bản tin thị trường bảo hiểm (Cục QLGS bảo hiểm / IAV) *(tuỳ chọn)* | Số ngành gốc thay vì qua trung gian — đáng có vì báo cáo thường niên dẫn IAV **không nhất quán** | ☐ |

**Hai lần kế hoạch tài liệu phải sửa lại — đáng ghi vì đó là cách việc này thực sự diễn ra:**

1. Yêu cầu ban đầu là *"BCTC riêng lẻ / theo bộ phận, **bắt buộc** để tách nhân thọ / phi nhân thọ"*.
   Hoá ra **BCTC riêng lẻ hoàn toàn sai hướng** — nó là báo cáo của công ty mẹ holding, không có nghiệp
   vụ bảo hiểm. Còn thứ cần thì **nằm sẵn bên trong bản hợp nhất**: thuyết minh 24 và 26 tách hai nửa
   cho phí, bồi thường và dự phòng.
2. Nhưng bản hợp nhất *không* tách **hoa hồng, chi phí bán hàng và chi phí QLDN** theo nửa. Nên yêu cầu
   đổi thành **BCTC của riêng công ty con phi nhân thọ (BHBV)** — hẹp hơn và cụ thể hơn nhiều so với
   yêu cầu ban đầu.

Bài học: **danh sách tài liệu cần chỉ đúng sau khi đã đọc tài liệu.** Lần đầu lập danh sách là phỏng
đoán, không phải kế hoạch.

## Chỉ số đã rút ra

### Phi nhân thọ — 9T/2025 (triệu đồng)

| Chỉ số | Giá trị | Nguồn |
|---|---:|---|
| Phí bảo hiểm gốc | 8.225.802 | TM 26 · PDF tr.67 |
| Phí nhận tái bảo hiểm | 324.671 | TM 26 |
| Phí nhượng tái bảo hiểm | (2.824.103) | TM 26 |
| **Phí giữ lại** · tỷ lệ giữ lại | **5.726.370** · **66,97%** | tính · kiểm 40 |
| **Doanh thu phí thuần (earned)** | **5.610.073** | tính · kiểm 40 |
| Bồi thường thuần đã phát sinh | 2.581.671 | tính |
| **Loss ratio** | **46,02%** | tính |
| Còn lại cho hoa hồng + bộ máy | 2.913.836 = **51,94%** | tính |
| **Expense ratio** | 🔴 không tính được | chi phí không tách theo nửa |
| **Combined ratio** | 🔴 không tính được | *(mức bộ phận gộp: 117,52%)* |
| Dự phòng nghiệp vụ gross · thuần | 8.741.115 · **5.441.105** | TM 24 · PDF tr.63 |

### Nhân thọ — 9T/2025 (triệu đồng)

| Chỉ số | Giá trị | Nguồn |
|---|---:|---|
| Phí bảo hiểm gốc | 24.199.241 | TM 26 |
| Doanh thu phí thuần | 24.191.027 | tính · kiểm 40 |
| Chi bồi thường gốc + chi trả đáo hạn | 12.035.562 | TM 26 |
| **Δ dự phòng toán học** | **+11.129.164** | TM 24 |
| Dự phòng toán học (số dư) | **168.277.749** | TM 24 · bảng CĐ `344.1` |
| Δ dự phòng lãi cam kết đầu tư tối thiểu | **+754.259** *(hoàn nhập)* | TM 24 · KQKD `24` |
| Dự phòng lãi cam kết (số dư) | **15.987.478** | TM 24 |
| Δ dự phòng chia lãi · số dư | +404.129 · 3.925.131 | TM 24 |
| APE · NBV · persistency | 🔴 **không có ở đâu cả** — báo cáo thường niên cũng không công bố. Thay thế gần nhất: doanh thu khai thác mới của BVNT **+24,8%** năm 2025 | |
| Tỷ suất đầu tư vs lãi suất cam kết | 🔴 không công bố *(chỉ suy được qua dấu của dự phòng)* | |

### Toàn tập đoàn — 9T/2025 / 30-9-2025

| Chỉ số | Giá trị | Nguồn |
|---|---:|---|
| Doanh thu phí bảo hiểm | 32.488.927 tr · **+3,13%** yoy | KQKD `01` |
| Doanh thu phí thuần | 29.801.100 tr | KQKD `08` |
| Lợi nhuận gộp HĐKD bảo hiểm | **1.414.659** tr *(9T/2024: −1.036.263)* | KQKD `42` |
| Lợi nhuận hoạt động tài chính | **8.211.684** tr = **3,08× LNTT** | KQKD `44` |
| LNTT | 2.664.795 tr | KQKD `50` |
| LNST · của chủ sở hữu | 2.188.618 · 2.119.232 tr · **+35,25%** yoy | KQKD `60`/`61` |
| EPS | 2.855 đ | KQKD `70` |
| Tổng tài sản | **272.801.453** tr *(+8,56% từ 31/12/2024)* | bảng CĐ |
| **Dự phòng nghiệp vụ** | **197.433.095** tr = **72,37%** tài sản | bảng CĐ `344` |
| Vốn chủ sở hữu | 25.557.825 tr = **9,37%** tài sản | bảng CĐ `440` |
| Quỹ dự trữ bắt buộc hoạt động bảo hiểm | 807.884 tr | bảng CĐ |
| Tỷ lệ an toàn vốn *(cơ chế mới)* | 🔴 không công bố ở BCTC quý lẫn báo cáo thường niên | cần #8 |
| ROA · ROE *(xấp xỉ, quy năm)* | ~1,11% · ~11,52% | tính — **xem cảnh báo** |

## Bốn câu hỏi ban đầu — đã trả lời 4/4

- [x] **Combined ratio phi nhân thọ có vượt 100%?**
      → **Ở mức bộ phận bảo hiểm (gộp hai nửa): 117,5%.** Nghiệp vụ lỗ **5.323 tỷ**, đầu tư lãi
      **7.449 tỷ** = **3,40× LNTT bộ phận**. Bỏ hết thu nhập đầu tư thì bộ phận bảo hiểm lỗ.
      **Nhưng con số này không phải combined ratio theo nghĩa gốc** — bỏ Δ dự phòng toán học ra thì nó
      xuống **80,9%**. Riêng phi nhân thọ: **loss ratio 46,02%** tính được, expense ratio thì không.
      Chi tiết: [02-metrics](../02-metrics/README.md).
- [x] **Chính sách dự phòng của BVH có khác TCGI/TCLI?**
      → **Khác đáng kể.** Dao động lớn **2% vs 1%**; đảm bảo cân đối phi nhân thọ **2% vs 1%**; dự phòng
      phí chưa hưởng **25% cố định / phương pháp 1/8** vs **trích theo từng ngày**; dự phòng toán học
      **max(một trong ba phương pháp kể cả Zillmer, mức tối thiểu luật định)** vs **max của hai**.
      IBNR 3% thì giống nhau. → **Xác nhận: tỷ lệ trích lập là lựa chọn doanh nghiệp được BTC phê duyệt,
      không phải hằng số ngành.** Bảng đối chiếu đầy đủ: [01-domain-analysis](../01-domain-analysis/README.md).
- [x] **BVH có còn trích dự phòng dao động lớn, hay đã dừng theo CMKT 19?**
      → **Vẫn trích, và ở tỷ lệ gấp đôi TCGI.** Số dư 186.907.656.143 → **227.678.022.034**,
      tăng **+40.770.365.891** trong 9T/2025. Xung đột *quy định vs chuẩn mực* là **hiện tượng toàn
      ngành**, không phải chuyện riêng một công ty.
- [x] **Tỷ suất đầu tư có cao hơn lãi suất cam kết?**
      → **9T/2025: có.** Dự phòng đảm bảo lãi suất cam kết được **hoàn nhập 754.259 tr** (dự phòng chỉ
      trích khi đầu tư *thấp hơn* cam kết). **9T/2024: không** — phải trích thêm 3.597.159 tr. Cú đảo
      chiều 4.351.418 tr này giải thích **178%** biến động lợi nhuận gộp bảo hiểm giữa hai kỳ.

Còn mở: **tỷ lệ an toàn vốn** theo cơ chế mới — cần tài liệu #8, `[?]`. Đây là câu `[?]` duy nhất còn
lại, và nó không đóng được bằng tài liệu doanh nghiệp: phải đọc trực tiếp văn bản pháp lý.

## Ba câu hỏi mới, sinh ra từ các tài liệu bổ sung

- [x] **BVH đang thắng hay thua thị trường?** → **Thua ở nửa đang tăng, thắng ở nửa đang đứng.**
      Phi nhân thọ: BHBV **+6,5%** vs thị trường **+10,3%** (≈60% mức bình quân), giữ hạng 2 với 12,6%
      thị phần. Nhân thọ: BVNT **+1,5%** vs thị trường **−1,9%**, giữ hạng 1 với 20,3%. Chẩn đoán này
      **không rút ra được từ BCTC** — phải có số ngành.
- [x] **Phi nhân thọ có kiếm được tiền không?** → **Gần như không.** BHBV, doanh nghiệp phi nhân thọ
      lớn thứ 2 Việt Nam, đạt LNST **300 tỷ trên 12.920 tỷ doanh thu** = biên **2,32%**. Cùng tập đoàn,
      công ty quản lý quỹ BVF có biên **38,64%** — gấp 17 lần.
- [x] **Bản kết xuất `.xls` có dùng thay PDF được không?** → **Không, nhưng dùng để đối chứng thì rất
      tốt.** Hơn 30 dòng khớp tuyệt đối với bản OCR (xác nhận OCR không sai hệ thống), nhưng bản kết
      xuất **thiếu giá trị, đảo dấu, gán sai nhãn** và **không có phân rã dự phòng nghiệp vụ**. Chi
      tiết §6 của [verification-bvh.md](verification-bvh.md).

## Ghi chú kỹ thuật

Cùng bộ công cụ đã dùng cho banking — xem [banking/references/README.md](../../banking/references/README.md):
`pdftotext -layout` có sẵn trong Git Bash; file `.xls` từ CafeF/Vietstock thực chất là HTML, dùng
[`../../banking/references/xls2tsv.py`](../../banking/references/xls2tsv.py).

### Ba dạng tài liệu, ba cách xử lý

| Dạng | Ví dụ | Cách trích | Lỗi đặc trưng |
|---|---|---|---|
| **PDF scan** (không font) | BCTC hợp nhất Q3/2025, Q2/2026 | OCR — [`ocr-pdf.ps1`](ocr-pdf.ps1) | lỗi ký tự trong số · trộn cột |
| **PDF có lớp text** | Báo cáo thường niên 2025 | `pdftotext -layout` | rơi dấu tiếng Việt · số mâu thuẫn giữa các trang |
| **HTML đội tên `.xls`** | 4 file kết xuất | [`xls2tsv.py`](../../banking/references/xls2tsv.py) | thiếu giá trị · đảo dấu · gán sai nhãn |

Cách nhận dạng nhanh, chạy trước khi làm gì khác:

```bash
pdftotext -layout -f 1 -l 12 "<file>.pdf" out.txt && wc -c out.txt
head -c 120 "<file>.xls"
```

`wc -c` gần 0 → scan, phải OCR. `head` ra `<html ...>` → dùng `xls2tsv.py`, không phải Excel.

### Bản CBTT của BVH là PDF scan — cần OCR

Khác hoàn toàn với banking. File Techcombank là PDF có lớp text, `pdftotext` chạy ra ngay. Hai file
BVH thì **không có một font nào**: 84 trang, 168 ảnh (CCITT G4 + JPEG). Đây là bản công bố thông tin
có chữ ký, tức **ảnh chụp giấy**. `pdftotext` trả về **0 dòng** — không phải lỗi, mà là không có gì
để trích.

Máy này không có `tesseract`, `pdftoppm`, `pdfimages`, `PIL`, `pypdf`, `pdfplumber`, `markitdown`.
Đường đi được là **OCR có sẵn trong Windows 10**, gọi qua PowerShell:

| Thành phần | API WinRT | Việc |
|---|---|---|
| Render trang PDF → ảnh | `Windows.Data.Pdf.PdfDocument` | thay `pdftoppm` |
| Giải mã ảnh → bitmap | `Windows.Graphics.Imaging.BitmapDecoder` | thay `PIL` |
| OCR | `Windows.Media.Ocr.OcrEngine` | thay `tesseract` |

Script: [`ocr-pdf.ps1`](ocr-pdf.ps1) — không cần cài gì. 84 trang mất khoảng 4 phút.

```powershell
powershell -NoProfile -File ocr-pdf.ps1 -Pdf "<file>.pdf" -Out out.txt -First 1 -Last 84 -Width 2600 -Cols 230
```

**Ba điều phải biết trước khi tin kết quả:**

1. **Chỉ có gói ngôn ngữ `en-US`.** `OcrEngine.AvailableRecognizerLanguages` trả về đúng một dòng —
   **không có tiếng Việt**. Chữ Việt bị đọc sai dấu một cách ngẫu nhiên: *"Tập đoàn Bảo Việt"* ra
   `Tåp doån Båo Viét`, *"Bảng cân đối"* ra `Bång can dbi`. Đọc được, nhưng **không grep được theo chữ
   có dấu**. Grep phải dùng phần không dấu và chấp nhận nhiễu.
2. **Số đọc *phần lớn* đúng — nhưng không phải luôn luôn.** Cùng một con số vốn điều lệ ra
   `7.423.227.640.000` ở file này và `703.227R40.ooo` ở file kia. Đã bắt **7 lỗi ký tự trong số**, tất
   cả bằng cộng dọc chứ không bằng đọc lại — liệt kê đầy đủ trong [verification-bvh.md](verification-bvh.md).
   Nên: **số OCR chỉ được dùng sau khi qua một phép kiểm số học.** Không có ngoại lệ.
3. **`OcrResult` không có khái niệm cột.** Nó cho từng *dòng* và toạ độ từng *từ*. Script tự dựng lại
   layout bằng cách quy `x` của mỗi từ về số cột. Cách này **gần đúng, không chính xác** — cạm bẫy
   lệch cột của PDF ở banking ở đây **nặng hơn**, vì tọa độ đến từ nhận dạng ảnh chứ không từ file.
   Bảng cân đối bị trộn cột nặng nhất (nhãn dồn một khối, số dồn khối khác); báo cáo KQKD thì sạch.

### Bốn luật khi rút số

1. **Bảng nhiều cột bị lệch dòng khi trích** — lấy số từ câu văn tường thuật trước, rồi dùng số học
   kiểm chứng bảng. Với OCR thì bắt buộc: **mọi con số dùng để kết luận phải qua một phép kiểm số học**
   (cộng dọc, hoặc tái tạo lại một tỷ lệ đã công bố).
2. **Luôn kiểm cộng dọc trước khi dùng một file cân đối** (tổng tài sản = tổng nợ + vốn chủ). Ở
   banking, phép kiểm này phát hiện một file export lỗi mà đọc qua thấy hoàn toàn bình thường. Ở BVH
   phép kiểm này **đạt**: 247.243.627.277.116 + 25.557.825.433.774 = 272.801.452.710.890 ✅
3. **Ghi rõ trang PDF cho mỗi số.** Mục lục cho: bảng cân đối tr.3–6, KQKD tr.7–10, LCTT tr.11–12,
   thuyết minh tr.13–80 → **trang PDF = trang báo cáo + 4**.
4. **Luật mới, học được ở đây:** phép kiểm mạnh nhất không phải cộng dọc trong một bảng, mà là **nối
   hai báo cáo khác nhau qua từng cấu phần**. Sáu phép kiểm 28–33 trong verification buộc thuyết minh
   dự phòng (bảng cân đối) khớp với từng dòng biến động dự phòng (KQKD). Loại kiểm chứng này gần như
   không thể qua được nếu OCR sai.

## ⚠️ Giới hạn của bộ tài liệu hiện có

| Vấn đề | Hệ quả |
|---|---|
| **Quý 3/2025, "trước soát xét"** | Chưa kiểm toán, chưa soát xét. Số có thể đổi. Không phải BCTC năm — thuyết minh chính sách kế toán rút gọn hơn bản năm |
| **Báo cáo *riêng* là của công ty mẹ holding** | Không có nghiệp vụ bảo hiểm, chỉ có thu nhập đầu tư. Gần như không dùng được cho thư viện này |
| **Chi phí không tách theo nửa** | Hoa hồng, chi phí bán hàng, chi phí QLDN chỉ có ở mức gộp → **combined ratio phi nhân thọ không tính được** |
| **Không có phân rã theo nghiệp vụ / kênh** | Thuyết minh 35 chỉ *liệt kê danh mục* nghiệp vụ, không có số theo từng nghiệp vụ |
| **Quy năm từ 9 tháng** | ROA/ROE ở trên nhân ×4/3. Với nhân thọ, giả định đồng đều theo quý là **yếu**. Không dùng để so sánh liên công ty |
