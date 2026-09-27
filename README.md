# Zorig Chusum 🇧🇹

A SwiftUI iOS app that lists **Bhutan's thirteen traditional arts and crafts (Zorig Chusum)** and shows the details of each one. It has a warm, storybook-style design with a hand-drawn illustration for every craft.

* **Interface:** SwiftUI · **Language:** Swift · **Storage:** None
* **Requires:** Xcode 16 or newer, iOS 17+ Simulator

## Features

| Requirement | Where it is |
|---|---|
| `Craft` model (`Identifiable` struct with id, name, englishName, imageName, description) | `Model/Craft.swift` |
| Array of all 13 crafts | `Model/CraftData.swift` |
| `List` + `ForEach` rows showing the Dzongkha name and English meaning | `Views/ContentView.swift`, `Views/CraftRow.swift` |
| `NavigationStack` + `NavigationLink` → `CraftDetailView` | `Views/ContentView.swift` |
| Detail screen built with VStack, HStack, Spacer, Image, Text and modifiers | `Views/CraftDetailView.swift` |
| **Enhancement 1:** `.navigationTitle("Zorig Chusum")` | `ContentView.swift` |
| **Enhancement 2:** Visual styling (rounded fonts, custom colour palette, corner radius on images, card rows, shadows) | `Theme/Theme.swift`, all views |
| **Enhancement 3:** Extra components: `Divider`, a "Visited" `Toggle`, a `ProgressView`, a `Start` `Button` | `CraftDetailView.swift`, `ContentView.swift`, `WelcomeView.swift` |
| **Bonus:** `.searchable()` search bar that filters by Dzongkha or English name | `ContentView.swift` |
| Extra: material filter chips, a welcome screen, and "Did you know?" facts | |

## Project structure

```
ZorigChusum/
├── ZorigChusum.xcodeproj
└── ZorigChusum/
    ├── ZorigChusumApp.swift        App entry point (welcome screen, then list)
    ├── Model/
    │   ├── Craft.swift             Craft struct + CraftMaterial enum
    │   ├── CraftData.swift         The 13 crafts
    │   └── CraftStore.swift        In-memory "Visited" state
    ├── Views/
    │   ├── WelcomeView.swift
    │   ├── ContentView.swift       List screen
    │   ├── CraftRow.swift
    │   └── CraftDetailView.swift
    ├── Theme/Theme.swift           Colours, fonts, Chip view
    └── Assets.xcassets             13 craft illustrations, welcome art, app icon
```

## Running it

1. Unzip the project and double-click **`ZorigChusum.xcodeproj`**.
2. At the top of Xcode, choose an iPhone simulator, for example *iPhone 16*.
3. Press **⌘R** to build and run.
4. To see the SwiftUI previews, open `ContentView.swift` or `CraftDetailView.swift` and press **⌥⌘↩** to show the canvas.

> If Xcode asks for a signing team, select the **ZorigChusum** target, open *Signing & Capabilities* and choose your Personal Team. The Simulator doesn't need signing.

## Uploading to GitHub

```bash
cd ZorigChusum
git init
git add .
git commit -m "Zorig Chusum SwiftUI app"
git branch -M main
git remote add origin https://github.com/<your-username>/ZorigChusum.git
git push -u origin main
```

(First create an empty repository called `ZorigChusum` on github.com. You can also use Xcode's **Integrate ▸ New Git Repository**.)

## Screenshot checklist for the lab report

1. Xcode Project Navigator showing the folder structure, with `Craft.swift` open.
2. `ContentView` in the SwiftUI **Preview** canvas, and the same screen in the **Simulator** (scroll to show all 13 crafts).
3. Tapping a row, then the `CraftDetailView` for that craft (for example, Thagzo).
4. Enhancements: the large navigation title; the styled rows and detail card; the Divider and "Visited" toggle (turn it on, go back, and the ✓ appears on the row and the progress bar goes up); the search bar filtering (type "wood" or "zo").
5. The back button returning to the list.
# Zorig-Chusum
