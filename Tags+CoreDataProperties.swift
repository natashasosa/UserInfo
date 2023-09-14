//
//  Tags+CoreDataProperties.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 14/09/23.
//
//

import Foundation
import CoreData


extension Tags {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tags> {
        return NSFetchRequest<Tags>(entityName: "Tags")
    }

    @NSManaged public var tag: String?
    @NSManaged public var origin: User?

    public var wrappedTag: String {
        tag ?? "Unknown Tag"
    }


}

extension Tags : Identifiable {

}
