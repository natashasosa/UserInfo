//
//  CachedFriends+CoreDataProperties.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 18/09/23.
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

}

extension CachedFriends : Identifiable {

}
