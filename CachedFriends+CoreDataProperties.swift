//
//  CachedFriends+CoreDataProperties.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 15/09/23.
//
//

import Foundation
import CoreData


extension CachedFriends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriends> {
        return NSFetchRequest<CachedFriends>(entityName: "CachedFriends")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: CachedUser?

    public var wrappedName: String {
        name ?? "Unknown Friend"
    }

    public var wrappedId: String {
        id ?? "Unknown Id"
    }

}

extension CachedFriends : Identifiable {

}
