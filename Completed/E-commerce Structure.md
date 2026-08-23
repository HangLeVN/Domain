# 📊 E-COMMERCE ANALYTICS PLAYBOOK - STRUCTURE OVERVIEW

**Phiên Bản:** 2.0 (Complete + Enhanced)  
**Tạo Ngày:** 26 June 2026  
**Trạng Thái:** ✅ Ready for Production Use  
**Định Dạng:** Vietnamese-First (Tiếng Việt + English Keywords)  

---

## 🎯 PLAYBOOK PURPOSE

Hướng dẫn **Senior Data Analyst / Analytics Manager** trong e-commerce Vietnam:
- ✅ **Phân tích**: Phân tích các vấn đề metrics/KPI phức tạp
- ✅ **Suy luận**: Lập luận logic từ data → insights → recommendations  
- ✅ **Quyết định**: Đề xuất solutions với impact định lượng
- ✅ **Tránh lỗi**: Nhận diện red flags & common pitfalls

**Không phải:**
- ❌ Marketing guide
- ❌ Technical SQL/Analytics tool tutorial
- ❌ Business strategy document

---

## 📚 STRUCTURE OVERVIEW (9 PHẦN)

### **PHẦN 0: HOW TO USE** (31 dòng)
**Mục đích:** Hướng dẫn sử dụng playbook theo mục tiêu

**Nội dung:**
- 3 cách sử dụng playbook (Beginner / Quick Start / Reference)
- Timeline learning curve cho từng đối tượng
- Khi nào dùng cái gì

**Khi dùng:**
> Bạn mới bắt đầu hoặc muốn biết cách sử dụng hiệu quả

---

### **PHẦN 1: FOUNDATION** (143 dòng)
**Mục đích:** Xây dựng nền tảng tư duy phân tích

**Nội dung 5 sections:**

1. **3-Step Framework** - Cách tiếp cận BẤT KỲ vấn đề:
   - MECE Breakdown (5-15 phút): Tách chỉ số thành công thức
   - 4W Isolation (10-20 phút): Cô lập WHERE/WHAT/WHO/WHEN
   - 5 Whys Root Cause (15-45 phút): Tìm nguyên nhân gốc
   - ⏱️ Total: 30 phút (đơn giản) → 2 giờ (phức tạp)

2. **Data Quality Check** - Trước khi phân tích:
   - 10 câu hỏi validate data integrity
   - Common data issues (duplicates, gaps, outliers)
   - Khi nào trusted vs khi nào cần investigate

3. **Hypothesis Validation** - Khi claim "X gây Y":
   - Statistical rigor (confidence level, sample size)
   - Control vs experiment group
   - Confounding variables check
   - Seasonality adjustment

4. **Segmentation Principles** - Aggregate metrics lie:
   - Segment by Tier/Category/Channel/Payment method
   - Simpson's Paradox example
   - Why segment-level analysis > national average

5. **Decision Framework** - Từ insights → recommendations:
   - Quantify financial impact
   - Compare alternatives (Option A/B/C)
   - Risk assessment + contingency

**Khi dùng:**
> Trước mỗi phân tích, xác nhận bạn đang làm "đúng cách"

---

### **PHẦN 2: DATA MAP** (1,212 dòng)
**Mục đích:** Hiểu toàn cảnh dữ liệu e-commerce

**Nội dung 6 trụ cột chính:**

1. **Revenue Pillar**
   - Definition variations (GMV vs GTV vs Revenue)
   - Metric breakdown: Revenue = AOV × Units × Channels
   - Category impact (Fashion vs Electronics vs Food)
   - Regional impact (Tier 1-3 differences)

2. **Profitability Pillar**
   - Margin components (COGS, Shipping, Returns, Discount, etc.)
   - COGS realities (sourcing, QC, storage)
   - Hidden costs (payment gateway, refunds, chargeback)

3. **Customer Acquisition Pillar**
   - CAC by channel (Google ₹300 vs Social ₹1,500 vs Email ₹25)
   - Cohort analysis (acquire month vs repeat month)
   - CAC payback timeline + NPV
   - LTV validation (repeat rate × AOV × margin)

4. **Inventory Pillar**
   - Stock health (DIO = Days Inventory Outstanding)
   - Turnover rates by category
   - Seasonal dynamics (Tết +300%, Summer -10%)
   - SKU lifecycle (new → peak → decline → end)

