# 02 — Metrics: đo cái gì, và đo sai ở đâu

Nguồn: `[v2]` — `knowledge/business-model.md` (cây metric banking) + 9 card trong
`knowledge/metrics/banking/` + rule `dq:` trong `knowledge/sources/banking-core.md`.

Cây YAML máy đọc được: [metric-tree.yaml](metric-tree.yaml).

## 4 nhóm hero KPI

### GROWTH — tăng trưởng khối lượng

| Metric | Công thức | Grain / tính chất | Bẫy |
|---|---|---|---|
| **Total Deposit Balance** | Σ `Balance_VND` tại cuối tháng | **semi-additive** | Không cộng qua các tháng. Dùng `LASTNONBLANK` theo Date |
| **CASA Balance** | Deposit Balance, chỉ sản phẩm CASA (`ProductSubCategory` ∈ {CA, SA}) | subset driver | Là *tập con*, không phải metric độc lập |
| **CASA Achievement %** | CASA Balance ÷ CASA Target | ratio | Target ở grain chi nhánh × tháng, phải unpivot trước khi join |
| **Loan Disbursed** | Σ số tiền giải ngân | **additive**, theo sự kiện | Là *dòng chảy* (flow), không phải *tồn* (stock) — đừng lẫn với dư nợ |
| **Weighted Avg Interest Rate** | Σ(rate × amount) ÷ Σ(amount) | ratio có trọng số | Bình quân giản đơn của lãi suất là **sai** |
| **Transaction Value & Volume** | Σ `Amount_VND` · đếm dòng | additive | **`Amount_VND` CÓ DẤU: Debit âm, Credit dương.** Tổng thẳng sẽ triệt tiêu nhau |

### SAFETY — rủi ro tín dụng

| Metric | Công thức | Bẫy |
|---|---|---|
| **NPL Ratio** *(headline)* | NPL Balance ÷ Total Balance — **balance-weighted** | Đây là phán quyết có chủ: balance-weighted là chính, count là phụ |
| **NPL Account Ratio** *(phụ)* | NPL Accounts ÷ Total Accounts | Cùng tên "NPL" nhưng khác mẫu số — hai số khác nhau |
| **NPL Balance by Group** | Σ balance theo 6 lớp `NPLGroup` | Lớp nào tính là NPL là **`[QĐ]` quy định**, không tự đặt |
| **NPL Migration / roll-rate** | dịch chuyển giữa các lớp tháng-qua-tháng | Cần **2 cuối tháng liền kề**; tháng đầu là **blank, không phải 0** |

`Balance` là semi-additive nên **ratio tính trong một tháng**, không cộng tử số và mẫu số qua nhiều tháng.

### LOYALTY — sự hài lòng

| Metric | Công thức | Bẫy |
|---|---|---|
| **NPS** | %Promoter − %Detractor | Là *hiệu của hai tỷ lệ*, không phải điểm trung bình |
| Phân bố lý do | theo `PrimaryReason` | **`PrimaryReason` null 47–50%, và lệch hẳn: Detractor null 0%, Promoter null ~73%.** Mọi phân tích theo lý do đều nghiêng về người không hài lòng — nói ra, đừng che |

### EFFICIENCY / INCOME — hiệu quả & thu nhập

| Metric | Công thức | Bẫy |
|---|---|---|
| **Fee Income** | Σ `Fee_VND` | Chỉ là thu phí, **không phải** thu nhập lãi |
| *Estimated* Interest Income | Σ(dư nợ cuối tháng × BaseRate ÷ 12) | Bản gốc ghi rõ **"rough accrual, not booked"** — số ước lượng, không phải số hạch toán |
| *Estimated* Total Revenue | Fee Income + Estimated Interest Income | Proxy, không phải doanh thu |
| **Channel Mix %** (digital adoption) | giao dịch digital ÷ tổng giao dịch | digital = **Mobile + Internet**; quầy/ATM = non-digital. Xu hướng 36 tháng cho thấy dịch chuyển quầy → digital |
| **Service-Time SLA** | Avg(`ServiceTimeMinutes`) | **CHỈ Ở QUẦY GIAO DỊCH.** ~79% null ở kênh khác vì cấu trúc dữ liệu — phải filter về `Quầy giao dịch` TRƯỚC khi tính, nếu không con số vô nghĩa |

### Customer holdings — nuôi cả GROWTH và LOYALTY

