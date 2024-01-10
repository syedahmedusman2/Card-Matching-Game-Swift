//
//  MemoryGame.swift
//  First Swift App
//
//  Created by User on 08/01/2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private var oneFaceUpCardIndex: Int?
   mutating func chooseCard(_ card: Card) {
       if let choosenIndex = cards.firstIndex(where: { $0.id == card.id}), !cards[choosenIndex].isFaceUp, !cards[choosenIndex].isMatched{
           if let potentialMatchedCard = oneFaceUpCardIndex{
               if cards[choosenIndex].cardContenct == cards[potentialMatchedCard].cardContenct{
                   cards[choosenIndex].isMatched = true
                   cards[potentialMatchedCard].isMatched = true
                  
               }
               oneFaceUpCardIndex = nil
           }else{
               for index in 0..<cards.count{
                   cards[index].isFaceUp = false
               }
             oneFaceUpCardIndex = choosenIndex
           }
           cards[choosenIndex].isFaceUp.toggle()
       }
        }
    
    mutating func resetGame(){
        for index in 0..<cards.count{
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        cards.shuffle()
    }

    
    init(numberOfPairsOfCards: Int, createCardContent : (Int) -> CardContent) {
        var cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
        let contenta = createCardContent(pairIndex)
            cards.append(Card(cardContenct: contenta, id: pairIndex*2))
            cards.append(Card(cardContenct: contenta, id: pairIndex*2+1))
        }
        self.cards = cards.shuffled()
    }
    
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var cardContenct: CardContent
        var id: Int
    }
}
