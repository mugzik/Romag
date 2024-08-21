//
//  MainTabBarView.swift
//  Romag
//
//  Created by Maksim on 16.08.2024.
//

import UIKit

final class MainTabBarView: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabs()
    }
}

private extension MainTabBarView {
    func configureTabs(){
        // Create and configure tabs
        let highlitedNews = TestViewController()
        let presenter = TestViewPresenter()
        let dataManager = Api.shared
        let highlitedNewsNavController = UINavigationController(rootViewController: highlitedNews)
        
        highlitedNews.presenter = presenter
        presenter.view = highlitedNews
        presenter.dataManager = dataManager
        
        let tab2 = ViewController()
        tab2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let tab3 = ViewController()
        tab3.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        let tab4 = ViewController()
        tab4.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        
        setViewControllers([highlitedNewsNavController, tab2, tab3, tab4], animated: true)
    }
}
