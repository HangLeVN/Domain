# 02 — Metrics: đo cái gì trong bảo hiểm

Số trong tài liệu này lấy từ bốn nguồn BVH: **BCTC hợp nhất Q3/2025** và **Q2/2026** (thuyết minh —
tách nhân thọ / phi nhân thọ), **Báo cáo thường niên 2025** (số toàn thị trường và kết quả từng công ty
con), và **bản kết xuất `.xls`** (chuỗi 4 quý). Mỗi con số đã qua một phép kiểm số học độc lập — xem
[verification-bvh.md](../references/verification-bvh.md).

Kỳ mới nhất là **Q2/2026**; kỳ có phân tích đầy đủ nhất là **9T/2025**. Chỗ nào dùng kỳ nào đều ghi rõ.

## Khái niệm phải nắm trước mọi con số: **giữ lại** (retained)

Một hợp đồng bảo hiểm gần như không bao giờ do một công ty gánh toàn bộ. Chuỗi bốn con số:

```
Phí bảo hiểm gốc            (GWP — thu từ khách hàng)
+ Phí nhận tái bảo hiểm     (gánh hộ công ty khác)
− Phí nhượng tái bảo hiểm   (đẩy sang công ty khác)
= Phí bảo hiểm GIỮ LẠI      ← hầu hết chỉ số hiệu quả tính trên con số NÀY
```

Và thêm một bước nữa, dễ lẫn nhất:

```
Phí giữ lại  −  biến động dự phòng phí chưa được hưởng  =  Doanh thu phí THUẦN (earned)
```

**Written ≠ earned.** Phí đã ghi nhận (written) là tiền của hợp đồng; phí đã hưởng (earned) là phần
thuộc về kỳ này. Lẫn hai cái là lỗi số một khi đọc báo cáo bảo hiểm — và nó tương đương đúng với bẫy
*flow vs stock* của `Loan Disbursed` trong [banking](../../banking/02-metrics/README.md).

Ở BVH 9T/2025 chuỗi đó ra thế này `[BCTC]`:

| | Toàn tập đoàn | Nhân thọ | Phi nhân thọ |
|---|---:|---:|---:|
| Phí bảo hiểm gốc | 32.425.043 | 24.199.241 | 8.225.802 |
| + Phí nhận tái | 324.671 | — | 324.671 |
| − Phí nhượng tái | (2.818.118) | +5.984 | (2.824.103) |
| **= Phí giữ lại** | **29.931.596** | **24.205.225** | **5.726.370** |
| **Tỷ lệ giữ lại** | **91,40%** | **100,02%** | **66,97%** |
| − Δ dự phòng phí chưa hưởng (thuần) | (130.496) | (14.198) | (116.297) |
| **= Doanh thu phí thuần** | **29.801.100** | **24.191.027** | **5.610.073** |

*(triệu đồng)*

⚠️ **Đọc bảng này theo cột, không theo dòng đầu.** Tỷ lệ giữ lại của tập đoàn là **91,4%** —
nhưng nhân thọ giữ ~100% và phi nhân thọ chỉ giữ **67%**. Con số 91,4% không mô tả đúng nửa nào; nó
chỉ là trọng số của việc nhân thọ lớn gấp ba. Đây là **cạm bẫy trộn bộ phận**, và nó là cạm bẫy đo
lường đầu tiên của ngành bảo hiểm.

## Câu hỏi trung tâm — ĐÃ CÓ CÂU TRẢ LỜI

> **Combined ratio của phi nhân thọ có vượt 100% không — tức nghiệp vụ lỗ và lợi nhuận đến từ đầu tư?**

### Trả lời phần đo được: **có, và rất rõ**

Bộ phận `Hoạt động bảo hiểm` (thuyết minh 35), 9T/2025, triệu đồng:

| | Số | Ghi chú |
|---|---:|---|
| Doanh thu thuần HĐKD bảo hiểm | 30.389.405 | |
| Tổng chi phí trực tiếp | (29.024.681) | bồi thường + dự phòng + hoa hồng |
| Chi phí bán hàng | (1.409.402) | |
| Chi phí quản lý doanh nghiệp | (5.277.825) | |
| **Kết quả NGHIỆP VỤ** | **(5.322.503)** | **lỗ 5.323 tỷ** |
| Lợi nhuận hoạt động tài chính | **7.448.814** | **lãi 7.449 tỷ** |
| Lợi nhuận khác | 62.070 | |
| **LNTT bộ phận bảo hiểm** | **2.188.381** | |

