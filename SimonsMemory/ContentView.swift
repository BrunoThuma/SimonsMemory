//
//  ContentView.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 16/09/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @State var game = SimonsMemoryGame()
    @State var cards = [Card]()
    
    var fourColumnGrid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: fourColumnGrid) {
            ForEach((0...4), id: \.self) {
                Image(systemName: sfSymbols[$0])
                    .font(
                        .system(
                            .largeTitle)
                        .bold())
                    .frame(width: 80,
                           height: 80)
                    .background(Color.cyan)
                    .cornerRadius(10)
            }
        }
        .onAppear()
    }
    
    private func configureGame() {
        
        APIClient.shared.getCardImages { (cardsArray, error) in
            if let _ = error {
                // show alert
            }
            
            self.cards = cardsArray!
            self.setupNewGame()
        }
    }
    
    func setupNewGame() {
        cards = game.newGame(newCards: self.cards)
    }
    
    func resetGame() {
        game.restartGame()
        setupNewGame()
    }
}

extension ContentView: SimonsMemoryGameDelegate {
    func gameDidStart(_ game: SimonsMemoryGame) {
        <#code#>
    }
    
    func gameDidEnd(_ game: SimonsMemoryGame) {
        <#code#>
    }
    
    func game(_ game: SimonsMemoryGame, showCards cards: [Card]) {
        <#code#>
    }
    
    func game(_ game: SimonsMemoryGame, hideCards cards: [Card]) {
        <#code#>
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
