//
//  FullNewsDescriptionView.swift
//  Romag
//
//  Created by Maksim on 14.08.2024.
//

import UIKit

class FullNewsDescriptionView: UIViewController {
    var model: ArticlesDecodableType!
    let label: UILabel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
}

extension FullNewsDescriptionView {
    func setup() {
        view.backgroundColor = .lightGray
        label.numberOfLines = 0
        view.addSubview(label)
    }
    
    func layout() {
        label.snp.makeConstraints {
            $0.size.equalToSuperview()
        }
    }
    
    func updateModel(model: ArticlesDecodableType) {
        self.model = model
        label.text = model.url
        debugPrint(model)
    }
}
