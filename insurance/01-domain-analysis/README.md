# 01 — Domain analysis: bảo hiểm hoạt động ra sao

## Câu hỏi nền của ngành

Ngân hàng bán lẻ là **nghề chênh lệch lãi cộng dự phòng**. Bảo hiểm là một nghề khác hẳn:

> Thu tiền **trước**, trả tiền **sau** — và không biết trước sẽ trả bao nhiêu, khi nào.

Toàn bộ kế toán và đo lường của ngành sinh ra từ khoảng trống thời gian đó. Ba hệ quả:

1. **Doanh thu không phải tiền đã thu.** Phí bảo hiểm thu hôm nay phần lớn thuộc về các kỳ sau →
   phải tách ra bằng *dự phòng phí chưa được hưởng*.
2. **Chi phí lớn nhất chưa xảy ra.** Tổn thất đã phát sinh nhưng chưa khiếu nại vẫn là nợ →
   *dự phòng bồi thường*, gồm cả phần **IBNR** (Incurred But Not Reported).
3. **Lợi nhuận là một ước lượng, không phải một phép trừ.** Đổi giả định dự phòng là đổi lợi nhuận,
   mà không có một giao dịch nào phát sinh.

Điểm 3 là lý do bảo hiểm khó đo hơn ngân hàng: ở ngân hàng, dư nợ và số dư là **sự kiện**; ở bảo
hiểm, phần lớn bảng cân đối là **phán quyết chuyên môn** (actuarial judgment).

### Điểm 3, đo bằng số `[BCTC]`

Không còn là luận điểm. Bảng cân đối hợp nhất BVH tại 30/9/2025:

| | Số (triệu đồng) | ÷ tổng tài sản |
|---|---:|---:|
| Tổng tài sản | 272.801.453 | |
| **Dự phòng nghiệp vụ bảo hiểm** | **197.433.095** | **72,37%** |
| — trong đó **dự phòng toán học** | **168.277.749** | **61,69%** |
| Vốn chủ sở hữu | 25.557.825 | 9,37% |

**Dự phòng toán học một mình bằng 6,58 lần vốn chủ sở hữu.** Và nó không phải một số dư hợp đồng — nó
là *"số lớn hơn giữa dự phòng trích lập theo phương pháp của Bảo Việt Nhân thọ và dự phòng tối thiểu
theo luật định"*, trong đó phương pháp của công ty lại là một trong ba phương pháp actuarial được Bộ
Tài chính phê duyệt (xem dưới).

So sánh: ở một ngân hàng, khoản mục lớn nhất bên nợ là **tiền gửi khách hàng** — một con số hợp đồng,
đúng đến đồng. Ở đây, **61,7% bảng cân đối là một con số được tính ra.** Đó là khác biệt cấu trúc lớn
nhất giữa hai ngành.

## Hai nửa của ngành — cùng tên gọi, khác nghề

`[BCTC]` thuyết minh 24 và 26, 9T/2025:

| | Nhân thọ | Phi nhân thọ |
|---|---:|---:|
| Phí bảo hiểm gốc | 24.199.241 tr (**74,6%**) | 8.225.802 tr (**25,4%**) |
| Dự phòng nghiệp vụ | 188.691.981 tr (**95,6%**) | 8.741.115 tr (**4,4%**) |
| Tỷ lệ giữ lại | 100,02% | 66,97% |
| Nhận tái bảo hiểm | không | toàn bộ |
| Dự phòng toán học | có — 168.277.749 tr | **không có** |
| Dự phòng lãi cam kết | có — 15.987.478 tr | **không có** |
| Dự phòng dao động lớn | **không có** | có — 227.678 tr |

**Một phần tư doanh thu, một phần hai mươi ba bảng cân đối.** Đó là toàn bộ sự khác nhau giữa hai nửa,
gói trong một phép so sánh: phi nhân thọ bán *bảo vệ trong một năm*, nhân thọ bán *một cam kết dài hạn
kèm tiết kiệm*. Cùng gọi là "bảo hiểm", nhưng bảng cân đối không giống nhau và **không dùng chung được
một chỉ số nào**.

