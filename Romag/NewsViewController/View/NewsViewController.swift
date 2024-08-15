//
//  FullNewsDescriptionView.swift
//  Romag
//
//  Created by Maksim on 14.08.2024.
//

import UIKit

class NewsViewController: UIViewController {
    var presenter: NewsViewPresenterOutput!
    
    var model: ArticlesDecodableType!
    
    let headTitle: UILabel = .init()
    let infoLabel: UILabel = .init()
    let imageView: UIImageView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
}

extension NewsViewController {
    func setup() {
        view.backgroundColor = .lightGray
        
        headTitle.numberOfLines = 0
        headTitle.backgroundColor = .white
        headTitle.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(headTitle)
        
        infoLabel.numberOfLines = 0
        infoLabel.backgroundColor = .white
        infoLabel.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(infoLabel)
        
        view.addSubview(imageView)
    }
    
    func layout() {
        headTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(64)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(headTitle.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(128)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    func updateModel(model: ArticlesDecodableType) {
        self.model = model
        headTitle.text = model.title
        
        infoLabel.text = model.description
        
        presenter.viewDidLoad()
    }
}

extension NewsViewController: NewsViewControllerInput {
    func setImageData(imData: Data?) {
        guard let data = imData else { return }
        imageView.image = UIImage(data: data)
    }
}
