# MDT Copilot Skill Pack

面向飞书生态 + OpenClaw 的 MDT（多学科会诊）辅助技能包。  
用于在真实临床 MDT 场景中，完成 会前准备 → 会中记录 → 会末补充 → 会后小结 的完整闭环。

本技能包设计目标：

- 不替代医生决策  
- 不改变临床讨论流程  
- 不污染 clinical_decision_support 的原始能力  
- 只负责整理、承接、记录、输出  

适用于：

- 肿瘤 MDT  
- 泛癌种 MDT  
- 复杂病例讨论  
- 临床试验讨论  
- 二次意见讨论  
- 多中心会诊  

运行环境：

- OpenClaw  
- 飞书机器人 / 飞书文档生态  
- OpenClaw-Medical-Skills  


---

# 一、设计原则


## 1. 会前建议必须来自 clinical_decision_support

第二份会前文档必须直接调用：

integration_clinical_decision_support

禁止：

- 模板改写  
- 风格重排  
- 推荐重组  
- 摘要压缩  

允许：

- 原文直出  
- 附录补充  


---

## 2. 会后小结必须符合医院真实纪要格式

MDT 小结必须按真实医院文书结构输出：

MDT 小结

患者信息

一、病史回顾及诊断  
二、后续诊疗计划  
三、注意事项与预后  
四、参考文献  

记录人


---

## 3. 飞书文档是唯一输出介质

所有文档必须写入飞书文档：

- MDT病例资料  
- AI临床决策支持报告  
- MDT小结  
- Mermaid流程图  


---

## 4. Mermaid 是唯一流程图格式

必须使用 Mermaid fenced code block，例如：

```mermaid
flowchart TD
A --> B
```

不能使用：

- plaintext  
- svg  
- 图片  
- HTML  


---

# 二、整体工作流

MDT Copilot 支持完整 MDT 生命周期：

会前 → 会中 → 会末 → 会后

| 阶段 | 命令 | 输出 |
|------|------|------|
| 会前 | /mdt_prep | 病例资料 + CDS报告 |
| 会中 | /mdt_listen | 结构化讨论记录 |
| 会末 | /mdt_comment | AI补充意见 |
| 会后 | /mdt_summary | MDT小结 |


---

# 三、命令说明


## /mdt_prep

生成两份会前文档


### 文档1：MDT病例资料

来源：

core_intake  
→ template_mdt_case_doc  
→ mermaid_flowchart_generator  
→ feishu_doc_writer  


### 文档2：AI临床决策支持报告

来源：

core_reasoner  
→ integration_clinical_decision_support  
→ feishu_doc_writer  

规则：

- 必须直接输出 CDS  
- 不允许改写  
- 不允许重排  
- 不允许摘要  


---

## /mdt_listen

会中记录

core_meeting_listener


---

## /mdt_comment

会末 AI 发言

core_final_comment


---

## /mdt_summary

生成 MDT 小结

core_summary_writer

固定结构：

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

必须先安装：

OpenClaw-Medical-Skills

https://github.com/FreedomIntelligence/OpenClaw-Medical-Skills


依赖技能：

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


## 4 测试

/mdt_prep  
/mdt_listen  
/mdt_comment  
/mdt_summary  


---

# 七、推荐流程

上传病例  
→ /mdt_prep  

开会  
→ /mdt_listen  

会末  
→ /mdt_comment  

会后  
→ /mdt_summary  


---

# 八、设计目标

本技能包不是 AI 会诊系统

而是

MDT 工作流操作系统

- 不替医生思考  
- 不替医生决策  
- 不改变流程  
- 只做结构化支持  

适用于真实医院环境
