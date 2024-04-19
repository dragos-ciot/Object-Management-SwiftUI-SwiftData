//
//  ObjectEntity.swift
//  ObjectManagement
//
//  Created by Dragos-Georgian Ciot on 19.04.2024.
//

import Foundation
import SwiftData

@Model
class ObjectEntity: Hashable, Equatable, Codable {
    @Attribute(.unique) var objectID: String
    var name: String
    var type: ObjectType
    
    init(objectID: String = UUID().uuidString, name: String, type: ObjectType) {
        self.objectID = objectID
        self.name = name
        self.type = type
    }
    
    // MARK: - Codable conformance
    private enum CodingKeys: String, CodingKey {
        case objectID
        case name
        case type
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.objectID = try container.decode(String.self, forKey: .objectID)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(ObjectType.self, forKey: .type)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(objectID, forKey: .objectID)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
    }
}
