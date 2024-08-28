//
//  ToDoListViewControllerInput.swift
//  Romag
//
//  Created by Maksim on 21.08.2024.
//

import Foundation

protocol ToDoListViewControllerInput: AnyObject {
    func setData(_ data:[ToDoData]?)
}
