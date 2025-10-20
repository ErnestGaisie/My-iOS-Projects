//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Ernest Gaisie on 29/01/2025.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
