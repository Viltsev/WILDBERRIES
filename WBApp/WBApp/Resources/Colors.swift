//
//  Colors.swift
//  WBApp
//
//  Created by Данила on 06.06.2024.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    enum Name: String {
        case color
    }
}

extension Color.Name {
    var path: String { "\(rawValue)" }
}

extension Color {
    init(_ name: Color.Name) {
        self.init(name.path)
    }
}

extension UIColor {
    convenience init(named name: Color.Name) {
        self.init(named: name.path)!
    }
}
