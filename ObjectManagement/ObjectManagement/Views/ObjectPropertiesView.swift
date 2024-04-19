//
//  ObjectPropertiesView.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI

struct ObjectPropertiesView: View {
    @Binding
    var objectType: ObjectType
    
    @Binding
    var objectName: String
    
    @Binding
    var objectDescription: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Picker("Type", selection: $objectType) {
                ForEach(ObjectType.allCases, id: \.self) { type in
                    HStack {
                        Text(type.rawValue.capitalized)
                        Image(systemName: type.icon)
                    }
                }
            }
            .font(.headline)
            .pickerStyle(.menu)
        }
        
        VStack (alignment: .leading) {
            Text("Object Name")
                .font(.headline)
            TextField("Enter the object name here", text: $objectName)
                .textFieldStyle(.roundedBorder)
        }
        
        VStack (alignment: .leading) {
            Text("Description")
                .font(.headline)
            TextField("Enter the object name here", text: $objectDescription, axis: .vertical)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    ObjectPropertiesView(
        objectType: .constant(.chair),
        objectName: .constant(""),
        objectDescription: .constant("")
    )
}
