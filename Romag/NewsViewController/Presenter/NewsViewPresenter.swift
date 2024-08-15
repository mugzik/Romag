//
//  NewsViewPresenter.swift
//  Romag
//
//  Created by Maksim on 15.08.2024.
//

import UIKit

class NewsViewPresenter {
    var dataProvider: DataProvider!
    var view: NewsViewController!
}

extension NewsViewPresenter: NewsViewPresenterOutput {
    func viewDidLoad() {
        guard let url = view.model.urlToImage else { return }
        
        dataProvider.getData(url: URL(string: url)!) { data, responce, error in
            DispatchQueue.main.async {
                        self.view.setImageData(imData: data)
            }            
        }
    }
}
