# Kiểm chứng số BVH

| Nguồn | Dạng | Trích bằng | Dùng cho |
|---|---|---|---|
| BCTC hợp nhất **Q3/2025** (84 tr.) | PDF **scan** | [`ocr-pdf.ps1`](ocr-pdf.ps1) | §1–§5 — phân tích đầy đủ nhất |
| BCTC hợp nhất **Q2/2026** (90 tr.) | PDF **scan** | [`ocr-pdf.ps1`](ocr-pdf.ps1) | §7 — kỳ mới nhất |
| BCTC riêng Q3/2025 và Q2/2026 | PDF **scan** | — | ⚠️ công ty mẹ holding, **không có nghiệp vụ bảo hiểm** |
| **Báo cáo thường niên 2025** (346 tr.) | PDF **có lớp text** | `pdftotext -layout` | §8 — số toàn thị trường và từng pháp nhân |
| `BVH_KQKD.xls` · `CDKT` · `LCTT` · `BCTC_Tom_Tat` | HTML đội tên `.xls` | [`xls2tsv.py`](../../banking/references/xls2tsv.py) | §6 — chuỗi 4 quý |

## Vì sao file này phải có

Nguồn quan trọng nhất — **BCTC hợp nhất** — là ảnh chụp giấy, phải OCR. Nghĩa là mỗi con số có xác suất
bị đọc sai **mà không có dấu hiệu gì**. Bằng chứng cụ thể, gặp ngay trong buổi đầu:

| Chỗ | OCR đọc ra | Đúng |
|---|---|---|
| Vốn điều lệ, file **hợp nhất** | `7.423.227.640.000` | ✅ đúng |
| Vốn điều lệ, file **riêng** | `703.227R40.ooo` | ❌ sai — cùng một con số, cùng một máy OCR |
| Tổng dự phòng, thuyết minh 24 | `497.433.09S.27S.13S` | ❌ `197.433.095.275.135` |
| Dự phòng bồi thường 30/9 | `2.7%.831.372.253` | ❌ `2.796.831.372.253` |
| Doanh thu thuần, thuyết minh 35 | `30.3u.413` | ❌ `30.384.413` |

Nên **luật của thư viện này áp dụng ở mức nghiêm nhất: một con số chỉ được dùng sau khi qua một phép
kiểm số học độc lập.** Ba số cuối trong bảng trên đều bị bắt bằng cách cộng dọc, không bằng cách đọc lại.

Hai nguồn còn lại **không** phải OCR — báo cáo thường niên có lớp text, bản `.xls` là HTML — nhưng chúng
có loại lỗi riêng, và tệ hơn ở một điểm: **lỗi của chúng nhìn không ra**. Bản kết xuất `.xls` thiếu giá
trị, đảo dấu và gán sai nhãn (§6); báo cáo thường niên tự mâu thuẫn ở bốn chỗ (§8). Một con số sạch sẽ,
đúng định dạng, nằm đúng ô — vẫn có thể sai.

Dưới đây là toàn bộ phép kiểm đã chạy. Đơn vị VND trừ khi ghi khác.

---

## 1. Báo cáo KQKD hợp nhất — 9 tháng 2025 (PDF tr.11–14)

| # | Phép kiểm | Kết quả |
|:--:|---|:--:|
| 1 | `01` Doanh thu phí = `02` + `03` + `04` → 32.425.043.113.632 + 324.670.859.704 − 260.787.018.838 = **32.488.926.954.498** | ✅ |
| 2 | `05` Phí nhượng tái = `06` + `07` → −2.818.118.407.396 + 130.291.397.342 = **−2.687.827.010.054** | ✅ |
| 3 | `08` Phí thuần = `01` + `05` = **29.801.099.944.444** | ✅ |
| 4 | `15` Doanh thu thuần = `08` + `09` = 29.801.099.944.444 + 583.313.224.911 = **30.384.413.169.355** | ✅ |
| 5 | `18` = `19` + `20` → 16.279.885 + 84.477.959 = **100.757.844** | ✅ |
| 6 | `22` = `23`+`24`+`25`+`26` → −11.129.164.189.881 + 754.259.150.270 − 404.128.554.782 − 93.357.131.626 = **−10.872.390.726.019** | ✅ |
| 7 | `29` = `16`+`17`+`18`+`21`+`22`+`27`+`28` = **−25.484.088.862.235** | ✅ |
| 8 | `31` = `32` + `33` → −2.194.073.488.954 − 1.250.821.008.146 = **−3.444.894.497.100** | ✅ |
| 9 | `41` = `29`+`30`+`31` = −25.484.088.862.235 − 40.770.365.891 − 3.444.894.497.100 = **−28.969.753.725.226** | ✅ |
| 10 | `42` Lợi nhuận gộp bảo hiểm = `15` + `41` = **1.414.659.444.129** | ✅ |
| 11 | `43` = 431.299.002.648 − 436.133.301.566 = **−4.834.298.918**; `44` = 10.248.604.399.432 − 2.036.920.679.822 = **8.211.683.719.610**; `48` = 16.714.907.459 − 2.895.903.753 = **13.819.003.706** | ✅ |
| 12 | `50` LNTT = `42`+`43`+`44`+`45`+`46`+`47`+`48` = **2.664.794.699.828** | ✅ |
| 13 | `60` LNST = `50`+`51`+`52` = 2.664.794.699.828 − 476.944.737.305 + 767.849.199 = **2.188.617.811.722**; và `61`+`62` = 2.119.232.451.737 + 69.385.359.985 = **2.188.617.811.722** | ✅ |

