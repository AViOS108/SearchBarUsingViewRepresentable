//
//  SearchBarUsingViewRepresentableApp.swift
//  SearchBarUsingViewRepresentable
//
//  Created by Anurag Bhakuni on 06/08/21.
//

import SwiftUI

@main
struct SearchBarUsingViewRepresentableApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
