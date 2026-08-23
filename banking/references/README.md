# references — tài liệu gốc

Chỗ lưu tài liệu bạn tải về. Mọi con số `[TCB]` trong thư viện này phải trích được về một file ở đây.

## Quy ước đặt tên

```
<năm>-<kỳ>-<loại>-<tổ chức>.<ext>
```

Ví dụ: `2025-Q4-investor-presentation-tcb.pdf` · `2024-annual-report-tcb.pdf` ·
`2024-bctc-hop-nhat-kiem-toan-tcb.pdf` · `2021-tt11-nhnn-phan-loai-no.pdf`

## Cần tải — theo thứ tự giá trị

Tất cả đều là tài liệu **công khai** (TCB niêm yết trên HOSE), không cần xin phép ai.

| # | Tài liệu | Cho cái gì | Đã có |
|---|---|---|:--:|
| 1 | **Công bố KQKD Q2/2026** — `vn-tcb-cong-bo-kqkd-q22026.pdf` (33 tr, 28/07/2026) | ✅ **Đã khai thác xong** — toàn bộ 7 chỉ số + chi phí vốn + credit cost. Phụ lục trang 27 là bảng KPI 5 quý | ✅ |
| 2 | **Báo cáo thường niên 2025** — `techcombank-bao-cao-thuong-nien-2025-vie-update.pdf` (197 tr) | ✅ **Đã khai thác** — hệ sinh thái 5 pháp nhân, 4 khối, 2 trục phân khúc khách hàng, cơ cấu tín dụng KHDN/KHCN, **bảng 5 hạn mức pháp lý vs thực tế**. Kết quả: [../01-domain-analysis/README.md](../01-domain-analysis/README.md) | ✅ |
| 3 | **BCTC bản SEARCHABLE** — `...hop-nhat-4q25-searchable.pdf` (87 tr) · `...rieng-le-4q25-searchable.pdf` (73 tr) · **`...hop-nhat-interim25-searchable.pdf` (93 tr — bảng cân đối 30/06/2025 ở trang 7, đóng được ROE)** | ✅ **Đã khai thác xong** — thuyết minh 4.6 (5 nhóm nợ + tỷ lệ dự phòng) và 9.1 (dư nợ theo nhóm). Kết quả: [../02-metrics/npl-classification.md](../02-metrics/npl-classification.md). *Bản scan cũ giữ lại làm bản gốc, không dùng.* | ✅ |
| 4 | **BCTC dạng bảng** — `TCB_BCTC_Tom_Tat.xls` · `TCB_KQKD.xls` · `TCB_CDKT.xls` · `TCB_LCTT.xls` (Q3-2025 → Q2-2026). ⚠️ `TCB_CDKT (1).xls` **LỖI, không dùng** — nửa tài sản Q2-24→Q1-25, nửa vốn chủ Q3-25→Q2-26, lệch tổng 221.264 tỷ | ✅ **Đã khai thác xong** — máy đọc được, đúng dấu. Cho **đủ feed P&L/vốn** mà estate v2 thiếu: chi phí lãi, OPEX, dự phòng, vốn chủ. Kết quả: [../02-metrics/verification-tcb.md](../02-metrics/verification-tcb.md) | ✅ |
| 5 | **Thông tư NHNN về phân loại nợ & trích lập dự phòng** (bản hiện hành) | `[QĐ]` — ngưỡng nợ xấu là quy định, không phải lựa chọn phân tích. Số hiệu đã thay đổi qua các năm, kiểm tra bản đang áp dụng | ☐ |
| 6 | Báo cáo quản trị / phần cơ cấu tổ chức | Sơ đồ khối — nguyên liệu cho bảng owner-of-meaning | ☐ |
| 7 | Báo cáo phân tích của công ty chứng khoán về TCB *(tuỳ chọn)* | Cách người ngoài đọc cùng bộ số — hữu ích để thấy chỉ số nào thị trường thật sự quan tâm | ☐ |

### Ghi chú kỹ thuật khi trích

