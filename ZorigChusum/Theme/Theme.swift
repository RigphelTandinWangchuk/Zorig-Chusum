//
//  Theme.swift
//  ZorigChusum
//
//  Warm cream-and-orange palette with rounded type, inspired by storybook-style planner apps.
//

import SwiftUI
import UIKit

enum Theme {
    static let cream      = Color(hex: 0xFDF4E3)   // main background
    static let card       = Color(hex: 0xFFFAF0)   // rows and cards
    static let sand       = Color(hex: 0xF8DFB4)   // soft panel / gradient
    static let peach      = Color(hex: 0xF5C27D)
    static let orange     = Color(hex: 0xE8893A)   // accent
    static let deepOrange = Color(hex: 0xD06A26)   // strong accent / tint
    static let ground     = Color(hex: 0xE8963F)   // matches the illustrated ground
    static let olive      = Color(hex: 0xE3DA9A)   // chips (like the date chips in the reference)
    static let oliveDark  = Color(hex: 0x7F7730)
    static let brown      = Color(hex: 0x5A3A1E)   // primary text & outlines
    static let softBrown  = Color(hex: 0x8A6A4A)   // secondary text

    /// Rounded system font used throughout the app.
    static func rounded(_ size: CGFloat, _ weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }

    /// Soft cream background used behind the list and detail screens.
    static var background: some View {
        LinearGradient(colors: [cream, Color(hex: 0xFBE9CC)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }

    /// Gives the navigation bar rounded, brown titles to match the design.
    static func configureNavigationBar() {
        func rounded(_ size: CGFloat, _ weight: UIFont.Weight) -> UIFont {
            let base = UIFont.systemFont(ofSize: size, weight: weight)
            guard let descriptor = base.fontDescriptor.withDesign(.rounded) else { return base }
            return UIFont(descriptor: descriptor, size: size)
        }
        let brown = UIColor(red: 0x5A / 255, green: 0x3A / 255, blue: 0x1E / 255, alpha: 1)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [.font: rounded(34, .bold), .foregroundColor: brown]
        appearance.titleTextAttributes = [.font: rounded(17, .semibold), .foregroundColor: brown]

        let scrolled = UINavigationBarAppearance()
        scrolled.configureWithDefaultBackground()
        scrolled.backgroundColor = UIColor(red: 0xFD / 255, green: 0xF4 / 255, blue: 0xE3 / 255, alpha: 0.92)
        scrolled.largeTitleTextAttributes = appearance.largeTitleTextAttributes
        scrolled.titleTextAttributes = appearance.titleTextAttributes

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = scrolled
        UINavigationBar.appearance().compactAppearance = scrolled
    }
}

extension Color {
    init(hex: UInt, opacity: Double = 1) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xFF) / 255,
                  green: Double((hex >> 8) & 0xFF) / 255,
                  blue: Double(hex & 0xFF) / 255,
                  opacity: opacity)
    }
}

/// A small pill-shaped label, e.g. "No. 3" or "Metal".
struct Chip: View {
    let text: String
    var symbol: String? = nil
    var fill: Color = Theme.olive
    var foreground: Color = Theme.brown

    var body: some View {
        HStack(spacing: 5) {
            if let symbol { Image(systemName: symbol).font(.caption.weight(.bold)) }
            Text(text)
        }
        .font(Theme.rounded(13, .semibold))
        .foregroundStyle(foreground)
        .padding(.horizontal, 11)
        .padding(.vertical, 6)
        .background(fill, in: Capsule())
        .overlay(Capsule().stroke(Theme.brown.opacity(0.15), lineWidth: 1))
    }
}
