//
//  UserDetails.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 13/09/23.
//

import SwiftUI

struct UserDetailsView: View {
    //var user: User
    var user: CachedUser

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .top) {
                    Text(user.wrappedName)
                        .font(.title2.weight(.bold))
                    Spacer()
                    Circle()
                        .fill(user.isActive ? .green : .red)
                        .frame(width: 10, height: 10)
                }


                Text("Age: \(user.age)")
                Text("Email: \(user.wrappedEmail)")
                Text("Company: \(user.wrappedCompany)")

                Text("About \(user.wrappedName): \(user.wrappedAbout)")
                    .padding(.vertical)

                Text("Friends:")
                ForEach(user.friendsArray) {friend in
                    Text(friend.wrappedName)
                }
            }
            .navigationTitle("User Details")
            .padding()
        }
    }
}

//struct UserDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailsView(user: User(id: "id", isActive: true, name: "name", age: 30, company: "Company name", email: "mail@example.com", address: "Address", about: "Brief description", registered: nil, tags: [], friends: []))
//    }
//}
