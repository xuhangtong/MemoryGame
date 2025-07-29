//
//  ContentView.swift
//  MemoryGame
//
//  Created by Xuhang Tong on 2025-07-27.
//
// make a small changes

import SwiftUI

struct ContentView: View { //this struct behaves like a View
    
    let emojis = ["⚽️", "🏀",  "🎱", "🏓", "🏊‍♀️", "🛹", "⛳️", "🎣", "🤸", "🥌", "🏆", "🚴"]
//still a variable
    @State var cardCount:Int = 4
    var body: some View {//some view, the type of variable can be any struct, as long as the struct return a some view behaves like view
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()//a function, view modifier
    }//computed properties, code run over and over
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content:emojis[index]).aspectRatio(2/3, contentMode:.fit)
            }
        }
        .foregroundStyle(.green)
    }
    
    var cardCountAdjusters:some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset:Int, symbol:String) -> some View{
        Button(action: {
                cardCount += offset
        }, label: {
            Image (systemName: symbol)
        })
        .disabled( cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover:some View{
        cardCountAdjuster(by: -1, symbol: "pencil.tip.crop.circle.badge.minus")
    }
    
    var cardAdder:some View{
        cardCountAdjuster(by: +1, symbol: "pencil.tip.crop.circle.badge.plus")
    }
}

struct CardView:View{
    let content:String
    @State var isFaceUp = true //every var
    
    var body:some View {
        ZStack { //embedded function
            let base = RoundedRectangle(cornerRadius: 50)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
