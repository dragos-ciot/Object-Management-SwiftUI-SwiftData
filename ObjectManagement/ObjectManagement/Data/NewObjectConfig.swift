//
//  NewObjectConfig.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import Foundation
import SwiftUI

@Observable
class NewObjectConfig {
    var objectType: ObjectType = .chair
    
    var objectName: String = ""
    
    var objectDescription: String = ""
}
