//
//  AusbildungsSpielKochApp.swift
//  AusbildungsSpielKoch
//
//  Created by Andreas Pelczer on 15.02.26.
//

import SwiftUI

@main
struct AusbildungsSpielKochApp: App {
    @StateObject private var progressManager = ProgressManager.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(progressManager)
                .preferredColorScheme(.dark)
        }
    }
}
