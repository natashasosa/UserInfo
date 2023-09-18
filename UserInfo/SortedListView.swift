//
//  SortedListView.swift
//  UserInfo
//
//  Created by Natasha Rebelo on 18/09/23.
//

import CoreData
import SwiftUI

struct SortedListView<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) {item in
            self.content(item)
        }
    }

    init(descriptor: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: descriptor)

        self.content = content
    }
}

//struct SortedListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SortedListView()
//    }
//}
