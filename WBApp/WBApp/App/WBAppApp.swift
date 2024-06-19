//
//  WBAppApp.swift
//  WBApp
//
//  Created by Данила on 06.06.2024.
//

import SwiftUI

@main
struct WBAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContactsDetailView(contact: Contact.mockContacts.first!,
                               networks:  Contact.mockContacts.first!.networks)
        }
    }
}
