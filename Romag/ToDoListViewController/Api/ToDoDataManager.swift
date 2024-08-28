//
//  ToDoDataManager.swift
//  Romag
//
//  Created by Maksim on 22.08.2024.
//

import UIKit

protocol ToDoDataManager: AnyObject {
    func getData() -> [ToDoData]
    
    func getNewEmptyObject() -> ToDoData
    
    func saveData()
    
    func removeObj(obj: ToDoData)
}
