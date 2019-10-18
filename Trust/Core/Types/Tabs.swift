// Copyright DApps Platform Inc. All rights reserved.

import Foundation
import TrustCore

enum WalletAction {
    case none
    case addToken(Address)
}

enum Tabs {
    case wallet(WalletAction)
    case browser(openURL: URL?)
    case dex
    case settings

    var index: Int {
        switch self {
        case .wallet: return 0
        case .browser: return 1
        case .dex: return 2
        case .settings: return 3
        }
    }
}

extension Tabs: Equatable {
    static func == (lhs: Tabs, rhs: Tabs) -> Bool {
        switch (lhs, rhs) {
        case (let .browser(lhs), let .browser(rhs)):
            return lhs == rhs
        case (.wallet, .wallet),
             (.dex, .dex),
             (.settings, .settings):
            return true
        case (_, .wallet),
             (_, .browser),
             (_, .dex),
             (_, .settings):
            return false
        }
    }
}
