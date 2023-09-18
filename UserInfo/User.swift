//
//  User.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 13/09/23.
//

import Foundation

struct User: Codable, Identifiable {

    struct Friends: Codable, Identifiable {
        let id: UUID
        let name: String
    }

    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date?
    let tags: [String]
    var friends: [Friends]

    var formattedRegisteredDate: String {
        registered?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
