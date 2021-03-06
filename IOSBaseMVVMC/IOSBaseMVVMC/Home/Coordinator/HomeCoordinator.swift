//
//  HomeCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate: class {
    func openNewScreen(index: MenuIndex)
}

final class HomeCoordinator: BaseCoordinator {
    
    override func start() {
        let viewModel = HomeViewModel()
        viewModel.delegate = self
        let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeController = homeStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeController.viewModel = viewModel
        self.navigationController?.pushViewController(homeController, animated: false)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func openNewScreen(index: MenuIndex) {
        if MenuIndex.POS_LOGIN == index {
            let loginCoordinator = LoginCoordinator(navigationController: navigationController)
            loginCoordinator.start()
        } else if MenuIndex.POS_TAB_LAYOUT == index {
            let tabLayoutCoordinator = TabLayoutCoordinator(navigationController: navigationController)
            tabLayoutCoordinator.start()
        } else if MenuIndex.POS_CONTAINER == index {
            let containerCoordinator = ContainerCoordinator(navigationController: navigationController)
            containerCoordinator.start()
        }
    }
}
