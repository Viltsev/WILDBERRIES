//
//  Contact.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import Foundation
import SwiftUI

struct Contact: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var image: String?
    var isOnline: Bool
    var hasStory: Bool
    var phone: String
    var lastSeen: Date = .init()
    
    static func getLastSeenTitle(lastSeen: Date) -> String {
        let lastSeenTime = Int(Date().timeIntervalSince(lastSeen))
        
        switch lastSeenTime {
        case 0 ..< 90: return String.online
        case 90 ..< 300: return String.onlineRecently
        case 300 ..< 3600: return String.onlineMinutesAgo(lastSeenTime / 60)
        case 3600 ..< 86400: return String.onlineHoursAgo(lastSeenTime / 3600)
        case 86400 ..< 172800: return String.onlineYesterday
        default: return String.onlineLongAgo
        }
    }
}

extension Contact {
    static let mockContacts: [Contact] = [
        .init(name: "Анастасия Иванова",
              image: UIEnums.Images.anastasiyaProfile,
              isOnline: false,
              hasStory: false,
              phone: "+7 999 999-99-99"),
        .init(name: "Петя",
              image: UIEnums.Images.petrProfile,
              isOnline: true,
              hasStory: false,
              phone: "+7 999 999-99-99"),
        .init(name: "Маман",
              image: UIEnums.Images.momProfile,
              isOnline: false,
              hasStory: true,
              phone: "+7 999 999-99-99"),
        .init(name: "Арбуз Дыня",
              image: UIEnums.Images.watermelonProfile,
              isOnline: true,
              hasStory: false,
              phone: "+7 999 999-99-99"),
        .init(name: "Иван Иванов",
              isOnline: true,
              hasStory: false,
              phone: "+7 999 999-99-99"),
        .init(name: "Лиса Алиса",
              isOnline: false,
              hasStory: true,
              phone: "+7 999 999-99-99")
    ]
    
    static func filterContacts(_ contact: String) -> [Contact] {
        if contact.isEmpty {
            return mockContacts
        } else {
            return mockContacts.filter { $0.name.lowercased().contains(contact.lowercased()) }
        }
    }
}