Hệ quả cho việc dựng mô hình: **nhân thọ và phi nhân thọ không được để chung một fact table.** Grain
khác, chiều khác, và measure của nửa này vô nghĩa với nửa kia.

## Thị trường bảo hiểm Việt Nam 2025 — `[CTY]`

Nguồn: **Báo cáo thường niên BVH 2025**, dẫn số liệu **Hiệp hội Bảo hiểm Việt Nam (IAV)**. Đây là tầng
mà BCTC không cho: một công ty không tự công bố quy mô ngành.

| | 2025 | Tăng trưởng |
|---|---:|---:|
| **Tổng doanh thu phí toàn thị trường** | **~237,2 nghìn tỷ** | +4% |
| — Phi nhân thọ | **88,4 nghìn tỷ** | **+10,3%** |
| — Nhân thọ | **148,8 nghìn tỷ** | **+0,4%** |
| Tổng tài sản các doanh nghiệp bảo hiểm | ~1,1 triệu tỷ | |

*(88,4 + 148,8 = 237,2 ✓)*

**Nhân thọ chiếm 62,7% phí nhưng gần như không tăng; phi nhân thọ chiếm 37,3% và tăng gấp 25 lần tốc độ
của nhân thọ.** Đây là bối cảnh giải thích tại sao mọi con số hợp nhất của một tập đoàn có hai nửa đều
khó đọc — bản thân hai thị trường đang đi hai hướng.

Tăng trưởng theo nghiệp vụ phi nhân thọ 2025: **xe cơ giới +12,2%** · **tài sản – thiệt hại +11,2%** ·
**sức khỏe +10,2%**. Ba nghiệp vụ bán lẻ và đầu tư công là động lực.

### Vị thế của công ty neo

| | Thị phần | Xếp hạng | Tăng trưởng 2025 |
|---|---:|---|---:|
| **Bảo Việt Nhân thọ** (nhân thọ) | **20,3%** | **số 1** — cả tổng doanh thu phí lẫn doanh thu khai thác mới | **+1,5%** *(khai thác mới +24,8%)* |
| **Bảo hiểm Bảo Việt** (phi nhân thọ) | **12,6%** | **số 2** | **+6,5%** ≈ 60% mức bình quân thị trường |

Nhóm dẫn đầu phi nhân thọ: BHBV · PVI · BMI · MIC · BIC · OPES · VBI. Báo cáo ghi *"ngoại trừ PVI, các
DN Top đầu trong năm 2025 đều tăng trưởng thấp hơn bình quân thị trường"* — PVI +11,9% (2024: +21,3%),
và **tái bảo hiểm quốc tế đóng góp trên 50% lợi nhuận từ hoạt động bảo hiểm của PVI**.

**Đọc được gì từ đây, mà một mình BCTC không nói:** BVH **thua thị trường ở nửa đang tăng** (phi nhân
thọ 6,5% vs ngành 10,3%) và **thắng thị trường ở nửa đang đứng** (nhân thọ 1,5% vs ngành −1,9% theo IAV).
Nó đang giữ ngôi số 1 ở một thị trường không tăng, và mất dần vị thế tương đối ở thị trường đang tăng.
Đó là một chẩn đoán chiến lược mà **không tỷ số kế toán nào cho được** — phải có số ngành mới thấy.

Quy mô hạ tầng phân phối: **180 chi nhánh · 1.200 phòng giao dịch · 227.000 đại lý và tư vấn viên**,
phục vụ **~20 triệu khách hàng/năm ≈ 20% dân số Việt Nam**. BVH đầu tư trở lại nền kinh tế khoảng
**27% tổng nguồn vốn đầu tư của toàn thị trường bảo hiểm**, và chi trả bồi thường khoảng **¼ tổng số
tiền chi trả của toàn ngành**.

### Hai sự kiện quy định đáng ghi — `[QĐ]`

1. **Tái cấu trúc sản phẩm bảo hiểm nhân thọ từ 1/7/2025** — đơn giản hoá cấu trúc sản phẩm, tăng tính
   minh bạch, tập trung vào giải pháp bảo vệ. Một thay đổi cấu trúc sản phẩm ở giữa năm nghĩa là **số
   liệu trước và sau 1/7/2025 không hoàn toàn so sánh được**.
