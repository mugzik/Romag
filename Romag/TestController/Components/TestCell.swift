//
//  TestCell.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

import UIKit

protocol TestCellDelegate: AnyObject {
    func tapped(index i: Int)
}

class TestCell: UICollectionViewCell {
    // TODO add views
    private var model: ArticlesDecodableType?
    private var index: Int = Int()
    var delegate: TestCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ item: ArticlesDecodableType, index i: Int) {
        model = item
        index = i
        let label = UILabel()
        label.text = item.title
        
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.size.equalToSuperview()
        }
    }
}

private extension TestCell {
    @objc func onTapped()
    {
        delegate?.tapped(index: index)
    }
    
    func setup() {
        backgroundColor = .red
        
        let tapRecognizer = UITapGestureRecognizer(target:self, action:#selector(onTapped))
        tapRecognizer.numberOfTapsRequired = 1
        
        addGestureRecognizer(tapRecognizer)
    }
}
