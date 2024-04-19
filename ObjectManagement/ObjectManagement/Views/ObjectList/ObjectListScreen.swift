//
//  ContentView.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI
import SwiftData

struct ObjectListScreen: View {
    @Environment(ObjectManager.self)
    private var objectManager
    
    @Environment(\.modelContext)
    private var modelContext
    
    @Query
    private var objectsList: [ObjectEntity]
    
    @State
    private var searchText = ""
    
    @State
    private var shouldPresentAddObjectSheet = false
    
    var body: some View {
        List {
            ForEach(ObjectType.allCases, id: \.self) { objectType in
                Section {
                    ForEach(objectsList.filter { $0.type == objectType }) { object in
                        NavigationLink(destination: {
                            ObjectDetailView(objectItem: object)
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
            .onDelete { indexSet in
                objectManager.deleteObjects(
                    with: modelContext,
                    at: indexSet,
                    forObjects: objectsList
                )
            }
        }
        .searchable(text: $searchText, placement: .toolbar, prompt: Text("Enter your search criteria"))
        .listStyle(.plain)
        .sheet(isPresented: $shouldPresentAddObjectSheet) {
            AddObjectSheet()
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                AddButton(title: "Add object") {
                    shouldPresentAddObjectSheet.toggle()
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
        }
        .navigationTitle("Object List")
    }
}

#Preview {
    NavigationStack {
        ObjectListScreen()
            .environment(ObjectManager())
            .modelContainer(ObjectEntity.previewContainer)
    }
}
