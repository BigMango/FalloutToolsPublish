# Changelog

## [Unreleased]

## [1.0.2] - 2026-03-11
### Added
- **Master Dependencies** — recursive ESM master-file dependency tree, color-coded load/exist/missing status (Record → Master Dependencies)
- **OMOD Modification Chain** — view all Object Modifications for a weapon/armor, grouped by slot keyword (Record → OMOD Chain, WEAP/ARMO/NPC_)
- **NPC Equipment Viewer** — inspect outfits (OTFT), inventory (CNTO), death items, and template inheritance (Record → NPC Equipment, NPC_ only)
- **ItemRelationIndexExporter** — enhanced export with new relationship types

### Fixed
- Item Source Chain: FVPA subrecord parsing stride corrected from 8 to 12 bytes (`ComponentFormID + Count + CurveTable`)
- Item Source Chain: crafting component nodes now show localized full names
- Advanced Search: reduced gap between type label and ComboBox for better layout

## [1.0.1] - 2026-03-09
### Added
- Item Source Chain — trace crafting recipes (COBJ), leveled lists (LVLI), vendor sources (Record → Item Source Chain)
- Keyboard navigation: `F5` cycle recent records, `Ctrl+F` focus search
- Search history dropdown (recent search terms)
- Bookmark color tags (Red / Orange / Green / Blue / Purple)
- Bookmark delete from context menu
- Session persistence (window size, splitter positions, last ESM path)

### Improved
- ATX/MTX model path fallback for 3D preview
- i18n updates for all 13 languages

## [1.0.0] - 2026-03-08
### Features
- **ESM Browser**: unified search box (hex/decimal FormID, EditorID, name keyword), tree-based record browsing with type filtering, detail panel with field/value/hex columns
- **Multi-ESM**: load multiple ESM files simultaneously, cross-ESM operations
- **Navigation**: back/forward history (`Alt+Left/Right`), recent records list
- **Search**: basic search (`Ctrl+F`), advanced search with type filters and deep subrecord search (`Ctrl+Shift+F`), field-level search across all loaded ESMs
- **Record Analysis**: reference lookup, record comparison (diff view), cross-ESM comparison, unknown field detection
- **Export**: JSON export (single record or entire type), CSV export (entire type), screenshot export
- **Preview**: 3D model preview (NIF via WebView2), texture preview (DDS), cell map viewer
- **Tools**: strings analyzer (multi-language string database), conflict detection, error check
- **Favorites**: bookmark records into groups, quick navigation from menu
- **Localization**: 13 languages (EN, 简中, 繁中, 日, 韩, DE, FR, ES, ES-MX, PT-BR, RU, PL, IT)
- **Other**: auto-update checker, self-contained single-file executable (no .NET runtime needed)
- **Context Menus**: copy FormID/EditorID, jump to record, copy JSON, batch export type, view map
