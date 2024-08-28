//
//  ToDoListViewControllerOutput.swift
//  Romag
//
//  Created by Maksim on 21.08.2024.
//

import Foundation

protocol ToDoListViewControllerOutput: AnyObject {
    func saveData()
    
    func getNewEmptyObject() -> ToDoData
}
