//
//  RickyMortyTestApp.swift
//  RickyMortyTest
//
//  Created by Lukman Makhaev on 10.01.2025.
//

import SwiftUI

@main
struct RickyMortyTestApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
