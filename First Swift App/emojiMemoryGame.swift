//
//  emojiMemoryGame.swift
//  First Swift App
//
//  Created by User on 08/01/2024.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
   static let emojis = ["✈️","🏀", "🎃",  "🎩", "👑","🐨","🍎","🎲","🚗","☎️","🦆","🐝", "🍫","🔫"]
    
    static func createMemoryGame()-> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 10, createCardContent: {pairIndex in emojis[pairIndex]})
    }
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    

//    var cards: Array<MemoryGame<String>.Card> {
//        return model.cards
//    }
    // Mark - Intent
    
    func resetGame(){
        objectWillChange.send()
        model.resetGame()
    }
    func chooseCard(_ card: MemoryGame<String>.Card){
        objectWillChange.send()
        model.chooseCard(card)
    }
}
