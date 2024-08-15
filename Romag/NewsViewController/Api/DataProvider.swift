//
//  DataProvider.swift
//  Romag
//
//  Created by Maksim on 15.08.2024.
//

import UIKit

protocol DataProvider: AnyObject {
    func getData(url: URL, dataHandler: @escaping (Data?, URLResponse?, Error?) -> ())
}
