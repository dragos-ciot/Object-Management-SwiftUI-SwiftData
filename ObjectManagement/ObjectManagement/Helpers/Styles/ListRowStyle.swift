//
//  ListRowStyle.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI

struct ListRowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 8)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.gray.opacity(0.1))
            }
    }
}

extension View {
    func listRowStyle() -> some View {
        modifier(ListRowStyle())
    }
}
