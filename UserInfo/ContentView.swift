//
//  ContentView.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 06/09/23.
//

import SwiftUI

struct ContentView: View {
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
            
            if let decodedUsers = try? decoder.decode([User].self, from: data) {
                users = decodedUsers
            }

        } catch {
            print("Error: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
