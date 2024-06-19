//
//  Fonts.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import Foundation
import SwiftUI

extension Font {
    static func subheading1(size: CGFloat = 18) -> Font {
        .system(size: size, weight: .semibold)
    }
    
    static func subheading2(size: CGFloat = 16) -> Font {
        .system(size: size, weight: .semibold)
    }
    
    static func body1(size: CGFloat = 14) -> Font {
        .system(size: size, weight: .semibold)
    }
    
    static func profileImage(size: CGFloat = 14) -> Font {
        .system(size: size, weight: .bold)
    }
    
    static func metaData1(size: CGFloat = 12) -> Font {
        .system(size: size, weight: .regular)
    }
}
