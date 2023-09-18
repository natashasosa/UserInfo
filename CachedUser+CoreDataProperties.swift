//
//  CachedUser+CoreDataProperties.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 18/09/23.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?

    public var wrappedName: String {
        name ?? "Unknown Friend"
    }

    public var wrappedId: UUID {
        id ?? UUID()
    }

    public var wrappedCompany: String {
        company ?? "Unknown Company"
    }

    public var wrappedEmail: String {
        email ?? "Unknown email"
    }

    public var wrappedAddress: String {
        address ?? "Unknown address"
    }

    public var wrappedAbout: String {
        about ?? "No description"
    }

    public var wrappedDate: Date {
        registered ?? Date()
    }

    public var wrappedTags: String {
        tags ?? ""
    }

    var friendsArray: [CachedFriends] {
        let friendList = friends as? Set<CachedFriends> ?? []

        return Array(friendList.sorted {$0.wrappedName < $1.wrappedName})
    }
}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriends)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriends)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
