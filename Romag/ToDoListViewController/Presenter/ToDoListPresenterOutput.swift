//
//  ToDoListPresenterOutput.swift
//  Romag
//
//  Created by Maksim on 21.08.2024.
//

import Foundation

protocol ToDoListPresenterOutput: AnyObject {
    func getData() -> [ToDoData]
    
    func getNewEmptyObject() -> ToDoData
    
    func removeObj(obj: ToDoData)
}
