# 01 — Domain analysis: ngân hàng bán lẻ hoạt động ra sao

Nguồn: `[v2]` — `knowledge/business-model.md`, mục *Banking domain (VN Retail Bank)*, thêm 2026-07-20.

⚠️ Toàn bộ bảng dưới đây được đánh `ASSUMPTION` ở bản gốc: **không có stakeholder thật**, mọi dòng
do maintainer đứng thay chủ nghiệp vụ xác nhận, dựa trên dữ liệu synthetic đã profile. Cấu trúc
đáng tin; tên người và quyền sở hữu là role-handle giả.

## Quy trình nghiệp vụ — 6 cái

Luật Kimball: một dòng là **sự kiện nghiệp vụ dạng động-từ + danh-từ**, không phải một hệ thống,
không phải một phòng ban.

| Quy trình | Grain (một dòng = ) | Sự kiện đo | Owner |
|---|---|---|---|
| Payments & transactions | một giao dịch | nạp / rút / chuyển / thanh toán | Head of Retail |
| Deposits & balance position | tài khoản × cuối tháng | chốt số dư cuối tháng | Head of Retail |
| Customer holdings | khách × sản phẩm × tháng | đang giữ sản phẩm, mang số dư | Head of Retail |
| Lending / originations | một khoản vay giải ngân | khoản vay được cấp & giải ngân | Chief Risk |
| Customer satisfaction (NPS) | một phiếu trả lời | trả lời survey, nêu lý do | Head of CX |
| Targets / planning | chi nhánh × tháng × loại target | đặt chỉ tiêu cho kỳ | Head of Retail |

**Điều đáng học ở bảng này:** ba loại grain khác nhau cùng tồn tại trong một ngân hàng —
**sự kiện** (giao dịch, giải ngân), **snapshot định kỳ** (số dư cuối tháng), và **kỳ kế hoạch**
(target tháng). Ba loại này không cộng được với nhau, và mọi lỗi đo lường trong banking gần như đều
xuất phát từ chỗ trộn chúng.

## Bus matrix

| Quy trình \ Chiều | Date | Customer | Branch | Product | Account\* |
|---|:--:|:--:|:--:|:--:|:--:|
| Payments & transactions | x | x | x | x | |
| Deposits & balance position | x (tháng) | x | x | x | x |
| Customer holdings | x (tháng) | x | x | x | |
| Lending / originations | x | x | x | x | |
| Customer satisfaction (NPS) | x | x | x | | |
| Targets / planning | x (tháng) | | x | | |

\* `Account` là **bridge** (Customer × Product), không phải chiều báo cáo.

Đọc bảng theo cột: `Date` và `Branch` phủ cả 6 quy trình → mọi so sánh chi nhánh và mọi chuỗi thời
gian đều roll-up được. `Product` vắng ở NPS và ở Targets → **không thể** quy sự hài lòng về sản
phẩm, cũng không thể đặt target theo sản phẩm. Một ô trống trong bus matrix là một câu hỏi không
trả lời được — đó là công dụng thật của cái bảng này.

## Chiều conform — 4 cái

| Chiều | Nghĩa nghiệp vụ | Bẫy đã ghi nhận |
|---|---|---|
| **Date** | kỳ báo cáo; fact ở grain ngày, snapshot/target ở grain tháng | `DimDate` mang time component `00:00:00` — **phải normalize khi join** |
| **Customer** | một khách hàng, khoá `CustomerID` (5.000 dòng); mang `HomeBranchID` | `HomeBranchID` chính là **chỗ ngồi của RLS theo chi nhánh** |
| **Branch** | một chi nhánh, khoá `BranchID` (50 dòng) | **`BranchName` KHÔNG unique — chỉ 29 giá trị distinct trên 50 chi nhánh. Join bằng `BranchID`, tuyệt đối không bằng tên** |
| **Product** | một sản phẩm, khoá `ProductID` (24 dòng); có `ProductCategory` | — |

