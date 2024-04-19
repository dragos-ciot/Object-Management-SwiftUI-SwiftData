//
//  ObjectListRowView.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI

struct ObjectListRowView: View {
    @Bindable
    var objectItem: ObjectEntity
    
    var body: some View {
        VStack (alignment: .leading, spacing: 6) {
                Text(objectItem.name)
                    .font(.headline)
            Text(objectItem.desc)
                .lineLimit(2)
            HStack {
                HStack {
                    if objectItem.relations.isEmpty {
                        Text("No items")
                        Image(systemName: "xmark.bin")
                    } else {
                        ForEach(objectItem.relations) { containingObject in
                            Image(systemName: containingObject.type.icon)
                        }
                    }
                }
                Spacer()
                Text(objectItem.createdAt, style: .date)
            }
        }
        .padding()
        
    }
}

#Preview { @MainActor in
    ModelPreview(modelContainer: ObjectEntity.previewContainer) { objectModel in
        ObjectListRowView(objectItem: objectModel)
    }
}
