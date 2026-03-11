# Record Menu

Menu path: **Record(&C)**

## Query by FormID (&Q)

- **Function**: Enter a FormID (e.g. `003ABC` or `0x003ABC`) in the top search box and press Enter or click "Search"
- **Result**: Navigates directly to the matching record and displays its details

## Search Records (&S)

- **Shortcut**: `Ctrl + F`
- **Function**: Focus the top search box. Supports 4 search modes:

### Search Modes

**① Keyword Search**
- Enter plain text (e.g. `Laser` or `PowerArmor`)
- Performs fuzzy matching against EditorID and FullName

**② Wildcard Search**
- Use `*` (match any characters) and `?` (match single character)
- Examples: `Weapon*Laser`, `NPC_???`

**③ FormID Range Search**
- Format: `0x1000-0x2000` or `1A00-2FFF`
- Finds all records within the specified FormID range

**④ Regex Search**
- Format: `/pattern/` (wrapped in slashes)
- Example: `/^Weapon_.+Laser$/`
- Supports full .NET regex syntax, case-insensitive

### Search Results Window

- Results appear in a separate window
- Columns: FormID, Type, EditorID, Name
- **Double-click** or **Enter** to jump to a record
- When multiple ESMs are loaded, a "Source ESM" column is shown

## Advanced Search (&V)

- **Shortcut**: `Ctrl + Shift + F`
- **Function**: Opens an advanced search dialog with richer filtering options
- **Supports**: Type filtering, field value search, etc.

## Field Search (&Z)

- **Function**: Opens the field-level search window
- **Use case**: Search for specific subrecord field values within a given record type
- **Steps**:
  1. Select a record type (e.g. WEAP, ARMO)
  2. Enter search criteria
  3. The search scans subrecord data across all records of that type

## Locate in Tree (&L)

- **Prerequisite**: A record must be currently queried
- **Function**: Finds and selects the current record's node in the left tree
- **Process**: Automatically expands the type node (including page nodes), scrolls to and highlights the target node

## View References (&E)

- **Function**: Scans all loaded ESMs to find which records reference the currently selected record
- **Use case**: Discover which recipes, containers, leveled lists, etc. reference a given item/NPC/effect
- **Result**: Opens a separate window listing all referencing records
- **Limitation**: Compressed records are excluded from the scan

## Compare Records (&D)

- **Prerequisite**: A record must be currently queried
- **Function**: Opens a record comparison window where two FormIDs can be compared side by side
- **Display**: Left/right split view showing subrecords, with differences highlighted

## Cross-ESM Compare (&X)

- **Prerequisite**: At least 2 ESM files must be loaded
- **Function**: Compare the same FormID's data across two different ESMs
- **Use case**: See what changes a mod or patch made to a specific record

## Item Source Chain (&P)

- **Prerequisite**: A record must be selected
- **Function**: Analyze how the item can be obtained
- **Display**: Traces recipes (COBJ), containers (CONT), NPC drops, leveled lists (LVLI), and other acquisition paths

## OMOD Chain (&O)

- **Prerequisite**: A record must be selected
- **Function**: Display the weapon/armor's Object Modification (OMOD) chain
- **Use case**: View all available modifications and their effects for a weapon or armor

## NPC Equipment (&N)

- **Prerequisite**: An NPC_ type record must be selected
- **Function**: Display the NPC's complete equipment loadout
- **Display**: Equipped armor, weapons, ammo, etc. with detailed information

## Leveled Lists (&L)

- **Prerequisite**: An LVLI / LVLN / LVSP record must be selected
- **Function**: Recursively expand the complete leveled list contents
- **Display**: Tree structure showing level entries, probability weights, and nested sub-lists

## Master Dependency Chain (&M)

- **Function**: Display the Master dependency relationships of the loaded ESMs
- **Display**: Dependency graph between ESM files

## Unknown Fields (&U)

- **Function**: List all subrecord signatures in the current view that are not registered in `subrecord-fields.*.json`
- **Use case**: Aid reverse engineering and field documentation work
- **Output**: Displays unrecognized signatures that can be added to field definition files
