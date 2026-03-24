---
name: mermaid_flowchart_generator
description: 生成用于飞书文档渲染的 Mermaid fenced code blocks。不能输出 plaintext 或 SVG。
user-invocable: false
---

# Purpose

Generate Mermaid code blocks for Feishu documents.

# Output rule

Always return fenced Mermaid blocks, for example:

```mermaid
flowchart TD
A[开始] --> B[结束]
```

# Hard rules

- Do not output plaintext pseudocode.
- Do not output SVG.
- Do not output Mermaid without fenced code block syntax.
