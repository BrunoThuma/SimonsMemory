//
//  Card.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 01/10/23.
//

import SwiftUI

class Card: ObservableObject {
    var id: String = UUID().uuidString
    var icon: Image
    var color: Color
    @Published var isShown: Bool = false
    
    init(card: Card) {
        self.id = card.id
        self.icon = card.icon
        self.color = card.color
        self.isShown = card.isShown
    }
    
    init(icon: Image, color: Color) {
        self.icon = icon
        self.color = color
    }
    
    
    func isEqual(to card: Card) -> Bool {
        let isCopy = self.id.contains(card.id)
        let otherIsCopy = card.id.contains(self.id)
        
        return isCopy || otherIsCopy
    }
    
    func copy() -> Card {
        return Card(card: self)
    }
}

extension Card {
    
}
