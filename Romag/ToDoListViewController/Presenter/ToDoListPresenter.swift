//
//  ToDoListPresenter.swift
//  Romag
//
//  Created by Maksim on 21.08.2024.
//

import Foundation

class ToDoListPresenter {
    var dataManager: ToDoDataManager!
    var view: ToDoListViewControllerInput!
    
    func whenViewLoaded()
    {
        view.setData(getData())
    }
}

extension ToDoListPresenter: ToDoListPresenterOutput {
    func removeObj(obj: ToDoData) {
        dataManager.removeObj(obj: obj)
    }
    
    func getNewEmptyObject() -> ToDoData {
        return dataManager.getNewEmptyObject()
    }
    
    func getData() -> [ToDoData] {
        return dataManager.getData()
    }
    
}

extension ToDoListPresenter: ToDoListPresenterInput {
    func saveData() {
        dataManager.saveData()
    }
    
}
