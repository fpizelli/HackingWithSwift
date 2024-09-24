//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Felipe Pizelli on 24/09/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