**Combined ratio = 35.711.908 ÷ 30.389.405 = 117,5%**

Nghiệp vụ bảo hiểm **lỗ 5.323 tỷ**. Đầu tư **lãi 7.449 tỷ**, tức **3,40 lần** toàn bộ lợi nhuận trước
thuế của bộ phận. Nói cách khác: **nếu bỏ hết thu nhập đầu tư, bộ phận bảo hiểm của BVH lỗ.** Toàn bộ
lợi nhuận, và hơn thế, đến từ việc đầu tư số tiền đang giữ hộ người mua bảo hiểm.

Mô hình kinh tế là *"lấy tiền của người khác đem đầu tư, và trả phí cho quyền được giữ tiền đó"* —
và ở đây khoản "phí cho quyền được giữ tiền" là 5.323 tỷ trong 9 tháng.

### Nhưng câu hỏi đã đặt sai — và chỗ sai mới là bài học

Combined ratio là chỉ số của **phi nhân thọ**: hợp đồng ngắn hạn, không có cấu phần tiết kiệm, phí thu
vào là để trả bồi thường. Áp nó lên một tập đoàn mà **95,6% dự phòng là nhân thọ** thì con số ra được
không có nghĩa như tên gọi của nó.

Cụ thể: trong 29.024.681 triệu "chi phí trực tiếp" có **11.129.164 triệu là tăng dự phòng toán học** —
tiền để dành **cho chính người mua bảo hiểm**, không phải tổn thất. Nó bị tính là chi phí, còn thu nhập
đầu tư sinh ra từ chính khoản để dành đó lại nằm ở một dòng khác, dưới vạch "nghiệp vụ". **Hai mặt của
một giao dịch bị xếp vào hai ô khác nhau.**

Bỏ riêng dòng đó ra:

| Cách tính | Combined ratio |
|---|---:|
| Như công bố | **117,5%** |
| Bỏ Δ dự phòng toán học | **80,9%** |

**Một dòng duy nhất làm tỷ số dịch 36,6 điểm phần trăm.** Đây là minh chứng bằng số cho luận điểm ở
[01](../01-domain-analysis/README.md): *lợi nhuận trong bảo hiểm là một ước lượng, không phải một phép trừ.*

### Kết luận đúng

1. **Với nhân thọ, "combined ratio > 100%" là thiết kế của sản phẩm, không phải dấu hiệu yếu.** Mọi công
   ty nhân thọ khoẻ mạnh đều "lỗ nghiệp vụ" theo cách đo này, vì phần lớn phí thu vào là tiền tiết kiệm
   của khách phải để dành lại.
2. **Với phi nhân thọ, combined ratio là chỉ số thật** — nhưng BVH **không tách chi phí theo nửa** ở
   bất kỳ tài liệu nào hiện có, nên **không tính được combined ratio phi nhân thọ**. Xem mục dưới.
3. **Không bao giờ báo cáo combined ratio ở mức tập đoàn có cả hai nửa.** Nếu buộc phải, phải nói kèm
   tỷ trọng nhân thọ. 117,5% mà không nói "95,6% dự phòng là nhân thọ" là một con số gây hiểu sai.

### Bằng chứng mạnh hơn con số 117,5%: lợi nhuận của hai công ty con

Báo cáo thường niên 2025 công bố kết quả **từng pháp nhân** — thứ mà BCTC hợp nhất không cho. Đây là
cách trả lời câu hỏi combined ratio mà không cần combined ratio `[CTY]`:

| Pháp nhân | Tổng doanh thu | LNST | **Biên LNST** |
|---|---:|---:|---:|
| **Bảo Việt Nhân thọ** (BVNT) | 45.260 tỷ *(phí bảo hiểm 32.640 tỷ)* | **2.168 tỷ** · +43,6% | **4,79%** |
| **Bảo hiểm Bảo Việt** (BHBV) | 12.920 tỷ · +8,3% | **300 tỷ** | **2,32%** |
| Quản lý Quỹ Bảo Việt (BVF) | 199 tỷ · +13,3% | 76,9 tỷ | 38,64% |
| Công ty Mẹ (holding) | 1.828 tỷ · +8,0% | 1.285 tỷ | — *(LNST/vốn điều lệ 17,3%)* |
| **Hợp nhất** | **59.700 tỷ** · +5% | **2.922 tỷ** · +33,2% | 4,89% |

