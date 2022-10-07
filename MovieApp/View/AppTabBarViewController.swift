//
//  AppTabBarViewController.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 07.10.2022.
//

import UIKit

class AppTabBarViewController: UITabBarController {

    unowned var assembly: Assembly
    
    init(assembly: Assembly) {
        self.assembly = assembly
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.updateAppearance()
        
        let homeViewController = setupHome()
        viewControllers = [homeViewController]
    }
    
    private func setupHome() -> UIViewController {
        let movieListViewModel = HomeViewModel(networkManager: assembly.networkManager())
        let homeViewController = HomeViewController(viewModel: movieListViewModel)
        let navigation = UINavigationController(rootViewController: homeViewController)
        navigation.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home_tab_deselected"), selectedImage: UIImage(named: "home_tab_selected"))
        return navigation
    }
}
