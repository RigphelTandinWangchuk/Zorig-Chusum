//
//  Craft.swift
//  ZorigChusum
//
//  The data model for one of Bhutan's thirteen traditional arts and crafts.
//

import Foundation

/// The broad material family a craft belongs to. Used for the filter chips on the list screen.
enum CraftMaterial: String, CaseIterable, Identifiable {
    case wood  = "Wood"
    case earth = "Earth & Stone"
    case metal = "Metal"
    case fibre = "Fibre & Paper"
    case paint = "Paint"

    var id: String { rawValue }

    /// SF Symbol used for the material chip.
    var symbol: String {
        switch self {
        case .wood:  return "tree.fill"
        case .earth: return "mountain.2.fill"
        case .metal: return "hammer.fill"
        case .fibre: return "scissors"
        case .paint: return "paintpalette.fill"
        }
    }
}

/// One of the thirteen traditional arts (Zorig Chusum).
struct Craft: Identifiable, Hashable {
    let id: Int                 // 1 … 13, also used as the craft's number
    let name: String            // Dzongkha term, e.g. "Thagzo"
    let englishName: String     // English meaning, e.g. "Weaving"
    let imageName: String       // Image in Assets.xcassets
    let description: String     // Short explanation of the craft
    let material: CraftMaterial
    let funFact: String         // "Did you know?" note on the detail screen
}