**BHBV là doanh nghiệp phi nhân thọ lớn thứ 2 Việt Nam, và nó kiếm 300 tỷ trên 12.920 tỷ doanh thu.**
Biên lợi nhuận sau thuế **2,32%**. Trong khi đó công ty quản lý quỹ — không gánh rủi ro bảo hiểm nào —
có biên **38,64%**, gấp **17 lần**.

Con số 2,32% đó nói về nghề phi nhân thọ mạnh hơn bất kỳ tỷ lệ nào tôi tự tính được: **bán bảo hiểm phi
nhân thọ ở Việt Nam gần như không sinh lời từ nghiệp vụ.** Doanh thu 12.920 tỷ đã bao gồm thu nhập đầu
tư; trừ phần đó ra thì kết quả nghiệp vụ rất mỏng và có thể âm — nhưng **không tính được chính xác** vì
BCTC riêng của BHBV không có trong tay `[?]`.

### Bằng chứng thứ ba, và là bằng chứng sạch nhất: một dòng dự phòng

Q2/2026, số đã kiểm từ PDF `[BCTC]`:

| | Q2/2026 (3 tháng) |
|---|---:|
| Doanh thu thuần HĐKD bảo hiểm `15` | 10.703.923.026.128 |
| Tổng chi trực tiếp HĐKD bảo hiểm `41` | (9.720.825.333.493) |
| **Lợi nhuận gộp HĐKD bảo hiểm `42`** | **+983.097.692.635** |
| trong đó: hoàn nhập dự phòng lãi cam kết đầu tư tối thiểu `24` | **+2.376.553.425.690** |
| **Nếu bỏ riêng dòng đó ra** | **−1.393.455.733.055** |

**Lãi 983 tỷ trở thành lỗ 1.393 tỷ chỉ vì một khoản hoàn nhập dự phòng.** Dự phòng ở đây không phải một
chi tiết kỹ thuật — **nó là kết quả kinh doanh**. Đây là điểm 3 của [01](../01-domain-analysis/README.md)
ở dạng thuần khiết nhất: *lợi nhuận là một ước lượng, không phải một phép trừ.*

## Phi nhân thọ — đo được đến đâu

| Chỉ số | Giá trị | Trạng thái |
|---|---:|---|
| Phí bảo hiểm gốc | 8.225.802 tr | 🟢 |
| Phí giữ lại · tỷ lệ giữ lại | 5.726.370 tr · **66,97%** | 🟢 |
| Doanh thu phí thuần (earned) | 5.610.073 tr | 🟢 |
| **Loss ratio** | **46,02%** | 🟢 |
| Còn lại cho hoa hồng + bộ máy | 2.913.836 tr = **51,94%** phí thuần | 🟢 |
| **Expense ratio** | — | 🔴 **không tính được** |
| **Combined ratio** | — | 🔴 **không tính được** |

**Chặn ở đâu:** hoa hồng (2.194.073 tr), chi khác HĐKD bảo hiểm (1.250.821 tr), chi phí bán hàng
(1.409.402 tr) và chi phí QLDN (5.638.619 tr) **không được tách nhân thọ / phi nhân thọ** ở bất kỳ
thuyết minh nào — thuyết minh 26 tách phí và bồi thường, thuyết minh 27 tách chi khác *theo loại chi*,
thuyết minh 35 gộp hai nửa. Cần **BCTC riêng của Bảo hiểm Bảo Việt** (công ty con), không phải BCTC
riêng của Tập đoàn.

Nhận xét đọc được từ 51,94% còn lại: nếu expense ratio phi nhân thọ ở mức phổ biến của thị trường Việt
Nam (hoa hồng đại lý cao), combined ratio phi nhân thọ sẽ nằm quanh 100%. **Nhưng đó là suy đoán, không
phải số đo — `[?]`.**

## Bốn nhóm chỉ số

### A. QUY MÔ / TĂNG TRƯỞNG

