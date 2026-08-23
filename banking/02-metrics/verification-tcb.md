# Kiểm chứng: tự tính lại chỉ số TCB từ báo cáo tài chính thô

Bốn file `.xls` trong [../references/](../references/) là **BCTC dạng bảng máy đọc được** — thứ mà
bản PDF scan không cho. Nhờ đó bài tập nâng được một bậc: thay vì **chép** chỉ số TCB công bố, ta
**tự tính lại** và so.

Đây chính là kỷ luật mà framework gọi là *evidence rule* — không tin một con số vì nó được in ra,
mà vì tái tạo được nó từ cấu phần.

## Dữ liệu

| File | Nội dung | Kỳ |
|---|---|---|
| `TCB_BCTC_Tom_Tat.xls` | P&L + bảng cân đối rút gọn | Q3-2025 → Q2-2026 (4 quý) |
| `TCB_KQKD.xls` | Kết quả kinh doanh chi tiết (có **thu nhập lãi gộp**) | 4 quý |
| `TCB_CDKT.xls` | Cân đối kế toán chi tiết (có **số dư dự phòng**, cấu phần vốn) | 4 quý |
| `TCB_LCTT.xls` | Lưu chuyển tiền tệ | 4 quý |

Đơn vị: tỷ VND. Số **hợp nhất** (consolidated) — điểm này quan trọng, xem mục *Hai chỗ lệch*.

## Kết quả kiểm chứng

### Khớp — 6 chỉ số

| Chỉ số | Tự tính | TCB công bố | Cách tính |
|---|---|---|---|
| **TOI** Q2-26 | **14.942** | 14.942 | NII 10.763,00 + ngoài lãi 4.178,78 |
| **CIR** Q2-26 | **30,92%** | 30,9% | 4.620,13 ÷ 14.941,78 |
| **LNTT** Q2-26 | **9.670,01** | 9.670 | LN trước dự phòng 10.321,65 − dự phòng 651,64 |
| **NIM** (LTM) | **3,62%** | 3,6% | NII 4 quý 40.998 ÷ bình quân tài sản sinh lời 1.132.856 |
| **Credit cost** (LTM) | **0,49%** | 0,5% | dự phòng 4 quý 3.904 ÷ dư nợ bình quân |
| **ROA** (LTM) | **2,35%** | 2,4% | LNST 4 quý 28.270 ÷ tổng tài sản bình quân |

Tài sản sinh lời được định nghĩa là: tiền gửi tại NHNN + tiền gửi & cho vay TCTD + chứng khoán kinh
doanh + cho vay khách hàng + chứng khoán đầu tư.

### Xác nhận thêm — chi phí vốn, số trước đó chỉ suy ra được

Bản PDF để chi phí vốn trong bảng phụ lục bị lệch cột nên chỉ suy được "~4,8%". Giờ tính trực tiếp:

| | Q2-2026, quy đổi năm |
|---|---|
| Thu nhập lãi gộp | 22.861,34 (`TCB_KQKD` dòng 1) |
| **Chi phí lãi** | **12.098,34** (= 22.861,34 − NII 10.763,00) |
| **Chi phí vốn** | **4,91%** (÷ bình quân nợ chịu lãi 985.154) |
| Lợi suất tài sản | 8,07% |

Nợ chịu lãi = nợ CP&NHNN + tiền gửi/vay TCTD + tiền gửi khách hàng + giấy tờ có giá.

**Chênh lệch 8,07% − 4,91% = 3,16%** là biên lãi thô của quý. Đây là con số mà estate `[v2]` không
bao giờ dựng được, vì nó không có bên nào của phép trừ này.

## Hai chỗ lệch — và đây là phần đáng học nhất

### ROE: 15,35% → **15,84%** vs công bố 16,0% — ĐÃ ĐÓNG

Giả thuyết ban đầu: nguyên nhân là **cửa sổ tính bình quân**. ROE trượt 12 tháng cần lợi nhuận 4 quý
(có đủ) và vốn chủ bình quân **5 điểm** từ Q2-2025 → Q2-2026; ta chỉ có 4 điểm từ Q3-2025.

Với **BCTC hợp nhất giữa niên độ 2025** (bản searchable), số tại 30/06/2025 đã có. Bảng trong PDF bị
lệch cột khi trích, nên tái tạo rồi **kiểm bằng ba phép cộng dọc — cả ba khớp tuyệt đối**:

| Kiểm | Phép tính | Kết quả |
|---|---|---|
| 1 | Vốn điều lệ 70.648.517 + thặng dư (59) + vốn khác 7.764.086 | = **78.412.544** = dòng *Vốn* ✓ |
| 2 | Vốn 78.412.544 + các quỹ 24.786.836 + LNCPP 54.414.630 + CĐ không kiểm soát 4.213.219 | = **161.827.229** = *TỔNG VCSH* ✓ |
| 3 | Tổng nợ 875.818.166 + tổng VCSH 161.827.229 | = **1.037.645.395** ✓ (khớp tổng tài sản công bố) |

→ **Vốn và các quỹ tại 30/06/2025 = 157.614,01 tỷ** (không gồm cổ đông không kiểm soát, cùng cách
định nghĩa với dòng trong `TCB_BCTC_Tom_Tat.xls`).

| Cách bình quân | Vốn chủ bq | ROE (LNST toàn bộ) | ROE (LNST NH mẹ) |
|---|---:|---:|---:|
| **5 điểm (Q2-25 → Q2-26)** | 178.445 | **15,84%** | 15,20% |
| 2 điểm đầu–cuối | 173.306 | 16,31% | 15,65% |

**Số công bố 16,0% nằm giữa hai quy ước bình quân.** Chênh còn **16 bps** với bình quân 5 điểm —
trong khoảng sai số của quy ước (bình quân số dư ngày thay vì cuối quý, đúng như TCB đã ghi cho NIM).

**Đính chính kết luận trước của tôi.** Khi chưa có số này, tôi đã viết rằng "giả thuyết đúng một phần
nhưng không đủ" và suy ra phải còn *một quy ước nữa chưa công bố*. Với số thật thì **giả thuyết ban
đầu đúng gần như hoàn toàn** — cửa sổ bình quân giải thích 49 trong 65 bps, phần còn lại là quy ước
bình quân. Tôi đã kết luận quá bi quan trên một ước lượng, thay vì chờ dữ liệu.

Đó là mặt còn lại của bài học ở mục trên: **thiếu dữ liệu thì đừng kết luận về nguyên nhân — kể cả
kết luận rằng "còn nguyên nhân khác".**

### Vì sao mẫu số ROE năm nay đặc biệt nhạy: TCBS IPO

Vốn chủ nhảy bất thường trong Q3-2025:

| | 30/06/2025 | 30/09/2025 | Thay đổi |
|---|---:|---:|---:|
| Vốn và các quỹ | 157.614 | 179.431 | **+21.817** |
| Lợi ích cổ đông không kiểm soát | 4.213 | 15.398 | **+11.185** |
| **Tổng vốn chủ sở hữu** | 161.827 | 194.828 | **+33.001** |

LNST của quý chỉ 6.614 tỷ, nên ~26.400 tỷ còn lại không đến từ lợi nhuận: đó là **TCBS IPO** — vốn
huy động ở công ty con chảy vào vốn chủ hợp nhất và làm phình lợi ích cổ đông không kiểm soát.

Hệ quả cho việc đọc số: một IPO ở công ty con **làm tăng mẫu số ROE mà không tăng tương ứng tử số**,
nên ROE hợp nhất bị kéo xuống một cách máy móc. Đây là lý do cách chọn cửa sổ bình quân trong đúng
năm này tạo ra chênh lệch lớn hơn bình thường — và là loại chi tiết mà một cây metric không ghi
`grain` cùng phạm vi hợp nhất sẽ che mất.

### Cảnh báo: `TCB_CDKT (1).xls` là bản export LỖI — đừng dùng

File này khai kỳ Q2-2024 → Q1-2025, nhưng **hai nửa của bảng thuộc hai kỳ khác nhau**:

| Phần | Kỳ thực tế | Bằng chứng |
|---|---|---|
| **Tài sản** | Q2-2024 → Q1-2025 (**đúng**) | TỔNG TÀI SẢN = 908.307 / 927.052 / 978.799 / 989.216 — khớp chính xác bản công bố KQKD 6T2025 |
| **Nợ phải trả + Vốn chủ** | Q3-2025 → Q2-2026 (**sai kỳ**) | VỐN CHỦ SỞ HỮU = 179.430,59 / 179.501,44 / 186.682,77 / 188.997,15 — trùng từng số với file `TCB_CDKT.xls` của kỳ sau |

Bảng **không khớp tổng**: tài sản 908.307 nhưng nợ + vốn chủ 1.129.570. Chênh 221.264 tỷ.