Kiểm thêm EPS: 2.119.232.451.737 ÷ 742.322.764 cp = 2.854,87 → công bố **2.855** ✅

**13/13 khớp tuyệt đối.** Khối KQKD dùng được không dè dặt.

## 2. Bảng cân đối hợp nhất (PDF tr.9–10)

**Phép kiểm bắt buộc của thư viện** (luật học từ banking — chính phép kiểm này đã phát hiện file TCB lỗi):

| Ngày | Nợ phải trả | Vốn chủ sở hữu | Tổng | Tổng nguồn vốn công bố |
|---|---:|---:|---:|:--:|
| 30/9/2025 | 247.243.627.277.116 | 25.557.825.433.774 | **272.801.452.710.890** | 272.801.452.710.890 ✅ |
| 31/12/2024 | 227.720.439.778.201 | 23.565.887.059.923 | **251.286.326.838.124** | *(suy ra — cột bị cắt)* |

Kiểm phụ:

| # | Phép kiểm | Kết quả |
|:--:|---|:--:|
| 14 | `310` + `330` = 49.498.254.221.488 + 197.745.373.055.628 = **247.243.627.277.116** = `300` | ✅ |
| 15 | Nợ dài hạn = 307.881.157.885 + 922.000.000 + 3.474.622.608 + 197.433.095.275.135 = **197.745.373.055.628** | ✅ |
| 16 | Dự phòng nghiệp vụ `344` = Σ `344.1..344.7` = **197.433.095.275.135** *(7 cấu phần, xem §3)* | ✅ |
| 17 | Vốn chủ = Σ 8 cấu phần = 7.423.227.640.000 + 7.310.458.742.807 + 15.445.192.000 + 3.870.269.047.054 + 103.568.802.818 + 4.988.636.685.030 + 807.884.043.569 + 1.038.335.280.496 = **25.557.825.433.774** | ✅ |
| 18 | LNST chưa phân phối = 2.879.355.892.226 + 2.109.280.792.804 = **4.988.636.685.030** | ✅ |
| 19 | 31/12/2024: nợ dài hạn = 227.720.439.778.201 − 40.840.468.409.215 = **186.879.971.368.986** *(trùng số đọc được)*; và 186.879.971.368.986 − 186.574.100.476.584 = 305.870.892.402 = 303.139.567.653 + 2.731.324.749 | ✅ |

## 3. Thuyết minh 24 — dự phòng nghiệp vụ, **tách nhân thọ / phi nhân thọ** (PDF tr.63)

Đây là thuyết minh quan trọng nhất của cả bộ tài liệu.

### Nhân thọ

| Loại dự phòng | 31/12/2024 | Thay đổi trong kỳ | 30/9/2025 |
|---|---:|---:|---:|
| Dự phòng toán học | 157.148.585.024.401 | +11.129.164.189.881 | 168.277.749.214.282 |
| Dự phòng phí chưa được hưởng | 242.531.152.855 | +14.198.208.340 | 256.729.361.195 |
| Dự phòng bồi thường | 68.617.657.754 | −5.535.278.876 | 63.082.378.878 |
| Dự phòng chia lãi | 3.521.002.598.958 | +404.128.554.782 | 3.925.131.153.740 |
| Dự phòng lãi cam kết đầu tư tối thiểu | 16.741.736.693.139 | −754.259.150.270 | 15.987.477.542.869 |
| Dự phòng đảm bảo cân đối | 162.249.272.468 | +19.561.651.915 | 181.810.924.383 |
| Dự phòng dao động lớn | — | — | — |
| **Tổng** | **177.884.722.399.575** | **+10.807.258.175.772** | **188.691.980.575.347** |

### Phi nhân thọ (bảo hiểm gốc và nhận tái — *gross*)

