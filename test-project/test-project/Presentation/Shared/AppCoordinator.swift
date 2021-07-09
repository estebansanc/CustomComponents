//
//  AppCoordinator.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 15/05/2021.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    static var shared: AppCoordinator?
    
    private init(with navigationController: UINavigationController) {
        super.init(with: navigationController, from: nil)
    }
    
    static func getShared(with navigationController: UINavigationController? = nil) -> AppCoordinator {
        if AppCoordinator.shared == nil,
           let navVC = navigationController
        {
            shared = AppCoordinator(with: navVC)
            return shared!
            
        } else {
            return shared!
        }
    }
    
    override func start() {
        let vc = ViewController()
        navigationController.setViewControllers([vc], animated: false)
    }
}
