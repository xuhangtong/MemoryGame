//
//  ContentView.swift
//  MemoryGame
//
//  Created by Xuhang Tong on 2025-07-27.
//
// make a small changes

import SwiftUI

struct ContentView: View { //this struct behaves like a View
    
    let emojis = ["⚽️", "🏀",  "🎱", "🏓"]
//still a variable
    var body: some View {//some view, the type of variable can be any struct, as long as the struct return a some view behaves like view
        HStack{
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content:emojis[index])
            }
        }
        .foregroundStyle(.green)
        .padding()//a function, view modifier
    }//computed properties, code run over and over
}

struct CardView:View{
    let content:String
    @State var isFaceUp = true //every var
    
    var body:some View {
        ZStack { //embedded function
            let base = RoundedRectangle(cornerRadius: 50)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