| Loại dự phòng | 31/12/2024 | Thay đổi | 30/9/2025 |
|---|---:|---:|---:|
| Dự phòng phí chưa được hưởng | 5.209.277.210.371 | +246.588.810.498 | 5.455.866.020.869 |
| Dự phòng bồi thường | 3.043.167.026.696 | −309.418.033.321 | 2.733.748.993.375 |
| Dự phòng dao động lớn | 186.907.656.143 | +40.770.365.891 | 227.678.022.034 |
| Dự phòng đảm bảo cân đối | 250.026.183.799 | +73.795.479.711 | 323.821.663.510 |
| **Tổng gross** | **8.689.378.077.009** | **+51.736.622.779** | **8.741.114.699.788** |
| Nhượng tái (tài sản tái bảo hiểm) | (3.558.134.396.677) | | (3.300.009.957.420) |
| **Dự phòng thuần** | **5.131.243.680.332** | | **5.441.104.742.368** |

| # | Phép kiểm | Kết quả |
|:--:|---|:--:|
| 20 | Cộng dọc nhân thọ, cả hai ngày | ✅ |
| 21 | Cộng dọc phi nhân thọ gross, cả hai ngày | ✅ |
| 22 | Cộng dọc dự phòng thuần phi nhân thọ, cả hai ngày | ✅ |
| 23 | gross − nhượng tái = thuần, cả hai ngày (8.741.114.699.788 − 3.300.009.957.420 = 5.441.104.742.368) | ✅ |
| 24 | Từng dòng: UPR 5.455.866.020.869 − 1.817.189.180.310 = 3.638.676.840.559; bồi thường 2.733.748.993.375 − 1.482.820.777.110 = 1.250.928.216.265 | ✅ |
| 25 | Nhân thọ + phi nhân thọ = tổng tập đoàn: 188.691.980.575.347 + 8.741.114.699.788 = **197.433.095.275.135** = `344` ở bảng cân đối | ✅ |
| 26 | 31/12/2024: 177.884.722.399.575 + 8.689.378.077.009 = **186.574.100.476.584** | ✅ |
| 27 | Δ nhân thọ + Δ phi nhân thọ = 10.807.258.175.772 + 51.736.622.779 = **10.858.994.798.551** = Δ tổng | ✅ |
| 28 | **Nối sang KQKD:** Δ UPR nhân thọ + Δ UPR phi nhân thọ = 14.198.208.340 + 246.588.810.498 = **260.787.018.838** = dòng `04` | ✅ |
| 29 | Δ UPR nhượng tái phi nhân thọ = 1.817.189.180.310 − 1.686.897.782.968 = **130.291.397.342** = dòng `07` | ✅ |
| 30 | Δ dự phòng bồi thường: −5.535.278.876 (NT) − 309.418.033.321 (PNT) = **−314.953.312.197** = dòng `27` | ✅ |
| 31 | Δ dự phòng bồi thường nhượng tái = 1.871.236.613.709 − 1.482.820.777.110 = **388.415.836.599** = dòng `28` | ✅ |
| 32 | Δ đảm bảo cân đối: 19.561.651.915 + 73.795.479.711 = **93.357.131.626** = dòng `26` | ✅ |
| 33 | Δ dao động lớn = **40.770.365.891** = dòng `30` (toàn bộ ở phi nhân thọ) | ✅ |

Sáu phép kiểm 28–33 **nối bảng cân đối với báo cáo kết quả** — đây là loại kiểm chứng mạnh nhất, vì
nó buộc hai báo cáo khác nhau, ở hai trang khác nhau, phải khớp nhau qua từng cấu phần.

## 4. Thuyết minh 26 — doanh thu và chi phí, **tách nhân thọ / phi nhân thọ** (PDF tr.67)

9 tháng 2025:

| Chỉ tiêu | Nhân thọ | Phi nhân thọ | Tổng | Khớp dòng KQKD |
|---|---:|---:|---:|:--:|
| Phí bảo hiểm gốc | 24.199.240.634.978 | 8.225.802.478.654 | 32.425.043.113.632 | `02` ✅ |
| Phí nhận tái bảo hiểm | — | 324.670.859.704 | 324.670.859.704 | `03` ✅ |
| Tổng phí nhượng tái | (5.984.473.662) | 2.824.102.881.058 | 2.818.118.407.396 | `06` ✅ |
| Chi bồi thường gốc + đáo hạn | 12.035.562.108.068 | 3.532.562.788.139 | 15.568.124.896.207 | `16` ✅ |
| Chi bồi thường nhận tái | — | 36.309.181.707 | 36.309.181.707 | `17` ✅ |
| Thu bồi thường nhượng tái | — | 1.066.097.708.256 | 1.066.097.708.256 | `21` ✅ |

Sáu phép kiểm nữa (34–39), tất cả khớp. Ba dòng có dấu "—" nói lên một điều về cấu trúc, không phải
về số: **nhận tái bảo hiểm và thu hồi nhượng tái là chuyện của phi nhân thọ**, nhân thọ gần như không
tái bảo hiểm (phí nhượng tái *âm* 5,98 tỷ — một khoản hoàn nhập).

