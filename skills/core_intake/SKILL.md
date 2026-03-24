---
name: core_intake
description: 整理病例事实并生成第一份 /mdt_prep 文档的结构化输入。
user-invocable: false
---

# Purpose

Collect and normalize patient facts for MDT.

# Required outputs

- patient_profile
- tumor_info
- pathology
- stage_if_known
- molecular
- treatment_history
- current_question
- missing_information

# Hard rules

- Facts only.
- No treatment recommendation.
