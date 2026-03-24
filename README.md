# MDT Copilot Skill Pack v6

面向飞书生态下 OpenClaw 的 MDT 辅助技能包。

## 对外命令

- `/mdt_prep`：生成两份会前文档
  - 文档1：MDT病例资料
  - 文档2：AI临床决策支持报告（直接输出 `clinical_decision_support` 结果，不做任何调整）
- `/mdt_listen`：会中结构化记录
- `/mdt_comment`：会末 AI 补充发言
- `/mdt_summary`：会后 MDT 小结

## 本版关键修正

### 1. /mdt_prep 第二份文档改为 CDS 直出

- `core_reasoner` 只负责整理病例输入包并调用 `integration_clinical_decision_support`
- 第二份文档主文必须直接采用 `clinical_decision_support` 的结果
- 不允许模板重写、风格改写、推荐重排或摘要压缩
- 如需补充内容，只能以附录形式单列，不得混入主文

### 2. /mdt_summary 按固定医院纪要格式输出

固定结构如下：

- 标题：`MDT 小结`
- 页首字段：患者 ID、姓名、性别、科室、出生日期、年龄、讨论日期、参与讨论人员
- 正文：
  - 一、病史回顾及诊断
  - 二、后续诊疗计划
  - 三、注意事项与预后
  - 四、参考文献
- 结尾字段：记录人

## Mermaid 规则

Mermaid 图必须使用标准 fenced code block：

```mermaid
flowchart TD
    A[开始] --> B[结束]
```

不能写成 plaintext 代码块。

## 技能结构

- `mdt_orchestrator`：阶段路由
- `core_intake`：病例事实整理
- `core_reasoner`：CDS 输入准备与直出承接
- `core_meeting_listener`：会中记录
- `core_final_comment`：会末补充意见
- `core_summary_writer`：会后纪要（固定医院格式）
- `integration_clinical_decision_support`：临床决策支持来源
- `template_mdt_case_doc`：病例资料文档模板
- `template_cds_report`：保留在包内作参考模板，不再参与 /mdt_prep 第二份文档主链路改写
- `feishu_doc_writer`：飞书文档写入约束
- `mermaid_flowchart_generator`：Mermaid 图块生成

## 安装

### 前置依赖

本技能包依赖以下 OpenClaw 技能，请先安装：

1. **OpenClaw-Medical-Skills**（提供 `clinical_decision_support` 能力）
   ```bash
   git clone https://github.com/your-org/OpenClaw-Medical-Skills.git
   cp -r OpenClaw-Medical-Skills/skills/* ~/.openclaw/skills/
   ```

### 方式一：OpenClaw 自动安装（推荐）

如果你已安装 `openclaw` CLI 工具，可以直接运行：

```bash
openclaw skills install mdt-copilot-skill-pack
```

或指定本地路径：

```bash
openclaw skills install ./mdt-copilot-skill-pack
```

### 方式二：手动复制

将本包的 `skills/` 下目录复制到 OpenClaw 的 `skills/` 目录中：

```bash
cp -r skills/* ~/.openclaw/skills/
```

或复制到某个 workspace 的 `skills/` 目录。

### 重启生效

安装完成后，重启 OpenClaw Gateway 使新技能生效：

```bash
sh ~/.openclaw/scripts/restart.sh
```

或使用 CLI：

```bash
openclaw gateway restart
```
