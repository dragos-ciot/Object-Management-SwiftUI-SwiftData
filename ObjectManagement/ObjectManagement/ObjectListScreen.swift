//
//  ContentView.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI

struct ObjectListScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "tray.full.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("ObjectListScreen")
                .padding()
        }
        .padding()
    }
}

#Preview {
    ObjectListScreen()
}
