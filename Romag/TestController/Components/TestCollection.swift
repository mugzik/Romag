//
//  TestCollection.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

import UIKit

class TestCollection: UICollectionView {
    var callback: ((Int) -> Void)?
    
    var model: [ArticlesDecodableType] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElement(newsToken: ArticlesDecodableType) {
        model.append(newsToken)
    }
    
    // TODO configure function
}

extension TestCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = model[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TestCell
        cell.configure(item, index: indexPath.item)
        cell.delegate = self
        return cell
    }
}

extension TestCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 32
        return CGSize(width: width, height: 54)
    }
}

extension TestCollection: TestCellDelegate {
    func tapped(index i: Int) {
        callback?(i)
    }
}

private extension TestCollection {
    func setup() {
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        register(TestCell.self, forCellWithReuseIdentifier: "cell")
        
        dataSource = self
        delegate = self
    }
}