`pdftotext` có sẵn trong Git Bash (`/mingw64/bin/pdftotext`) — không cần cài gì:

```bash
pdftotext -layout "<file>.pdf" out.txt          # cả file
pdftotext -layout -f 27 -l 27 "<file>.pdf" -    # một trang, in ra stdout
```

Hai cảnh báo đã gặp:

1. **Dấu tiếng Việt bị rơi** (font không có ToUnicode chuẩn): *"Tình hình"* → `T�nh h�nh`. Chữ cái gốc
   và **toàn bộ chữ số** vẫn nguyên, nên đọc số thì tin được, đọc nhãn thì phải suy luận.
2. **Bốn file `.xls` thực chất là HTML** (export kiểu CafeF/Vietstock), không phải Excel. Không có
   `lxml`/`bs4` nên `pandas.read_html` không chạy — dùng `xls2tsv.py` kèm trong folder này, chỉ dựa
   trên `html.parser` sẵn có: `python references/xls2tsv.py <file>.xls out.tsv`
3. **Bảng nhiều cột bị lệch dòng** — nhãn ở dòng này, giá trị nhảy sang dòng khác. Cách chống: lấy
   số từ **câu văn tường thuật** trước, rồi dùng số học để kiểm chứng bảng. Ví dụ đã làm:
   CIR quý = 4.620 ÷ 14.942 = 30,9% ✓ khớp câu văn.

## Chỉ số TCB — Q2/2026 (công bố 28/07/2026)

Nguồn tất cả: `vn-tcb-cong-bo-kqkd-q22026.pdf`. Cột *tin cậy* rất quan trọng — xem chú giải dưới bảng.

| Chỉ số | Q2/2026 | So sánh | Trang | Tin cậy |
|---|---|---|---|:--:|
| **NIM** (trượt 12 tháng, TS sinh lời bình quân ngày) | **3,6%** | 3,9% ở 2Q25 · 6M25 3,9% → 6M26 3,6% (−20bps) | 6, 8, 27 | 🟢 |
| NIM (trượt 12T, theo số dư cuối kỳ) | 3,5% | 6M25 3,7% (−7bps) | 27 | 🟡 |
| **Chi phí vốn** | **4,91%** quý (tự tính) · 4,6% cho 6M26 | 6M25 3,5% → **+107 bps** | 27 + BCTC | 🟢 |
| **CASA ratio** | **38,3%** | 41,1% ở 2Q25 (−287bps); số dư CASA +8% QoQ | 6, 10, 27 | 🟢 |
| **CIR** | **30,9%** quý · **29,7%** cho 6M26 | 6M25 29,2%; 1Q26 28,3% | 12, 27 | 🟢 |
| **Credit cost** (12T gần nhất) | **0,5%** — tự tính 0,49% ✓ | 0,6% các quý trước | 27 + BCTC | 🟢 |
| **NPL** tại 31/12/2025 | **1,13%** — tự tính 1,133% ✓ | 1,17% ở 2024 | thuyết minh 9.1 | 🟢 |
| **NPL** | **1,15%** | 1,16% ở 1Q26 · 1,32% ở 2Q25 | 6, 13, 27 | 🟢 |
| Tỷ lệ bao phủ nợ xấu | 125,5% (2Q26) · **127,9% tại 31/12/2025 — tự tính khớp tuyệt đối** | 113,8% ở 2024 | 27 + thuyết minh 9.1/10 | 🟢 |
| **ROE** (trượt 12 tháng) | **16,0%** — tự tính 15,35% (lệch: thiếu BCĐ Q2-2025) | 6M25 14,5% (+151bps) | 6, 27 | 🟢 |
| **ROA** (trượt 12 tháng) | **2,4%** | 2,2% ở 2Q25 | 6, 27 | 🟢 |
| **CAR** (Basel II) | **15,0%** tại 30/06/2026 | 15,2% ở 1Q26 — giảm do chi ~5 nghìn tỷ cổ tức tiền mặt tháng 6 | 6, 14, 27 | 🟢 |
| CAR cấp 1 | 14,0% | 14,3% ở 1Q26 | 27 | 🟢 |
| LDR | 80,1% | 80,5% ở 1Q26 | 14, 27 | 🟢 |
| Vốn ngắn hạn cho vay trung–dài hạn | 27,8% | 26,9% ở 1Q26 | 14, 27 | 🟢 |

