//
//  AddRelationsSheet.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 20.04.2024.
//

import SwiftUI

struct AddRelationsSheet: View {
    @Environment(ObjectManager.self)
    private var objectManager
    
    @Environment(\.modelContext)
    private var modelContext
    
    @Environment(\.dismiss)
    private var dismiss
    
    @Bindable
    var objectItem: ObjectEntity
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
                        objectManager.addRelationToObject(with: modelContext, objectConfig: newObjectConfig, object: objectItem)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview { @MainActor in
    NavigationStack {
        ModelPreview(modelContainer: ObjectEntity.previewContainer) { objectModel in
            AddRelationsSheet(objectItem: objectModel)
        }
    }
    .environment(ObjectManager())
}