5. **Operations Pillar**
   - Logistics (GHN pricing by tier, lead times, returns)
   - Returns (rate + RMA process + cost)
   - Payment methods (COD vs E-wallet economics)
   - Fulfillment (warehouse → carrier → customer)

6. **Market Pillar**
   - Competitive landscape (Shopee 45% vs Lazada 30%)
   - Pricing power (your price vs competitor)
   - Market share trends
   - Seasonality (Black Friday, Tết, etc.)

**Cross-Dimensional Views:**
- By Category (Fashion, Electronics, Food, Furniture)
- By Tier (Tier 1 HCMC vs Tier 3 Rural)
- By Channel (Marketplace vs D2C)
- By Payment (COD vs E-wallet)
- By Customer Segment (New vs Repeat)

**Khi dùng:**
> Mapping dataset vào 6 pillars để hiểu data landscape

---

### **PHẦN 3: 7 SPECIALIZED FRAMEWORKS** (1,826 dòng)
**Mục đích:** Giải quyết 7 vấn đề phổ biến nhất

**Nội dung 7 frameworks:**

1. **Revenue Deep Dive**
   - When revenue ↓, breakdown: AOV vs Units vs Mix
   - Seasonality adjustment (remove Tết noise)
   - Category/Tier/Channel attribution
   - Price elasticity impact

2. **Margin Analysis**
   - Contribution margin vs gross margin
   - COGS breakdown + supplier negotiations
   - Shipping cost by region (Tier 1 ₹60 vs Tier 3 ₹300)
   - Discount depth analysis + profitability gap

3. **Inventory Health Check**
   - DIO trending (optimal 30-45 days)
   - Dead stock identification (slow movers)
   - Stock-out risk (fast movers running out)
   - Overstock write-down projections

4. **Return Analysis**
   - Return rate by Tier/Category/Payment (COD 25% vs CC 5%)
   - Root cause breakdown (quality vs expectation vs fraud)
   - Return cost (reverse logistics + refund processing)
   - Prevention strategies by root cause

5. **CAC Funnel**
   - Unit economics: CAC vs LTV vs Payback
   - By channel: Organic vs Paid vs Affiliate
   - Cohort analysis: Which acquisition cohorts are best?
   - Scaling decision: LTV:CAC ratio thresholds

6. **Seasonality & Forecasting**
   - Decompose trend vs seasonal vs cyclic
   - Tết impact (+300-400% revenue, -40% margin)
   - Category-specific seasonality
   - Inventory/cash planning

7. **Omnichannel Integration**
   - Marketplace vs D2C unit economics
   - Customer journey: Single touch vs multi-touch
   - Channel conflict (customer buy cheaper on Shopee)
   - Blended metrics challenges

**Khi dùng:**
> Khi gặp vấn đề, tìm framework phù hợp → apply template

---

### **PHẦN 4: EXECUTION & FEEDBACK LOOPS** (~350 dòng)
**Mục đích:** Perfect analysis = 0 value nếu không implement & track kết quả

**Nội dung 3 tools:**

1. **Report Templates (3 formats)**
   - Executive Summary (1 page - CEO): Issue + ₹ Impact + 1 recommendation
   - Manager Brief (5 pages - Team Lead): Situation + Options + Decision framework
   - Analyst Deep Dive (Full detail - Peer): Methodology + Evidence + All numbers

2. **Post-Action ROI Tracking Sheet** (3-month tracking)
   - Month 1-3: Leading + Lagging indicators, Status updates, Financial impact
   - Learning Loop: What worked + What didn't + Lessons for next time
   - Accountability: Prove recommendation correct or identify why failed

3. **Post-Action Checklist** (Validate & Learn)
   - Month 1/2/3 gates with escalation triggers
   - Learning loop updates (update PHẦN 5-6 with new insights)
   - Accountability closure (team sign-off, decision: scale/maintain/pivot)

**Khi dùng:**
> Sau khi có insights, trước khi presentation → choose template
> Sau implementation → track 3 months với ROI sheet
> Month 3 → validate & learn lessons

---

### **PHẦN 5: COMMON MISTAKES** (2,684 dòng)
**Mục đích:** Nhận diện 7 lỗi phân tích phổ biến + cách tránh

