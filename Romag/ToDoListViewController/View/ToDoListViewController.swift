//
//  ToDoListViewController.swift
//  Romag
//
//  Created by Maksim on 21.08.2024.
//

import UIKit

class ToDoListViewController: UIViewController {
    var presenter: ToDoListPresenter!
    let toDoListCollection: ToDoListCollection = ToDoListCollection()
    let newToDoView: CreateTodoView = CreateTodoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        presenter.whenViewLoaded()
    }

}

private extension ToDoListViewController {
    func setup() {
        view.backgroundColor = .darkGray
        
        toDoListCollection.rmDelegate = self
        toDoListCollection.backgroundColor = .lightGray
        toDoListCollection.layer.cornerRadius = 5
        view.addSubview(toDoListCollection)
        
        newToDoView.delegate = self
        newToDoView.backgroundColor = .lightGray
        view.addSubview(newToDoView)
    }
    
    func layout() {
        newToDoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(64)
        }
        
        toDoListCollection.snp.makeConstraints {
            $0.top.equalTo(newToDoView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.greaterThanOrEqualToSuperview()
        }
    }
    
}

extension ToDoListViewController: ToDoListViewControllerInput {
    func setData(_ data: [ToDoData]?) {
        guard let data = data else { return }
        
        debugPrint("Loaded Data size: \(data.count)")
        
        for el in data {
            toDoListCollection.addElement(elem: el)
        }
        toDoListCollection.reloadData()
        
    }
    
}

extension ToDoListViewController: ToDoListViewControllerOutput {
    func getNewEmptyObject() -> ToDoData {
        presenter.getNewEmptyObject()
    }
    
    func saveData() {
        presenter.saveData()
    }
    
}

extension ToDoListViewController: CreateTodoDelegate {
    func createNew(message: String) {
        let newToDo = getNewEmptyObject()
        newToDo.message = message
        newToDo.isdone = false
        toDoListCollection.addElement(elem: newToDo)
        toDoListCollection.reloadData()
        saveData()
    }
    
}

extension ToDoListViewController: ToDoListRmDelegate {
    func removeElement(elem: ToDoData) {
        presenter.removeObj(obj: elem)
    }
    
}
