//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by Ernest Gaisie on 29/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Accent Color").foregroundColor(Color.theme.accent)
                Text("Secondary Text Color").foregroundColor(Color.theme.secondaryText)
                Text("Red Color").foregroundColor(Color.theme.red)
                Text("Greeen Color").foregroundColor(Color.theme.green)
            }.font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
