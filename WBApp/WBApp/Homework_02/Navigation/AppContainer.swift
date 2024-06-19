//
//  AppContainer.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import SwiftUI

struct AppContainer: View {
    @StateObject private var router: Router = Router()
    var body: some View {
        NavigationStack(path: $router.path) {
            HomeView()
                .environmentObject(router)
                .navigationDestination(for: ContactsNavigation.self) { nav in
                    switch nav {
                    case .contactDetail(let contact):
                        ContactsDetailView(contact: contact)
                            .environmentObject(router)
                    }
                }
        }
    }
}

#Preview {
    AppContainer()
}
