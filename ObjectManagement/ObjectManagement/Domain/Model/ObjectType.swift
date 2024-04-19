//
//  ObjectType.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import SwiftUI

enum ObjectType: String, Codable, CaseIterable {
    case desk
    case computer
    case keyboard
    case server
    case staff
    case chair
    case monitor
    case printer
    case smartphone
    case tablet
    
    var icon: String {
        switch self {
        case .desk:
            return "deskview.fill"
        case .computer:
            return "desktopcomputer"
        case .keyboard:
            return "keyboard"
        case .server:
            return "network"
        case .staff:
            return "person"
        case .chair:
            return "chair"
        case .monitor:
            return "display"
        case .printer:
            return "printer"
        case .smartphone:
            return "iphone"
        case .tablet:
            return "ipad"
        }
    }
}
