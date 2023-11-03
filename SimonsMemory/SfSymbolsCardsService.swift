//
//  SfSymbolsCardsService.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 02/10/23.
//

import SwiftUI

struct SfSymbolsCardsService: CardService {
    func fetchCards(numberOfUniqueCards number: Int,
                    completion: (Result<[Card], CardServiceError>) -> Void) {
        var cards: [Card] = []
        let images = getIcons(numberOfImages: number)
        
        for image in images {
            let card = Card(icon: image, color: Color.cyan)
            var copy = Card(card: card)
            copy.id += "-c"
            
            cards.append(card)
            cards.append(copy)
        }
        
        completion(.success(cards))
    }
    
    private func getIcons(numberOfImages: Int) -> [Image] {
        var images: [Image] = []
        
        for _ in 0..<numberOfImages {
            images.append(Image(systemName: getRandomSfSymbol()))
        }
        
        return images
    }
    
    private func getRandomSfSymbol() -> String {
        sfSymbols.randomElement()!
    }
}
