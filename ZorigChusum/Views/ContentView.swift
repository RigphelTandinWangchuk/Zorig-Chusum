//
//  ContentView.swift
//  ZorigChusum
//
//  Main screen: a List of all thirteen crafts inside a NavigationStack.
//

import SwiftUI

struct ContentView: View {
    @Environment(CraftStore.self) private var store
    @State private var searchText = ""
    @State private var selectedMaterial: CraftMaterial? = nil

    /// Crafts filtered by the search bar and the material chips.
    private var filteredCrafts: [Craft] {
        crafts.filter { craft in
            let matchesMaterial = selectedMaterial == nil || craft.material == selectedMaterial
            let matchesSearch = searchText.isEmpty
                || craft.name.localizedCaseInsensitiveContains(searchText)
                || craft.englishName.localizedCaseInsensitiveContains(searchText)
            return matchesMaterial && matchesSearch
        }
    }

    var body: some View {
        NavigationStack {
            List {
                // Header card: greeting, progress and material filter chips
                Section {
                    HeaderCard(visitedCount: store.visited.count,
                               total: crafts.count,
                               selectedMaterial: $selectedMaterial)
                        .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 8, trailing: 16))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }

                Section {
                    ForEach(filteredCrafts) { craft in
                        NavigationLink {
                            CraftDetailView(craft: craft)
                        } label: {
                            CraftRow(craft: craft, isVisited: store.isVisited(craft))
                        }
                        .listRowInsets(EdgeInsets(top: 12, leading: 28, bottom: 12, trailing: 28))
                        .listRowSeparator(.hidden)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .fill(Theme.card)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                                        .stroke(Theme.brown.opacity(0.08), lineWidth: 1)
                                )
                                .shadow(color: Theme.brown.opacity(0.07), radius: 6, y: 3)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 6)
                        )
                    }
                } header: {
                    Text("The Thirteen Arts")
                        .font(Theme.rounded(20, .bold))
                        .foregroundStyle(Theme.brown)
                        .textCase(nil)
                        .padding(.leading, 4)
                }

                if filteredCrafts.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Theme.background)
            .navigationTitle("Zorig Chusum")
            .searchable(text: $searchText, prompt: "Search by Dzongkha or English name")
        }
    }
}

// MARK: - Header card

private struct HeaderCard: View {
    let visitedCount: Int
    let total: Int
    @Binding var selectedMaterial: CraftMaterial?

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Kuzuzangpo la! 🙏")
                        .font(Theme.rounded(20, .bold))
                        .foregroundStyle(Theme.brown)
                    Text("The thirteen traditional arts of Bhutan")
                        .font(Theme.rounded(14))
                        .foregroundStyle(Theme.softBrown)
                }
                Spacer()
                Image(systemName: "sparkles")
                    .font(.title2)
                    .foregroundStyle(Theme.orange)
            }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Visited")
                    Spacer()
                    Text("\(visitedCount) of \(total)")
                        .fontWeight(.bold)
                }
                .font(Theme.rounded(13, .medium))
                .foregroundStyle(Theme.brown)

                ProgressView(value: Double(visitedCount), total: Double(total))
                    .tint(Theme.orange)
            }

            // Material filter chips (styled like the date chips in the reference design)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    filterChip(title: "All", symbol: "square.grid.2x2.fill", isOn: selectedMaterial == nil) {
                        selectedMaterial = nil
                    }
                    ForEach(CraftMaterial.allCases) { material in
                        filterChip(title: material.rawValue, symbol: material.symbol,
                                   isOn: selectedMaterial == material) {
                            selectedMaterial = (selectedMaterial == material) ? nil : material
                        }
                    }
                }
                .padding(.vertical, 2)
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(Theme.sand.opacity(0.6))
        )
    }

    private func filterChip(title: String, symbol: String, isOn: Bool, action: @escaping () -> Void) -> some View {
        Button {
            withAnimation(.snappy) { action() }
        } label: {
            Chip(text: title,
                 symbol: symbol,
                 fill: isOn ? Theme.orange : Theme.olive,
                 foreground: isOn ? .white : Theme.brown)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
        .environment(CraftStore())
        .tint(Theme.deepOrange)
}
