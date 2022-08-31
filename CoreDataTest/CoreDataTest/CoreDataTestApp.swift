//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Alan Trieu on 31/8/2022.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