### Phép kiểm 40 — phép kiểm quyết định

Dựng lại **doanh thu phí thuần từng nửa** rồi cộng lại:

```
Phi nhân thọ:  8.225.802.478.654 + 324.670.859.704 − 246.588.810.498   (phí gốc + nhận tái − Δ UPR gross)
             − 2.824.102.881.058 + 130.291.397.342                     (− nhượng tái + Δ UPR nhượng tái)
             =  5.610.073.044.144
Nhân thọ:     24.199.240.634.978 + 5.984.473.662 − 14.198.208.340
             = 24.191.026.900.300
Cộng:          5.610.073.044.144 + 24.191.026.900.300 = 29.801.099.944.444
```

= đúng dòng `08` **Doanh thu phí bảo hiểm thuần** của báo cáo hợp nhất ✅

Phép kiểm này quan trọng vì nó xác nhận **toàn bộ việc tách nhân thọ / phi nhân thọ là đúng và đầy đủ**
— không sót cấu phần nào. Mọi tỷ số phi nhân thọ ở dưới đứng trên nền này.

## 5. Thuyết minh 35 — báo cáo bộ phận (PDF tr.77–79)

Bộ phận theo **lĩnh vực kinh doanh**: `Hoạt động bảo hiểm` · `Hoạt động tài chính` ·
`Bất động sản và khác` · `Các bút toán điều chỉnh hợp nhất`.

⚠️ Thuyết minh ghi rõ bộ phận bảo hiểm là *"Dịch vụ bảo hiểm (**nhân thọ và phi nhân thọ**)"* —
**gộp cả hai nửa vào một bộ phận.** Không có bộ phận theo khu vực địa lý (toàn bộ hoạt động ở Việt Nam).

Bộ phận **Hoạt động bảo hiểm**, 9T/2025 (triệu đồng):

| Chỉ tiêu | Số |
|---|---:|
| Doanh thu thuần hoạt động kinh doanh bảo hiểm | 30.389.405 |
| Tổng chi phí trực tiếp | (29.024.681) |
| Chi phí bán hàng | (1.409.402) |
| Chi phí quản lý doanh nghiệp | (5.277.825) |
| **= Kết quả nghiệp vụ (trước đầu tư)** | **(5.322.503)** |
| Lợi nhuận hoạt động tài chính | 7.448.814 |
| Lợi nhuận khác | 62.070 |
| **Tổng lợi nhuận kế toán trước thuế** | **2.188.381** |

| # | Phép kiểm | Kết quả |
|:--:|---|:--:|
| 41 | Cộng dọc bộ phận bảo hiểm ra đúng LNTT 2.188.381 | ✅ |
| 42 | LNTT bốn cột: 2.188.381 + 1.471.722 + 11.270 − 1.006.578 = **2.664.795** = LNTT hợp nhất | ✅ |
| 43 | Doanh thu phí: 32.490.849 − 1.922 = **32.488.927** | ✅ |
| 44 | Chi khác HĐKD bảo hiểm: −3.499.821 + 54.927 = **−3.444.894** | ✅ |
| 45 | Tổng chi trực tiếp: −29.024.681 + 54.927 = **−28.969.754** | ✅ |

---

## Tỷ số dẫn xuất — tất cả từ số đã kiểm

### Câu hỏi trung tâm: combined ratio

| Chỉ số | Công thức | Kết quả |
|---|---|---:|
| **Combined ratio, bộ phận bảo hiểm** | (29.024.681 + 1.409.402 + 5.277.825) ÷ 30.389.405 | **117,52%** |
| Kết quả nghiệp vụ | | **−5.323 tỷ** |
| Lợi nhuận đầu tư | | **+7.449 tỷ** |
| Đầu tư ÷ LNTT bộ phận | 7.448.814 ÷ 2.188.381 | **3,40×** |
| *Cùng công thức, bỏ Δ dự phòng toán học* | (35.711.908 − 11.129.164) ÷ 30.389.405 | **80,88%** |

Hai dòng cuối là điểm quan trọng nhất của cả bảng: **một dòng duy nhất làm tỷ số dịch 36,6 điểm phần trăm.**

### Cơ cấu hai nửa

| | Nhân thọ | Phi nhân thọ |
|---|---:|---:|
| Phí bảo hiểm gốc 9T/2025 | 24.199.240.634.978 (74,6%) | 8.225.802.478.654 (**25,4%**) |
| Dự phòng nghiệp vụ 30/9/2025 | 188.691.980.575.347 (95,6%) | 8.741.114.699.788 (**4,4%**) |
| Tăng trưởng phí gốc so với 9T/2024 | +2,2% | +5,9% |
| Tỷ lệ giữ lại (phí) | 100,02% | **66,97%** |
| Tỷ lệ giữ lại (dự phòng) | ~100% | **62,25%** |

