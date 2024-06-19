//
//  TabBar.swift
//  WBApp
//
//  Created by Данила on 18.06.2024.
//

import Foundation
import SwiftUI

enum MainTab: String, CaseIterable {
    case contacts
    case chats
    case more
    
    var iconName: String {
        switch self {
        case .contacts:
            return UIEnums.Icons.contacts
        case .chats:
            return UIEnums.Icons.chats
        case .more:
            return UIEnums.Icons.more
        }
    }
}

struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: MainTab
    var isAnimating: Bool?
}
