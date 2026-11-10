# Banking — VN Retail Banking

Mục tiêu: **hiểu ngành ngân hàng Việt Nam**, lấy **hai** ca mẫu: Techcombank và Vietcombank (chỉ tài
liệu công khai).

Không phải một engagement. Không có khách hàng thật, không có dữ liệu nội bộ.

> ### 👉 Mới tiếp cận ngành? Đọc [**DOMAIN-PRIMER.md**](DOMAIN-PRIMER.md) trước.
>
> Toàn bộ các file còn lại trong folder này tổ chức theo **bài tập đã làm** (estate synthetic vs hai
> ngân hàng, log kiểm số) — hữu ích khi đã biết ngành, nhưng khó vào nếu chưa. `DOMAIN-PRIMER.md` tổ
> chức theo **ngành**: ngân hàng kiếm tiền bằng cách nào · 11 quy trình nghiệp vụ + chỉ số và ý nghĩa
> từng chỉ số · lợi nhuận nội bộ (FTP) · quy định bắt buộc · chuẩn đọc số · dữ liệu nằm ở đâu · từ điển
> thuật ngữ. TCB/VCB ở đó chỉ là **ví dụ minh
> hoạ có nhãn**, không phải xương sống.

## Ba nguồn, và vì sao cần cả ba

| Nguồn | Cho cái gì | Không cho cái gì |
|---|---|---|
| **Estate `banking-flagship` của agent-v2** — synthetic, 7 feed, 36 tháng (2023–2025) | **Cơ học đo lường**: grain, chiều conform, semi-additive, cạm bẫy null, roll-rate. Có model đã DAX-smoke 28/28 PASS làm đáp án | Số liệu thật, benchmark ngành, và **toàn bộ tầng P&L / vốn** — dataset không có feed chi phí lãi, OPEX, dự phòng, vốn |
| **Báo cáo công khai Techcombank** `[TCB]` — [references/TCB/](references/TCB/) | Bộ chỉ số ban lãnh đạo thật sự theo (NIM, CASA, CIR, credit cost, ROE, CAR), độ lớn thật, định nghĩa chính thức, ngưỡng `[QĐ]` | Cơ học tính toán ở mức bảng/cột. Và: **không cho biết cái gì là của ngành, cái gì của riêng nó** |
| **Báo cáo công khai Vietcombank** `[VCB]` — [references/VCB/](references/VCB/) | **Biên độ** — mô hình kinh doanh đối lập (quốc doanh, nghiêng doanh nghiệp) nên tách được "sự thật ngành" khỏi "lựa chọn của một bank". Thêm **tầng thị trường** (số toàn hệ thống) | Cơ học tính toán. Và 4 chỉ số của nó **không so trực tiếp** được với TCB |

Đọc riêng lẻ thì mỗi bên đều lệch. Ghép lại mới ra tri thức ngành.

**Vì sao cần tổ chức neo thứ hai, nói gọn:** khi chỉ có TCB, mọi đặc điểm của TCB đều trông như đặc
điểm của ngành. Sau khi có VCB thì thấy **4 trên 6 điều tưởng là kiến thức ngành hoá ra chỉ là mô tả
một ngân hàng** — bảng đối chiếu ở [02-metrics/peer-tcb-vcb.md](02-metrics/peer-tcb-vcb.md).

**Một câu để nhớ, đã sửa lại sau khi có bank thứ hai:** ngân hàng là **nghề chênh lệch lãi + dự phòng
+ đòn bẩy**. Câu cũ chỉ có hai cấu phần đầu — và cấu phần thứ ba chính là chỗ VCB kiếm ROE cao hơn TCB
(18,2% vs 16,0%) *dù* ROA thấp hơn 38%. Một dataset ở mức giao dịch và số dư cho bạn *khối lượng* và
*rủi ro phân loại*, nhưng không bao giờ cho bạn *lợi nhuận* — và cũng không cho bạn *cấu trúc vốn*.

## Trạng thái các stage

| Stage | Trạng thái | Nội dung |
|---|---|---|
| [01-domain-analysis](01-domain-analysis/) | ✅ Xong | 6 quy trình, bus matrix, 4 chiều conform, 5 degenerate dim (từ `[v2]`) · **phạm vi thật: hệ sinh thái 5 pháp nhân, 2 trục phân khúc, cơ cấu tín dụng, 5 hạn mức `[QĐ]`** (từ `[TCB]`) · **đối chiếu cơ cấu danh mục 2 bank + tầng thị trường + 2 thay đổi hạn mức Q2/26** (từ `[VCB]`) |
| [02-metrics](02-metrics/) | ✅ Xong | 4 nhóm hero + 9 metric `[v2]` · tầng P&L tự kiểm chứng ở **hai** bank ([verification-tcb.md](02-metrics/verification-tcb.md) · [verification-vcb.md](02-metrics/verification-vcb.md)) · **phân loại nợ 5 nhóm `[QĐ]`, xác nhận độc lập 2 lần** ([npl-classification.md](02-metrics/npl-classification.md)) · **so sánh 2 bank + 5 bẫy đo lường mới** ([peer-tcb-vcb.md](02-metrics/peer-tcb-vcb.md)) |
| [03-data-profile](03-data-profile/) | ✅ Xong *(chưng cất)* | 7 feed · 10 luật `dq:` · **2 điểm không nhất quán giữa feed** mà profile từng feed không bắt được · danh sách kiểm cho feed ngân hàng thật |
| [04-semantic-model](04-semantic-model/) | ✅ Xong *(chưng cất)* | 6 fact × 5 dim · DAX đáng học lại (semi-additive, tỷ lệ đúng grain, chỉ tiêu stock/flow) · **bảng 16 câu của primer: 6 trả lời được, 4 cần thêm cột/measure, 6 thiếu feed** · cách dựng roll-rate và vintage |
| [05-report](05-report/) | ✅ Xong *(chưng cất)* | 8 trang theo 3 tầng tốc độ đọc · **câu chuyện chính của report dựa trên tỷ trọng phí ~0,3% — số thật 3,8% (VCB)** · báo cáo điều hành ngân hàng thật bắt đầu từ lợi nhuận và vốn |
| [references/TCB](references/TCB/) | 🟢 10 file | KQKD Q2/2026 ✅ · 5 file BCTC dạng bảng ✅ · BCTN 2025 ✅ · BCTC hợp nhất + riêng lẻ searchable ✅ |
| [references/VCB](references/VCB/) | 🟢 6 file | Deck 2Q2026 ✅ (**phụ lục 9 quý**) · BCTC hợp nhất bán niên 2026 ✅ (OCR) · BCTC riêng lẻ ☐ · 3 deck cũ ☐ (scan, ưu tiên thấp) |


- `knowledge/records/audits/2026-07-21-banking-flagship-close.md` — close record

⚠️ Dữ liệu thô **không còn trên đĩa** (`ingest/inbox/banking-sample-dataset/` gitignored, đã purge ở
`/close`). Đọc và mổ được toàn bộ artifact, nhưng không refresh model được.
