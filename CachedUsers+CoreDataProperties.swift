//
//  CachedUsers+CoreDataProperties.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 15/09/23.
//
//

import Foundation
import CoreData


extension CachedUsers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUsers> {
        return NSFetchRequest<CachedUsers>(entityName: "CachedUsers")
    }

    @NSManaged public var user: NSSet?

    public var userArray: [CachedUser] {
        let set = user as? Set<CachedUser> ?? []

        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for user
extension CachedUsers {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: CachedUser)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: CachedUser)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension CachedUsers : Identifiable {

}