| Metric | Công thức | BVH 9T/2025 |
|---|---|---|
| Phí bảo hiểm gốc (GWP) | Σ phí thu từ khách hàng | 32.425.043 tr · **+3,13%** yoy |
| Phí nhận tái / nhượng tái | — | 324.671 / 2.818.118 tr — **nhận tái 100% là phi nhân thọ** |
| **Tỷ lệ giữ lại** | phí giữ lại ÷ (gốc + nhận tái) | 91,40% tập đoàn · 66,97% phi nhân thọ |
| **Doanh thu phí thuần** | phí giữ lại − Δ dự phòng phí chưa hưởng | 29.801.100 tr |

⚠️ Tăng trưởng lệch nhau giữa hai nửa: nhân thọ **+2,2%**, phi nhân thọ **+5,9%**. Con số tập đoàn
+3,13% lại là một trung bình che mất cả hai.

### B. HIỆU QUẢ NGHIỆP VỤ (chủ yếu phi nhân thọ)

| Metric | Công thức | Đọc thế nào |
|---|---|---|
| **Loss ratio** | (bồi thường thuộc trách nhiệm giữ lại + Δ dự phòng bồi thường) ÷ phí thuần | Định phí đúng hay sai. BVH phi nhân thọ: **46,02%** |
| **Expense ratio** | (chi phí bán hàng + chi phí quản lý) ÷ phí thuần | Bộ máy và hoa hồng đại lý |
| **Combined ratio** | **loss ratio + expense ratio** | **> 100% = LỖ nghiệp vụ.** Chỉ có nghĩa ở phi nhân thọ |

Cách dựng loss ratio phi nhân thọ, đầy đủ dấu — đây là chỗ dễ sai nhất:

```
− Chi bồi thường gốc            (3.532.563)
− Chi bồi thường nhận tái          (36.309)
+ Các khoản giảm trừ chi phí            0,1
+ Thu bồi thường nhượng tái      1.066.098
+ Hoàn dự phòng bồi thường         309.418     ← dấu DƯƠNG: dự phòng giảm thì lãi
− Giảm dự phòng BT nhượng tái     (388.416)    ← dấu ÂM: tài sản tái bảo hiểm giảm
= Bồi thường thuần               (2.581.671)   ÷ 5.610.073 = 46,02%
```

Hai dòng cuối là cặp đối ứng của **cùng một tổn thất**, một bên là nợ, một bên là tài sản. Bỏ sót một
trong hai làm loss ratio sai vài điểm phần trăm mà vẫn "trông hợp lý".

### C. NHÂN THỌ

| Metric | Công thức / ý nghĩa | BVH |
|---|---|---|
| **APE** (Annual Premium Equivalent) | phí định kỳ năm đầu + 10% × phí đóng một lần | 🔴 không công bố trong BCTC |
| **NBV** (New Business Value) | giá trị hiện tại của lợi nhuận tương lai từ hợp đồng mới | 🔴 không công bố |
| **Persistency** | tỷ lệ hợp đồng còn hiệu lực sau 13 / 25 tháng — chất lượng bán, không phải số lượng bán | 🔴 không công bố |
| Δ dự phòng toán học | biến động khoản mục lớn nhất bên nợ | **+11.129.164 tr** trong 9 tháng |
| Dự phòng toán học (số dư) | | **168.277.749 tr = 6,58× vốn chủ sở hữu** |

Ba dòng 🔴 đầu là chỉ số quản trị nhân thọ, **không phải chỉ tiêu kế toán** — muốn có phải lấy báo cáo
thường niên hoặc bản trình bày nhà đầu tư. Đây là điểm khác banking: ở banking, gần như mọi chỉ số hero
(NIM, CASA, CIR, NPL) đều dựng được từ BCTC. Ở nhân thọ thì không.

### D. ĐẦU TƯ — nơi lợi nhuận thật sự sinh ra

| Metric | BVH 9T/2025 |
|---|---|
| Doanh thu hoạt động tài chính | 10.248.604 tr |
| Chi phí hoạt động tài chính | (2.036.921) tr |
| **Lợi nhuận hoạt động tài chính** | **8.211.684 tr** — bằng **3,08×** LNTT hợp nhất (2.664.795 tr) |
| Trong đó thuộc bộ phận bảo hiểm | 7.448.814 tr |

**Dự phòng đảm bảo lãi suất cam kết** là chỗ nối giữa đầu tư và nghiệp vụ, và là cấu phần biến động
mạnh nhất của cả báo cáo:

