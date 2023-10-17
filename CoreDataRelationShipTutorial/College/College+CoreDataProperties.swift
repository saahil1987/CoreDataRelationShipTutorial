//
//  College+CoreDataProperties.swift
//  CoreDataRelationShipTutorial
//
//  Created by Saahil Kaushal on 17/10/23.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var university: String?

}

extension College : Identifiable {

}