2. **Siết chặt kênh bancassurance và hệ thống đại lý** sau *"khủng hoảng niềm tin liên quan đến hoạt
   động phân phối bảo hiểm qua ngân hàng"* giai đoạn 2021–2025.

Cả hai giải thích vì sao nhân thọ gần như không tăng trong khi phi nhân thọ tăng hai chữ số: **cú hãm
không nằm ở nhu cầu mà nằm ở kênh phân phối và ở sản phẩm.**

### ⚠️ Chính báo cáo thường niên cũng không nhất quán

Bốn chỗ mâu thuẫn trong **cùng một tài liệu**:

| Chỉ tiêu | Chỗ này nói | Chỗ khác nói |
|---|---|---|
| Tăng trưởng thị trường phi nhân thọ 2025 | **+10,3%** *(tr.33)* | **11%** *(tr.10–11)* |
| Tăng trưởng thị trường nhân thọ 2025 | **+0,4%** *(tr.33)* | **−1,9%** *(tr.12, dẫn IAV)* |
| Số đại lý và tư vấn viên | **227.000** | **237.000** |
| LNST 2.168 tỷ, +43,6% | là của **BVNT** *(tr.61)* | dễ bị đọc thành của tập đoàn *(tr.7)* — LNST hợp nhất là **2.922 tỷ** |

Hai dòng đầu có thể là hai thước đo khác nhau (*doanh thu phí bảo hiểm* vs *tổng doanh thu phí*), nhưng
báo cáo **không nói rõ**. Dòng cuối là chỗ tôi đã gần mắc: con số 2.168 tỷ xuất hiện sớm trong tài liệu
mà không nói của pháp nhân nào.

**Luật rút ra:** thị phần và tăng trưởng ngành **không phải sự thật tính được** — chúng phụ thuộc vào
mẫu số nào, nguồn nào, thước đo nào. Kiểm thử: BVNT phí bảo hiểm 32.640 tỷ ÷ thị trường nhân thọ
148,8 nghìn tỷ = **21,9%**, nhưng báo cáo công bố thị phần **20,3%**. Hai con số trong cùng một tài liệu
không khớp, vì chúng dùng hai định nghĩa thị trường khác nhau. **Mọi con số thị phần phải ghi kèm mẫu số
và nguồn**, nếu không nó chỉ là một số vô nghĩa trông có vẻ chính xác.

## Taxonomy dự phòng nghiệp vụ — `[BCTC]`

Nguồn: thuyết minh **4.16** của BCTC hợp nhất **BVH** Q3/2025 (chính sách của **Bảo Việt Nhân thọ** và
**Bảo hiểm Bảo Việt**).

### Nhân thọ

| # | Loại dự phòng | Cách trích của Bảo Việt Nhân thọ | Số dư 30/9/2025 (tr) |
|:--:|---|---|---:|
| 1 | **Dự phòng toán học** | **max(phương pháp của công ty, dự phòng tối thiểu theo luật định)**. Phương pháp của công ty là **một trong ba**: dự phòng phí toàn phần · dự phòng phí thuần · dự phòng phí thuần **điều chỉnh theo hệ số Zillmer**. Phương pháp, cơ sở và giả định do **Bộ Tài chính phê chuẩn** khi trình sản phẩm | **168.277.749** |
| 2 | **Dự phòng phí chưa được hưởng** | trên **phí gộp**, cho đơn bảo hiểm thời hạn **≤ 1 năm** còn hiệu lực | 256.729 |
| 3 | **Dự phòng bồi thường** | (a) **RBNA** — đã yêu cầu chưa giải quyết: phương pháp **từng hồ sơ**, ước tính trên thống kê số tiền dự kiến phải trả<br>(b) **IBNR** = **3% phí thu trong kỳ** (hợp đồng đóng phí định kỳ), hoặc 3% phí một lần chia cho thời hạn, hoặc **số lớn hơn** giữa 3% phí đã sử dụng từ đầu năm hợp đồng và 3% phí thu trong kỳ — **tùy theo sản phẩm**. Chỉ áp cho hợp đồng **≤ 1 năm** | 63.082 |
| 4 | **Dự phòng chia lãi** | lãi tích lũy chưa trả + bảo tức + phần lãi chưa công bố, cho hợp đồng có tham gia chia lãi | 3.925.131 |
| 5 | **Dự phòng đảm bảo lãi suất cam kết** | khi thị trường đầu tư biến động hoặc kết quả đầu tư từ nguồn phí **thấp hơn lãi suất cam kết** — trích bằng phần chênh lệch | **15.987.478** |
| 6 | **Dự phòng đảm bảo cân đối** | **1% lợi nhuận trước thuế** mỗi năm, đến khi đạt **5% phí bảo hiểm** thu trong kỳ | 181.811 |

