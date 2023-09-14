//
//  Friends+CoreDataProperties.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 14/09/23.
//
//

import Foundation
import CoreData


extension Friends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friends> {
        return NSFetchRequest<Friends>(entityName: "Friends")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var origin: User?

    public var wrappedName: String {
        name ?? "Unknown Friend"
    }

    public var wrappedId: String {
        id ?? "Unknown Id"
    }
}

extension Friends : Identifiable {

}
