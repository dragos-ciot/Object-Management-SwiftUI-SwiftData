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
                        VStack (alignment: .leading, spacing: 6){
                                Text(object.name)
                                    .font(.headline)
                            Text(object.desc)
                            HStack {
                                HStack {
                                    ForEach(object.relations) { containingObject in
                                        Image(systemName: containingObject.type.icon)
                                    }
                                }
                                Spacer()
                                Text(object.createdAt, style: .date)
                            }
                            .tint(.accentColor)
                        }
                    }
                } header: {
                    HStack {
                        Text(objectType.rawValue.capitalized)
                        Image(systemName: objectType.icon)
                    }
                } footer: {}
            }
        }
        .navigationTitle("Object List")
    }
}

#Preview {
    NavigationStack {
        ObjectListScreen()
            .modelContainer(ObjectEntity.previewContainer)
    }
}
