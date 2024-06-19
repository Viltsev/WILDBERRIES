//
//  Strings.swift
//  WBApp
//
//  Created by Данила on 18.06.2024.
//

import Foundation

extension String {
    static let chatWithFriends: String = "Общайтесь с друзьями и близкими легко"
    static let userAgreement: String = "Пользовательское соглашение"
    static let startToTalk: String = "Начать общаться"
    static let dismissString: String = "Dismiss"
    static let contactsTitle: String = "Контакты"
    static let searchBarTitle: String = "Search"
    static let online: String = "Online"
    static let onlineRecently: String = "Last seen recently"
    static let onlineYesterday: String = "Last seen yesterday"
    static let onlineLongAgo: String = "Last seen for a long time"
    static func onlineHoursAgo(_ hours: Int) -> String {
        "Last seen \(hours) hours ago"
    }
    static func onlineMinutesAgo(_ min: Int) -> String {
        "Last seen \(min) minutes ago"
    }
}