| | 9T/2024 | 9T/2025 | Thay đổi |
|---|---:|---:|---:|
| Δ dự phòng lãi cam kết đầu tư tối thiểu | (3.597.159) | **+754.259** | **+4.351.418** |
| Lợi nhuận gộp HĐKD bảo hiểm | (1.036.263) | **+1.414.659** | **+2.450.922** |

Riêng dòng trên giải thích **178%** biến động của dòng dưới. Nghĩa là: lợi nhuận gộp bảo hiểm đảo từ
**lỗ 1.036 tỷ** sang **lãi 1.415 tỷ**, và nguyên nhân chi phối **không phải phí** (chỉ +3,13%), **không
phải bồi thường**, mà là một khoản **dự phòng cho lãi suất cam kết** — hoàn nhập khi đầu tư tốt hơn cam
kết, trích thêm khi kém hơn.

Số dư khoản dự phòng này tại 30/9/2025 là **15.987.478 tr = 62,55% vốn chủ sở hữu**. Một biến động lãi
suất buộc trích lại sẽ ăn vào vốn chủ ở quy mô đó. Đây là **rủi ro trung tâm của một công ty nhân thọ**,
và nó không tồn tại ở ngân hàng lẫn phi nhân thọ.

### E. AN TOÀN VỐN — đã thay đổi cơ chế, xem mục dưới

## Chuỗi bốn quý — Q3/2025 → Q2/2026

Nguồn: bản kết xuất `.xls`, **đã đối chiếu từng dòng với PDF** cho hai quý có báo cáo (Q3/2025 và
Q2/2026). Đơn vị tỷ đồng.

| | Q3-2025 | Q4-2025 | Q1-2026 | Q2-2026 |
|---|---:|---:|---:|---:|
| Doanh thu phí bảo hiểm | 10.448,27 | 11.244,57 | 10.577,35 | **11.532,49** |
| Doanh thu phí thuần | 9.549,41 | 10.332,20 | 9.594,34 | 10.447,10 |
| **Lợi nhuận gộp HĐKD bảo hiểm** | 244,84 | 216,70 | 307,86 | **983,10** |
| Lợi nhuận gộp HĐ tài chính | 2.915,80 | 2.919,32 | 2.958,37 | 3.237,62 |
| Δ dự phòng lãi cam kết | −152,41 | +270,67 | **0** *(thật)* | **+2.376,55** |
| LNTT | 962,98 | 1.061,82 | 1.005,99 | **1.283,36** |
| LNST | 797,76 | 874,11 | 815,63 | **1.047,36** |
| EPS (đồng) | 1.038 | 1.157 | 1.077 | **1.391** |

Bảng cân đối, cùng nguồn:

| | 30/9/2025 | 31/12/2025 | 31/3/2026 | 30/6/2026 |
|---|---:|---:|---:|---:|
| Tổng tài sản | 272.801,45 | 291.911,21 | 307.487,71 | **315.683,22** |
| Nợ phải trả | 247.243,63 | 266.301,16 | 281.191,74 | 288.358,83 |
| Vốn chủ sở hữu | 25.557,83 | 25.610,05 | 26.295,97 | 27.324,39 |
| **Vốn chủ ÷ tài sản** | 9,37% | 8,77% | 8,55% | **8,66%** |
| Dự phòng toán học | 168.277,75 | 171.409,33 | — | **178.666,39** |

Tổng tài sản tăng **+15,7%** trong 9 tháng, vốn chủ chỉ **+6,9%** → **đòn cân tăng**. Ở bảo hiểm nhân
thọ điều này là bình thường, không phải dấu hiệu xấu: tài sản phình lên vì dự phòng của người mua bảo
hiểm phình lên, không vì công ty đi vay.

⚠️ **Ba lỗi của bản kết xuất `.xls`** — phải biết trước khi dùng, chi tiết trong
[verification-bvh.md](../references/verification-bvh.md):
thiếu giá trị (chi phí QLDN trống ở 2/4 quý, mỗi quý ~1.859–2.232 tỷ — PDF có, export không) ·
đảo dấu (cột Q3-2025 để dương nhiều dòng chi phí mà PDF ghi âm) ·
gán sai nhãn (807,88 tỷ *Quỹ dự trữ bắt buộc* bị xếp vào *Nguồn vốn đầu tư XDCB*) ·
và **không có phân rã dự phòng nghiệp vụ** — chỉ dừng ở tổng *Nợ dài hạn*.

