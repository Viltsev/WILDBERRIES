//
//  OnlineUsersWidgetEntryView.swift
//  WBApp
//
//  Created by viltsevdanila on 25.06.2024.
//

import SwiftUI
import WidgetKit

struct WBWidgetEntryView : View {
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
