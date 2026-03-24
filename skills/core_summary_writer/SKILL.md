---
name: core_summary_writer
description: 按固定医院纪要格式生成 MDT 小结。以会议讨论记录为主，病例资料与 clinical_decision_support 报告为参考，不得直接复制 CDS 报告作为小结正文。
user-invocable: false
---

# Purpose

Generate the post-MDT summary document in a fixed hospital-style format.

This skill produces a formal meeting summary, not a pre-meeting decision support report.

# Mandatory output title

`MDT 小结`

# Mandatory header fields

The document must begin with these fields:

- 患者 ID
- 姓名
- 性别
- 科室
- 出生日期
- 年龄
- 讨论日期
- 参与讨论人员

# Mandatory body structure

The body must follow this exact structure:

## 讨论内容

### 一、病史回顾及诊断
Write a factual case recap only. It should include:
- 主诉与来院背景
- 关键诊疗经过
- 病理与分子结果
- 既往治疗及疗效
- 当前疾病状态
- 目前诊断

Do not place recommendations in this section.

### 二、后续诊疗计划
This is the main recommendation section of the MDT summary.
It must reflect the meeting discussion result rather than directly copying the CDS report.
It should include when applicable:
- 当前治疗瓶颈或失败原因分析
- 已知标准路径与本病例适配性
- MDT 推荐的下一步方案
- 备选方案
- 条件允许下可考虑的补充路径

### 三、注意事项与预后
This section is mandatory and should cover:
- 风险与注意事项
- 治疗承受能力/毒性关注点
- 并发症或特殊监测点
- 总体预后判断
- 当前阶段治疗目标

### 四、参考文献
List only the core references supporting the post-MDT plan.
Prefer guidelines, pivotal studies, or key trials.

# Ending field

The document must end with:
- 记录人

If the recorder is unknown, use:
`记录人：OpenClaw（待人工确认）`

# Hard rules

- Do not output the post-MDT summary in CDS report format.
- Do not copy the clinical_decision_support report verbatim as the main body.
- The meeting discussion record is the primary source for section two.
- Case document and CDS report are supporting materials only.
- Preserve the four numbered sections exactly in Chinese.

# Inputs

- `case_document`
- `cds_document`
- `meeting_listener_output`
- optional `final_comment_output`
- optional document metadata

# Output schema

Return structured content suitable for Feishu document rendering:

```json
{
  "title": "MDT 小结",
  "header_fields": {
    "患者 ID": "",
    "姓名": "",
    "性别": "",
    "科室": "",
    "出生日期": "",
    "年龄": "",
    "讨论日期": "",
    "参与讨论人员": ""
  },
  "sections": [
    {"heading": "一、病史回顾及诊断", "content": ""},
    {"heading": "二、后续诊疗计划", "content": ""},
    {"heading": "三、注意事项与预后", "content": ""},
    {"heading": "四、参考文献", "content": ""}
  ],
  "footer_fields": {
    "记录人": ""
  }
}
```
