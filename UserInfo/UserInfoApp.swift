//
//  UserInfoApp.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 06/09/23.
//

import SwiftUI

@main
struct UserInfoApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
