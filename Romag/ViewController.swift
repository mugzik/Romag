//
//  ViewController.swift
//  RomaGey
//
//  Created by Maksim on 08.08.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        initialize()
    }

    
    private func initialize()
    {
        let test = UIView()
        test.backgroundColor = .blue
        
        let test_button = UIButton()
        test_button.backgroundColor = .red
        test_button.setTitle("HUY", for: .normal)
        
        view.addSubview(test)
        view.addSubview(test_button)
        
        test.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(60)
        }
        
        test_button.snp.makeConstraints{
            $0.top.equalTo(test.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(60)
        }
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(showSecond))
        tapGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func showSecond()
    {
        navigationController?.pushViewController(SecondViewController(), animated: true)
        //navigationController?.show((navigationController?.topViewController)!, sender: self)
    }

}

