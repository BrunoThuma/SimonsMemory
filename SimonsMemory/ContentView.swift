//
//  ContentView.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 16/09/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    let cardsService: CardService = SfSymbolsCardsService()
    let cardsPairs: Int = 8
    
    @ObservedObject var game = SimonsMemoryGame()
    @State var cards: [Card] = [Card]()
    
    var fourColumnGrid: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 80)),
              count: cardsPairs/2)
    }
    
    var body: some View {
        LazyVGrid(columns: fourColumnGrid, spacing: 10) {
            ForEach(game.cards, id: \.self.id) { card in
                CardCell(cardModel: card, didSelectCard: didSelectCard) {
                    Text("SM")
                }
            }
        }
        .onAppear( perform: setupNewGame )
    }
    
    private func setupNewGame() {
        fetchCards()
        cards = game.newGame(newCards: self.cards)
    }
    
    private func resetGame() {
        game.restartGame()
        setupNewGame()
    }
    
    private func fetchCards() {
        cardsService.fetchCards(numberOfUniqueCards: cardsPairs) { result in
            switch result {
            case .success(let cards):
                self.cards = cards
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func didSelectCard(card: Card) {
        game.didSelectCard(card)
    }
    
}

extension ContentView: SimonsMemoryGameDelegate {
    func gameDidStart(_ game: SimonsMemoryGame) {
        print("Salve")
    }
    
    func gameDidEnd(_ game: SimonsMemoryGame) {
        print("Salve")
    }
    
    func game(_ game: SimonsMemoryGame, showCards cards: [Card]) {
        print("Salve")
    }
    
    func game(_ game: SimonsMemoryGame, hideCards cards: [Card]) {
        print("Salve")
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
