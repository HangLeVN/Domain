# Insurance — Bảo hiểm Việt Nam

Mục tiêu: **hiểu ngành bảo hiểm Việt Nam**, cùng phương pháp đã dùng cho [banking](../banking/).

## Khác banking ở một điểm cốt lõi

Estate `banking-flagship` của agent-v2 cho banking **nửa cơ học đo lường**: grain, chiều conform,
semi-additive, cạm bẫy null. **Bảo hiểm không có estate nào trong v2** — `domains` của nó là
`sales · inventory · finance · hr · banking · marketing · transport`.

Nên nửa cơ học phải lấy từ nguồn khác: **thuyết minh chính sách kế toán trong BCTC**.

| Nguồn | Cho cái gì | Không cho cái gì |
|---|---|---|
| **Thuyết minh kế toán BCTC** (`[BCTC]`) | Công thức trích lập từng loại dự phòng, cơ sở ghi nhận, chỗ nằm trên bảng cân đối. Đây là *định nghĩa*, chính xác và có nguồn | **Grain, chiều, cạm bẫy dữ liệu thật** — một thuyết minh không nói cho bạn biết một dòng dữ liệu là gì, hay cột nào null 79% |
| **Báo cáo công khai của một công ty bảo hiểm** (`[CTY]`) | Bộ chỉ số ban lãnh đạo theo, độ lớn thật, cơ cấu nghiệp vụ | Cơ học tính toán ở mức bảng/cột |
| **Văn bản pháp lý** (`[QĐ]`) | Ngưỡng bắt buộc: biên khả năng thanh toán, tỷ lệ đầu tư, giới hạn trách nhiệm | — |

**Chỗ yếu đã dự đoán, và kết quả thực tế.** Ban đầu tôi ghi ở đây rằng thư viện bảo hiểm sẽ *"thiếu
hẳn tầng cạm bẫy đo lường"* vì không có dữ liệu để profile. Điều đó **đúng một nửa**: không có cạm bẫy
ở mức *cột và bảng* (null bao nhiêu %, join theo tên có trùng không, kiểu dữ liệu sai chỗ nào) — những
thứ chỉ hiện ra khi chạm vào dữ liệu thật.

Nhưng có một tầng cạm bẫy khác đã lộ ra, và nó **không đến từ dữ liệu mà đến từ định nghĩa**:
trộn nhân thọ với phi nhân thọ, written vs earned, dấu của biến động dự phòng đảo ngược trực giác,
cặp dự phòng gốc/nhượng tái phải đi cùng nhau, tỷ lệ trích lập khác nhau giữa các công ty. Tám dòng,
**mỗi dòng có số chứng minh** — xem [02-metrics](02-metrics/README.md).

Nói cách khác: banking dạy cạm bẫy của *dữ liệu*, bảo hiểm dạy cạm bẫy của *khái niệm*. Cái thứ hai
không cần dữ liệu để học, nhưng cần báo cáo thật để chứng minh.

## Trạng thái các stage

| Stage | Trạng thái | Nội dung |
|---|---|---|
| [01-domain-analysis](01-domain-analysis/) | 🟢 Xong | Bản chất ngành **có số chứng minh** · hai nửa của ngành · **thị trường bảo hiểm VN 2025** (237,2 nghìn tỷ; phi nhân thọ +10,3% vs nhân thọ +0,4%) và vị thế BVH · taxonomy dự phòng **của chính BVH** · bảng đối chiếu BVH vs TCGI/TCLI chứng minh tỷ lệ là lựa chọn doanh nghiệp · xung đột CMKT 19 xác nhận toàn ngành. **Chưa có** quy trình nghiệp vụ và bus matrix |
| [02-metrics](02-metrics/) | 🟢 Xong | Câu hỏi trung tâm **đã trả lời ba lớp**: combined ratio bộ phận **117,5%** · biên LNST của BHBV chỉ **2,32%** · và Q2/2026 lãi 983 tỷ thành lỗ 1.393 tỷ nếu bỏ một dòng dự phòng. Chuỗi 4 quý Q3/2025→Q2/2026. 8 cạm bẫy đo lường, mỗi cái có số. **Combined ratio riêng phi nhân thọ vẫn không tính được** — nêu rõ chặn ở đâu |
| 03 · 04 · 05 | ⚪ Chưa | Sẽ chỉ là thiết kế trên giấy — không có estate làm đáp án |
| [references](references/) | 🟢 Có tài liệu | Công ty neo: **Bảo Việt (BVH)**. 7 tài liệu: BCTC hợp nhất + riêng **Q3/2025 và Q2/2026** (PDF **scan**, phải OCR) · **Báo cáo thường niên 2025** (có lớp text) · 4 file `.xls` kết xuất. [verification-bvh.md](references/verification-bvh.md): phép kiểm số học đầy đủ. 4/4 câu hỏi đã đóng |

## Ký hiệu nguồn (bổ sung cho [luật chung](../README.md))

`[BCTC]` = thuyết minh chính sách kế toán · `[CTY]` = báo cáo công khai của công ty neo ·
`[QĐ]` = văn bản pháp lý · `[?]` = chưa xác minh

`[BCTC]` giờ lấy từ **BCTC hợp nhất BVH Q3/2025**. Bản dựng đầu tiên dùng tạm thuyết minh 4.17 của
**BCTC hợp nhất Techcombank** (chính sách của TCGI và TCLI) và ghi cảnh báo rằng *"các tỷ lệ là lựa
chọn của doanh nghiệp trong khuôn khổ quy định, không phải hằng số của ngành"*.

**Cảnh báo đó đã được kiểm và đúng** — mức khác biệt còn lớn hơn dự kiến: BVH trích dự phòng dao động
lớn **2%** và đảm bảo cân đối **2%**, trong khi TCGI trích **1%** cho cả hai; dự phòng phí chưa được
hưởng thì BVH dùng **25% cố định / phương pháp 1/8** còn TCGI trích **theo từng ngày**. Cả hai đều
hợp pháp, đều *"được Bộ Tài chính phê duyệt"*. Bảng đối chiếu đầy đủ ở
[01-domain-analysis](01-domain-analysis/README.md).

⚠️ **Hệ quả:** không tồn tại "công thức dự phòng của ngành bảo hiểm Việt Nam". Mọi so sánh liên công ty
về loss ratio hay lợi nhuận **phải kiểm tham số dự phòng trước** — nếu không là so hai thước đo khác nhau.