*(Tỷ lệ giữ lại phi nhân thọ = 5.726.370.457.300 ÷ 8.550.473.338.358; nhân thọ >100% vì phí nhượng
tái âm.)*

Tỷ lệ giữ lại **toàn tập đoàn** = 29.931.595.565.940 ÷ 32.749.713.973.336 = **91,40%** — một con số
không mô tả đúng nửa nào.

### Loss ratio phi nhân thọ

```
Doanh thu phí thuần            5.610.073.044.144   (phép kiểm 40)
Bồi thường thuần đã phát sinh  2.581.671.307.024
  = −3.532.562.788.139 (gốc) − 36.309.181.707 (nhận tái) + 100.757.844 (giảm trừ)
    + 1.066.097.708.256 (thu nhượng tái) + 309.418.033.321 (hoàn dự phòng BT)
    − 388.415.836.599 (giảm dự phòng BT nhượng tái)
→ LOSS RATIO = 46,02%
```

Còn lại cho hoa hồng và bộ máy, sau khi trừ dao động lớn (40.770.365.891) và đảm bảo cân đối
(73.795.479.711): **2.913.835.891.518 = 51,94% phí thuần.**

### Quy mô và đòn cân

| Chỉ số | Giá trị |
|---|---:|
| Tổng tài sản 30/9/2025 | 272.801.452.710.890 |
| Tổng tài sản 31/12/2024 (suy ra) | 251.286.326.838.124 → **+8,56%** |
| Dự phòng nghiệp vụ ÷ tổng tài sản | **72,37%** |
| Dự phòng toán học ÷ tổng tài sản | **61,69%** |
| Dự phòng toán học ÷ vốn chủ sở hữu | **6,58×** |
| Dự phòng lãi cam kết ÷ vốn chủ sở hữu | **62,55%** |
| Vốn chủ sở hữu ÷ tổng tài sản | **9,37%** |
| ROA *(LNST quy năm ÷ tài sản bình quân)* | **~1,11%** |
| ROE *(LNST chủ sở hữu quy năm ÷ vốn chủ cuối kỳ, trừ lợi ích CĐ không kiểm soát)* | **~11,52%** |

⚠️ ROA/ROE là **xấp xỉ**: quy năm từ 9 tháng bằng ×4/3 (giả định phần còn lại của năm đồng đều — với
bảo hiểm nhân thọ thì giả định này yếu), và ROE dùng vốn chủ cuối kỳ vì không đọc được phần lợi ích cổ
đông không kiểm soát tại 31/12/2024. Ở banking, chính chỗ "vốn chủ bình quân" này đã tạo lệch 65 bps.
**Không dùng hai số này để so sánh với công ty khác.**

### Cú xoay của dự phòng lãi cam kết

| | 9T/2024 | 9T/2025 | Thay đổi |
|---|---:|---:|---:|
| `24` Dự phòng lãi cam kết đầu tư tối thiểu | (3.597.158.868.796) | +754.259.150.270 | **+4.351.418.019.066** |
| `42` Lợi nhuận gộp HĐKD bảo hiểm | (1.036.262.515.419) | +1.414.659.444.129 | **+2.450.921.959.548** |

Riêng dòng `24` giải thích **178%** biến động của dòng `42`. Phí gốc chỉ tăng **+3,13%**, còn LNST tăng
**+35,25%** (1.618.157.084.694 → 2.188.617.811.722).

---

## KHÔNG tính được từ hai file này — và vì sao

| Muốn tính | Chặn ở đâu |
|---|---|
| **Expense ratio và combined ratio riêng của phi nhân thọ** | Chi hoa hồng (2.194.073.488.954), chi khác HĐKD bảo hiểm (1.250.821.008.146), chi phí bán hàng (1.409.402.029.061) và chi phí QLDN (5.638.619.018.271) **không được tách nhân thọ / phi nhân thọ** ở bất kỳ thuyết minh nào. Thuyết minh 26 tách phí và bồi thường; thuyết minh 27 tách chi khác **theo loại chi**, không theo nghiệp vụ; thuyết minh 35 gộp hai nửa. → Cần BCTC riêng của **Bảo hiểm Bảo Việt** |
| Phân rã phí phi nhân thọ theo nghiệp vụ (xe cơ giới / sức khỏe / tài sản / hàng hải…) | Không có trong báo cáo quý |
| APE · NBV · persistency nhân thọ | Không phải chỉ tiêu BCTC — chỉ có ở báo cáo thường niên / bản trình bày nhà đầu tư |
| Tỷ lệ an toàn vốn (cơ chế mới) | Không công bố trong BCTC quý |
| Doanh thu phí theo kênh (đại lý / bancassurance / trực tuyến) | Không có |

