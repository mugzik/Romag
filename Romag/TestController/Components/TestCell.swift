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
    private var model: Int = Int()
    var delegate: TestCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ item: Int) {
        model = item
    }
}

private extension TestCell {
    @objc func onTapped()
    {
        delegate?.tapped(index: model)
    }
    
    func setup() {
        backgroundColor = .red
        
        let tapRecognizer = UITapGestureRecognizer(target:self, action:#selector(onTapped))
        tapRecognizer.numberOfTapsRequired = 1
        
        addGestureRecognizer(tapRecognizer)
    }
}
