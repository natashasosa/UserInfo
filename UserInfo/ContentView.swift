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
        List {
            ForEach(users) { user in
                VStack(alignment: .leading) {
                    Text("name")
                    Text(user.name)
                        .font(.headline)
                    HStack {
                        Text("mail")
                        Text(user.email)
                        Spacer()
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 3, height: 3)
                    }

                }
            }
        }
        .task {
            await loadData()
        }
    }

    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedUsers = try? JSONDecoder().decode(Users.self, from: data) {
                users = decodedUsers.users
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