**Một suy luận có thể làm nhưng KHÔNG chắc** — `[?]`: dự phòng đảm bảo cân đối phi nhân thọ trích
**2% phí giữ lại** *(thuyết minh 4.16.2 b(iii), áp cho nghiệp vụ sức khỏe)*, tăng 73.795.479.711 trong
9 tháng → quy năm 98.393.972.948 ÷ 2% ⇒ phí giữ lại nghiệp vụ sức khỏe ≈ **4.920 tỷ/năm**. Không thể
làm phép tương tự với dự phòng dao động lớn, vì tỷ lệ là *"tối đa từ 1% đến 3%"* và một số nghiệp vụ
có thể đã đạt trần 100% nên ngừng trích — hai ẩn số, một phương trình.

## Sai số OCR đã bắt được

| Trang | OCR | Đúng | Bắt bằng cách |
|---|---|---|---|
| tr.63 | `497.433.09S.27S.13S` | 197.433.095.275.135 | trùng khớp với `344` ở bảng cân đối |
| tr.63 | `2.7%.831.372.253` | 2.796.831.372.253 | cộng dọc dự phòng |
| tr.63 | `11.129.164.189.B81` · `IS.987.477.S42.869` · `3.521.n.598.9S8` | đọc lại từ cột nhân thọ | cộng dọc |
| tr.63 | `3.043.167.026.6%` | 3.043.167.026.696 | cộng dọc |
| tr.78 | `30.3u.413` | 30.384.413 | khớp dòng `15` |
| tr.10 | `7.423.227.640.ooo` · `2109.280.792.804` | `o`→`0`, thiếu dấu phân cách | cộng dọc vốn chủ |
| tr.12 | `(1 17.704.165.648)` | (117.704.165.648) | khoảng trắng chèn vào giữa số |

Tất cả đều là **lỗi ký tự trong con số**, không phải lỗi đặt số sai dòng. Cộng dọc bắt được hết.

---

## 6. Bản kết xuất `.xls` — dùng làm đối chứng độc lập, và ba lỗi của nó

Bốn file `.xls` từ nguồn dữ liệu tài chính (HTML đội tên `.xls`, cùng thủ thuật đã gặp ở banking) cho
chuỗi **Q3-2025 · Q4-2025 · Q1-2026 · Q2-2026**, đơn vị tỷ đồng.

### Phép kiểm 46 — đối chứng chéo OCR vs kết xuất

Cột **Q3-2025** của `BVH_KQKD.xls` được so với từng dòng của PDF đã OCR. **Hơn 30 dòng khớp độ lớn
tuyệt đối**, ví dụ:

| Dòng | `.xls` (tỷ) | PDF (VND) |
|---|---:|---:|
| Doanh thu phí bảo hiểm | 10.448,27 | 10.448.267.257.725 |
| Doanh thu phí thuần | 9.549,41 | 9.549.412.925.810 |
| Tăng dự phòng toán học | 2.984,61 | 2.984.608.083.156 |
| Tổng chi trực tiếp HĐKD BH | 9.504,75 | 9.504.752.925.403 |
| Lợi nhuận gộp HĐKD bảo hiểm | 244,84 | 244.838.162.662 |

Đây là **phép kiểm mạnh nhất trong cả tài liệu**: hai nguồn hoàn toàn độc lập — một bản OCR ảnh chụp
giấy và một bản kết xuất HTML — trùng nhau ở hơn 30 con số. Nó xác nhận pipeline OCR **không** tạo ra
lỗi hệ thống.

Kết xuất còn **bù được một chỗ OCR bị mất**: dòng *Thu bồi thường nhượng tái bảo hiểm* Q3/2025 bị OCR
cắt thành `411.` — kết xuất cho **411,59 tỷ**.

### Ba lỗi của bản kết xuất

| # | Lỗi | Bằng chứng |
|:--:|---|---|
| 1 | **Thiếu giá trị** | Dòng *Chi phí quản lý doanh nghiệp* **trống ở 2/4 quý** (Q3-2025 và Q1-2026). PDF cho Q3/2025 là **1.858.906.018.853**. Kiểm: 244,84 − 17,09 + 2.915,80 + 29,28 − 356,08 + 5,13 = 2.821,88; trừ 1.858,91 = **962,97** ≈ LNTT công bố 962,98 ✅ → ô trống là **dữ liệu bị mất**, không phải số 0 |
| 2 | **Đảo dấu, không nhất quán giữa các cột** | Cột Q3-2025 để **dương** nhiều dòng chi phí mà PDF ghi **âm** (*Tổng chi bồi thường* 8.296,85 vs PDF `(8.296.849.745.541)`; *Tăng dự phòng nghiệp vụ* 3.111,99 vs `(3.111.987.690.289)`), trong khi cùng cột đó dòng *dao động lớn* −11,81 lại đúng dấu. Ba cột còn lại thì âm |
| 3 | **Gán sai nhãn** | **807,88 tỷ** mà PDF ghi rõ là *Quỹ dự trữ bắt buộc hoạt động bảo hiểm* bị kết xuất xếp vào dòng *Nguồn vốn đầu tư XDCB*, còn dòng *Quỹ dự trữ bắt buộc* để trống. Đến cột Q2-2026 thì nó lại nằm đúng chỗ (821,57) |