Sản phẩm **liên kết chung** có thêm một tầng: dự phòng rủi ro bảo hiểm = **số lớn nhất trong BA**
phương pháp — (i) phí chưa được hưởng, (ii) dòng tiền góp đáp ứng **toàn bộ chi phí tương lai**,
(iii) dòng tiền thuần đáp ứng **chi trả quyền lợi rủi ro** trong suốt thời hạn hợp đồng.

Sản phẩm **sức khỏe** (do công ty nhân thọ bán): dự phòng toán học = **max(dự phòng phí thuần, dự phòng
phí chưa được hưởng theo phương pháp hệ số thời hạn 1/8)**.

### Phi nhân thọ

| # | Loại dự phòng | Cách trích của Bảo hiểm Bảo Việt | Số dư 30/9/2025 (tr) |
|:--:|---|---|---:|
| 1 | **Dự phòng phí chưa được hưởng** | **không phải một công thức duy nhất**:<br>· bảo hiểm **hàng hóa ≤ 1 năm**: **25% tổng phí bảo hiểm** (một tỷ lệ cố định)<br>· các loại khác, và hợp đồng **> 1 năm** của hàng hóa vận chuyển đường bộ/biển/thủy nội địa/sắt/không: **phương pháp 1/8** | 5.455.866 |
| 2 | **Dự phòng bồi thường** | (a) đã khiếu nại chưa giải quyết: ước tính **từng vụ**, **sau khi trừ phần thu hồi từ nhượng tái bảo hiểm**<br>(b) **IBNR** = **3% phí bảo hiểm** theo từng nghiệp vụ | 2.733.749 |
| 3 | **Dự phòng dao động lớn** | **tối đa từ 1% đến 3%** phí giữ lại của từng nghiệp vụ, đến khi đạt **100% phí giữ lại** trong kỳ. **Bảo hiểm Bảo Việt hiện áp 2%** tổng phí giữ lại của từng loại hình | 227.678 |
| 4 | **Dự phòng đảm bảo cân đối** *(nghiệp vụ sức khỏe)* | **2% phí bảo hiểm giữ lại** / năm | 323.822 |

**Phương pháp 1/8 là gì, và vì sao nó là một cạm bẫy.** Thuyết minh giải thích thẳng: phương pháp này
*"giả định phí bảo hiểm thuộc các hợp đồng phát hành trong một quý phân bổ đều giữa các tháng trong quý,
hay nói cách khác, toàn bộ hợp đồng bảo hiểm của một quý cụ thể được giả định là có hiệu lực vào giữa
quý đó."*

Nghĩa là **dự phòng phí chưa được hưởng không phải một số đo — nó là một quy ước.** Cùng với tỷ lệ
**25% cố định** cho bảo hiểm hàng hóa, ta có: một khoản mục 5.456 tỷ trên bảng cân đối được tạo ra bởi
**hai phép xấp xỉ** thay vì bởi ngày hiệu lực thực của từng hợp đồng. Ai dựng mô hình dữ liệu ở đây phải
biết: **con số trong báo cáo và con số tính từ dữ liệu hợp đồng sẽ không bằng nhau, và cả hai đều đúng
theo định nghĩa của nó.** (TCGI thì trích theo *từng ngày* — xem bảng đối chiếu dưới.)

## Tỷ lệ trích lập là LỰA CHỌN của doanh nghiệp — đã chứng minh

Trước khi có báo cáo BVH, thư viện này dùng tạm chính sách của **TCGI/TCLI** (hai công ty con bảo hiểm
của Techcombank) và ghi cảnh báo rằng *"các tỷ lệ là lựa chọn của doanh nghiệp trong khuôn khổ quy định,
không phải hằng số của ngành"*. Đối chiếu với BVH cho thấy cảnh báo đó là đúng, và mức khác biệt lớn hơn
dự kiến:

