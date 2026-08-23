# 04 — Semantic model: star schema & DAX

⚪ Chưa làm.

## Sẽ chứa gì

- Star schema: fact, dimension, quan hệ, hướng filter
- Cách xử lý semi-additive, RLS, marked date table
- Các measure DAX đáng học lại

## Nguồn để nạp — có sẵn một model đã kiểm chứng

`[v2]` `Framework/datapot-analytic-agent-v2/`

- `knowledge/models/banking-flagship/card.md` — **6 fact × 5 dim**, ERD mermaid, Import mode,
  `DimDate` marked as date table (day-grain 2023–2025), star một chiều (fact → dim), **không**
  bidirectional, **không** snowflake
- `knowledge/models/banking-flagship/dictionary.md` — sinh từ TMDL, 0 gap
- `fabric/sample-ws/banking-flagship/Banking Flagship.SemanticModel/` — TMDL là bản canonical

Bằng chứng chất lượng đã ghi trong card: **DAX smoke 28/28 PASS**, RLS "Branch View (demo)" PASS,
`validate_metric_trace` sạch cả hai chiều. Nghĩa là model này dùng được làm **đáp án đối chiếu**:
tự viết lại một measure rồi so với bản đã kiểm chứng.
