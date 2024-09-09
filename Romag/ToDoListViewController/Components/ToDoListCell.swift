//
//  ToDoListCell.swift
//  Romag
//
//  Created by Maksim on 21.08.2024.
//

import UIKit

protocol ToDoRemoveDelegate {
    func removeToDoCell(id: Int)
}

class ToDoListCell: UICollectionViewCell {
    let label: UITextView = .init()
    let checkButton: UIButton = UIButton(type: .system)
    let removeButton: UIButton = UIButton(type: .system)
    var id: Int = Int()
    
    var delegate: ToDoRemoveDelegate?
    
    private var model: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: ToDoData, id: Int)
    {
        label.text = model.message
        self.id = id
    }
    
}

private extension ToDoListCell {
    func setup() {
        label.backgroundColor = .white
        label.textContainerInset = UIEdgeInsets(top:0, left: 5, bottom: 0, right: 0)
        
        let font = UIFont(name: "TimesNewRomanPSMT", size: 16)
        label.font = font
        
        contentView.addSubview(label)
        
        checkButton.backgroundColor = .blue
        checkButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        contentView.addSubview(checkButton)
        
        removeButton.backgroundColor = .red
        removeButton.addTarget(self, action: #selector(onRemoveButtonClicked), for: .touchDown)
        removeButton.setImage(UIImage(systemName: "trash"), for: .normal)
        contentView.addSubview(removeButton)
        
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        
        contentView.layer.borderColor = UIColor.darkGray.cgColor
        contentView.layer.borderWidth = 1
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
    }
    
    func layout() {
        checkButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        removeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(label.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalTo(checkButton.snp.leading)
        }
    }
    	
    @objc func onRemoveButtonClicked() {
        debugPrint("Remove button clicked")
        guard let delegate = delegate else { return }
            
        delegate.removeToDoCell(id: id)
    }
}
