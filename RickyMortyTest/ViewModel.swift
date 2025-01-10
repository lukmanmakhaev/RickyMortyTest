//
//  Viewmode.swift
//  RickyMortyTest
//
//  Created by Lukman Makhaev on 10.01.2025.
//

import Foundation

class ViewModel: Observable {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
}
