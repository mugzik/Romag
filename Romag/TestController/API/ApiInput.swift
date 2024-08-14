//
//  ApiInput.swift
//  Romag
//
//  Created by Maksim on 13.08.2024.
//

import Foundation

protocol DataInput: AnyObject {
    func loadData(callback: @escaping ([any Decodable]) -> Void)
}
