# Favorites & Shortcuts

## Favorites Menu

Menu path: **Favorites(&A)**

### Overview

- Bookmark frequently used records for quick access
- Supports group management (custom group names)
- Bookmarks are persisted to a JSON file and restored on restart
- Maximum 50 bookmarks

### Adding Bookmarks

1. Select a record in the left tree
2. Right-click → **Add to Favorites (&B)**
3. A group selection dialog appears; choose an existing group or enter a new name
4. Confirm to add the record to favorites

### Managing Bookmarks

- **Move to Group (&M)**: Right-click a bookmarked record to move it to another group
- **Remove from Favorites (&D)**: Right-click to remove the bookmark
- **Clear All**: Use the "Clear All Bookmarks" option at the bottom of the Favorites menu

### Using Bookmarks

- Click the Favorites menu to view grouped bookmark list
- Click any bookmark to jump to that record
- Each item displays `[FormID] EditorID (Type)` format

## Color Tags

Right-click a record in the left tree → **Tag Color(&T)**:

- 🔴 **Red** — Important / Attention
- 🟠 **Orange** — Pending
- 🟢 **Green** — Completed
- 🔵 **Blue** — Reference
- 🟣 **Purple** — Special
- **Clear Tag** — Remove color

Colors are displayed directly on tree nodes and are persisted across sessions.

## Left Tree Context Menu

Right-click on a record in the left tree:

| Menu Item | Description |
|-----------|-------------|
| View References (&R) | Find all records referencing this one |
| Item Source Chain (&P) | Analyze item acquisition sources |
| Copy FormID (&I) | Copy FormID in `0x00XXXXXX` format |
| Copy EditorID (&E) | Copy the Editor ID |
| Add to Favorites (&B) | Bookmark with group selection |
| Move to Group (&M) | Move to a different favorites group |
| Remove from Favorites (&D) | Remove bookmark |
| Tag Color (&T) | Set/clear color tag |
| Export This Type JSON (&J) | Export all records of this type as JSON |
| Export This Type CSV (&C) | Export all records of this type as CSV |
| View Map (&W) | Worldspace nodes only — view CELL map |

## Right Detail Panel Context Menu

Right-click on the detail tree:

| Menu Item | Description |
|-----------|-------------|
| Copy FormID (&I) | Copy the current record's FormID |
| Jump to Record (&G) | Navigate to the FormID referenced in the current row |
| Copy Field Value (&V) | Copy the current cell's value |
| Copy Node JSON (&N) | Export current node and children as JSON |
| Copy Full JSON (&F) | Export entire record as JSON |

## Keyboard Shortcuts

| Shortcut | Function |
|----------|----------|
| `Ctrl + F` | Search records (focus search box) |
| `Ctrl + Shift + F` | Advanced search |
| `Ctrl + G` | Focus detail field filter box |
| `Alt + Left` | Navigate back |
| `Alt + Right` | Navigate forward |
| `F3` | Cycle through recently viewed records |
| `/` | Focus left tree filter box |
| `Esc` | Clear the currently focused filter box |
| `Enter` | Execute search in search box |
| `Enter` | Jump to first matching record in filter box |

## Mouse Operations

| Action | Function |
|--------|----------|
| **Left-click** tree node | Load record details |
| **Double-click** blue link in detail panel | Jump to referenced FormID |
| **Ctrl + Left-click** blue link | Jump to referenced FormID |
| **Mouse Button 4** (XButton1) | Navigate back |
| **Mouse Button 5** (XButton2) | Navigate forward |
| **Hover** over blue link | Show tooltip with target record's EditorID/Type/Name |
