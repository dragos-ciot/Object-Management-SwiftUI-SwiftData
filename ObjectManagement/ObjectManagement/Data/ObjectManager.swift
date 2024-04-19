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
    
}
