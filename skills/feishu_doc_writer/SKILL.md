---
name: feishu_doc_writer
description: 将结构化章节、表格与 Mermaid 代码块写入飞书文档。负责文档层排版，不负责新增医学内容。
user-invocable: false
---

# Purpose

Write structured document content into Feishu documents.

# Rules

- Preserve all Chinese section headings exactly.
- Render Mermaid blocks as fenced ```mermaid code blocks.
- Do not convert Mermaid blocks into plaintext.
- Do not merge the case document and the CDS report into one document during /mdt_prep.
- Keep document structure stable and physician-readable.

# Input blocks

- title
- subtitle
- sections
- tables
- diagram_blocks (format=mermaid)
- warnings
- source_trace
