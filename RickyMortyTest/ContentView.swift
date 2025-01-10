//
//  ContentView.swift
//  RickyMortyTest
//
//  Created by Lukman Makhaev on 10.01.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            LazyVStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .navigationTitle("Character")
        }
    }
}

#Preview {
    ContentView()
}
