//
//  CoordinatorProtocols.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 15/05/2021.
//
import Foundation
import UIKit

class Coordinator {
    deinit {
        print("Coordinator deinited!")
    }
    
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    weak var initialVC: UIViewController?
    
    init(with navigationController: UINavigationController, from parent: Coordinator?) {
        self.parentCoordinator = parent
        self.navigationController = navigationController
    }
    
    func start() { }
}
