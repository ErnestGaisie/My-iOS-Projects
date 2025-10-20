//
//  ContentView.swift
//  TwitterSwift
//
//  Created by Ernest Gaisie on 20/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()

            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
    }
}

#Preview {
    ContentView()
}
