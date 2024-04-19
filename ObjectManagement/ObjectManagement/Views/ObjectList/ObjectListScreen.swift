//
//  ContentView.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI
import SwiftData

struct ObjectListScreen: View {
    @Query
    private var objectsList: [ObjectEntity]
    
    var body: some View {
        List {
            ForEach(ObjectType.allCases, id: \.self) { objectType in
                Section {
                    ForEach(objectsList.filter { $0.type == objectType }) { object in
                        NavigationLink(destination: {
                            EmptyView()
                        }, label: {
                            ObjectListRowView(objectItem: object)
                        })
                        .listRowStyle()
                    }
                } header: {
                    HStack {
                        Text(objectType.rawValue.capitalized)
                        Image(systemName: objectType.icon)
                    }
                } footer: {}
            }
        }
        .listStyle(.plain)
        .navigationTitle("Object List")
    }
}

#Preview {
    NavigationStack {
        ObjectListScreen()
            .modelContainer(ObjectEntity.previewContainer)
    }
}