Bẫy `BranchName` là ví dụ sạch nhất về vì sao **không bao giờ join bằng tên**: 50 chi nhánh chỉ có
29 tên, nên join theo tên sẽ âm thầm gộp các chi nhánh khác nhau lại và mọi số theo chi nhánh đều
sai mà không có thông báo lỗi nào.

## Degenerate dimensions — 5 cái

Sống ngay trên bảng fact (ID ↔ Name là 1:1 theo profiling), không tách thành chiều riêng:

`Channel` (6 giá trị, song ngữ) · `TransactionType` (8) · `NPLGroup` (**6 lớp phân loại rủi ro tín
dụng**) · `NPSCategory` · `PrimaryReason` (lý do NPS)

`NPLGroup` là cái quan trọng nhất trong nhóm này — nó là trục phân loại nợ, và ngưỡng nào tính là
nợ xấu **là quy định `[QĐ]`, không phải lựa chọn phân tích**.

⚠️ **Estate `[v2]` ghi `NPLGroup` là thang 6 lớp; quy định Việt Nam có 5 nhóm** (nợ xấu = nhóm 3+4+5).
Không phải lỗi của estate — dữ liệu synthetic không có nghĩa vụ mô phỏng quy định — nhưng người học
chỉ đọc estate sẽ nhớ sai. Chi tiết:
**[02-metrics/npl-classification.md](../02-metrics/npl-classification.md)**.

## Ba thứ estate không mô hình hoá — đã lấp bằng `[TCB]`

Đều là hoạt động thật của một ngân hàng bán lẻ:

- **Nguồn vốn (funding)** — huy động từ dân cư vs thị trường liên hàng, cấu trúc chi phí vốn.
- **Vận hành & chi phí** — OPEX theo khối, nền tảng của CIR.
- **Trích lập dự phòng** — chi phí tín dụng, và cách nó chuyển hoá từ `NPLGroup` sang P&L.

Ba thứ này không phải "thiếu sót của bộ dữ liệu" — chúng là nửa còn lại của ngành. Xem bảng *tầng
P&L còn trống* ở [02-metrics](../02-metrics/README.md), giờ đã đóng bằng số TCB Q2/2026.

## Phạm vi thật của một ngân hàng — `[TCB]`

Nguồn: BCTN 2025 (`references/techcombank-bao-cao-thuong-nien-2025-vie-update.pdf`, 197 trang).

### Không phải một ngân hàng, mà một hệ sinh thái 5 pháp nhân

`Techcombank` · `TechcomSecurities (TCBS)` — đã IPO · `Techcom Capital` — quản lý quỹ, AUM ~12.000 tỷ
với gần 50.000 nhà đầu tư · `Techcom General Insurance (TCGI)` — bảo hiểm phi nhân thọ, hết năm đầu
hoạt động trọn vẹn · `Techcom Life (TCLI)` — bảo hiểm nhân thọ, mới ra mắt.

Quy mô: 18,0 triệu khách hàng tại 31/12/2025; S&P `BB-` triển vọng *Tích cực*; giá trị thương hiệu
1,4 tỷ USD.

### Khối kinh doanh

| Khối | Viết tắt |
|---|---|
| Ngân hàng Bán lẻ | RBG |
| Ngân hàng Doanh nghiệp và Định chế tài chính | CIBG |
| Dữ liệu và Phân tích | DnA |
| Tiếp thị | — |

### Phân khúc khách hàng — hai trục khác nhau

**Cá nhân (KHCN), phân theo tài sản:** High-Net-Worth → thương hiệu **Private** (có Techcombank
Private Lounge) · Affluent → thương hiệu **Priority** · **Mass Affluent (MAF)**.

**Doanh nghiệp (KHDN), phân theo quy mô:** **SME · ESME · MSME**, cùng phân khúc *micro và emerging
SME*; thêm trục **Merchant** (chiến lược Merchant Hub).

Đáng chú ý: đây là **hai trục phân khúc không cùng bản chất** — cá nhân phân theo *tài sản*, doanh
nghiệp phân theo *quy mô*. Không thể nhồi vào một cột `Segment` duy nhất mà vẫn giữ được nghĩa.

