//
//  WBIntents.swift
//  WBApp
//
//  Created by Данила on 24.06.2024.
//

import Foundation
import AppIntents

final class WBIntents: AppIntent {
    static var title: LocalizedStringResource = "open contacts in wb_app"
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        Router.shared.moveToTab(.contacts)
        return .result()
    }
}
