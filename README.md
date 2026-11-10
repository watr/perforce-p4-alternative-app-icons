# Perforce P4 Alternative App Icons

Unofficial alternative macOS application icons for **Perforce P4V, P4Merge, and P4Admin**.

A minimal, onigiri-inspired icon set designed to complement the modern macOS aesthetic.

## Preview

![P4V, P4Merge, and P4Admin alternative app icons](assets/preview.png)

## Supported Applications

| Application | Description | Download |
|---|---|---|
| **P4V** | Perforce Visual Client | [PNG](icons/P4V.png) · [ICNS](icons/P4V.icns) |
| **P4Merge** | Visual merge and diff tool | [PNG](icons/P4Merge.png) · [ICNS](icons/P4Merge.icns) |
| **P4Admin** | Administration tool | [PNG](icons/P4Admin.png) · [ICNS](icons/P4Admin.icns) |

These icons replace only the macOS application icons. They do not modify the applications themselves, their interfaces, or any internal icons.

## Installation

1. Download the **PNG** for your application from the table above. On GitHub, open the file and use **Download raw file** to save it.
2. Open **Finder** and locate the application you want to customize.
3. Select the application and press `⌘I` to open **Get Info**.
4. Open the replacement icon in **Preview**, then select all (`⌘A`) and copy (`⌘C`).
5. Click the small application icon in the top-left corner of the Get Info window.
6. Paste (`⌘V`) to replace the icon.

You may need to restart the application or refresh the Dock for the new icon to appear.

To restore the original icon, select the custom icon in the Get Info window and press `Delete`.

## Design

The icons share a consistent visual language:

- Minimal, geometric, onigiri-inspired shapes
- Distinct symbols for P4V, P4Merge, and P4Admin
- A cohesive appearance across all three applications
- Designed for modern macOS

## Source Files

The `P4_p4v.icon`, `P4_p4merge.icon`, and `P4_p4admin.icon` folders are editable **Icon Composer** documents. `P4_base.icon` contains the shared design and symbol variants.

To rebuild the PNG and ICNS files and the preview on macOS, select an Xcode installation containing Icon Composer with `xcode-select`, then run:

```sh
bash scripts/export-icons.sh
```

The script requires Xcode 27 or later and exports the default macOS appearance using design generation 27. The distributed PNG and ICNS files are static snapshots of that appearance.

## Disclaimer

This is an independent, unofficial project and is not affiliated with, endorsed by, or sponsored by Perforce Software.

Perforce, P4, P4V, P4Merge, and P4Admin are trademarks or product names of their respective owners.

All original trademarks and application rights remain with their respective owners.
