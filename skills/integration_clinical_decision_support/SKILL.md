---
name: integration_clinical_decision_support
description: 调用 clinical_decision_support 并返回结构化临床决策支持结果，供 template_cds_report 使用。
user-invocable: false
---

# Purpose

Obtain structured recommendation content from clinical_decision_support.

# Required output keys

- executive_summary
- patient_features
- plans
- special_modules
- monitoring_and_support
- mdt_points
- followup_plan
- references
- decision_logic
- final_recommendation

# Hard rules

- Return structured data.
- Do not return only free text.
- Recommendation authority belongs here for the second `/mdt_prep` document.
