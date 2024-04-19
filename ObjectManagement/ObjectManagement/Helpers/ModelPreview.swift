//
//  ModelPreview.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI
import SwiftData

struct ModelPreview<Model: PersistentModel, Content: View>: View {
    
    var modelContainer: ModelContainer
    var content: (Model) -> Content
    
    init(modelContainer: ModelContainer, @ViewBuilder content: @escaping (Model) -> Content) {
        self.modelContainer = modelContainer
        self.content = content
    }
    
    var body: some View {
        PreviewContentView(content: content)
            .modelContainer(modelContainer)
    }
    
    struct PreviewContentView: View {
        @Query private var models: [Model]
        var content: (Model) -> Content
        
        @State private var waitedToShowIssue = false
        
        var body: some View {
            if let model = models.first {
                content(model)
            } else {
                ContentUnavailableView("Could not load model for previews", systemImage: "xmark")
                    .opacity(waitedToShowIssue ? 1 : 0)
                    .task {
                        Task {
                            try await Task.sleep(for: .seconds(1))
                            waitedToShowIssue = true
                        }
                    }
            }
        }
    }
}
