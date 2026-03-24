---
name: core_reasoner
description: 为 /mdt_prep 的第二份文档准备病例输入包，并直接调用 clinical_decision_support。该技能不得改写、重排、压缩或再创作 clinical_decision_support 的输出。
user-invocable: false
---

# Purpose

Prepare a complete case input packet for `integration_clinical_decision_support`, call it, and return the CDS result as the second pre-MDT document body.

This skill is a CDS passthrough orchestrator, not a recommendation writer.

# Hard rules

- Do not generate treatment recommendations directly.
- Do not summarize, simplify, rewrite, or re-rank the result from `integration_clinical_decision_support`.
- Do not merge CDS output with guideline, trial, drug, or search output into the main body.
- Do not convert the CDS report into another house style.
- The main body of document 2 must remain the original CDS result.
- If supplementary material is needed, place it only in a clearly labeled appendix section outside the CDS main body.

# Inputs

- structured case data from `core_intake`
- optional raw source materials if available
- optional document metadata

# Required behavior

1. Build the most complete possible case packet for CDS.
2. Prefer preserving clinically meaningful detail over aggressive summarization.
3. Call `integration_clinical_decision_support`.
4. Return the CDS output unchanged as the main content for document 2.
5. Pass the result to `feishu_doc_writer` for document creation.

# Output

Return a structured package containing:
- `case_data`
- `cds_raw_output`
- `document_title`
- `document_type`: `AI临床决策支持报告`
- optional `appendix_materials`

The field `cds_raw_output` must be preserved without stylistic rewriting.
