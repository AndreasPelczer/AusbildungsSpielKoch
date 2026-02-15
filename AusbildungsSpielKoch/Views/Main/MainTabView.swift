//
//  MainTabView.swift
//  AusbildungsSpielKoch
//
//  Haupt-Tab-Navigation: Quiz + Lexikon
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            StartScreenView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Quiz")
                }
                .tag(0)

            LexikonHomeView(
                produkte: LexikonLoader.loadProdukte(),
                garmethoden: LexikonLoader.loadGarmethoden(),
                saucen: LexikonLoader.loadSaucen()
            )
            .tabItem {
                Image(systemName: "book.fill")
                Text("Lexikon")
            }
            .tag(1)
        }
        .tint(.orange)
    }
}
