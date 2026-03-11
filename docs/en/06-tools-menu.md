# Tools Menu

Menu path: **Tools(&T)**

## Strings Analyzer (&S)

- **Function**: Opens the Strings Analyzer in a separate window
- **Data source**: Loads game string data from `strings.db` (SQLite)
- **Features**:
  - Browse all in-game strings by language (item names, descriptions, dialogue, etc.)
  - Paginated browsing
  - Search with wildcard `*` support
  - View translations for the same StringID across all languages
  - Export current page or all data
- **Note**: If `strings.db` doesn't exist, it is automatically built from localization BA2 files during ESM loading

## Batch Export CSV (&B)

- **Function**: Export all record types as CSV files in one operation
- **Steps**:
  1. Select a destination folder
  2. The program iterates through all record types
  3. Each type generates a separate CSV file (e.g. `WEAP.csv`, `ARMO.csv`)
- **CSV content**: FormID, EditorID, FullName
- **Progress**: Status bar shows the current type being exported and overall progress

## Conflict Detection (&C)

- **Prerequisite**: At least 2 ESM files must be loaded
- **Function**: Detect record conflicts between multiple ESMs
- **Conflict types**:
  - Same FormID with different data across ESMs
  - Record override detection
- **Result**: Lists conflicting records; double-click to view details or compare

## Error Check (&E)

- **Prerequisite**: At least one ESM must be loaded
- **Function**: Perform integrity and consistency checks on loaded ESM data
- **Checks**:
  - Invalid FormID references (referencing non-existent records)
  - Data structure anomalies
  - Field value anomalies
- **Result**: Opens a window listing all detected issues; click to jump to the corresponding record
