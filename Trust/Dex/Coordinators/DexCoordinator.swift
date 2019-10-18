// Copyright DApps Platform Inc. All rights reserved.

import Foundation
import UIKit
import BigInt
import TrustKeystore
import RealmSwift
import URLNavigator
import WebKit
import Branch


final class DexCoordinator: Coordinator {
    var coordinators: [Coordinator] = []
    let navigationController: NavigationController
    
    lazy var rootViewController: DexViewController = {
        let controller = DexViewController()
        controller.modalPresentationStyle = .pageSheet
        controller.btnNext.addTarget(self, action: #selector(nextClick), for: .touchUpInside)
        controller.btn_p_chng.addTarget(self, action: #selector(viewCurrtype), for: .touchUpInside)
        controller.btn_r_chng.addTarget(self, action: #selector(viewCurrtype), for: .touchUpInside)
//        controller.btnNext = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(edit))
        return controller
    }()
    
    init(navigationController: NavigationController = NavigationController()
        ) {
        self.navigationController = navigationController
        self.navigationController.modalPresentationStyle = .formSheet
    }
    
    func start() {
        navigationController.viewControllers = [rootViewController]
    }

    @objc func nextClick() {
        let controller = DexConfirmViewController()
//        controller.delegate = self
        controller.navigationItem.hidesBackButton = true
        navigationController.pushViewController(controller, animated: true)
    }
    
    @objc func viewCurrtype() {
        let controller = CurrTypeTableViewController()
        navigationController.pushViewController(controller, animated: true)
    }
}
