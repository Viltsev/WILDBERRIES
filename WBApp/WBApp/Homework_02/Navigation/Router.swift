//
//  Router.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import SwiftUI

final class Router: ObservableObject {
    @Published var path = NavigationPath() {
        didSet {
            print(path.count)
        }
    }
    
    func pushView<T: Hashable>(_ destination: T) {
        self.path.append(destination)
    }
    
    func popToRoot() {
        self.path = NavigationPath()
    }
    
    func popView() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
