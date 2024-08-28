//
//  CoreDataManager.swift
//  Romag
//
//  Created by Maksim on 22.08.2024.
//

import CoreData
import UIKit
import Foundation

class CoreDataManager {
    static let shared = CoreDataManager()
    var dataContext: NSManagedObjectContext?
    
    private init() {
        dataContext = (UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate).persistentContainer.viewContext
    }
}

extension CoreDataManager: ToDoDataManager {
    func removeObj(obj: ToDoData) {
        guard let context = dataContext else { 
            debugPrint("Error while deleting object. Context is not initialized")
            return
        }
        
        do {
            context.delete(obj)
            try context.save()
            debugPrint("Object removed from DATA")
        } catch {
            debugPrint("Error while savig afte remove")
        }
    }
    
    func getNewEmptyObject() -> ToDoData {
        guard let context = dataContext else { return ToDoData() }
        
        let new = ToDoData(context: context)
        return new
    }
    
    func getData() -> [ToDoData] {
        
        guard let context = dataContext else { return [] }
        
        let fetchRequest = ToDoData.fetchRequest()
        
        do {
            let toDoData = try context.fetch(fetchRequest)
            return toDoData
        } catch {
            print("Failed to fetch ToDo \(error)")
            return []
        }
        
    }
    
    func saveData() {
        guard let context = dataContext else { return }
        
        do {
            try context.save()
        } catch {
            debugPrint("Wrror while saving data")
        }
    }
}
