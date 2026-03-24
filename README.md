# MDT Copilot Skill Pack

MDT Copilot 是面向 OpenClaw + 飞书生态的多学科会诊（MDT）辅助技能包，用于支持真实临床场景下的会前准备、会中整理、会末补充和会后小结输出。

本技能包用于在不改变现有 MDT 工作流程的前提下，提供结构化文档生成与临床决策支持能力。

适用场景：

- 肿瘤 MDT
- 泛癌种病例讨论
- 复杂病例会诊
- 临床试验讨论
- 二次意见讨论
- 多中心会诊


---

# 一、整体流程

MDT Copilot 支持完整 MDT 工作流程：

会前 → 会中 → 会末 → 会后

| 阶段 | 命令 | 输出 |
|------|------|------|
| 会前 | /mdt_prep | 病例资料 + 临床决策支持报告 |
| 会中 | /mdt_listen | 会议记录整理 |
| 会末 | /mdt_comment | AI补充意见 |
| 会后 | /mdt_summary | MDT小结 |


---

# 二、命令说明


## /mdt_prep

生成两份会前文档

### 文档1：MDT病例资料

根据上传的病例资料整理生成结构化病例文档，包括：

- 基本信息
- 既往诊疗经过
- 检查结果
- 病理结果
- 分期
- 当前问题
- 诊疗流程图

该文档写入飞书文档。


### 文档2：AI临床决策支持报告

基于病例资料调用 clinical_decision_support 生成完整临床决策支持报告。

报告内容直接来自 clinical_decision_support，用于 MDT 会前参考。


---

## /mdt_listen

整理会议讨论记录。

输入内容为会议文字记录或讨论纪要文本，系统将其整理为结构化讨论记录，包括：

- 主要讨论问题
- 不同观点
- 推荐方案
- 证据依据
- 风险与注意事项


---

## /mdt_comment

在 MDT 讨论结束前生成 AI 补充意见。

输入内容包括：

- 病例资料
- 临床决策支持报告
- 会议记录

输出为独立的 AI 建议文档，用于 MDT 讨论参考。


---

## /mdt_summary

生成 MDT 小结。

小结按标准 MDT 纪要格式输出：

MDT 小结

患者ID  
姓名  
性别  
科室  
出生日期  
年龄  
讨论日期  
参与讨论人员  

一、病史回顾及诊断  
二、后续诊疗计划  
三、注意事项与预后  
四、参考文献  

记录人  

该文档写入飞书文档。


---

# 三、文档输出

所有文档均写入飞书文档，包括：

- MDT病例资料
- AI临床决策支持报告
- MDT小结
- 流程图

流程图使用 Mermaid 语法生成，可在飞书文档中直接渲染。


---

# 四、技能结构

mdt_orchestrator  
core_intake  
core_reasoner  
core_meeting_listener  
core_final_comment  
core_summary_writer  

integration_clinical_decision_support  

template_mdt_case_doc  
template_cds_report  

feishu_doc_writer  
mermaid_flowchart_generator  


---

# 五、依赖

需要先安装 OpenClaw-Medical-Skills

https://github.com/FreedomIntelligence/OpenClaw-Medical-Skills

依赖技能包括：

clinical-decision-support  
guideline_search  
trial_search  
drug_analysis  
biomedical_search  


---

# 六、安装


## 1 安装医疗技能包

Install OpenClaw-Medical-Skills  
https://github.com/FreedomIntelligence/OpenClaw-Medical-Skills  


## 2 安装 MDT Copilot

Install mdt-copilot-skill-pack  
https://github.com/TheodoreHu3d/mdt-copilot-skill-pack  


## 3 重启 OpenClaw


## 4 测试命令

/mdt_prep  
/mdt_listen  
/mdt_comment  
/mdt_summary  


---

# 七、推荐使用流程

上传病例  
→ /mdt_prep  

上传会议记录  
→ /mdt_listen  

生成补充意见  
→ /mdt_comment  

生成小结  
→ /mdt_summary
