//
//  SocialNetwork.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import Foundation
import SwiftUI

struct SocialNetwork: Hashable {
    let network: SocialNetworkEnum
    let url: URL
    
    init(network: SocialNetworkEnum, url: URL) {
        self.network = network
        self.url = url
    }
}

enum SocialNetworkEnum {
    case twitter
    case insta
    case linkdn
    case facebook
    
    var icon: Image {
        switch self {
        case .twitter:
            Image(UIEnums.Icons.twitter)
        case .insta:
            Image(UIEnums.Icons.insta)
        case .linkdn:
            Image(UIEnums.Icons.linkdn)
        case .facebook:
            Image(UIEnums.Icons.facebook)
        }
    }
}
