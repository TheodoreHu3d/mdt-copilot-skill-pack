---
name: template_mdt_case_doc
description: 将 core_intake 的结构化病例信息整理为 MDT 病例资料文档。仅整理事实，不输出诊疗建议。
user-invocable: false
---

# Purpose

Generate the first `/mdt_prep` document: MDT病例资料.

# Required sections

1. 患者基本信息
2. 主诉与当前问题
3. 肿瘤与病理信息
4. 分期与关键检查
5. 分子检测结果
6. 既往治疗经过
7. 当前临床问题
8. 资料缺失与待补充项
9. 病例时间轴（Mermaid）

# Hard rules

- Facts only.
- No treatment recommendation.
- No preferred option.
- No inferred plan.
