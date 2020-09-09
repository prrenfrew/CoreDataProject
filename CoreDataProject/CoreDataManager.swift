//
//  CoreDataManager.swift
//  CoreDataProject
//
//  Created by MAC on 9/9/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataManager {
  
  static let shared = CoreDataManager()
  
  private init() { }
  
  /*
   Lazy - lazy properties are not created initially. They are created when they are needed. Specifically when they are accessed for the first time.
   This is useful when initialization of an object takes time
   */
  lazy var container: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "MyContainer")
    container.loadPersistentStores { (description, error) in
      print(description)
      print(error)
    }
    return container
  }()
  
  var context: NSManagedObjectContext {
    return self.container.viewContext
  }
  
  func saveContext() {
    try? self.context.save()
  }
  
  func createPerson(with name: String) -> Person? {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: self.context) else {
      print("Failed to create entity description")
      return nil
    }
    let newPerson = Person(entity: entityDescription, insertInto: self.context)
    newPerson.name = name
    return newPerson
  }
  
  func retrievePeople() -> [Person] {
    let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
    let retrievedPeople = try? context.fetch(fetchRequest)
    return retrievedPeople ?? []
  }
}