| Khoản mục | TCGI / TCLI (Techcombank) | Bảo Việt | Khác |
|---|---|---|:--:|
| Dự phòng phí chưa hưởng, phi nhân thọ | trích theo **từng ngày** | **25% tổng phí** (hàng hóa ≤1 năm) · **phương pháp 1/8** (còn lại) | ⚠️ khác hẳn |
| Dự phòng phí chưa hưởng, sức khỏe | từng ngày | **phương pháp 1/8** | ⚠️ |
| **IBNR** | **3%** phí | **3%** phí — nhân thọ có thêm biến thể max-của-hai | ✅ giống |
| **Dự phòng dao động lớn** | **1%** phí giữ lại/năm, đến 100% | **tối đa 1–3%**, thực tế đang áp **2%**, đến 100% | ⚠️ **gấp đôi** |
| **Dự phòng đảm bảo cân đối**, phi nhân thọ / sức khỏe | **1%** phí giữ lại | **2%** phí giữ lại | ⚠️ **gấp đôi** |
| Dự phòng đảm bảo cân đối, nhân thọ | 1% LNTT đến 5% phí | 1% LNTT đến 5% phí | ✅ giống |
| **Dự phòng toán học**, nhân thọ | **max của HAI** phương pháp (phí chưa hưởng vs dòng tiền) | **max(một trong BA phương pháp actuarial kể cả Zillmer, mức tối thiểu theo luật)** | ⚠️ khác |
| Dự phòng rủi ro, liên kết chung | max của **HAI** | max của **BA** | ⚠️ |

**Kết luận:** hai công ty cùng ngành, cùng chịu một khung pháp lý, trích dự phòng dao động lớn và đảm
bảo cân đối ở tỷ lệ **chênh nhau hai lần**. Cả hai đều hợp pháp — thuyết minh của cả hai đều ghi phương
pháp *"do Công ty lựa chọn và được Bộ Tài chính chấp thuận"* / *"theo phương pháp đã được Bộ Tài chính
phê duyệt"*.

**Hệ quả cho việc học và cho việc dựng metric:** không thể có một "công thức dự phòng của ngành bảo hiểm
Việt Nam". Mỗi công ty có một bộ tham số riêng đã đăng ký. Bất kỳ so sánh liên công ty nào về loss ratio,
combined ratio hay lợi nhuận đều **phải kiểm tham số dự phòng trước**, nếu không là so hai thước đo khác
nhau. Đây là điều mà một mô hình dữ liệu **không thể tự phát hiện** — nó phải được ghi thành metadata.

## Chỗ ghi nhận trên báo cáo — `[BCTC]`

| Loại | Ghi ở đâu |
|---|---|
| Dự phòng nghiệp vụ của **bảo hiểm gốc và nhận tái** | **Nợ dài hạn**, mục `344` (BVH) / *Các khoản Nợ khác* (khi bảo hiểm là công ty con của ngân hàng) |
| Dự phòng nghiệp vụ cho **nhượng tái bảo hiểm** | **Tài sản tái bảo hiểm** — bên **tài sản** |
| Biến động dự phòng của bảo hiểm gốc & nhận tái | chi phí trong **Tổng chi trực tiếp hoạt động kinh doanh bảo hiểm** |
| Biến động dự phòng cho nhượng tái | cùng khối, dấu ngược |

Hai điều dễ đọc sai:

1. **Dự phòng bảo hiểm không xuất hiện thành một dòng mang tên "dự phòng bảo hiểm" ở mức nhìn nhanh.**
   Ở BVH nó là `344` bên trong *Nợ dài hạn*; ở Techcombank hợp nhất nó nằm trong *Các khoản Nợ khác* và
   **nhìn bảng cân đối hợp nhất sẽ không thấy nghiệp vụ bảo hiểm ở đâu cả**.
2. **Mỗi khoản dự phòng có một cặp đối ứng bên tài sản** (phần nhượng tái). Ở BVH phi nhân thọ:
   dự phòng gross 8.741.115 tr − tài sản tái bảo hiểm 3.300.010 tr = **dự phòng thuần 5.441.105 tr**.
   Dùng gross khi đáng dùng thuần làm phóng đại quy mô rủi ro **60%**.

