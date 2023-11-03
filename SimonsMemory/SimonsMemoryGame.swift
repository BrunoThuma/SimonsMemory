//
//  SimonsMemoryGame.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 01/10/23.
//

import SwiftUI

protocol SimonsMemoryGameDelegate {
    //protocol definition goes here
    func gameDidStart(_ game: SimonsMemoryGame)
    func gameDidEnd(_ game: SimonsMemoryGame)
    func game(_ game: SimonsMemoryGame, showCards cards: [Card])
    func game(_ game: SimonsMemoryGame, hideCards cards: [Card])
}

class SimonsMemoryGame: ObservableObject {
    var delegate: SimonsMemoryGameDelegate?
    @Published var cards: [Card] = [Card]()
    @State var cardsShown: [Card] = [Card]()
    @State var isPlaying: Bool = false
    
    func shuffleCards(cards: [Card]) -> [Card] {
        var randomCards = cards
        randomCards.shuffle()
        return randomCards
    }
    
    func newGame(newCards: [Card]) -> [Card] {
        cards = shuffleCards(cards: newCards)
        isPlaying = true
        
        return cards
    }
    
    func restartGame() {
        isPlaying = false
        cards.removeAll()
        cardsShown.removeAll()
    }
    
    fileprivate func endGame() {
        isPlaying = false
        delegate?.gameDidEnd(self)
    }
    
    func cardAtIndex(_ index: Int) -> Card? {
        guard index > cards.count else {
            return nil
        }
        
        return cards[index]
        
    }
    
    func indexForCard(_ card: Card) -> Int? {
        for index in 0...cards.count - 1 {
            if card.isEqual(to: cards[index]) {
                return index
            }
        }
        return nil
    }
    
    func isFirsCardOfTurn() -> Bool {
        return cardsShown.count % 2 != 0
    }
    
    func firstCardOfTurn() -> Card? {
        return cardsShown.last
    }
    
    func didSelectCard(_ card: Card?) {
        guard let card = card else { return }
        
        if isFirsCardOfTurn() {
            let firstCard = firstCardOfTurn()!
            
            if card.isEqual(to: firstCard) {
                print("Cards are equal")
                cardsShown.append(card)
            } else {
                let _ = cardsShown.removeLast()
            }
        } else {
            cardsShown.append(card)
        }
        
        if cardsShown.count == cards.count {
            endGame()
        }
    }
}