🟢 = có trong câu văn tường thuật, hoặc kiểm chứng được bằng số học · 🟡 = chỉ có trong bảng phụ lục
bị lệch cột khi trích, **nên soi lại bằng mắt trước khi dùng để kết luận**.

### Cấu phần P&L và bảng cân đối (2Q26 · 6M26, tỷ VND)

| Khoản | 2Q26 | 6M26 | Tăng trưởng |
|---|---|---|---|
| Thu nhập lãi thuần (NII) | 10.763 | 20.285 | +16,3% |
| Thu nhập ngoài lãi | 4.179 | 8.331 | +20,5% |
| **Tổng thu nhập hoạt động (TOI)** | **14.942** | **28.616** | +17,5% |
| Chi phí hoạt động | (4.620) | (8.489) | +19,3% |
| **Lợi nhuận trước thuế** | **~9.670** | **18.540** | +22,4% quý · +22,5% 6T |
| Tổng tài sản | 1.273.077 | | +22,7% N/N |
| Tiền gửi khách hàng | 697.413 | | +18,4% N/N |
| Tăng trưởng tín dụng | | 11,6% YTD | |

Kiểm chứng chéo đã làm: NII + ngoài lãi = TOI (10.763 + 4.179 = 14.942 ✓) và
chi phí ÷ TOI = CIR (4.620 ÷ 14.942 = 30,9% ✓).

### Định hướng 2026 (slide Triển vọng)

Slide có hai cột chưa xác định rõ nhãn — **cần soi lại**: CASA `40,4 | 38,3` · NIM `3,8 | 3,6` ·
CIR `30,8 | 29,7`. Cột thứ hai khớp với số thực hiện 6M26, nên cột đầu có thể là FY2025.
NPL: định hướng **"kiểm soát dưới 1,5%"**.

## Bốn câu hỏi — đã đóng 4/4

- [x] **Thang phân loại nợ có mấy nhóm, nhóm nào là nợ xấu?** → 5 nhóm; nợ xấu = nhóm 3+4+5.
- [x] **Số hiệu Thông tư NHNN đang áp dụng?** → **Thông tư 31/2024/TT-NHNN** (hiệu lực 01/7/2024,
      thay thế TT 11/2021) + **Nghị định 86/2024/NĐ-CP** (11/7/2024), sửa thủ tục bởi **TT
      37/2025/TT-NHNN** (15/12/2025). Tra từ nguồn ngoài, BCTC chỉ dùng dạng viết tắt.
- [x] **Tỷ lệ trích lập theo từng nhóm?** → 0% · 5% · 20% · 50% · 100% + dự phòng chung 0,75%.
- [x] **NPL theo balance-weighted hay số lượng khoản?** → **balance-weighted**, trùng phán quyết của
      estate `[v2]`.

Đáp án đầy đủ: **[../02-metrics/npl-classification.md](../02-metrics/npl-classification.md)**

## Hai luật của folder này

1. **Không commit file lớn.** PDF báo cáo hàng chục MB không thuộc git. Nếu về sau đưa thư viện này
   vào git thì thêm `references/*.pdf` vào `.gitignore` và giữ lại bảng chỉ số ở trên — số liệu đã
   trích + đường dẫn nguồn là thứ cần bền, không phải file gốc.
2. **Chỉ tài liệu công khai.** Đây là thư viện học, không phải engagement. Tài liệu nội bộ của bất kỳ
   tổ chức nào cũng không thuộc đây — nó đi kèm chính sách phân loại dữ liệu riêng và phải nằm trong
   một bản clone v2 có `org-context/` khai đúng tổ chức đó.
