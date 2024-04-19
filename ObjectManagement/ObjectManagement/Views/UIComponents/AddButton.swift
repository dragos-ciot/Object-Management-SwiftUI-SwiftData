//
//  AddObjectButton.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI

struct AddButton: View {
    var title: String
    var action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                Image(systemName: "plus.circle.fill")
            }
        }
    }
}

#Preview {
    AddButton(title: "Add preview button", action: {})
}
