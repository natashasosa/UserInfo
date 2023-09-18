//
//  ContentView.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 06/09/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var ascendingSort = true
    @State private var users = [User]()

    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        UserDetailsView(user: user)
                    } label: {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(user.name)
                                .font(.headline)

                            HStack {
                                Text(user.email)
                                Spacer()
                                Circle()
                                    .fill(user.isActive ? .green : .red)
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(.vertical, 10)
                    }
                }
            }
            .task {
                await loadData()
            }
            .navigationTitle("Users")
        }
    }

    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601 // Set the date decoding strategy
            
            guard let decodedUsers = try? decoder.decode([User].self, from: data) else {
                print("Can't decode JSON Data!")
                return
            }
            print("JSON data decoded successfully")

            await MainActor.run {
                updateCache(with: decodedUsers)
            }

        } catch {
            print("Error: \(error)")
        }
    }

    func updateCache(with updateData: [User]) {
        do {
            print("Updating cached User data")

            for user in updateData {
                let cachedUser = CachedUser(context: moc)

                cachedUser.id = user.id
                cachedUser.isActive = user.isActive
                cachedUser.name = user.name
                cachedUser.age = Int16(user.age)
                cachedUser.company = user.company
                cachedUser.email = user.email
                cachedUser.address = user.address
                cachedUser.about = user.about
                cachedUser.registered = user.registered
                cachedUser.tags = user.tags.joined(separator: ",")

                for friend in user.friends {
                    let cachedFriend = CachedFriends(context: moc)

                    cachedFriend.id = friend.id
                    cachedFriend.name = friend.name
                    cachedUser.addToFriends(cachedFriend)
                }
            }

        } catch {
            print("Failed to update cached User data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
