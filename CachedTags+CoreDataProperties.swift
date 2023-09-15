//
//  CachedTags+CoreDataProperties.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 15/09/23.
//
//

import Foundation
import CoreData


extension CachedTags {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedTags> {
        return NSFetchRequest<CachedTags>(entityName: "CachedTags")
    }

    @NSManaged public var tag: String?
    @NSManaged public var origin: CachedUser?

    public var wrappedTag: String {
        tag ?? "Unknown Tag"
    }
}

extension CachedTags : Identifiable {

}
