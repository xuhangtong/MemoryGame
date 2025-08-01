//
//  MemorizeGame.swift
//  MemoryGame
//
//  Created by Xuhang Tong on 2025-07-29.
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable {
    private(set) var cards : Array<Card>
    
    init(numberOfPairsOfCards:Int, cardContentFactory:(Int) -> CardContent){
        cards = []
        // add of numberOfPairsOfCards x2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content:CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+2)b"))
        }
    }
    
    var indexOfTheOneAndOnlyCardFaceUpCard: Int? {
        get{cards.indices.filter { index in cards[index].isFaceUp }.only}
        set{cards.indices.forEach{cards[$0].isFaceUp = (newValue == $0 )}}
    }
    
    mutating func choose(_ card:Card){
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id}){
            if !cards[choosenIndex].isFaceUp && !cards[choosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyCardFaceUpCard{
                        if cards[potentialMatchIndex].content == cards[choosenIndex].content{
                            cards[potentialMatchIndex].isMatched = true
                            cards[choosenIndex].isMatched = true
                        }
                }else {
                    for index in cards.indices{
                        cards[index].isFaceUp = false
                    }
                }
                cards[choosenIndex].isFaceUp = true
            }
        }
    }
    
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? " matched" : "")"
        }
        
        var isFaceUp  = false
        var isMatched  = false
        let content : CardContent
        
        var id: String
    }
}

extension Array{
    var only:Element?{
        count == 1 ? first : nil
    }
}
