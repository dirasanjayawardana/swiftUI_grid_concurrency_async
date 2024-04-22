//
//  ContentView.swift
//  GridConcurrencyView
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var symbolViewModel = SymbolViewModel()
    
    // minimum (minimum width setiap item)
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 100), spacing: 10)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20, content: {
                    ForEach(symbolViewModel.symbols) { item in
                        Image(systemName: item.name)
                            .padding()
                            .foregroundStyle(.white)
                            .font(.title)
                            .frame(width: 100, height: 100)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                })
                .padding()
            }
            .navigationTitle("Symbols")
            .toolbar(content: {
                ToolbarItem(content: {
                    Button(action: {
                        Task {
                            await symbolViewModel.downloadImageWithoutBlockUI()
                        }
                    }, label: {
                        Image(systemName: "square.and.arrow.down")
                    })
                    .tint(.black)
                    .fontWeight(.bold)
                    .font(.title2)
                })
            })
        }
    }
}

#Preview {
    ContentView()
}
