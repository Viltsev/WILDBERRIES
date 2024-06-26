//
//  WidgetContact.swift
//  WBApp
//
//  Created by viltsevdanila on 25.06.2024.
//

import Foundation

struct WidgetContact: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var image: String?
    var isOnline: Bool
    var hasStory: Bool
    var phone: String
    var lastSeen: Date = .init()
}

extension WidgetContact {
    static let mockContacts: [WidgetContact] = [
        .init(name: "Danila Viltsev", isOnline: true, hasStory: true, phone: "+ 7 999 999 99 99"),
        .init(name: "Ivan Ivanov", isOnline: false, hasStory: false, phone: "+ 7 999 999 99 99"),
        .init(name: "Petr Petrov", isOnline: false, hasStory: false, phone: "+ 7 999 999 99 99"),
        .init(name: "User Userovich", isOnline: true, hasStory: true, phone: "+ 7 999 999 99 99")
    ]
    
    static func filterContacts(_ contact: String) -> [WidgetContact] {
        if contact.isEmpty {
            return mockContacts
        } else {
            return mockContacts.filter { $0.name.lowercased().contains(contact.lowercased()) }
        }
    }
    
    static func extractInitials(from name: String) -> String {
        let words = name.split(separator: " ")
        var initials = ""
        
        for word in words {
            if let firstLetter = word.first {
                initials.append(firstLetter)
            }
        }
        
        return String(initials)
    }
    
    static func loadUsers() -> [WidgetContact] {
        WidgetContact.mockContacts.filter { $0.isOnline }
    }
}
