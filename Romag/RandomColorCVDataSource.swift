//
//  RandomColorCVDataSource.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

import UIKit
import SnapKit

final class RandColorCell: UICollectionViewCell
{
    private var titleLabel: UILabel = .init()
    
    private var model: Int = Int()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Int) {
        self.model = model
        configureTitleLabel()
    }
}

private extension RandColorCell {
    func configureTitleLabel() {
        titleLabel.text = "\(model)"
    }
    
    func layout () {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func setup() {
        setupView()
        setupTitleLabel()
    }
    
    func setupView() {
        backgroundColor = .red
        layer.cornerRadius = 50
    }
    
    func setupTitleLabel() {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        
        titleLabel = label
        addSubview(titleLabel)
    }
}

final class RandomColorCVDataSource: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let arr: [Int] = [1, 2, 3, 4, 5]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = arr[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RandColorCell
        cell.configure(model: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item")
    }
}


