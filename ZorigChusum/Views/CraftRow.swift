//
//  CraftRow.swift
//  ZorigChusum
//
//  One row of the list: thumbnail, Dzongkha name and English meaning.
//

import SwiftUI

struct CraftRow: View {
    let craft: Craft
    let isVisited: Bool

    var body: some View {
        HStack(spacing: 14) {
            Image(craft.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Theme.brown.opacity(0.15), lineWidth: 1)
                )
                .overlay(alignment: .topLeading) {
                    Text("\(craft.id)")
                        .font(Theme.rounded(11, .bold))
                        .foregroundStyle(Theme.brown)
                        .frame(width: 22, height: 22)
                        .background(Theme.olive, in: Circle())
                        .overlay(Circle().stroke(Theme.card, lineWidth: 2))
                        .offset(x: -6, y: -6)
                }

            VStack(alignment: .leading, spacing: 3) {
                Text(craft.name)
                    .font(Theme.rounded(19, .bold))
                    .foregroundStyle(Theme.brown)
                Text(craft.englishName)
                    .font(Theme.rounded(14, .medium))
                    .foregroundStyle(Theme.softBrown)
                    .lineLimit(2)
            }

            Spacer(minLength: 4)

            if isVisited {
                Image(systemName: "checkmark.circle.fill")
                    .font(.title3)
                    .foregroundStyle(Theme.orange)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .padding(.vertical, 2)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    CraftRow(craft: crafts[9], isVisited: true)
        .padding()
        .background(Theme.card)
}
