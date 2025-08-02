//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Xuhang Tong on 2025-07-29.
//medium man

import SwiftUI


//class is shared
class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["⚽️", "🏀",  "🎱", "🏓", "🏊‍♀️", "🛹", "⛳️", "🎣", "🤸", "🥌", "🏆", "🚴"]
    
    @Published private var numberOfPairs: Int = 6
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 20) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }else{
                return "💦"
            }
        }
    }
        
    @Published private var model = createMemoryGame()

    var cards:Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //Mark:- Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
