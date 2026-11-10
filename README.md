# Perforce P4 Alternative App Icons

Unofficial alternative macOS application icons for **Perforce P4V, P4Merge, and P4Admin**.

Inspired by compact, satisfying onigiri and the smooth, continuous motion of rotary engine rotors, these icons express a simple idea: capable tools, neatly packed and close at hand, to keep your work moving.

## Preview

![P4V, P4Merge, and P4Admin alternative app icons](assets/preview.png)

## Downloads

| Application | Description | Download |
|---|---|---|
| **P4V** | Perforce Visual Client | [PNG](icons/P4V.png) · [ICNS](icons/P4V.icns) |
| **P4Merge** | Visual merge and diff tool | [PNG](icons/P4Merge.png) · [ICNS](icons/P4Merge.icns) |
| **P4Admin** | Administration tool | [PNG](icons/P4Admin.png) · [ICNS](icons/P4Admin.icns) |

These replace only the macOS app icons; the applications and their internal icons remain unchanged.

## Installation

1. Download the **PNG** for your application from the table above. On GitHub, open the file and use **Download raw file** to save it.
2. In **Finder**, select the application and press `⌘I` to open **Get Info**.
3. Open the downloaded PNG in **Preview**, then select all (`⌘A`) and copy (`⌘C`).
4. Click the small application icon in the top-left corner of the Get Info window and paste (`⌘V`).

You may need to restart the application or refresh the Dock for the new icon to appear.

To restore the original icon, select the custom icon in the Get Info window and press `Delete`.

## Source Files

The `P4_p4v.icon`, `P4_p4merge.icon`, and `P4_p4admin.icon` folders are editable **Icon Composer** documents. `P4_base.icon` contains the shared design and symbol variants.

To rebuild the icons and preview on macOS, select **Xcode 27 or later** with `xcode-select`, then run:

```sh
bash scripts/export-icons.sh
```

The PNG and ICNS exports capture the default macOS appearance using Icon Composer design generation 27.

## Disclaimer

This unofficial project is not affiliated with, endorsed by, or sponsored by Perforce Software.

Perforce, P4, P4V, P4Merge, and P4Admin are trademarks or product names of their respective owners. All application rights remain with their respective owners.
