//
//  Response.swift
//  RickyMortyTest
//
//  Created by Lukman Makhaev on 10.01.2025.
//

import Foundation
import SwiftUI

// MARK: - CharacterResponse
struct Response: Codable {
    let info: PageInfo
    let results: [Character]
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Character
struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: Status?
    let species: String
    let type: String
    let gender: Gender?
    let origin, location: CharacterLocation?
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    var statusTextColor: Color {
       switch status {
       case .alive:
           return .clrGreen
       case .dead:
           return .clrRed
       default:
           return .gray
       }
   }
    
    var statusBgColor: Color {
       switch status {
       case .alive:
           return .clrGreenBg
       case .dead:
           return .clrRedBg
       default:
           return .clrGrayBg
       }
   }

}

// MARK: - CharacterLocation
struct CharacterLocation: Codable {
    let name: String
    let url: String
}
