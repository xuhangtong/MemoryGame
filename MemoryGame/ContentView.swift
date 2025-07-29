//
//  ContentView.swift
//  MemoryGame
//
//  Created by Xuhang Tong on 2025-07-27.
//
// make a small changes

import SwiftUI

struct ContentView: View { //this struct behaves like a View
    //still a variable
    var body: some View {//some view, the type of variable can be any struct, as long as the struct return a some view behaves like view
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundStyle(.green)
        .padding()//a function, view modifier
    }//computed properties, code run over and over
}

struct CardView:View{
    @State var isFaceUp = true //every var
    
    var body:some View {
        ZStack { //embedded function
            let base = RoundedRectangle(cornerRadius: 50)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text("⚽️").font(.largeTitle)
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
