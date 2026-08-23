# Domains — thư viện tri thức ngành

Ghi chú học theo **ngành**, không theo lần làm việc. Đây là chỗ tri thức ngành tích luỹ và ở lại,
độc lập với mọi repo framework.

## Vì sao tách riêng

`datapot-analytic-agent-v2` là **engagement-first**: tổ chức theo lần làm việc
(`work/<ngày>-<slug>/`), và `knowledge/` của nó thuộc về một tổ chức cụ thể. Rất tốt để *làm*,
nhưng tri thức ngành học được sẽ nằm rải ở N bản clone và không ai đọc lại.

Thư viện này là **domain-first**: một folder một ngành, năm stage cố định. Shape lấy từ repo v1
(`datapot-analytics-agent/domains/`) — nhưng v1 chỉ có shape, không có nội dung; mọi cơ chế thật
vẫn nằm ở v2.

**Cách dùng đúng: v2 là công cụ, thư viện này là nơi lưu kết quả.**

## Registry

| Ngành | Trạng thái | Ghi chú |
|---|---|---|
| [banking](banking/) | 🟢 Xong 01–02 | VN retail banking. Nguồn: estate `banking-flagship` của v2 + báo cáo công khai Techcombank |
| [insurance](insurance/) | 🟢 Xong 01–02 | Bảo hiểm VN, neo **Bảo Việt (BVH)**. **Không có estate v2** — nửa cơ học lấy từ thuyết minh kế toán BCTC thay vì từ một mô hình dữ liệu. BCTC là PDF **scan**, phải OCR — xem [ocr-pdf.ps1](insurance/references/ocr-pdf.ps1). Có thêm **tầng thị trường** (số toàn ngành từ báo cáo thường niên) mà banking chưa có |
| retail | ⚪ Chưa | |

## Shape mỗi ngành

```
<ngành>/
├── 01-domain-analysis/   quy trình nghiệp vụ · bus matrix · chiều conform
├── 02-metrics/           cây metric · catalog · cạm bẫy đo lường
├── 03-data-profile/      profile nguồn · map field → thực thể
├── 04-semantic-model/    star schema · DAX
├── 05-report/            trang báo cáo · theme
└── references/           tài liệu gốc (báo cáo, thuyết minh, deck) — KHÔNG commit file lớn
```

## Luật của thư viện này

**Mọi dòng phải ghi nguồn.** Đây là luật quan trọng nhất — nếu không, cấu trúc từ một bộ dữ liệu
synthetic sẽ bị nhớ thành sự thật của ngành. Ký hiệu dùng chung cho cả thư viện:

| Ký hiệu | Nghĩa |
|---|---|
| `[v2]` | Từ estate synthetic `banking-flagship` của agent-v2 — **cấu trúc đáng tin, số liệu không thật** |
| `[v1]` | Từ template của repo v1 (`framework/templates/metric-tree.yaml`) |
| `[TCB]` | Từ tài liệu công khai Techcombank — xem `references/` |
| `[BCTC]` | Từ thuyết minh chính sách kế toán trong một BCTC — *định nghĩa*, không phải grain hay cạm bẫy dữ liệu |
| `[CTY]` | Từ báo cáo công khai của công ty neo của ngành đó |
| `[QĐ]` | Từ quy định pháp lý (Thông tư NHNN, Luật KDBH…) — luật, không phải lựa chọn phân tích |
| `[?]` | Chưa xác minh. Không được dùng để kết luận |

## Luật thứ hai: số phải kiểm được

Học được ở banking, siết lại ở insurance (nguồn là PDF scan phải OCR): **mỗi con số dùng để kết luận
phải qua một phép kiểm số học độc lập** — cộng dọc, hoặc tái tạo lại một tỷ lệ đã công bố. Không phải
để cẩn thận cho đẹp: phép kiểm này đã bắt được một file export cân đối bị lỗi ở banking
([verification-tcb.md](banking/02-metrics/verification-tcb.md)) và bảy lỗi ký tự OCR ở insurance
([verification-bvh.md](insurance/references/verification-bvh.md)).

Mỗi ngành giữ một file `verification-*.md` ghi lại toàn bộ phép kiểm, kể cả **những thứ không tính
được và chặn ở đâu**. Phần "không tính được" quan trọng ngang phần tính được.

Thêm một ngành: `cp -r banking/ <ngành>/`, xoá nội dung, thêm một dòng vào Registry.
