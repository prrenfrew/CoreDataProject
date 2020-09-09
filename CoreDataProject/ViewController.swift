//
//  ViewController.swift
//  CoreDataProject
//
//  Created by MAC on 9/9/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//
/*
CoreData is made up of 4 main components:
1. Persistent store
2. managed Object Context(MOC)
3. Persistent store coordinator
4. Managed Objects
*/

import UIKit
import CoreData

class ViewController: UIViewController {
  
  /*
   CoreData retrieval is a very lazy process. It only gets the information that is required
   Once we need that information, only then does it go and get it
   */

  override func viewDidLoad() {
    super.viewDidLoad()
    let allPeople = CoreDataManager.shared.retrievePeople()
    print(allPeople)
    for person in allPeople {
      print(person.name)
    }
    print(allPeople)
//    let newPerson = CoreDataManager.shared.createPerson(with: "Paul")
//    print(newPerson)
//    CoreDataManager.shared.saveContext()
//    print(CoreDataManager.shared.retrievePeople())
  }
}

