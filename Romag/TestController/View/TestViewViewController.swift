//
//  TestViewViewController.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

import UIKit
import SnapKit

class TestViewViewController: UIViewController {
    private var testCollection: TestCollection = .init()
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        bindings()
        getData()
    }
}

extension TestViewViewController: TestViewViewControllerInput {
    
}

private extension TestViewViewController {
    func bindings() {
        testCollection.callback = { [weak self] arg in
            guard let self = self else { return }
            print("tapped", arg)
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
    
    func getData() {
        Api.shared.getSimpleData()
    }
}
