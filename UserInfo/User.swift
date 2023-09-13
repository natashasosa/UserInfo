//
//  User.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 13/09/23.
//

import Foundation

struct User: Codable, Identifiable {

    struct Friends: Codable{
        let id: String
        let name: String
    }

    let id: String
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

//    private enum CodingKeys: String, CodingKey {
//        case id, isActive, name, age, company, email, address, about, registered, tags, friends
//    }

//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = try container.decode(String.self, forKey: .id)
//        isActive = try container.decode(Bool.self, forKey: .isActive)
//        name = try container.decode(String.self, forKey: .name)
//        age = try container.decode(Int.self, forKey: .age)
//        company = try container.decode(String.self, forKey: .company)
//        email = try container.decode(String.self, forKey: .email)
//        address = try container.decode(String.self, forKey: .address)
//        about = try container.decode(String.self, forKey: .about)
//        tags = try container.decode([String].self, forKey: .tags)
//        friends = try container.decode([Friends].self, forKey: .friends)
//
//        let dateString = try container.decode(String.self, forKey: .registered)
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        registered = formatter.date(from: dateString) ?? Date()
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(id, forKey: .id)
//        try container.encode(isActive, forKey: .isActive)
//        try container.encode(name, forKey: .name)
//        try container.encode(age, forKey: .age)
//        try container.encode(company, forKey: .company)
//        try container.encode(email, forKey: .email)
//        try container.encode(address, forKey: .address)
//        try container.encode(about, forKey: .about)
//        try container.encode(tags, forKey: .tags)
//        try container.encode(friends, forKey: .friends)
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        let dateString = formatter.string(from: registered)
//        try container.encode(dateString, forKey: .registered)
//    }

    var formattedRegisteredDate: String {
        registered?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
