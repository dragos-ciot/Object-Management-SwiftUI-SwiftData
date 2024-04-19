//
//  ObjectManagementApp.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI
import SwiftData

@main
struct ObjectManagementApp: App {
    
    @State
    private var objectManager = ObjectManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ObjectListScreen()
            }
            .environment(objectManager)
        }
        .modelContainer(for: ObjectEntity.self)
    }
}
