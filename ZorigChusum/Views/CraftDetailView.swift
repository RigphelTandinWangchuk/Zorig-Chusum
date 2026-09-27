//
//  CraftDetailView.swift
//  ZorigChusum
//
//  Detail screen built from VStack, HStack, Spacer, Image and Text plus modifiers.
//

import SwiftUI

struct CraftDetailView: View {
    let craft: Craft
    @Environment(CraftStore.self) private var store

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Illustration
                Image(craft.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 28, style: .continuous)
                            .stroke(Theme.brown.opacity(0.12), lineWidth: 1)
                    )
                    .shadow(color: Theme.brown.opacity(0.15), radius: 12, y: 6)
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    .padding(.bottom, 24)

                // Information card
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Chip(text: "No. \(craft.id) of \(crafts.count)")
                        Spacer()
                        Chip(text: craft.material.rawValue, symbol: craft.material.symbol, fill: Theme.sand)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(craft.name)
                            .font(Theme.rounded(36, .bold))
                            .foregroundStyle(Theme.brown)
                        Text(craft.englishName)
                            .font(Theme.rounded(20, .semibold))
                            .foregroundStyle(Theme.deepOrange)
                    }

                    Divider()
                        .overlay(Theme.brown.opacity(0.2))

                    VStack(alignment: .leading, spacing: 8) {
                        Label("About this craft", systemImage: "book.closed.fill")
                            .font(Theme.rounded(16, .bold))
                            .foregroundStyle(Theme.brown)
                        Text(craft.description)
                            .font(Theme.rounded(16))
                            .foregroundStyle(Theme.softBrown)
                            .lineSpacing(5)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    // "Did you know?" box
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "lightbulb.fill")
                            .font(.title3)
                            .foregroundStyle(Theme.orange)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Did you know?")
                                .font(Theme.rounded(15, .bold))
                                .foregroundStyle(Theme.brown)
                            Text(craft.funFact)
                                .font(Theme.rounded(15))
                                .foregroundStyle(Theme.softBrown)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(16)
                    .background(Theme.sand.opacity(0.55), in: RoundedRectangle(cornerRadius: 18, style: .continuous))

                    Divider()
                        .overlay(Theme.brown.opacity(0.2))

                    // "Visited" toggle (extra SwiftUI component)
                    Toggle(isOn: store.visitedBinding(for: craft).animation(.snappy)) {
                        HStack(spacing: 12) {
                            Image(systemName: store.isVisited(craft) ? "checkmark.seal.fill" : "seal")
                                .font(.title2)
                                .foregroundStyle(Theme.orange)
                                .contentTransition(.symbolEffect(.replace))
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Visited")
                                    .font(Theme.rounded(16, .bold))
                                    .foregroundStyle(Theme.brown)
                                Text(store.isVisited(craft) ? "You've explored this craft" : "Mark this craft as explored")
                                    .font(Theme.rounded(13))
                                    .foregroundStyle(Theme.softBrown)
                            }
                        }
                    }
                    .tint(Theme.orange)
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    UnevenRoundedRectangle(topLeadingRadius: 34, topTrailingRadius: 34, style: .continuous)
                        .fill(Theme.card)
                        .shadow(color: Theme.brown.opacity(0.08), radius: 10, y: -3)
                        .ignoresSafeArea(edges: .bottom)
                )
            }
        }
        .background(Theme.background)
        .navigationTitle(craft.englishName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CraftDetailView(craft: crafts[9])
    }
    .environment(CraftStore())
    .tint(Theme.deepOrange)
}
