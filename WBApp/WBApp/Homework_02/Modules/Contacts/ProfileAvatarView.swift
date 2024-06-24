//
//  ProfileAvatarView.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import SwiftUI

struct ProfileAvatarView: View {
    var isOnline: Bool
    var hasStory: Bool
    var image: String?
    var name: String
    
    var body: some View {
        content()
    }
}

extension ProfileAvatarView {
    @ViewBuilder
    func content() -> some View {
        ZStack {
            imageView()
            storyView()
            onlineView()
        }
    }
    
    @ViewBuilder
    func imageView() -> some View {
        if let image = image {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .cornerRadius(14)
        } else {
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.brand)
                .frame(width: 48, height: 48)
                .overlay {
                    Text(Contact.extractInitials(from: name))
                        .foregroundStyle(.white)
                        .font(Font.profileImage())
                }
        }
    }
    
    @ViewBuilder
    func storyView() -> some View {
        switch hasStory {
        case true:
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    image == nil ? LinearGradient.gradientPurple: LinearGradient.gradientBlue,
                    lineWidth: 2
                )
                .frame(width: 54, height: 54)
        case false:
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.clear, lineWidth: 2)
                .frame(width: 54, height: 54)
        }
    }
    
    @ViewBuilder
    func onlineView() -> some View {
        switch isOnline {
        case true:
            Circle()
                .fill(.white)
                .overlay {
                    Circle()
                        .fill(Color.online)
                        .frame(width: 15, height: 15)
                }
                .frame(width: 18, height: 18)
                .offset(x: 20, y: -20)
        case false:
            EmptyView()
        }
    }
}
