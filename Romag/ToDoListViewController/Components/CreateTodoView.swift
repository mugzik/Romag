//
//  CreateTodoView.swift
//  Romag
//
//  Created by Maksim on 27.08.2024.
//

import UIKit

protocol CreateTodoDelegate {
    func createNew(message: String)
}

class CreateTodoView: UIView {
    let newText: UITextView = UITextView()
    let saveButton: UIButton = UIButton(type: .system)
    var delegate: CreateTodoDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CreateTodoView {
    
    func setup() {        
        newText.isEditable = true
        newText.textAlignment = .left
        newText.backgroundColor = .white
        newText.translatesAutoresizingMaskIntoConstraints = false
        newText.clipsToBounds = false
        addSubview(newText)
        
        saveButton.addTarget(self, action: #selector(onCreateButtonPressed), for: .touchDown)
        saveButton.isEnabled = true
        saveButton.backgroundColor = .lightGray
        saveButton.clipsToBounds = false
        saveButton.setImage(UIImage(systemName:"plus"), for: .normal)
        addSubview(saveButton)
        
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }
    
    func layout() {
        
        saveButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
        }
        
        newText.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(saveButton.snp.leading)
            $0.bottom.equalToSuperview()
        }
    }
    
    @objc func onCreateButtonPressed() {
        debugPrint("Create button pressed!")
        guard let delegate = delegate else { return }
        
        delegate.createNew(message: newText.text)
    }
}
