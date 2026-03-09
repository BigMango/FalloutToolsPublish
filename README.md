# Fallout76 Data Tools

> [中文文档](README_CN.md)

A desktop tool for parsing and browsing Fallout 76 ESM (Elder Scrolls Master) files, similar to xEdit.

## Features

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

## System Requirements

- Windows 10 / 11 (x64)
- No additional runtime required

## Download

See [Releases](https://github.com/BigMango/FalloutToolsPublish/releases) for the latest build.

## Usage

1. Download and extract the zip from Releases
2. Run `Fallout76Data.exe`
3. Open an ESM file via **File → Open ESM**
4. Browse records in the left tree, view details on the right
5. Use the search box to jump to a record by FormID, EditorID, or name

## License

This tool is provided as-is for personal and community use.
