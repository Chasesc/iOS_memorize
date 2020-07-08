//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Chase Schelthoff on 7/1/20.
//  Copyright © 2020 Chase Schelthoff. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                self.cardView(for: card)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
    }
    
    func cardView(for card: MemoryGame<String>.Card) -> some View {
        CardView(card: card).onTapGesture {
            self.viewModel.choose(card: card)
        }
            .aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    let aspectRatio: CGFloat = 2/3
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: strokeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
            .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: UI Constants
    let cornerRadius: CGFloat = 10.0
    let strokeLineWidth: CGFloat = 3.0
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.height, size.width) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
