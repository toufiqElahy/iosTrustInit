// Copyright DApps Platform Inc. All rights reserved.

import Foundation
import UIKit

struct InCoordinatorViewModel {

    let config: Config
    let preferences: PreferencesController

    init(
        config: Config,
        preferences: PreferencesController = PreferencesController()
    ) {
        self.config = config
        self.preferences = preferences
    }

    var imageInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }

    var browserBarItem: UITabBarItem {
        return UITabBarItem(
            title: NSLocalizedString("browser.tabbar.item.title", value: "DApps", comment: ""),
            image: R.image.dapp_icon(),
            selectedImage: nil
        )
    }

    var walletBarItem: UITabBarItem {
        return UITabBarItem(
            title: NSLocalizedString("wallet.navigation.title", value: "Wallet", comment: ""),
            image: R.image.dwallets_icon(),
            selectedImage: nil
        )
    }
    
    var dexsBarItem: UITabBarItem {
        return UITabBarItem(
            title: NSLocalizedString("DEX.navigation.title", value: "DEX", comment: ""),
            image: R.image.dexs_tab_icon(),
            selectedImage: nil
        )
    }

    var settingsBarItem: UITabBarItem {
        return UITabBarItem(
            title: NSLocalizedString("settings.navigation.title", value: "Settings", comment: ""),
            image: R.image.settings_icon(),
            selectedImage: nil
        )
    }
}
