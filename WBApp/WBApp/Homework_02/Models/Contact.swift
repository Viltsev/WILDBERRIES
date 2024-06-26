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
    var networks: [SocialNetwork] = []
    
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
              phone: "+7 999 999-99-99",
              lastSeen: Date(timeIntervalSinceNow: -30 * 3600),
              networks: [
                SocialNetwork(network: .twitter, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .insta, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .linkdn, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .facebook, url: URL(string: "https://www.apple.com")!),
              ]),
        .init(name: "Петя",
              image: UIEnums.Images.petrProfile,
              isOnline: true,
              hasStory: false,
              phone: "+7 999 999-99-99",
              networks: [
                SocialNetwork(network: .twitter, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .insta, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .linkdn, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .facebook, url: URL(string: "https://www.apple.com")!),
              ]),
        .init(name: "Маман",
              image: UIEnums.Images.momProfile,
              isOnline: false,
              hasStory: true,
              phone: "+7 999 999-99-99",
              lastSeen: Date(timeIntervalSinceNow: -3 * 3600),
              networks: [
                SocialNetwork(network: .twitter, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .insta, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .linkdn, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .facebook, url: URL(string: "https://www.apple.com")!),
              ]),
        .init(name: "Арбуз Дыня",
              image: UIEnums.Images.watermelonProfile,
              isOnline: true,
              hasStory: false,
              phone: "+7 999 999-99-99",
              networks: [
                SocialNetwork(network: .twitter, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .insta, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .linkdn, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .facebook, url: URL(string: "https://www.apple.com")!),
              ]),
        .init(name: "Иван Иванов",
              isOnline: true,
              hasStory: false,
              phone: "+7 999 999-99-99",
              networks: [
                SocialNetwork(network: .twitter, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .insta, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .linkdn, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .facebook, url: URL(string: "https://www.apple.com")!),
              ]),
        .init(name: "Лиса Алиса",
              isOnline: false,
              hasStory: true,
              phone: "+7 999 999-99-99",
              lastSeen: Date(timeIntervalSinceNow: -30 * 60),
              networks: [
                SocialNetwork(network: .twitter, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .insta, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .linkdn, url: URL(string: "https://www.apple.com")!),
                SocialNetwork(network: .facebook, url: URL(string: "https://www.apple.com")!),
              ])
    ]
    
    static func filterContacts(_ contact: String) -> [Contact] {
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
}
