//
//  ContentView.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI
import SwiftData

struct ObjectListScreen: View {
    @Environment(\.modelContext)
    private var modelContext
    
    @Query
    private var objectsList: [ObjectEntity]
    
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
            .onDelete(perform: deleteObjects)
        }
        .searchable(text: .constant(""), placement: .toolbar, prompt: Text("Enter your search criteria"))
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
    
    func deleteObjects(at offsets: IndexSet) {
        for offset in offsets {
            let object = objectsList[offset]
            modelContext.delete(object)
        }
    }
}

#Preview {
    NavigationStack {
        ObjectListScreen()
            .modelContainer(ObjectEntity.previewContainer)
    }
}
