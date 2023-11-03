//
//  SwiftUIView.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 02/10/23.
//

import SwiftUI

struct CardCell<CardBack>: View where CardBack: View {
    @ObservedObject var cardModel: Card
    
    var didSelectCard: (Card) -> Void
    
    var cardBack: () -> CardBack
    
    var body: some View {
        ZStack {
            if cardModel.isShown {
                cardModel.icon
            } else {
                cardBack()
            }
        }
        .font(
            .system(
                .largeTitle)
            .bold())
        .frame(width: 80,
               height: 80)
        .background(Color.cyan)
        .cornerRadius(10)
        .onTapGesture(perform: tapped)
    }
    
    func tapped() {
        cardModel.isShown.toggle()
        print("card id \(cardModel.id) tapped \(cardModel.isShown)")
        didSelectCard(cardModel)
    }
}

#Preview {
    CardCell(
        cardModel: Card(
            icon: Image(sfSymbols.last!),
            color: .cyan),
        didSelectCard: {_ in}) {
            Text("Test")
    }
    
}
