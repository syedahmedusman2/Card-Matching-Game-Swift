//
//  First_Swift_AppApp.swift
//  First Swift App
//
//  Created by User on 01/01/2024.
//

import SwiftUI

@main
struct First_Swift_AppApp: App {
    let game: EmojiMemoryGame = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
