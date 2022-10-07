//
//  UITabBar+Extension.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 07.10.2022.
//

import UIKit

extension UITabBar {
    func updateAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(named: "backgroundColor")
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.black
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "mainColor")
       
        self.barTintColor = UIColor(named: "mainColor")
        
        self.standardAppearance = tabBarAppearance
        
        if #available(iOS 15, *) {
            self.scrollEdgeAppearance = tabBarAppearance
        }
    }
}
