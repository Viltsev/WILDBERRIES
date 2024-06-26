//
//  WBWidgetLiveActivity.swift
//  WBWidget
//
//  Created by Данила on 24.06.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WBWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WBWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WBWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WBWidgetAttributes {
    fileprivate static var preview: WBWidgetAttributes {
        WBWidgetAttributes(name: "World")
    }
}

extension WBWidgetAttributes.ContentState {
    fileprivate static var smiley: WBWidgetAttributes.ContentState {
        WBWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WBWidgetAttributes.ContentState {
         WBWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WBWidgetAttributes.preview) {
   WBWidgetLiveActivity()
} contentStates: {
    WBWidgetAttributes.ContentState.smiley
    WBWidgetAttributes.ContentState.starEyes
}