Bài học vận hành: **luôn kiểm tổng tài sản = tổng nợ + vốn chủ trước khi dùng một file cân đối.**
Một phép cộng mười giây phát hiện được một file mà mắt thường đọc qua thấy hoàn toàn bình thường.

### Nguồn đã đóng được câu hỏi này

`techcombank-vas-bao-cao-tai-chinh-hop-nhat-interim25-searchable.pdf` — BCTC hợp nhất giữa niên độ
2025, 93 trang, trích text được. Bảng cân đối tại 30/06/2025 nằm ở trang 7.

Ghi chú cho lần sau: bản chính thức `...-hop-nhat-2q25.pdf` trên website TCB là **scan thuần**
(78 trang, 0 ký tự). Bản **interim** mới là bản dùng được.

### Tỷ lệ bao phủ nợ xấu: tự tính 118,2% vs công bố 125,5% — ĐÃ GIẢI QUYẾT

> **Đính chính.** Ban đầu tôi cho rằng nguyên nhân là trộn phạm vi **hợp nhất vs riêng lẻ**.
> **Suy đoán đó sai.** Sau khi có BCTC searchable (cả hai bản), bảng phân loại nợ **giống hệt nhau**
> ở hợp nhất và riêng lẻ.
>
> Nguyên nhân thật: tôi dùng **sai cả tử số và mẫu số** — NPL suy từ tỷ lệ 1,15% của một kỳ khác, và
> mẫu số là tổng cho vay **gồm cả cho vay ký quỹ**. Định nghĩa đúng: NPL = cộng thẳng nhóm 3+4+5,
> chia cho **tổng dư nợ được phân loại** (loại trừ ký quỹ). Làm đúng thì khớp chính xác:
> **1,13%** và **127,9%** tại 31/12/2025.
>
> Chi tiết và bảng 5 nhóm: **[npl-classification.md](npl-classification.md)**.

Bài học tự nó lặp lại: **một chênh lệch không nói cho bạn biết nguyên nhân — nó chỉ nói rằng định
nghĩa chưa đúng.** Đoán nguyên nhân mà không mở tài liệu gốc thì đoán sai.

## Bài học rút ra

**Một tỷ lệ không tái tạo được nếu không biết chính xác định nghĩa của nó.** Cùng cái tên "ROE",
cùng cái tên "tỷ lệ bao phủ nợ xấu", nhưng khác cửa sổ bình quân hoặc khác phạm vi hợp nhất là ra
số khác. Sáu chỉ số khớp ở trên khớp được vì định nghĩa của chúng đơn giản và một kỳ; hai chỉ số lệch
đều lệch ở chỗ **định nghĩa có tham số ẩn**.

Đây đúng là lý do một metric card bắt buộc phải ghi `grain`, phần *Definition* với "cái gì tính / cái
gì KHÔNG tính", và một người chủ ý nghĩa ký tên. Không phải thủ tục hành chính — mà là điều kiện để
con số có thể kiểm chứng được. Trước khi làm bài tập này thì đó là một luật phải tin; sau khi làm thì
nó là một điều đã thấy.

## Hệ quả cho bảng "tầng P&L còn trống"

Bảng trong [README.md](README.md) được viết khi mọi feed P&L đều thiếu. Giờ chúng có đủ:

| Feed từng thiếu | Giờ có ở | Q2-2026 |
|---|---|---|
| Chi phí lãi / cost of funds | `TCB_KQKD` dòng 1 − NII | 12.098,34 → 4,91% |
| OPEX | `TCB_BCTC_Tom_Tat` | 4.620,13 |
| Chi phí dự phòng | `TCB_BCTC_Tom_Tat` | 651,64 |
| Số dư dự phòng | `TCB_CDKT` | −11.522,29 |
| Vốn chủ sở hữu | `TCB_BCTC_Tom_Tat` | 188.997,15 |
| Cấu phần tài sản sinh lời | `TCB_CDKT` | 1.196.645 |

Nghĩa là **cây metric giờ đã đầy đủ cả hai nửa**: nửa khối lượng/rủi ro/hài lòng từ estate `[v2]`,
nửa lợi nhuận/vốn từ BCTC `[TCB]`. Đó là mục tiêu ban đầu của thư viện này.

## Tái lập

Bốn file `.xls` **thực chất là HTML** (kiểu export của CafeF/Vietstock), không phải Excel thật. Máy
không có `lxml`/`bs4` nên `pandas.read_html` không chạy; dùng script kèm theo, chỉ dựa trên
`html.parser` của Python:

```bash
python references/xls2tsv.py references/TCB_BCTC_Tom_Tat.xls out.tsv
```