Cộng thêm một giới hạn không phải lỗi: kết xuất **không có phân rã dự phòng nghiệp vụ** — chỉ dừng ở
tổng *Nợ dài hạn*. Toàn bộ §3 của tài liệu này chỉ tồn tại nhờ PDF thuyết minh.

**Và một ô trống không phải lúc nào cũng là lỗi.** Dòng Δ *dự phòng lãi cam kết* để trống ở Q1-2026 là
**số 0 thật**: Δ của H1/2026 (`+2.376.553.425.690`) bằng đúng Δ của riêng Q2/2026 → Q1 không có biến
động. Phân biệt được "thiếu dữ liệu" với "bằng không" **chỉ vì có nguồn thứ hai**.

### Phép kiểm 47 — bảng cân đối 4 quý

| Ngày | Nợ phải trả | Vốn chủ | Tổng | Tổng nguồn vốn công bố |
|---|---:|---:|---:|:--:|
| 30/9/2025 | 247.243,63 | 25.557,83 | 272.801,46 | 272.801,45 ✅ *(làm tròn)* |
| 31/12/2025 | 266.301,16 | 25.610,05 | **291.911,21** | 291.911,21 ✅ |
| 31/3/2026 | 281.191,74 | 26.295,97 | **307.487,71** | 307.487,71 ✅ |
| 30/6/2026 | 288.358,83 | 27.324,39 | **315.683,22** | 315.683,22 ✅ |

Và cột 30/9/2025 khớp PDF đến từng đồng (272.801.452.710.890) ✅
Cộng dọc 8 cấu phần vốn chủ tại 30/6/2026 = **27.324,39** ✅

## 7. BCTC hợp nhất Q2/2026 — kỳ mới nhất

| # | Phép kiểm | Kết quả |
|:--:|---|:--:|
| 48 | Q2 3 tháng: `01` = `02`+`03`+`04` → 11.465.029.379.911 + 55.609.843.088 + 11.853.538.111 = **11.532.492.761.110** | ✅ |
| 49 | Q2: `05` = `06`+`07` → −1.159.514.507.407 + 74.121.419.717 = **−1.085.393.087.690**; `08` = **10.447.099.673.420**; `15` = **10.703.923.026.128** | ✅ |
| 50 | H1 6 tháng: `01` = 22.402.432.622.450 + 320.903.742.999 − 613.497.839.774 = **22.109.838.525.675**; `05` = **−2.068.394.535.155**; `08` = **20.041.443.990.520**; `15` = **20.523.357.263.683** | ✅ |
| 51 | Q2: `22` = `23`+`24`+`25`+`26` → −4.311.616.977.564 + 2.376.553.425.690 − 334.973.797.177 − 31.864.703.129 = **−2.301.902.052.180** | ✅ |
| 52 | Q2: `42` = `15` + `41` = 10.703.923.026.128 − 9.720.825.333.493 = **983.097.692.635** | ✅ |
| 53 | **Nối hai báo cáo:** Δ dự phòng toán học H1/2026 ở KQKD `23` = **7.257.062.357.521** = đúng biến động ở thuyết minh 24 (171.409.330.097.570 → 178.666.392.455.091) | ✅ |
| 54 | Thuyết minh 26 Q2/2026: phí gốc nhân thọ 8.451.780.532.970 + phi nhân thọ 3.013.248.846.941 = **11.465.029.379.911** = `02` | ✅ |
| 55 | Thuyết minh 26 H1/2026: 16.118.934.926.710 + 6.283.497.695.740 = **22.402.432.622.450**; H1/2025: 16.661.989.728.096 + 5.315.992.305.834 = **21.977.982.033.930** | ✅ |
| 56 | H1/2026 nhượng tái: 5.393.969.866 + 2.308.261.624.282 = **2.313.655.594.148**; bồi thường gốc: 9.315.884.967.560 + 2.408.662.870.757 = **11.724.547.838.317** | ✅ |
| 57 | Thuyết minh 24: UPR 1/1/2026 = 275.305.265.939 (NT) + 5.564.312.424.245 (PNT) = **5.839.617.690.184** | ✅ |

