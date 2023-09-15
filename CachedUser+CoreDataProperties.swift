//
//  CachedUser+CoreDataProperties.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 15/09/23.
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
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?
    @NSManaged public var tags: NSSet?
    @NSManaged public var userorigin: CachedUsers?

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

    public var friendsArray: [CachedFriends] {
        let set = friends as? Set<CachedFriends> ?? []

        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

    //todo:
    //need to check all the relashionships
    //need to check environment and all the core data steps again
    //need to figure out how to send the json data to coredata

    public var tagsArray: [String] { // stopped here
        let set = tags as? Set<CachedTags> ?? []
        var stringArray: [String] = []

        for tag in set {
            if let wrappedTag = tag.tag {
                stringArray.append(wrappedTag)
            }
        }

        return stringArray.sorted()
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

// MARK: Generated accessors for tags
extension CachedUser {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: CachedTags)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: CachedTags)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
