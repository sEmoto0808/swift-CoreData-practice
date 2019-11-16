//
//  CoreDataController.swift
//  swf-CoreData-practice
//
//  Created by 江本匠 on 2019/11/17.
//  Copyright © 2019 S.Emoto. All rights reserved.
//

import CoreData

class CoreDataController: NSObject {

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "swf_CoreData_practice")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Add to Core Data
    
    func add(countryName: String?) -> Bool {
        guard let countryName = countryName else {
            return false
        }
        let context = persistentContainer.viewContext
        let coffeeBean = CoffeeBean(context: context)
        coffeeBean.countryName = countryName
        
        return true
    }

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext  // NSManagedModelObjectContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Fetch from Core Data
    
    func fetch(entityName: String) -> [CoffeeBean] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let managedContext = persistentContainer.viewContext
        do {
            return try managedContext.fetch(request) as! [CoffeeBean]
        } catch {
            return []
        }
    }
}
