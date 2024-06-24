//
//  WBWidget.swift
//  WBWidget
//
//  Created by Данила on 24.06.2024.
//

import WidgetKit
import SwiftUI

struct WBWidget: Widget {
    let kind: String = "Online users"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ActiveUsersWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Online users")
        .description("Shows list of online users")
        .supportedFamilies([.systemMedium])
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), users: [])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), users: WidgetContact.loadUsers())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, users: WidgetContact.loadUsers())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let users: [WidgetContact]
}

struct ActiveUsersWidgetEntryView : View {
    @State var entry: Provider.Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(entry.users) { user in
                HStack {
                    if let image = user.image {
                        Image(image)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .cornerRadius(15)
                    } else {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.pink)
                            .frame(width: 48, height: 48)
                            .overlay {
                                Text(WidgetContact.extractInitials(from: user.name))
                                    .foregroundStyle(.white)
                            }
                    }
                    Text(user.name)
                        .font(.headline)
                        .padding()
                }
            }
        }
        .padding()
    }
}

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