**Nội dung 7 lỗi:**

1. **Correlation ≠ Causation**
   - Example: "Tháng 12 discount 40%, revenue ↑ 200% → Discount tạo revenue"
   - Reality: Tết seasonality tạo +300%, discount chỉ +10%
   - Solution: Decompose seasonality trước phân tích

2. **Aggregate Metrics Hide Segment Problems**
   - Example: "Margin 25% (looks good!)" nhưng thực chất:
     - Champions: 40% margin
     - At-Risk: 2% margin (Simpson's Paradox)
   - Solution: Always segment-analyze (Tier, Category, Channel)

3. **Ignoring Confounding Variables**
   - Example: "Email campaign → Revenue ↑ 15%" nhưng:
     - Competitor had outage same time
     - Black Friday promo running
   - Solution: Control group test, eliminate confounders

4. **Wrong Seasonality Benchmarks**
   - Example: Expect March revenue = January revenue (wrong!)
   - Reality: March sales -20% vs January (off-peak)
   - Solution: Track annual seasonality pattern, plan accordingly

5. **LTV:CAC Without Timing**
   - Example: "LTV 3x CAC = Good!" nhưng:
     - LTV takes 2 years to realize
     - CAC is Month 1 cost
     - Cash flow problem!
   - Solution: NPV analysis (cash flow timing matters)

6. **Misleading Attribution**
   - Example: "This channel drove 80% of conversions" nhưng:
     - Doesn't account for customer journey
     - Last-touch attribution overvalues top-of-funnel
   - Solution: Multi-touch attribution or cohort analysis

7. **Data Quality Assumption**
   - Example: "Margin jumped 5pp overnight!" without checking:
     - ETL changes
     - Accounting changes
     - Duplicate transactions
   - Solution: Data quality check BEFORE hypothesis

**Khi dùng:**
> Review mỗi khi conclude để avoid logical fallacies

---

### **PHẦN 6: DOMAIN KNOWLEDGE** (745 dòng)
**Mục đích:** Context không thể bỏ qua

**Nội dung 7 bắt buộc know-how + Red Flags:**

1. **Logistics & Vận Chuyển**
   - Lead times by tier (HCM 3 days, Cao Bằng 14 days)
   - Pricing: GHN ₹45 (Tier 1) vs ₹300 (Tier 3)
   - Tết impact (3 days → 15 days, giá tăng 2x)
   - Reverse logistics cost (₹50-500 return per unit)

2. **Competitive Dynamics**
   - Market structure (Shopee 45%, Lazada 30%, Tiki 15%)
   - Seller Retention signal (80%+ = healthy platform)
   - Price elasticity (nature of your category)
   - Competitor response time

3. **Inventory & Demand**
   - SKU lifecycle stages
   - Seasonality by category (Fashion peak Tết, Electronics steady)
   - Forecast accuracy impact on profit
   - Safety stock requirements

4. **Customer Behavior**
   - Return rate by payment (COD 25-35% vs CC 3-8%)
   - Customer intent signals
   - Regional behavior differences (Tier 1 vs Tier 3)
   - Loyalty patterns (repeat rate, LTV variations)

5. **Category Specifics**
   - Fashion: 30% margin, 20% return, high seasonality
   - Electronics: 25% margin, 6% return, low seasonality
   - Food: 17% margin, <1% return, high seasonality
   - Furniture: 40% margin, 18% return, medium seasonality

6. **Regulation & Compliance**
   - VAT 10% (included in price) = -10pp margin
   - COD max ₹20M (above → CC only)
   - 30-day return policy (mandatory)
   - Warranty reserve (electronics 3-5% of COGS)
   - PDPA email restrictions (6-month ramp)

7. **Marketing Channels**
   - Google Search: ₹150 CAC (slow 3 months, high quality)
   - Google Ads: ₹800 CAC (fast 1-2 weeks)
   - Social Ads: ₹3,500 CAC (fast but low quality)
   - Email: ₹50 CAC (slow 6 months, very high quality)

**15 Red Flags Checklist:**
- Metric change without context
- National average as target (ignores category/tier)
- Aggregate metric hiding segments
- Correlation mistaken for causation
- Seasonality ignored
- Revenue ↑ ≠ Profit ↑
- Average CAC hiding channel inefficiency
- Return rate without breakdown
- LTV:CAC without timeline
- Data quality assumption
- Outdated benchmarks
- Competitor activity ignored
- Cash flow ≠ Profit
- Single metric decision without holistic view
- Recommendation without financial impact

**Khi dùng:**
> Trước khi recommend, validate đủ 7 miền domain knowledge

---

### **PHẦN 7: CASE STUDIES** (86 dòng)
**Mục đích:** 6 scenario thực tế Vietnam e-commerce

**Nội dung 6 case studies:**

1. **CS1: Fashion D2C - Payment Mix Trap**
   - Problem: Revenue ↑ 50% but Profit ↓ 20%
   - Root cause: Payment mix shifted to COD (lower margin)
   - Impact: ₹3.7 Cr loss if scaled to Tier 3
   - Fix: Restrict COD, incentivize e-wallet

2. **CS2: Electronics - Data Quality Issue**
   - Problem: Margin jumped 5pp overnight
   - Root cause: ETL change in cost accounting
   - Impact: ₹50 L hidden loss from wrong decision
   - Fix: Data quality check before hypothesis

3. **CS3: Skincare - Attribution Error**
   - Problem: Email looks great but ROI inflated
   - Root cause: Multi-touch attribution error
   - Impact: ₹100 L overspend on email
   - Fix: Cohort analysis for true channel ROI

4. **CS4: B2B Wholesale - Different Metrics**
   - Problem: D2C metrics don't apply
   - Reality: AOV ₹100K (vs D2C ₹2K), CAC ₹50K (vs D2C ₹300)
   - LTV:CAC 7:1 (vs D2C 3:1) = Different growth math
   - Fix: Separate unit economics models

5. **CS5: Tét ETL Bug - Hidden Impact**
   - Problem: Discovered ₹2.5 Cr cost from data corruption
   - Discovery: Red flag detection in aggregate vs segment
   - Solution: Monthly data quality audits
   - Fix: Proper data validation pipeline

6. **CS6: Detection Lag - Speed to Insight**
   - Problem: Issues discovered 3 weeks late
   - Impact: Compounded losses while unaware
   - Solution: Weekly KPI monitoring + red flags
   - Fix: Automated alerts on metric anomalies

**Khi dùng:**
> Matching your scenario → learning what happened + how to fix

---

### **PHẦN 8: ADVANCED ANALYTICS** (end of file)
**Mục đích:** Chuyên sâu cho complex scenarios

**Nội dung (implied - structure tương tự PHẦN 3):**
- NPV Analysis (beyond LTV:CAC)
- Cohort Analysis (retention curves, unit economics by cohort)
- RFM Segmentation (identify high-value customers)
- Attribution Modeling (multi-touch vs last-touch)
- A/B Testing (statistical rigor, sample size, power)
- ML/AI Applications (forecasting, propensity modeling)
- Implementation Roadmap (Month 1-12 progression)

**Khi dùng:**
> Khi PHẦN 3 frameworks không đủ chuyên sâu

---

## 🗺️ LEARNING PATHS

### **Path 1: Beginner (0-3 months)**
```
Week 1-2:  PHẦN 0 (How to Use) + PHẦN 1 (Foundation)
Week 3-4:  PHẦN 2 (Data Map) - skim 6 pillars
Week 5-6:  PHẦN 3 (Frameworks) - pick 2 of interest
Week 7-8:  PHẦN 5 (Common Mistakes) - red flags checklist
Ongoing:   Reference Quick Reference + Case Studies
```
**Outcome:** Can apply 3-Step Framework to simple problems

---

### **Path 2: Intermediate (3-6 months)**
```
Week 1-2:  PHẦN 6 (Domain Knowledge) - understand Vietnam context
Week 3-4:  PHẦN 3 (Frameworks) - master all 7 frameworks
Week 5-8:  PHẦN 5 (Common Mistakes) - deep dive each mistake
Week 9-12: PHẦN 7 (Case Studies) - understand industry patterns
Ongoing:   PHẦN 8 (Advanced) - selective deep dives
```
**Outcome:** Can recommend solutions with ₹ impact quantification

---

### **Path 3: Advanced (6+ months)**
```
Ongoing:   All PHẦNs - mastery level
Focus:     PHẦN 8 (Advanced) + case study patterns
Mission:   Develop proprietary frameworks for your business
```
**Outcome:** Can mentor others + predict problems before they happen

---

## 📊 QUICK REFERENCE: PHẦN MAP BY PROBLEM

| Problem | Relevant PHẦNs | Time to Solution |
|---------|--------|------------------|
| Revenue down | PHẦN 1 (3-Step) → PHẦN 3 (Revenue Deep Dive) | 1-2 hours |
| Margin collapsed | PHẦN 3 (Margin Analysis) + PHẦN 6 (Regulations) | 2-4 hours |
| High return rate | PHẦN 3 (Return Analysis) + PHẦN 6 (Customer Behavior) | 1-2 hours |
| CAC too high | PHẦN 3 (CAC Funnel) + PHẦN 7 (Case Studies) | 2-3 hours |
| Inventory stuck | PHẦN 3 (Inventory Health) + PHẦN 6 (Seasonality) | 1-2 hours |
| Should we scale? | PHẦN 3 (CAC Funnel) + PHẦN 8 (NPV Analysis) | 4-6 hours |
| Regional expansion | PHẦN 2 (Data Map - Tier view) + PHẦN 6 (Logistics) | 1-3 days |
| New channel | PHẦN 3 (CAC Funnel) + PHẦN 1 (Data Quality) | 2-4 hours |

---

## 📁 FILE ORGANIZATION

**Main Playbook:**
```
f:\Hoc Hanh\DA\Claude Code\
├── PLAYBOOK_CONSOLIDATED_REVIEW.md (complete file)
└── PLAYBOOK_CONSOLIDATED_REVIEW.bk.md (backup)
```

**Split by PHẦN (for easier maintenance):**
```
f:\Hoc Hanh\DA\Claude Code\Learning Data\E-Commerce Playbook\Workings\
├── PHẦN_0_HOW_TO_USE.md
├── PHẦN_1_FOUNDATION.md
├── PHẦN_2_DATA_MAP.md
├── PHẦN_3_FRAMEWORKS.md
├── PHẦN_4_EXECUTION.md (NEW!)
├── PHẦN_5_COMMON_MISTAKES.md
├── PHẦN_6_DOMAIN_KNOWLEDGE.md
├── PHẦN_7_CASE_STUDIES.md
└── PHẦN_8_ADVANCED_ANALYTICS.md
```

**Structure Overview (this file):**
```
f:\Hoc Hanh\DA\Claude Code\Learning Data\E-Commerce Playbook\
└── E-commerce Structure.md
```

---

## 🎯 NEXT STEPS / RECOMMENDATIONS

### **For Users:**
1. ✅ Read PHẦN 0 (How to Use) - choose your path
2. ✅ Master PHẦN 1 (Foundation) - 3-Step Framework is your compass
3. ✅ Create personal cheat sheet for PHẦN 3 frameworks
4. ✅ Bookmark PHẦN 5 (Common Mistakes) - review before presenting
5. ✅ Use PHẦN 4 templates when presenting findings
6. ✅ Reference PHẦN 7 case studies when stuck

### **For Future Enhancement:**
- [ ] Add visual diagrams for PHẦN 2 (Data Map - 6 pillars)
- [ ] Create Python/SQL templates for PHẦN 3 frameworks
- [ ] Build case study database with proprietary company scenarios
- [ ] Video walkthroughs for complex topics
- [ ] Create fillable ROI tracking templates (Excel/Google Sheets)

---

## 📈 PLAYBOOK METRICS

| Metric | Value |
|--------|-------|
| Total Lines | ~7,100 (with PHẦN 4) |
| Total PHẦNs | 9 (complete!) |
| Report Templates | 3 (Executive / Manager / Analyst) |
| Case Studies | 6 Vietnam scenarios |
| Frameworks | 7 specialized (PHẦN 3) + 9 advanced (PHẦN 8) |
| Tracking Tools | ROI tracking sheet + checklist |
| Domain Knowledge Areas | 7 mandatory + 15 red flags |
| Time to Mastery | Beginner 8 weeks → Advanced 6+ months |
| Language | Vietnamese-first + English keywords |

---

**Last Updated:** 26 June 2026  
**Version:** 2.0  
**Status:** ✅ Production Ready
