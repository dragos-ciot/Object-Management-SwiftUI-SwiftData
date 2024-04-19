//
//  ObjectManager.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI
import SwiftData

@Observable
class ObjectManager {
    func addObject(with modelContext: ModelContext, objectConfig: NewObjectConfig) {
        let objectEntity = ObjectEntity(
            name: objectConfig.objectName,
            type: objectConfig.objectType,
            relations: [],
            desc: objectConfig.objectDescription,
            createdAt: Date.now
        )
        
        modelContext.insert(objectEntity)
    }
    
    func deleteObject(with modelContext: ModelContext, object: ObjectEntity) {
        modelContext.delete(object)
    }
    
    func deleteObjects(with modelContext: ModelContext, at offsets: IndexSet, forObjects objectsList: [ObjectEntity]) {
        for offset in offsets {
            let object = objectsList[offset]
            modelContext.delete(object)
        }
    }
    
}
