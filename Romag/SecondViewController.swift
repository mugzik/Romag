//
//  SecondViewController.swift
//  RomaGey
//
//  Created by Maksim on 08.08.2024.
//
import SnapKit
import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        initialize()
    }
    
    private func initialize()
    {
        view.backgroundColor = .darkGray
        
        let back_button = UIView()
        back_button.backgroundColor = .brown
        view.addSubview(back_button)
        
        back_button.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.size.equalTo(25)
        }
    
    }
    
}
