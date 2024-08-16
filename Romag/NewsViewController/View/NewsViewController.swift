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
    let textView: UITextView = .init()
    let imageView: UIImageView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
}

extension NewsViewController {
    func setup() {
        view.backgroundColor = .white
        
        headTitle.numberOfLines = 0
        headTitle.backgroundColor = .white
        headTitle.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(headTitle)
        
        textView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.isScrollEnabled = true
        view.addSubview(textView)
        
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
        
        textView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    func updateModel(model: ArticlesDecodableType) {
        self.model = model
        headTitle.text = model.title
        
        textView.text = model.content
        
        presenter.viewDidLoad()
    }
}

extension NewsViewController: NewsViewControllerInput {
    func setImageData(imData: Data?) {
        guard let data = imData else { return }
        imageView.image = UIImage(data: data)
    }
}
