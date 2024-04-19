//
//  AddObjectView.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI
import SwiftData

struct AddObjectSheet: View {
    @Environment(\.modelContext)
    private var modelContext
    
    @Environment(ObjectManager.self)
    private var objectManager
    
    @Environment(\.dismiss)
    private var dismiss
    
    @State
    private var newObjectConfig = NewObjectConfig()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add object") {
                    ObjectPropertiesView(
                        objectType: $newObjectConfig.objectType,
                        objectName: $newObjectConfig.objectName,
                        objectDescription: $newObjectConfig.objectDescription
                    )
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    AddButton(title: "Add") {
                        objectManager.addObject(with: modelContext, objectConfig: newObjectConfig)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddObjectSheet()
            .environment(ObjectManager())
    }
}
