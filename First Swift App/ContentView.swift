//
//  ContentView.swift
//  First Swift App
//
//  Created by User on 01/01/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var emojiList = ["✈️","🏀", "🎃",  "🎩", "👑","🐨","🍎","🎲","🚗","☎️","🦆","🐝", "🍫","🔫"]
    
    @State var cardCount = 4
    var body: some View {
        
        HStack{
            Text("Memorize").font(.title)
            Spacer()
            Button(action: {
                viewModel.resetGame()
            }, label: {
                Text("Reset")
            })
        }.padding(.horizontal)
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100 ))], content: {
                ForEach(viewModel.model.cards) {
                    card in CardView(cardData: card).aspectRatio(2/3,contentMode: .fill).onTapGesture {
              
                        viewModel.chooseCard(card)
                    }
                }
            })
        }}
        
}


#Preview {
    ContentView(viewModel: EmojiMemoryGame())
    
        
        
        
}

struct CardView: View{
    let cardData: MemoryGame<String>.Card
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if cardData.isFaceUp==true{
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(cardData.cardContenct)
                    .font(.largeTitle)
                    .padding(.horizontal)
            }else if cardData.isMatched{
                shape.opacity(0)
            }
            
            else{
                shape.fill().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                shape.stroke(lineWidth: 3).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }.padding(.horizontal, 5)
    }
}
