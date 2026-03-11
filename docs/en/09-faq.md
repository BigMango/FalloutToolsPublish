# Frequently Asked Questions (FAQ)

## Installation & Startup

### Q: Do I need to install .NET runtime?

No. The release is a self-contained single-file executable — no additional runtime is required.

### Q: The program can't find the ESM file automatically?

The program attempts to auto-detect the Fallout 76 installation path on startup. If detection fails:
1. Click **File → Open ESM**
2. Manually navigate to the `Data` folder in your Fallout 76 installation and select `SeventySix.esm`

Common causes: the game is installed in a non-default location, or installed via Microsoft Store.

### Q: First-time ESM loading is very slow. Is this normal?

Yes. On first load, the program needs to:
- Parse all records and build the index (~500,000 records)
- Build the strings database (extracted from BA2 files)

Both the index and strings database are cached, so subsequent loads will be significantly faster.

### Q: I get an error about missing strings database?

The strings database (`strings.db`) is automatically built from the game's Localization BA2 files on first load. Make sure the `Data` folder containing the ESM also has `SeventySix - Localization.ba2` and other localization files.

## Search & Navigation

### Q: What search modes does the search box support?

The search box supports 4 modes:

1. **Keyword** — plain text like `Laser`, fuzzy matches against EditorID and name
2. **Wildcard** — use `*` and `?`, e.g. `Weapon*Laser`
3. **FormID Range** — e.g. `0x1000-0x2000`, finds all records in the range
4. **Regex** — wrap in `/`, e.g. `/^Weapon_.+Laser$/`

You can also enter a FormID directly (e.g. `0x0004F46A` or `4F46A`) and press Enter to jump to it.

### Q: How do I use mouse side buttons for navigation?

The program intercepts mouse side button messages globally:
- **Button 4 (Back)** = Navigate back (same as `Alt + ←`)
- **Button 5 (Forward)** = Navigate forward (same as `Alt + →`)

This works regardless of which panel has focus.

### Q: What are the blue links? How do I use them?

Blue underlined text in the detail panel's Value column represents FormID reference links. Interactions:
- **Hover** — shows the target record's type, EditorID, and name
- **Double-click** — jumps to the target record
- **Ctrl + Left-click** — jumps to the target record
- **Right-click → Jump to Record** — context menu navigation

All jumps are recorded in navigation history, so you can always go back.

### Q: How do I quickly filter the left tree?

Press `/` to focus the filter box at the top of the left tree panel, then type a keyword to filter in real-time. Press `Enter` to jump to the first match, or `Esc` to clear the filter.

### Q: How do I filter fields in the detail panel?

Press `Ctrl + G` to focus the field filter box above the detail panel. Type a field name or value to filter the current record's subrecords. Press `Esc` to clear.

## Record Analysis

### Q: How do I find all sources for an item?

Select a record, then use **Record → Item Source Chain** (or right-click → **Item Source Chain**). The program traces crafting recipes (COBJ), containers (CONT), NPC drops, leveled lists (LVLI), and all other possible ways to obtain the item.

### Q: How do I compare two records?

1. Query a record first
2. Click **Record → Compare Records**
3. Enter the second FormID in the comparison window
4. Records are displayed side by side with differences highlighted

### Q: How does cross-ESM comparison work?

You need at least 2 ESM files loaded (**File → Open ESM** for the main file, **File → Add ESM** for additional files), then use **Record → Cross-ESM Compare** to view differences for the same FormID across ESMs.

### Q: How do I view weapon/armor modifications?

Select a WEAP or ARMO record and use **Record → OMOD Chain** to see all available Object Modification options and their effects.

## Export

### Q: What export options are available?

Multiple export methods are provided:
- **File → Export JSON** — export the current record as a JSON file
- **File → Export Screenshot** — export the current detail view as a PNG image
- **Right-click → Export This Type (JSON/CSV)** — batch export all records of a type
- **Tools → Batch Export CSV** — export all types as CSV files at once
- **Right-click → Copy Full JSON** — copy the current record's JSON to clipboard

### Q: The exported screenshot is too large or clipped?

Screenshot export expands all subrecord nodes and renders the full content. When the content is too large, the height is capped to prevent memory overflow. For complete data, use JSON export instead.

## Language & Strings

### Q: How do I switch the interface language?

Use the language dropdown on the right side of the toolbar. The interface updates immediately. 13 languages are supported.

### Q: What is the Strings Analyzer?

**Tools → Strings Analyzer** lets you browse all in-game multilingual strings (item names, descriptions, dialogue, etc.) with search and export support. The data comes from `strings.db`.

## Favorites & Tags

### Q: How do I use Favorites?

1. Right-click a record in the left tree → **Add to Favorites**
2. Choose or create a group
3. Access bookmarked records via the **Favorites** menu

Up to 50 favorites are saved and persisted across sessions.

### Q: What are color tags for?

Color tags are personal markers for quick visual identification:
- 🔴 Red — Important / Watch
- 🟠 Orange — To-do
- 🟢 Green — Done
- 🔵 Blue — Reference
- 🟣 Purple — Special

Right-click a record → **Tag Color** to set. Tags are persisted across sessions.

## Performance & Troubleshooting

### Q: How much memory does the program use?

Loading the full `SeventySix.esm` requires about 1–2 GB of RAM. At least 4 GB of available memory is recommended.

### Q: The UI is laggy after expanding all nodes?

Expanding all nodes with tens of thousands of records consumes significant rendering resources. Recommendations:
- Only expand the record types you need
- Use filters to narrow the scope
- Use **View → Collapse All** to reset

### Q: 3D model preview doesn't work?

3D model preview requires the WebView2 runtime (usually pre-installed on Windows 10/11). If it doesn't display:
- Verify that Microsoft Edge WebView2 Runtime is installed
- Ensure the BA2 archives contain the corresponding NIF model files

## Keyboard Shortcuts

| Shortcut | Function |
|----------|----------|
| `Ctrl + F` | Search records |
| `Ctrl + Shift + F` | Advanced search |
| `Ctrl + G` | Field filter |
| `Alt + ←` / `Alt + →` | Navigate back / forward |
| `F3` | Cycle recent records |
| `/` | Focus tree filter box |
| `Esc` | Clear filter box |
| Mouse Button 4 / 5 | Navigate back / forward |
