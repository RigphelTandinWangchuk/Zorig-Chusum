//
//  ZorigChusumApp.swift
//  ZorigChusum
//
//  App entry point: shows the welcome screen, then the list of crafts.
//

import SwiftUI

@main
struct ZorigChusumApp: App {
    @State private var store = CraftStore()
    @State private var hasStarted = false

    init() {
        Theme.configureNavigationBar()
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                if hasStarted {
                    ContentView()
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                } else {
                    WelcomeView {
                        withAnimation(.easeInOut(duration: 0.45)) { hasStarted = true }
                    }
                    .transition(.opacity)
                }
            }
            .environment(store)
            .tint(Theme.deepOrange)
            .preferredColorScheme(.light)
        }
    }
}
