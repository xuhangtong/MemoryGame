//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Xuhang Tong on 2025-07-27.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
