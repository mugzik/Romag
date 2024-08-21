//
//  ViewController.swift
//  RomaGey
//
//  Created by Maksim on 08.08.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let ds: RandomColorCVDataSource = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        //initialize()
        initAsCollectionView()
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
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
    
    private func initAsCollectionView()
    {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical // Or .horizontal
        
        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        
        collectionView.register(RandColorCell.self, forCellWithReuseIdentifier: "cell")

        collectionView.dataSource = ds
        collectionView.delegate = ds
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }

    }
    
    private func getCollectionElement() -> UIView
    {
        let randomColorView = UIView()
        randomColorView.backgroundColor = UIColor(red: drand48(), green: drand48(), blue: drand48(), alpha: 1.0)
        
        return randomColorView
    }
    
    @objc private func showSecond()
    {
        navigationController?.pushViewController(SecondViewController(), animated: true)
        //navigationController?.show((navigationController?.topViewController)!, sender: self)
    }

}

