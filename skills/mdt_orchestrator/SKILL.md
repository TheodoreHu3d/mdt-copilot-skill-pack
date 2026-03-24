---
name: mdt_orchestrator
description: 根据用户调用阶段路由到对应 MDT 工作流。对外入口为 /mdt_prep、/mdt_listen、/mdt_comment、/mdt_summary。
user-invocable: false
---

# Routing

- /mdt_prep -> generate two documents
  - document 1: MDT病例资料 via core_intake + template_mdt_case_doc + mermaid_flowchart_generator + feishu_doc_writer
  - document 2: AI临床决策支持报告 via core_reasoner + integration_clinical_decision_support + feishu_doc_writer
    - the main body must be the direct output of clinical_decision_support
    - no template-based rewriting, no summary-based reshaping, no style conversion
- /mdt_listen -> core_meeting_listener
- /mdt_comment -> core_final_comment
- /mdt_summary -> core_summary_writer + feishu_doc_writer
  - must follow the hospital-style MDT summary format
  - must use the four fixed sections and recorder field