Một ô trống **không** phải lúc nào cũng là lỗi: ô Δ dự phòng lãi cam kết ở Q1-2026 là **số 0 thật**,
kiểm được vì Δ của H1/2026 (+2.376.553.425.690) bằng đúng Δ của riêng Q2/2026 → Q1 không có biến động.
Phân biệt "thiếu dữ liệu" với "bằng không" chỉ làm được khi có nguồn thứ hai.

**Kết luận về nguồn:** bản `.xls` tốt để dựng chuỗi thời gian và để **đối chiếu độ lớn**, nhưng
**không được dùng làm nguồn cho cấu trúc**. PDF thuyết minh là nguồn có thẩm quyền.

## Cú phân kỳ của hai nửa — H1/2026 so với H1/2025

`[BCTC]` thuyết minh 26, phí bảo hiểm gốc, tỷ đồng:

| | H1/2025 | H1/2026 | Thay đổi |
|---|---:|---:|---:|
| Nhân thọ | 16.661,99 | 16.118,93 | **−3,26%** |
| Phi nhân thọ | 5.315,99 | 6.283,50 | **+18,20%** |
| **Tổng** | **21.977,98** | **22.402,43** | **+1,93%** |
| Tỷ trọng phi nhân thọ | 24,19% | **28,05%** | |

**Con số tập đoàn +1,93% che một nửa đang co lại và một nửa đang bùng.** Nếu chỉ theo dõi tổng, bạn sẽ
kết luận "tăng trưởng chậm nhưng ổn định" — trong khi thực tế là hai nghề đi hai hướng ngược nhau.

Thêm một dấu hiệu chất lượng: phi nhân thọ **phí +18,20%** nhưng **chi bồi thường gốc chỉ +6,19%**
(2.268,25 → 2.408,66 tỷ). Bồi thường tăng chậm hơn phí nhiều → loss ratio đang cải thiện. Điều này
**khớp với nhận định định tính** trong Báo cáo thường niên rằng *"tỷ lệ bồi thường [của BHBV] tiếp tục
được cải thiện"* — một lần hiếm khi số liệu quý xác nhận đúng câu chữ của báo cáo thường niên.

Tỷ lệ giữ lại phi nhân thọ vẫn ổn định: **66,30%** (H1/2025) → **65,05%** (H1/2026) → **66,97%**
(9T/2025). Nghĩa là chính sách tái bảo hiểm không đổi; tăng trưởng là tăng trưởng thật, không phải do
giữ lại nhiều hơn.

## Cạm bẫy đo lường — đã có số để chứng minh

| # | Cạm bẫy | Bằng chứng ở BVH |
|:--:|---|---|
| 1 | **Trộn nhân thọ với phi nhân thọ** | Tỷ lệ giữ lại 91,4% (tập đoàn) vs 67,0% (phi nhân thọ). H1/2026: tổng **+1,93%** che nhân thọ **−3,26%** và phi nhân thọ **+18,20%**. Combined ratio 117,5% mà 95,6% dự phòng là nhân thọ |
| 2 | **Written vs earned** | Phí giữ lại 29.931.596 ≠ phí thuần 29.801.100. Chênh 130.496 tr chỉ là Δ dự phòng phí chưa hưởng |
| 3 | **Dự phòng toán học bị tính như tổn thất** | Bỏ ra thì combined ratio từ 117,5% xuống 80,9% |
| 4 | **Cặp dự phòng gốc / nhượng tái phải đi cùng nhau** | +309.418 (hoàn dự phòng BT) và −388.416 (giảm dự phòng BT nhượng tái) là hai mặt một tổn thất |
| 5 | **Dấu của biến động dự phòng đảo ngược trực giác** | Dự phòng *giảm* làm lợi nhuận *tăng*. Dòng `24` +754.259 là một khoản **hoàn nhập** |
| 6 | **Số bộ phận không cộng thẳng ra số hợp nhất** | Phí bộ phận bảo hiểm 32.490.849 − bút toán điều chỉnh 1.922 = 32.488.927 |
| 7 | **Tỷ lệ trích dự phòng là lựa chọn của công ty** | BVH trích dao động lớn **2%**, TCGI **1%** — xem [01](../01-domain-analysis/README.md) |
| 8 | **Nợ lớn nhất không nằm ở dòng mang tên nó** | Dự phòng nghiệp vụ 197.433.095 tr nằm trong *Nợ dài hạn*, mục `344` |

