# View Menu

Menu path: **View(&V)**

## Expand All Nodes (&E)

- **Function**: Expand all loaded nodes in the left record type tree
- **Note**: May take a while with large record counts (tens of thousands)
- **Use case**: Quickly browse all loaded record categories

## Collapse All Nodes (&C)

- **Function**: Collapse all expanded nodes in the left tree, returning to top-level types only
- **Use case**: Clean up the view and return to the initial state

## Log Panel (&L)

- **Function**: Toggle the bottom log panel visibility
- **Default**: Shown (menu item is checked ✓)
- **Log contents**:
  - ESM loading progress and status
  - TES4 header information (version, Master list)
  - Record query and search operation logs
  - Navigation jump records
  - Export operation results
  - Errors and warnings
- **Style**: Black background, green monospaced text (Consolas 9pt), terminal-style

## Language Switching

- **Location**: Language dropdown on the right side of the toolbar
- **Function**: Switch the UI language in real-time
- **Supported languages** (14):
  - 简体中文 (zh-Hans)
  - 繁体中文 (zh-Hant)
  - English (en)
  - 日本語 (ja)
  - 한국어 (ko)
  - Français (fr)
  - Deutsch (de)
  - Русский (ru)
  - Español (es)
  - Español México (es-MX)
  - Italiano (it)
  - Português Brasil (pt-BR)
  - Polski (pl)
- **Note**: After switching, all menus, buttons, and status bar text update immediately; the strings database language also switches accordingly
