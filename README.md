# Fallout76 Data Tools

[English](#english) | [中文](#中文)

---

## English

A desktop tool for parsing and browsing Fallout 76 ESM (Elder Scrolls Master) files, similar to xEdit.

### Features

**ESM Browser**
- Unified search box: hex FormID (`0x003B8C17`), decimal FormID, EditorID, or name keyword
- Tree-based record browsing with type filtering
- Detail panel with field/value/hex columns
- Navigation history (back/forward) and recent records

**Record Analysis**
- Reference lookup — find all records that reference a given record
- Record comparison (diff view)
- Cross-ESM comparison
- Field-level search across all loaded ESMs
- Advanced search with filters
- Unknown field detection
- Item source chain tracing

**Preview**
- 3D model preview (NIF via WebView2)
- Texture preview (DDS)
- Cell map viewer

**Export**
- JSON export (single record or entire type)
- CSV export (entire type)
- Screenshot export

**Localization**
- 13 languages: English, 简体中文, 繁體中文, 日本語, 한국어, Deutsch, Français, Español, Español (MX), Português (BR), Русский, Polski, Italiano

**Other**
- Bookmarks / favorites with groups
- Auto-update checker
- Self-contained single-file executable (no .NET runtime needed)

### System Requirements

- Windows 10 / 11 (x64)
- No additional runtime required

### Download

See [Releases](https://github.com/BigMango/FalloutToolsPublish/releases) for the latest build.

### Usage

1. Download and extract the zip from Releases
2. Run `Fallout76Data.exe`
3. Open an ESM file via **File → Open ESM**
4. Browse records in the left tree, view details on the right
5. Use the search box to jump to a record by FormID, EditorID, or name

---

## 中文

一款用于解析和浏览 Fallout 76 ESM（Elder Scrolls Master）文件的桌面工具，功能对标 xEdit。

### 功能特性

**ESM 浏览器**
- 统一搜索框：支持十六进制 FormID（`0x003B8C17`）、十进制 FormID、EditorID、名称关键字
- 树形记录浏览，支持类型过滤
- 详情面板显示字段/值/Hex 三列
- 导航历史（前进/后退）和最近浏览记录

**记录分析**
- 引用者查找 — 查看哪些记录引用了当前记录
- 记录对比（差异视图）
- 跨 ESM 文件对比
- 字段级搜索（跨所有已加载 ESM）
- 高级搜索（带过滤条件）
- 未识别字段检测
- 物品产出链追踪

**预览**
- 3D 模型预览（NIF 格式，基于 WebView2）
- 贴图预览（DDS 格式）
- 地图查看器

**导出**
- JSON 导出（单条记录或整个类型）
- CSV 导出（整个类型）
- 截图导出

**多语言支持**
- 13 种语言：English、简体中文、繁體中文、日本語、한국어、Deutsch、Français、Español、Español (MX)、Português (BR)、Русский、Polski、Italiano

**其他**
- 收藏夹 / 书签分组管理
- 自动更新检测
- 单文件自包含可执行程序（无需安装 .NET 运行时）

### 系统要求

- Windows 10 / 11（x64）
- 无需额外运行时

### 下载

前往 [Releases](https://github.com/BigMango/FalloutToolsPublish/releases) 下载最新版本。

### 使用方法

1. 从 Releases 下载 zip 并解压
2. 运行 `Fallout76Data.exe`
3. 通过 **文件 → 打开 ESM** 加载 ESM 文件
4. 在左侧树形结构中浏览记录，右侧查看详情
5. 使用搜索框通过 FormID、EditorID 或名称快速跳转

---

## License

This tool is provided as-is for personal and community use.
