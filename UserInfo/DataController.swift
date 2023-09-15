//
//  DataController.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 14/09/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "UserInfo")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            //self.container.viewContext.mergePolicy = NSManagedObject.mergeByPropertyObjectTrump
        }
    }
}
