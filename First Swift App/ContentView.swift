//
//  ContentView.swift
//  First Swift App
//
//  Created by User on 01/01/2024.
//

import SwiftUI

struct ContentView: View {
    var emojiList = ["✈️","🏀", "🎃",  "🎩", "👑","🐨","🍎","🎲","🚗","☎️","🦆",
                     "✈️","🏀", "🎃",  "🎩", "👑","🐨","🍎","🎲","🚗","☎️","🦆",
                     "✈️","🏀", "🎃",  "🎩", "👑","🐨","🍎","🎲","🚗","☎️","🦆",
                     "✈️","🏀", "🎃",  "🎩", "👑","🐨","🍎","🎲","🚗","☎️","🦆",
                     "✈️","🏀", "🎃",  "🎩", "👑","🐨","🍎","🎲","🚗","☎️","🦆"]
    
    @State var cardCount = 4
    var body: some View {
        Text("Memorize")
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100 ))], content: {
                ForEach(emojiList[0..<cardCount], id:\.self) {
                    emoji in CardView(content: emoji).aspectRatio(2/3,contentMode: .fill)
                }
            })
        }
        Spacer()
        HStack{
            Button(action: {
                if(cardCount > 1){
                    cardCount = cardCount-1
                }
               
            }, label: {
                Text("Minus")
            })
            Spacer()
            Button(action: {
                print(emojiList.count)
                print(cardCount)
                if(cardCount < emojiList.count){
                    cardCount = cardCount+1
                }
                
            }, label: {
                Text("Add")
            })
        }.padding(.horizontal, 19.0)
        
//        HStack{
//           CardView()
//            CardView()
//            CardView()
//   
//        }
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
    
        
        
        
}

struct CardView: View{
    @State var isFaceUp: Bool = false
    var content: String
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(content)
                    .font(.largeTitle)
                    .padding(.horizontal)
            }else{
                shape.fill().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                shape.stroke(lineWidth: 3).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }.padding(.horizontal, 5)
    }
    
    
}

//ZStack {
//}.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).padding()
