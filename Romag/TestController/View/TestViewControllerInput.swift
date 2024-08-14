//
//  TestViewControllerInput.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

import UIKit

protocol TestViewControllerInput: AnyObject {
    func setTestCollection(model: [ArticlesDecodableType])
}
