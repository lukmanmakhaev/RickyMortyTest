//
//  ContentView.swift
//  RickyMortyTest
//
//  Created by Lukman Makhaev on 10.01.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                        Text("Loading...")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 32) {
                            ForEach($viewModel.characters, id: \.id) { $char in
                                NavigationLink(destination: {
                       
                                }, label: {
                                    ListItemView(character: $char)
                                        .foregroundStyle(.black)
                                })
                            }
                        }
                        .padding(.top, 24)
                    }
                }
            }
            .navigationTitle("Character")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
