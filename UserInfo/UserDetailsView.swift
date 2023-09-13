//
//  UserDetails.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 13/09/23.
//

import SwiftUI

struct UserDetailsView: View {
    var user: User
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .top) {
                    Text(user.name)
                        .font(.title2.weight(.bold))
                    Spacer()
                    Circle()
                        .fill(user.isActive ? .green : .red)
                        .frame(width: 10, height: 10)
                }


                Text("Age: \(user.age)")
                Text("Email: \(user.email)")
                Text("Company: \(user.company)")

                Text("About \(user.name): \(user.about)")
                    .padding(.vertical)

                Text("Friends:")
                ForEach(user.friends) {friend in
                    Text(friend.name)
                }
            }
            .navigationTitle("User Details")
            .padding()
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: User(id: "id", isActive: true, name: "name", age: 30, company: "Company name", email: "mail@example.com", address: "Address", about: "Brief description", registered: nil, tags: [], friends: []))
    }
}