## Một xung đột quy định vs chuẩn mực — `[QĐ]`, và nó phổ biến toàn ngành

Thuyết minh của **Techcombank** (4.17.1 iii) kể một chuyện hiếm khi được viết ra rõ như vậy:

- **28/12/2005**: Bộ Tài chính ban hành **Quyết định 100/2005/QĐ-BTC**, gồm **Chuẩn mực kế toán số 19
  — Hợp đồng bảo hiểm**.
- Theo CMKT 19, **từ tháng 01/2006 việc trích lập dự phòng dao động lớn là không còn cần thiết**, vì
  dự phòng này phản ánh *"các yêu cầu đòi bồi thường không tồn tại tại thời điểm lập báo cáo tài chính"*
  — tức nó không phải một nghĩa vụ hiện hữu.
- **Nhưng**: Bộ Tài chính chưa có hướng dẫn cụ thể việc áp dụng CMKT 19, và theo quy định hiện hành,
  công ty **vẫn trích**.

**Câu hỏi đặt ra khi đó: đây là chuyện riêng của TCGI, hay của cả ngành?**

**Đã trả lời — cả ngành.** BVH `[BCTC]`:

| | 31/12/2024 | Thay đổi 9T/2025 | 30/9/2025 |
|---|---:|---:|---:|
| Dự phòng dao động lớn (phi nhân thọ) | 186.907.656.143 | **+40.770.365.891** | **227.678.022.034** |

BVH **vẫn trích, và trích ở tỷ lệ cao gấp đôi TCGI (2% so với 1%)**. Khoản mục này vẫn tăng trong năm
2025 — hai mươi năm sau khi chuẩn mực kế toán nói nó không cần thiết.

Với người làm số, bài học rất thực: **một khoản mục có thể tồn tại vì lý do thủ tục, không vì lý do
kinh tế** — và nếu bạn xây một cây metric coi mọi dòng trên báo cáo là có nghĩa kinh tế thì bạn sẽ giải
thích sai. Ở đây, "dự phòng dao động lớn tăng 40,8 tỷ" **không** nói lên điều gì về rủi ro tổn thất; nó
nói lên rằng công thức 2% vẫn đang chạy.

## Còn trống — cần thêm tài liệu

| Còn thiếu | Trạng thái · cần gì |
|---|---|
| **Quy trình nghiệp vụ và bus matrix**: bán/tái tục · thu phí · giám định · bồi thường · nhượng tái · đầu tư nguồn phí — grain của từng cái | 🔴 Không có trong bất kỳ tài liệu công khai nào. Phải dựng **trên giấy** từ chính sách kế toán — đó sẽ là việc của stage 03–04 |
| **Phân khúc nghiệp vụ** phi nhân thọ theo số của BVH | 🟡 Một phần: có **tăng trưởng theo nghiệp vụ của toàn thị trường** (xe cơ giới +12,2% · tài sản-thiệt hại +11,2% · sức khỏe +10,2%), nhưng **không có phí của riêng BHBV theo nghiệp vụ** |
| **Kênh phân phối** | 🟡 Một phần: biết quy mô mạng lưới (180 chi nhánh · 1.200 PGD · 227.000 đại lý) và biết bancassurance bị siết, nhưng **không có phí theo kênh** |
| **Expense ratio và combined ratio riêng phi nhân thọ** | 🔴 Cần **BCTC riêng của Bảo hiểm Bảo Việt**. Thay thế gần nhất hiện có: **biên LNST 2,32%** của BHBV — xem [02-metrics](../02-metrics/README.md) |
| **Tỷ lệ an toàn vốn** cơ chế mới | 🔴 Không công bố trong BCTC quý lẫn báo cáo thường niên. Cần đọc trực tiếp Thông tư 67/2023 |
| **APE · NBV · persistency** | 🔴 Không phải chỉ tiêu kế toán, và **báo cáo thường niên cũng không công bố**. Thay thế gần nhất: **doanh thu khai thác mới (KTM) +24,8%** của BVNT năm 2025 |
