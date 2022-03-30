//
//  AsyncApp.swift
//  Async
//
//  Created by Niclas Jeppsson on 29/03/2022.
//

import SwiftUI

@main
struct AsyncApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
