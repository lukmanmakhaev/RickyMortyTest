//
//  ListItemView.swift
//  RickyMortyTest
//
//  Created by Lukman Makhaev on 10.01.2025.
//

import SwiftUI
import Kingfisher

struct ListItemView: View {
    @Binding var character: Character
    
    var body: some View {
        HStack (alignment: .top, spacing: 18) {
            
            KFImage(URL(string: character.image))
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .cornerRadius(40)
                .saturation(character.status == .dead ? 0 : 1)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)

            
            VStack (alignment: .leading, spacing: 0) {
                
                HStack {
                    Text(character.name)
                        .font(.system(size: 21))
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                    
                    Spacer()
                    
                    Text(character.status?.rawValue.uppercased() ?? "")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(character.statusBgColor)
                        .foregroundStyle(character.statusTextColor)
                        .cornerRadius(25)
                }
                
                Text("\(character.species), \(character.gender?.rawValue.lowercased() ?? "")")
                    .font(.system(size: 14))
                
                Button(action: {
                    
                }, label: {
                    HStack (spacing: 6) {
                        Image("arrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                        Text("Watch episodes")
                    }
                    .font(.system(size: 14))
                    .padding(.vertical, 9)
                    .padding(.horizontal, 12)
                    .background(Color.clrOrange.opacity(0.1))
                    .foregroundStyle(.clrOrange)
                    .cornerRadius(17)
                })
                .padding(.vertical, 12)
                
                HStack (spacing: 6) {
                    Image("pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                    Text(character.location?.name ?? "")
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                }
                .font(.system(size: 14))
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ListItemView(character: .constant(Character(id: 1, name: "Rick Sanchez", status: .unknown, species: "Human", type: "", gender: .male, origin: CharacterLocation(name: "Earth (C-500A)", url: ""), location: CharacterLocation(name: "Earth (C-500A)", url: "") , image: "image", episode: [], url: "", created: "")))
}
