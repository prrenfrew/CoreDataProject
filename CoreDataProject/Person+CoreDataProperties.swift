//
//  Person+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by MAC on 9/9/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?

}