| Metric | Công thức | Bẫy |
|---|---|---|
| **Product Penetration** | (số sản phẩm giữ ÷ số khách) bình quân theo tháng ≈ 3 | Phải `AVERAGEX` **theo tháng** mới đúng grain; tính gộp cả kỳ sẽ ra sai |
| Cross-sell | tỷ lệ khách nhiều sản phẩm · số khách active | — |

## Cạm bẫy đo lường — bảng tra nhanh

Đây là phần sách về banking không dạy, và là giá trị lớn nhất của estate `[v2]`:

| Bẫy | Hệ quả nếu bỏ qua |
|---|---|
| `Balance_VND` semi-additive | Cộng qua tháng → số dư phồng lên gấp số tháng |
| `Amount_VND` có dấu (Debit−/Credit+) | Tổng giao dịch tự triệt tiêu, ra gần 0 |
| `ServiceTimeMinutes` 79% null, chỉ có ở quầy | SLA tính trên toàn kênh → vô nghĩa |
| `PrimaryReason` null 50%, lệch detractor | "Lý do khách không hài lòng" bị hiểu thành "lý do chung" |
| `BranchName` không unique (29 tên / 50 chi nhánh) | Join theo tên gộp chi nhánh, mọi số theo chi nhánh sai |
| `BranchTargets` layout wide 36 cột tháng | Không unpivot thì không join được với actual |
| `DimDate` mang time `00:00:00` | Join theo datetime trượt, fact rơi ra ngoài |
| Loan Disbursed là flow, không phải stock | Lẫn giải ngân với dư nợ → sai cả GROWTH và SAFETY |

## Tầng P&L — estate v2 không đo được, `[TCB]` đã lấp

Estate `[v2]` **không đo được** những chỉ số dưới đây, và cột *feed dữ liệu cần* là chỗ giải thích
vì sao. Cột cuối đã điền từ báo cáo TCB; ❌ nghĩa là feed đó vắng **trong estate v2**, không phải
vắng trong dữ liệu thật.

| Chỉ số | Công thức | Feed dữ liệu cần (estate v2 KHÔNG có) | TCB Q2/2026 |
|---|---|---|---|
| **NIM** | Net Interest Income ÷ Average Earning Assets | chi phí lãi, tài sản sinh lời bình quân | **3,6%** (trượt 12T) |
| ├─ Net Interest Income | Interest Income − Interest Expense | | 10.763 tỷ (quý) |
| │  └─ *biên lãi thô* | Lợi suất tài sản − Chi phí vốn | | **8,07% − 4,91% = 3,16%** |
| │  ├─ Interest Income | Loan Balance × Average Yield | *v2 có dư nợ + BaseRate, nhưng chỉ ước lượng* | |
| │  └─ Interest Expense | Deposit Balance × **Cost of Funds** | ❌ không có cost of funds | 12.098 tỷ → **chi phí vốn 4,91%** |
| **CASA ratio** | CASA Balance ÷ Total Deposit Balance | *đo được — v2 có CASA Balance* | **38,3%** |
| **CIR** | Operating Expense ÷ Total Operating Income | ❌ không có OPEX | **30,9%** quý · 29,7% 6M |
| **Credit cost** | Chi phí dự phòng ÷ dư nợ bình quân | ❌ không có dự phòng | **0,5%** (12T) |
| **ROE** | Lợi nhuận sau thuế ÷ vốn chủ bình quân | ❌ không có P&L, không có vốn | **16,0%** (trượt 12T) |
| **CAR** | Vốn tự có ÷ tài sản có rủi ro | ❌ không có cấu phần vốn | **15,0%** (Basel II) |

Nguồn: `references/vn-tcb-cong-bo-kqkd-q22026.pdf`, công bố 28/07/2026 — chi tiết trang và mức độ tin
cậy từng số ở [../references/README.md](../references/README.md).

> **Các số trên đã được tự tính lại từ BCTC thô và kiểm chứng** — 6/8 khớp, 2 chỗ lệch đều giải thích
> được (cửa sổ bình quân, phạm vi hợp nhất vs riêng lẻ). Toàn bộ phép tính, kể cả chi phí lãi và biên
> lãi thô 3,16%: **[verification-tcb.md](verification-tcb.md)**. Bảng *feed dữ liệu cần* dưới đây giờ
> đã có nguồn thật cho mọi dòng ❌.

