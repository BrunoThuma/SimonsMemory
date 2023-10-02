//
//  Card.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 01/10/23.
//

import SwiftUI

struct Card {
    var id: String = UUID().uuidString
    var icon: Image
    var color: Color
    var shown: Bool = false
    
    
    func isEqual(to card: Card) -> Bool {
        return self.id == card.id
    }
    
    func copy() -> Card {
        return Card(card: self)
    }
}

extension Card {
    init(card: Card) {
        self.id = card.id
        self.icon = card.icon
        self.color = card.color
        self.shown = card.shown
    }
}
