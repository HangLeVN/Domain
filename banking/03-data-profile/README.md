# 03 — Data profile: nguồn có gì, hình dạng ra sao

⚪ Chưa làm.

## Sẽ chứa gì

- Profile từng feed: số dòng, % null, uniqueness, khoảng giá trị — **chỉ số tổng hợp, không giá trị thô**
- Map field → thực thể nghiệp vụ
- Bộ rule `dq:` với ngưỡng và mức severity

## Nguồn để nạp

`[v2]` `Framework/datapot-analytic-agent-v2/knowledge/sources/banking-core.md` — source card đã có
**10 rule `dq:`** phủ 6 chiều chất lượng dữ liệu của DAMA (completeness · uniqueness · consistency ·
conformity · accuracy · freshness).

⚠️ Dữ liệu thô không còn trên đĩa (`ingest/inbox/banking-sample-dataset/` đã purge ở `/close`), nên
stage này chỉ đọc lại được profile đã distill, không chạy lại profile mới được.

Các bẫy quan trọng nhất đã được rút lên [../02-metrics/README.md](../02-metrics/README.md) mục
*Cạm bẫy đo lường* — vì một cái bẫy chỉ có nghĩa khi đứng cạnh metric nó phá.
