//
//  SymbolModel.swift
//  GridConcurrencyView
//
//  Created by MACBOOK PRO on 22/04/24.
//

import Foundation

struct SymbolModel: Identifiable {
    let id = UUID()
    let name: String
}

extension SymbolModel {
    static var dummyData: [SymbolModel] {
        [
            SymbolModel(name: "keyboard"),
            SymbolModel(name: "hifispeaker.fill"),
            SymbolModel(name: "printer.fill"),
            SymbolModel(name: "tv.fill"),
            SymbolModel(name: "desktopcomputer"),
            SymbolModel(name: "headphones"),
            SymbolModel(name: "tv.music.note"),
            SymbolModel(name: "mic"),
            SymbolModel(name: "plus.bubble"),
            SymbolModel(name: "printer.dotmatrix"),
            SymbolModel(name: "scanner"),
            SymbolModel(name: "macpro.gen1"),
            SymbolModel(name: "pc"),
            SymbolModel(name: "macstudio"),
            SymbolModel(name: "flipphone"),
        ]
    }
}
