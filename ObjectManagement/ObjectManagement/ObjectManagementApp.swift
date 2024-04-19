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
    var body: some Scene {
        WindowGroup {
            ObjectListScreen()
        }
        .modelContainer(for: ObjectEntity.self)
    }
}
