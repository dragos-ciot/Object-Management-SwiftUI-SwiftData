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
    @Relationship(deleteRule: .nullify, inverse: \ObjectEntity.inverseRef) var relations: [ObjectEntity]
    var desc: String
    var createdAt: Date
    @Relationship var inverseRef: [ObjectEntity]?
    
    init(objectID: String = UUID().uuidString, name: String, type: ObjectType, relations: [ObjectEntity],  desc: String, createdAt: Date) {
        self.objectID = objectID
        self.name = name
        self.type = type
        self.relations = relations
        self.desc = desc
        self.createdAt = createdAt
    }
    
    // MARK: - Codable conformance
    private enum CodingKeys: String, CodingKey {
        case objectID
        case name
        case type
        case relations
        case desc
        case createdAt
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.objectID = try container.decode(String.self, forKey: .objectID)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(ObjectType.self, forKey: .type)
        self.relations = try container.decode([ObjectEntity].self, forKey: .relations)
        self.desc = try container.decode(String.self, forKey: .desc)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(objectID, forKey: .objectID)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(relations, forKey: .relations)
        try container.encode(desc, forKey: .desc)
        try container.encode(createdAt, forKey: .createdAt)
    }
}

//MARK: Mock data for previews
extension ObjectEntity {
    static let previewContainer: ModelContainer = {
        do {
            let container = try ModelContainer(
                for: ObjectEntity.self,
                configurations: ModelConfiguration(isStoredInMemoryOnly: true)
            )
            
            Task { @MainActor in
                let context = container.mainContext
                
                // Create some mock objects
                let officeDesk = ObjectEntity(name: "Office Desk", type: .desk, relations: [], desc: "A large wooden desk for office use", createdAt: Date())
                let desktopComputer = ObjectEntity(name: "Desktop Computer", type: .computer, relations: [], desc: "High-performance desktop computer", createdAt: Date())
                let mechanicalKeyboard = ObjectEntity(name: "Mechanical Keyboard", type: .keyboard, relations: [], desc: "Mechanical gaming keyboard", createdAt: Date())
                let serverRack = ObjectEntity(name: "Server Rack", type: .server, relations: [], desc: "Enterprise-grade server rack", createdAt: Date())
                let johnDoe = ObjectEntity(name: "John Doe", type: .staff, relations: [], desc: "Employee working at the desk", createdAt: Date())
                let ergonomicChair = ObjectEntity(name: "Ergonomic Chair", type: .chair, relations: [], desc: "Ergonomic office chair for comfortable seating", createdAt: Date())
                let ultrawideMonitor = ObjectEntity(name: "Ultrawide Monitor", type: .monitor, relations: [], desc: "34-inch ultrawide monitor for productivity", createdAt: Date())
                let colorPrinter = ObjectEntity(name: "Color Printer", type: .printer, relations: [], desc: "Color laser printer for printing documents", createdAt: Date())
                let latestSmartphone = ObjectEntity(name: "Latest Smartphone", type: .smartphone, relations: [], desc: "The latest smartphone model with advanced features", createdAt: Date())
                let pixelTablet = ObjectEntity(name: "Pixel Tablet", type: .tablet, relations: [], desc: "10-inch tablet device for portability", createdAt: Date())
                let iPadTablet = ObjectEntity(name: "iPad Pro", type: .tablet, relations: [], desc: "13-inch tablet device for portability", createdAt: Date())
                
                let objects: [ObjectEntity] = [
                    officeDesk,
                    desktopComputer,
                    mechanicalKeyboard,
                    serverRack,
                    johnDoe,
                    ergonomicChair,
                    ultrawideMonitor,
                    colorPrinter,
                    latestSmartphone,
                    pixelTablet,
                    iPadTablet
                ]
                
                // Add mock objects to the container
                objects.forEach { context.insert($0) }
                
                johnDoe.relations.append(contentsOf: [desktopComputer, mechanicalKeyboard, pixelTablet])
                officeDesk.relations.append(contentsOf: [desktopComputer, mechanicalKeyboard, johnDoe, ergonomicChair])
                desktopComputer.relations.append(contentsOf: [ultrawideMonitor, colorPrinter, latestSmartphone, iPadTablet])
            }
            
            return container
        } catch {
            fatalError("Failed to create container with error: \(error.localizedDescription)")
        }
    }()
}
