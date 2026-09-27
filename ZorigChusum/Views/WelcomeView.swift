//
//  WelcomeView.swift
//  ZorigChusum
//
//  Illustrated start screen with a "Start" button.
//

import SwiftUI

struct WelcomeView: View {
    var onStart: () -> Void

    var body: some View {
        ZStack {
            // Sky-to-ground gradient that blends into the illustration
            LinearGradient(colors: [Color(hex: 0xFDEFD6), Color(hex: 0xF8D9A6), Theme.ground],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                VStack(spacing: 6) {
                    Text("Zorig Chusum")
                        .font(Theme.rounded(34, .bold))
                        .foregroundStyle(Theme.brown)
                    Text("བཟོ་རིག་བཅུ་གསུམ")
                        .font(.system(size: 20))
                        .foregroundStyle(Theme.softBrown)
                }
                .padding(.top, 36)

                Spacer(minLength: 12)

                Image("welcome")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 380)
                    .clipped()
                    // Fade the top edge so the illustration melts into the sky gradient
                    .mask(
                        LinearGradient(stops: [.init(color: .clear, location: 0),
                                               .init(color: .black, location: 0.18)],
                                       startPoint: .top, endPoint: .bottom)
                    )

                VStack(spacing: 22) {
                    Text("Discover the thirteen traditional\narts and crafts of Bhutan")
                        .font(Theme.rounded(18, .medium))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Theme.brown)

                    Button(action: onStart) {
                        Text("Start")
                            .font(Theme.rounded(19, .semibold))
                            .foregroundStyle(Theme.brown)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Theme.card, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .stroke(Theme.brown, lineWidth: 2)
                            )
                            .shadow(color: Theme.brown.opacity(0.18), radius: 0, x: 0, y: 4)
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 36)
                }
                .padding(.top, 8)
                .padding(.bottom, 40)
                .frame(maxWidth: .infinity)
                .background(Theme.ground.ignoresSafeArea(edges: .bottom))
            }
        }
    }
}

#Preview {
    WelcomeView(onStart: {})
}
