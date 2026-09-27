//
//  CraftStore.swift
//  ZorigChusum
//
//  Keeps track (in memory only — the app uses no storage) of which crafts the user has marked as "Visited".
//

import SwiftUI
import Observation

@Observable
final class CraftStore {
    private(set) var visited: Set<Int> = []

    func isVisited(_ craft: Craft) -> Bool {
        visited.contains(craft.id)
    }

    func setVisited(_ craft: Craft, _ value: Bool) {
        if value { visited.insert(craft.id) } else { visited.remove(craft.id) }
    }

    /// A Binding that a Toggle can use directly.
    func visitedBinding(for craft: Craft) -> Binding<Bool> {
        Binding(
            get: { self.isVisited(craft) },
            set: { self.setVisited(craft, $0) }
        )
    }
}
