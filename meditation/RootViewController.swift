//
//  ViewController.swift
//  meditation
//
//  Created by Timo Metsälä on 1.2.2021.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 1)
        
        let presetsViewController = SettingsViewController()
        presetsViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "slider.horizontal.3"), tag: 2)

        let journalViewController = JournalViewController()
        journalViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "text.book.closed"), tag: 3)

        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gearshape"), tag: 4)
        
        viewControllers = [UINavigationController(rootViewController: homeViewController), UINavigationController(rootViewController: presetsViewController), UINavigationController(rootViewController: journalViewController),
        UINavigationController(rootViewController: settingsViewController)]
    }

}

