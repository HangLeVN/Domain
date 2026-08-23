# Banking — VN Retail Banking

Mục tiêu: **hiểu ngành ngân hàng bán lẻ Việt Nam**, lấy Techcombank làm ca mẫu (chỉ tài liệu công khai).

Không phải một engagement. Không có khách hàng thật, không có dữ liệu nội bộ.

## Hai nguồn, và vì sao cần cả hai

| Nguồn | Cho cái gì | Không cho cái gì |
|---|---|---|
| **Estate `banking-flagship` của agent-v2** — synthetic, 7 feed, 36 tháng (2023–2025) | **Cơ học đo lường**: grain, chiều conform, semi-additive, cạm bẫy null, roll-rate. Có model đã DAX-smoke 28/28 PASS làm đáp án | Số liệu thật, benchmark ngành, và **toàn bộ tầng P&L / vốn** — dataset không có feed chi phí lãi, OPEX, dự phòng, vốn |
| **Báo cáo công khai Techcombank** — xem [references/](references/) | Bộ chỉ số ban lãnh đạo thật sự theo (NIM, CASA ratio, CIR, credit cost, ROE, CAR), độ lớn thật, định nghĩa chính thức | Cơ học tính toán ở mức bảng/cột — báo cáo chỉ công bố kết quả |

Đọc riêng lẻ thì mỗi bên đều lệch. Ghép lại mới ra tri thức ngành.

**Một câu để nhớ:** ngân hàng bán lẻ là **nghề chênh lệch lãi cộng dự phòng**. Một dataset ở mức
giao dịch và số dư cho bạn *khối lượng* và *rủi ro phân loại*, nhưng không bao giờ cho bạn *lợi
nhuận*. Đó là lý do estate v2 không có NIM — và là bài học đắt nhất ở đây.

## Trạng thái các stage

| Stage | Trạng thái | Nội dung |
|---|---|---|
| [01-domain-analysis](01-domain-analysis/) | ✅ Xong | 6 quy trình, bus matrix, 4 chiều conform, 5 degenerate dim (từ `[v2]`) · **phạm vi thật: hệ sinh thái 5 pháp nhân, 2 trục phân khúc, cơ cấu tín dụng, 5 hạn mức `[QĐ]`** (từ `[TCB]`) |
| [02-metrics](02-metrics/) | ✅ Xong | 4 nhóm hero + 9 metric `[v2]` · tầng P&L tự kiểm chứng ([verification-tcb.md](02-metrics/verification-tcb.md)) · **phân loại nợ 5 nhóm + tỷ lệ dự phòng `[QĐ]`** ([npl-classification.md](02-metrics/npl-classification.md)) |
| [03-data-profile](03-data-profile/) | ⚪ Chưa | |
| [04-semantic-model](04-semantic-model/) | ⚪ Chưa | Star schema 6 fact × 5 dim có sẵn ở v2 để đối chiếu |
| [05-report](05-report/) | ⚪ Chưa | Report spec 8 trang có sẵn ở v2 |
| [references](references/) | 🟢 10 file | KQKD Q2/2026 ✅ · 5 file BCTC dạng bảng ✅ · BCTN 2025 ✅ · **BCTC hợp nhất + riêng lẻ searchable ✅** |

## Việc tiếp theo, theo thứ tự giá trị

Tất cả câu hỏi mở đã đóng. Còn lại là việc tuỳ chọn:

1. **Stage 03–05** (data profile · semantic model · report) — chỉ cần nếu muốn đi vào mô hình hoá và
   dựng báo cáo, không cần để *hiểu* ngành.
2. **Ngành thứ hai** — `cp -r banking/ <ngành>/` rồi lặp lại quy trình hai nguồn.
3. Chỉ khi muốn luyện tay mới cần clone v2 riêng.

⚠️ Lưu ý dữ liệu: `references/TCB_CDKT (1).xls` là **bản export lỗi** — nửa tài sản thuộc
Q2-24→Q1-25, nửa vốn chủ thuộc Q3-25→Q2-26, lệch tổng 221.264 tỷ. Đừng dùng.

## Đường dẫn nguồn (chỉ đọc, không sửa)

Estate v2 trên máy: `Framework/datapot-analytic-agent-v2/`

- `knowledge/business-model.md` — mục *Banking domain*, dòng 146 trở đi
- `knowledge/metrics/banking/` — 9 metric card
- `knowledge/sources/banking-core.md` — source card + 10 rule `dq:` (nơi có cạm bẫy đo lường)
- `knowledge/models/banking-flagship/card.md` + `dictionary.md`
- `fabric/sample-ws/banking-flagship/` — TMDL + PBIR + `_brief/report-spec.md`
- `knowledge/records/audits/2026-07-21-banking-flagship-close.md` — close record

⚠️ Dữ liệu thô **không còn trên đĩa** (`ingest/inbox/banking-sample-dataset/` gitignored, đã purge ở
`/close`). Đọc và mổ được toàn bộ artifact, nhưng không refresh model được.