### Cơ cấu danh mục tín dụng — cũng hai trục khác nhau

Dư nợ 2025: ngân hàng mẹ +18,4% → **758,3 nghìn tỷ**; hợp nhất +20,7% → **824,1 nghìn tỷ**.

| Nửa danh mục | Quy mô (nghìn tỷ, theo quý) | Cắt theo |
|---|---|---|
| **KHDN** | 443 → 463 → 452 | **ngành kinh tế**: bất động sản · FMCG/bán lẻ/logistics · xây dựng · vật liệu xây dựng · tiện ích & viễn thông · khác |
| **KHCN** | 284 → 295 → 316 → 342 → 372 | **loại sản phẩm**: cho vay mua nhà cá nhân (~59%) · cho vay tín chấp · thẻ tín dụng · cho vay ký quỹ · khác (tiêu dùng thế chấp BĐS) |

Ngân hàng theo dõi riêng *tỷ trọng cho vay bất động sản / tổng dư nợ* như một chỉ số tập trung rủi ro.

Hai chuỗi trên đọc ra từ biểu đồ bị xáo khi trích PDF, nên đã kiểm chứng: 452 + 372 = **824 nghìn tỷ**
= đúng dư nợ hợp nhất 824,1 công bố ở cùng trang. Vậy KHDN chiếm **~55%** danh mục.

### Hạn mức pháp lý vs thực tế — `[QĐ]`

Đây là phần tài liệu công khai cho mà estate synthetic không bao giờ có: **ngưỡng quy định**, kèm số thực hiện.

| Chỉ tiêu | Hạn mức quy định | Thực tế 31/12/2025 | Thực tế 31/12/2024 |
|---|---|---|---|
| Tỷ lệ dự trữ thanh khoản | ≥ 10% | 18,7% | 20,8% |
| Khả năng chi trả 30 ngày (VND) | ≥ 50% | 66,6% | 95,9% |
| Cho vay / tổng tiền gửi (LDR) | ≤ 85% | **76,5%** | 77,1% |
| Vốn ngắn hạn cho vay trung–dài hạn | ≤ 30% | **24,6%** | 26,3% |
| CAR | ≥ 8,0% | 15,0% | — |

Hai số in đậm **khớp chính xác** với cột 4Q25 trong bản công bố KQKD Q2/2026 — hai tài liệu độc lập
xác nhận nhau. Ngân hàng còn tự đặt chỉ tiêu nội bộ theo chuẩn Basel III trên mức quy định.

### Điều này dạy gì về mô hình hoá

So với estate `[v2]`:

| | Estate `[v2]` | Thực tế `[TCB]` |
|---|---|---|
| Phân khúc khách hàng | **có** cột `DimCustomer[Segment]` | hai trục khác bản chất (tài sản cho KHCN, quy mô cho KHDN) — một cột không đủ |
| Loại khách hàng | **chỉ cá nhân** — `Age`, `Gender`, `DateOfBirth`, `Occupation` | ~55% dư nợ là **KHDN**, hoàn toàn vắng trong estate |
| Chiều ngành kinh tế | **không có** | trục chính để cắt danh mục KHDN và đo tập trung rủi ro |
| Sản phẩm | `ProductCategory` ∈ {Deposit, Loan, Card, Wealth} + `ProductSubCategory`, 24 dòng | trục sản phẩm KHCN khớp được; trục ngành KHDN thì không |
| Ngưỡng quy định | không mô hình hoá | 5 hạn mức bắt buộc, phải giám sát liên tục |

Kết luận: estate `[v2]` là một **ngân hàng bán lẻ**, không phải một ngân hàng. Nửa doanh nghiệp — vốn
là hơn nửa dư nợ và là nơi rủi ro tập trung ngành phát sinh — không tồn tại trong đó. Và vì bus matrix
chỉ dựng được từ dữ liệu có sẵn, cái thiếu này không hiện ra như một ô trống: nó hiện ra như **một câu
hỏi không ai nghĩ đến việc đặt**.
