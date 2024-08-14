//
//  TestViewPresenter.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

import Foundation

final class TestViewPresenter: TestViewOutput {
    weak var view: TestViewControllerInput!
    weak var dataManager: DataInput!
    
}

extension TestViewPresenter: TestViewControllerOutput {
    func viewDidLoad() {
        
        dataManager.loadData( callback: { loadedData in
            var data: [ArticlesDecodableType] = []
            data.append(contentsOf: loadedData as! [ArticlesDecodableType])
            self.view.setTestCollection(model: data)
        } )
        
    }
}

private extension TestViewPresenter {
    
}
