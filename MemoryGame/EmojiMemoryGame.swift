//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Xuhang Tong on 2025-07-29.
//medium man

import SwiftUI


//class is shared
class EmojiMemoryGame: ObservableObject {
    private static let defaultTheme: Theme = Theme(name: "Sports", color: "orange", emojis: ["⚽️", "🏀",  "🎱", "🏓", "🏊‍♀️", "🛹", "⛳️", "🎣", "🤸", "🥌", "🏆", "🚴"])
    static var themeName: String = defaultTheme.name
    static var themeEmojis: [String] = defaultTheme.emojis
    static var themeColor: String = defaultTheme.color
    
    @Published private var numberOfPairs: Int = 6
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: themeEmojis.count) { pairIndex in
            if themeEmojis.indices.contains(pairIndex) {
                return themeEmojis[pairIndex]
            }else{
                return "💦"
            }
        }
    }
        
    @Published private var model = createMemoryGame()

    func getThemeColor() -> Color {
        switch EmojiMemoryGame.themeColor {
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "blue":
            return .blue
        case "pink":
            return .pink
        case "red":
            return .red
        case "orange":
            return .orange
        default:
            return .blue
        }
    }
    
    func getThemeName() -> String {
        return EmojiMemoryGame.themeName
    }
    
    var cards:Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var getScore: String {
        return model.getScore()
    }
    
    //Mark:- Intents
    func newGame(){
        setRandomTheme()
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func setRandomTheme(){
        let randomTheme:Theme = getRandomTheme()
        EmojiMemoryGame.themeName = randomTheme.name
        EmojiMemoryGame.themeEmojis = getArrayRandomSubset(from: randomTheme.emojis)
        EmojiMemoryGame.themeColor = randomTheme.color
    }
    
    func getArrayRandomSubset(from fullArray: [String]) -> [String] {
        let randomLength = Int.random(in: 2...fullArray.count)
        return Array(fullArray.shuffled().prefix(randomLength))
    }
    
    func getRandomTheme() -> Theme {
        let randomNumber:Int = Int.random(in: 0..<6)
        switch randomNumber {
        case 0:
            return EmojiMemoryGame.defaultTheme
        case 1:
            return Theme(name: "Vehicles", color: "blue", emojis: ["🚑", "🚚",  "🚛", "🚘", "🚴"])
        case 2:
            return Theme(name: "House", color: "yellow", emojis: ["🏢", "🏬", "🏣", "🏤", "🏥", "🏛️", "🛕", "🕌"])
        case 3:
            return Theme(name: "Fruit", color: "green", emojis: ["🍉", "🍌", "🥥", "🥝", "🥭", "🍊"])
        case 4:
            return Theme(name: "Mountains", color: "pink", emojis: ["🌋", "⛰️", "🏔️", "🗻", "🏕️", "🏝️", "🏜️"])
        case 5:
            return Theme(name: "Pets", color: "red", emojis: ["🐶", "🐱", "🦇", "🐥", "🦋", "🐛", "🐝", "🐌", "🐞", "🦗"])
        default:
            return EmojiMemoryGame.defaultTheme
        }
    }
    
    struct Theme {
        var name: String
        var color: String
        var emojis: [String]
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
