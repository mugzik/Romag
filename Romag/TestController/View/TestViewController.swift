//
//  TestViewController.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {
    private var testCollection: TestCollection = .init()
    
    var presenter: TestViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        bindings()
        presenter?.viewDidLoad()
    }
}

extension TestViewController: TestViewControllerInput {
    func setTestCollection(model: [ArticlesDecodableType]) {
        debugPrint("setTestCollection called. Args: \(model)")
        for el in model {
            testCollection.addElement(newsToken: el)
            debugPrint("Add element: \(el.title!)")
        }
        testCollection.reloadData()
    }
}

private extension TestViewController {
    func bindings() {
        testCollection.callback = { [weak self] in
            guard self != nil else { return }
            if let model = $0 {
                let newsView = self!.getNewDescriptionView()
                newsView.updateModel(model: model)
                self!.navigationController?.pushViewController(newsView, animated: true)
            }
        }
    }
    
    func layout() {
        testCollection.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setup() {
        setupView()
        setupTestCollection()
    }
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupTestCollection() {
        let collection = TestCollection()
        collection.backgroundColor = .gray
        
        testCollection = collection
        view.addSubview(testCollection)
    }
    
    func getNewDescriptionView() -> NewsViewController
    {
        let newsView = NewsViewController()
        let newsViewPresenter = NewsViewPresenter()
        let imgProvider = ImageProvider()
        
        newsViewPresenter.view = newsView
        newsViewPresenter.dataProvider = imgProvider
        newsView.presenter = newsViewPresenter
        
        return newsView
    }
}
