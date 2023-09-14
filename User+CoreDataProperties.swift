//
//  User+CoreDataProperties.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 14/09/23.
//
//

import Foundation
import CoreData
import SwiftUI


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: NSSet?
    @NSManaged public var friends: NSSet?
    @NSManaged public var userorigin: Users?

    public var wrappedName: String {
        name ?? "Unknown Friend"
    }

    public var wrappedId: String {
        id ?? "Unknown Id"
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

    public var friendsArray: [Friends] {
        let set = friends as? Set<Friends> ?? []

        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

    public var tagsArray: [String] { // stopped here
        let set = tags as? Set<Tags> ?? []
        var stringArray: [String] = []

        for tag in set {
            if let wrappedTag = tag.tag {
                stringArray.append(wrappedTag)
            }
        }

        return stringArray.sorted()
    }

}

// MARK: Generated accessors for tags
extension User {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tags)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tags)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friends)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friends)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension User : Identifiable {

}