## Quy mô và đòn cân — so với banking

| | BVH (bảo hiểm) | Đặc điểm |
|---|---:|---|
| Tổng tài sản 30/9/2025 | 272.801.453 tr | |
| **Dự phòng nghiệp vụ ÷ tổng tài sản** | **72,37%** | ở ngân hàng chỗ này là tiền gửi khách hàng — một **số hợp đồng**; ở đây là một **ước lượng chuyên môn** |
| Dự phòng toán học ÷ tổng tài sản | **61,69%** | |
| Vốn chủ ÷ tổng tài sản | **9,37%** | đòn cân ~10,7× |
| ROA (xấp xỉ, quy năm) | ~1,11% | thấp — bảng cân đối phình ra vì dự phòng, không vì kinh doanh |
| ROE (xấp xỉ, quy năm) | ~11,52% | |

⚠️ ROA/ROE là **xấp xỉ** — quy năm từ 9 tháng và dùng vốn chủ cuối kỳ. Xem cảnh báo trong
[verification-bvh.md](../references/verification-bvh.md). Không dùng để so sánh liên công ty.

**Một dòng để nhớ:** ở ngân hàng, 60–70% bảng cân đối là các **hợp đồng đã ký với số tiền đã biết**
(dư nợ, tiền gửi). Ở bảo hiểm nhân thọ, **61,7% bảng cân đối là một con số do actuary tính ra** — và
con số đó là **max của mấy phương pháp mà công ty tự chọn và Bộ Tài chính phê duyệt**. Đó là khác biệt
cấu trúc lớn nhất giữa hai ngành, và là lý do mọi cây metric bảo hiểm phải mang theo giả định.

## Thay đổi cơ chế an toàn vốn — `[QĐ]`

Khung pháp lý hiện hành:

| Văn bản | Ngày | Vai trò |
|---|---|---|
| **Luật Kinh doanh bảo hiểm 08/2022/QH15** | thông qua 16/6/2022 | luật gốc, thay Luật KDBH 2000 |
| **Nghị định 46/2023/NĐ-CP** | 01/7/2023 | quy định chi tiết thi hành |
| **Thông tư 67/2023/TT-BTC** | 02/11/2023 | hướng dẫn Luật + NĐ 46 |

**Điểm thay đổi lớn:** Luật 08/2022 **bãi bỏ quy định về biên khả năng thanh toán** theo mô hình
*Biên khả năng thanh toán 1*, thay bằng **tỷ lệ an toàn vốn** theo hướng dẫn của Bộ Tài chính, dựa
trên **mô hình vốn tương ứng quy mô và mức độ rủi ro** (risk-based capital).

⚠️ Hệ quả cho việc học: **"biên khả năng thanh toán" là khái niệm của chế độ cũ.** Rất nhiều tài liệu
và bài viết về bảo hiểm Việt Nam vẫn dạy chỉ số này — giống hệt tình trạng Thông tư 11/2021 trong
[banking](../../banking/02-metrics/npl-classification.md). Đây là lần thứ hai cùng một cái bẫy xuất
hiện ở hai ngành khác nhau, nên nó không phải trùng hợp mà là **đặc tính của mảnh `[QĐ]`: nó hết hạn,
và tài liệu học thì không**.

`[?]` **Chưa xác minh:** công thức và ngưỡng cụ thể của tỷ lệ an toàn vốn mới, cùng lộ trình áp dụng
— nằm trong Thông tư 67/2023 hoặc văn bản sau. **BCTC quý của BVH không công bố chỉ số này**, nên hai
file hiện có không giúp gì cho câu hỏi đó. Cần đọc trực tiếp văn bản.

Cái BVH **có** công bố, và đáng ghi nhớ vì là ràng buộc vốn thật `[BCTC]`:

> **Quỹ dự trữ bắt buộc** — trích **5% lợi nhuận sau thuế** mỗi kỳ của **Bảo hiểm Bảo Việt** và
> **Bảo Việt Nhân thọ** (từng đơn vị riêng), số dư tối đa **10% vốn điều lệ** mỗi đơn vị. Mục đích:
> *bổ sung vốn điều lệ và đảm bảo khả năng thanh toán.*
> Số dư hợp nhất 30/9/2025: **807.884.043.569 đ**, nằm trong vốn chủ sở hữu.
