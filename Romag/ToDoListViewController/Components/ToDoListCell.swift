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
    let label: UILabel = .init()
    let checkButton: UIButton = .init()
    let removeButton: UIButton = .init()
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
        addSubview(label)
        
        checkButton.backgroundColor = .blue
        addSubview(checkButton)
        
        removeButton.backgroundColor = .red
        removeButton.addTarget(self, action: #selector(onRemoveButtonClicked), for: .touchDown)
        addSubview(removeButton)
    }
    
    func layout() {
        checkButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        removeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    @objc func onRemoveButtonClicked() {
        debugPrint("Remove button clicked")
        guard let delegate = delegate else { return }
            
        delegate.removeToDoCell(id: id)
    }
}