### Điều đọc được khi ghép hai nửa lại

Đây là lúc estate `[v2]` và báo cáo `[TCB]` nói chuyện với nhau, và ba câu dưới đây là phần thu hoạch
thật của bài tập này:

**1. NIM co lại vì chi phí vốn, không vì lãi suất cho vay.** TCB: NIM trượt 12 tháng 3,9% → **3,6%**,
trong khi chi phí vốn 6M 3,5% → **4,6% (+107 bps)**. Estate `[v2]` có `Weighted Avg Interest Rate`
phía tài sản nhưng **không có gì phía nguồn vốn** — nên nhìn vào estate, bạn sẽ thấy lãi suất cho vay
ổn định và kết luận sai rằng biên lãi ổn định. Nửa quyết định kết quả nằm ở phía TCB không mô hình hoá
được trong estate.

**2. `NPLGroup` → P&L đi qua credit cost, và đó là mắt xích estate không có.** TCB: NPL **1,15%** nhưng
credit cost chỉ **0,5%**, với tỷ lệ bao phủ nợ xấu **125,5%**. Ba số này là ba tầng khác nhau: *phân
loại* (NPL, có trong `[v2]`), *chi phí đã ghi nhận* (credit cost, không có), *đệm dự phòng đã lập*
(coverage, không có). Estate `[v2]` dừng ở tầng đầu — nó cho bạn biết nợ xấu bao nhiêu, nhưng không
cho biết điều đó **tốn bao nhiêu**.

**3. CASA là đòn bẩy, không phải chỉ tiêu doanh số.** Estate `[v2]` mô hình CASA như một target
(`CASA Achievement %` so với `BranchTargets`) — đúng ở tầng chi nhánh. Nhưng CASA ratio của TCB giảm
41,1% → **38,3%** *cùng lúc* chi phí vốn tăng 107 bps: CASA là tiền gửi không kỳ hạn, tức là **nguồn
vốn rẻ nhất**. CASA rơi thì chi phí vốn lên, và NIM co. Ba chỉ số một chuỗi nhân quả — cái mà bảng
target theo chi nhánh không hề thể hiện.

Ba điều này không đọc được từ riêng estate synthetic, cũng không đọc được từ riêng báo cáo. Đó là
lý do thư viện này cần cả hai nguồn.

Công thức NIM lấy từ `[v1]` — `datapot-analytics-agent/framework/templates/metric-tree.yaml`, khối
ví dụ banking. Đây là mảnh v1 có mà v2 không có.

**Kết luận đọc được từ bảng này:** estate synthetic mô hình hoá được *khối lượng* (GROWTH), *rủi ro
phân loại* (SAFETY), *sự hài lòng* (LOYALTY) và *một phần thu nhập* — nhưng không có **chi phí vốn**,
**chi phí vận hành**, **dự phòng** và **vốn tự có**. Bốn thứ vắng mặt đó chính là nơi lợi nhuận ngân
hàng được quyết định. Ngân hàng bán lẻ là nghề chênh lệch lãi cộng dự phòng, và cái bảng trống này
là bằng chứng.

## Định nghĩa vs quy định — bài học cần đóng

Card `npl-ratio.md` của `[v2]` viết: *"nhóm 3–5 của thang 6 lớp theo convention; ngưỡng chính xác
chốt ở `/build-model` từ ngữ nghĩa của group"* — và kèm ba chữ **"never invented"**.

Việc cần làm: mở thuyết minh BCTC của TCB, tìm phần phân loại nợ và trích lập dự phòng, rồi trả lời:

- [ ] Thang phân loại thật có mấy nhóm, và nhóm nào là nợ xấu? (`[QĐ]`)
- [ ] Số hiệu Thông tư NHNN đang áp dụng là gì? (đã thay đổi qua các năm — kiểm tra bản hiện hành)
- [ ] Tỷ lệ trích lập theo từng nhóm là bao nhiêu?
- [ ] TCB công bố NPL theo **balance-weighted** hay theo số lượng khoản? So với phán quyết của `[v2]`.

Đóng được 4 gạch đầu dòng này thì bạn phân biệt được dứt khoát: cái nào là **quyết định phân tích**
(có thể tranh luận, cần người ký), cái nào là **quy định** (không tranh luận, chỉ tuân thủ). Đây là
ranh giới quan trọng nhất khi làm số trong ngành ngân hàng.
