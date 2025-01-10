//
//  Viewmode.swift
//  RickyMortyTest
//
//  Created by Lukman Makhaev on 10.01.2025.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    init() {
        Task { await fetchCharacters() }
    }
    
    @MainActor
     func fetchCharacters() async {
         isLoading = true
         error = nil
         do {
             let response = try await fetchCharactersFromAPI()
             characters = response.results
         } catch {
             self.error = error
         }
         isLoading = false
     }
    
    private func fetchCharactersFromAPI() async throws -> Response {
            let url = URL(string: "https://rickandmortyapi.com/api/character")!
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(Response.self, from: data)
        }
}
