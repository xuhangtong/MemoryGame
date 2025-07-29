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
            CardView(isFaceUp: false)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.green)
        .imageScale(.small)
        .padding()//a function, view modifier
    }//computed properties, code run over and over
}

struct CardView:View{
    var isFaceUp:Bool = true //every var
    
    var body:some View {
        ZStack(content: { //embedded function
            if isFaceUp{
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 50)
                    .strokeBorder(lineWidth: 5)
                Text("⚽️").font(.largeTitle)
            }else {
                RoundedRectangle(cornerRadius: 50)
            }
        })
    }
}

#Preview {
    ContentView()
}
