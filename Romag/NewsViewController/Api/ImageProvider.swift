//
//  ImageProvider.swift
//  Romag
//
//  Created by Maksim on 15.08.2024.
//

import UIKit

class ImageProvider: DataProvider {
    func getData(url: URL, dataHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        getDataFromUrl(url: url, dataHandler: dataHandler)
    }
}


private extension ImageProvider {
    func getDataFromUrl(url: URL, dataHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        debugPrint("Start loading")
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            dataHandler(data, responce, error)
        }.resume()
        
        debugPrint("Finish loading")
    }
}