⚠️ **Chỗ KHÔNG kiểm được:** khối dự phòng cột 6 tháng của KQKD Q2/2026 bị OCR trộn cột nặng —
`23`+`24`+`25`+`26` của cột H1 không cộng ra `22`. Nên **chỉ dùng các số Q2 3 tháng và hai số H1 đã được
nối chéo (phép kiểm 53, 55, 56)**; không dùng phần còn lại của cột H1.

### Số dẫn xuất từ Q2/2026

| Chỉ số | Giá trị |
|---|---:|
| **Lợi nhuận gộp HĐKD bảo hiểm Q2/2026** | **+983.097.692.635** |
| trong đó hoàn nhập dự phòng lãi cam kết | **+2.376.553.425.690** |
| **Nếu bỏ dòng đó ra** | **−1.393.455.733.055** |
| Phí gốc nhân thọ H1/2026 vs H1/2025 | 16.118,93 vs 16.661,99 tỷ → **−3,26%** |
| Phí gốc phi nhân thọ H1/2026 vs H1/2025 | 6.283,50 vs 5.315,99 tỷ → **+18,20%** |
| Tổng phí gốc | 22.402,43 vs 21.977,98 tỷ → **+1,93%** |
| Tỷ trọng phi nhân thọ | 24,19% → **28,05%** |
| Chi bồi thường gốc phi nhân thọ | 2.268,25 → 2.408,66 tỷ → **+6,19%** |
| Tỷ lệ giữ lại phi nhân thọ | 66,30% (H1/2025) → **65,05%** (H1/2026) |
| Dự phòng toán học 30/6/2026 | **178.666.392.455.091** (+4,23% trong H1) |

## 8. Báo cáo thường niên 2025 — nguồn duy nhất cho tầng thị trường

346 trang, **có lớp text** (`pdftotext -layout` chạy được), dấu tiếng Việt bị rơi như file Techcombank.

| # | Phép kiểm | Kết quả |
|:--:|---|:--:|
| 58 | Thị trường: phi nhân thọ 88,4 + nhân thọ 148,8 = **237,2 nghìn tỷ** | ✅ |
| 59 | Các pháp nhân: BVNT 45.260 + BHBV 12.920 = 58.180 tỷ vs hợp nhất **59.700 tỷ** — chênh 1.520 tỷ là BVF, BVSC, công ty mẹ trừ loại trừ hợp nhất | ✅ hợp lý |
| 60 | **Đối chứng chéo với BCTC:** phí gốc phi nhân thọ 9T/2025 = 8.225,80 tỷ, quy năm ×4/3 = **10.968 tỷ** ÷ thị trường phi nhân thọ 88.400 = **12,4%**, so với thị phần BHBV **12,6%** báo cáo công bố | ✅ lệch 0,2 đpt |

Phép kiểm 60 đáng chú ý: một con số suy ra từ **BCTC quý đã OCR** và một con số **do Hiệp hội Bảo hiểm
Việt Nam công bố** gặp nhau trong khoảng 1,5%. Hai chuỗi bằng chứng độc lập hoàn toàn.

### ⚠️ Bản thân báo cáo thường niên không nhất quán

| Chỉ tiêu | Chỗ này | Chỗ khác |
|---|---|---|
| Tăng trưởng phi nhân thọ 2025 | **+10,3%** | **11%** |
| Tăng trưởng nhân thọ 2025 | **+0,4%** | **−1,9%** *(dẫn IAV)* |
| Số đại lý và tư vấn viên | **227.000** | **237.000** |
| Thị phần BVNT | công bố **20,3%** | tự tính 32.640 ÷ 148.800 = **21,9%** |

Hai dòng đầu có thể là hai thước đo khác nhau nhưng báo cáo không nói rõ. **Kết luận: thị phần và tăng
trưởng ngành không phải sự thật tính được** — phải ghi kèm mẫu số và nguồn.

### Một chỗ tôi đã gần kết luận sai

Trang đầu báo cáo nêu *"lợi nhuận sau thuế đạt 2.168 tỷ đồng, tăng 43,6%"* mà **không nói của pháp nhân
nào**. Đọc nhanh sẽ hiểu đó là lợi nhuận của tập đoàn. Đến trang 61 mới rõ: **2.168 tỷ là của Bảo Việt
Nhân thọ**; LNST hợp nhất là **2.922 tỷ, +33,2%**. Tôi dừng lại kiểm thay vì dùng con số gặp đầu tiên —
đó là lý do duy nhất không sai. Cùng loại lỗi đã xảy ra ở banking khi một kết quả tìm kiếm trả về vốn
chủ sở hữu của **công ty chứng khoán con** thay vì của ngân hàng.
