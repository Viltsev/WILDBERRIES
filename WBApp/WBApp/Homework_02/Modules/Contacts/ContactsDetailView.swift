//
//  ContactsDetailView.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import SwiftUI

struct ContactsDetailView: View {
    let contact: Contact
    let networks: [SocialNetwork]
    
    var body: some View {
        content()
    }
}

extension ContactsDetailView {
    @ViewBuilder
    private func content() -> some View {
        NavigationStack {
            VStack {
                imageView()
                    .padding(.top, 136)
                VStack(spacing: 4) {
                    nameView()
                    phoneView()
                }
                .padding(.top, 20)
                socialNetworkListView()
                    .padding(.top, 40)
                    .padding(.horizontal, 26)
                Spacer()
            }
            .navigationBarItems(leading: NavigationTopView(title: String.profileTitle, icon: UIEnums.Icons.back, isPadding: false),
                                trailing: NavigationTopView(icon: UIEnums.Icons.edit, isPadding: false))
        }
    }
    
    @ViewBuilder
    private func imageView() -> some View {
        switch self.contact.image {
        case nil:
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.neutralOffWhite)
                .overlay {
                    Image(UIEnums.Icons.profile)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 90)
                }
        default:
            if let image = self.contact.image {
                Image(image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(100)
            }
        }
    }
    
    @ViewBuilder
    private func nameView() -> some View {
        Text(contact.name)
            .font(.subheading1())
            .foregroundStyle(.neutralActive)
    }
    
    @ViewBuilder
    private func phoneView() -> some View {
        Text(contact.phone)
            .font(.subheading2())
            .foregroundStyle(.disabled)
    }
    
    @ViewBuilder
    private func socialNetworkListView() -> some View {
        HStack(spacing: 12) {
            ForEach(networks, id: \.self) { network in
                socialNetworkView(network: network)
            }
        }
    }
    
    @ViewBuilder
    private func socialNetworkView(network: SocialNetwork) -> some View {
        Link(destination: network.url) {
            Capsule()
                .stroke(Color.brand, lineWidth: 1.6)
                .frame(height: 40)
                .overlay {
                    network.network.icon
                        .resizable()
                        .frame(width: 20, height: 20)
                }
        }
    }
}

//#Preview {
//    ContactsDetailView(contact: Contact(name: "Данила Вильцев", isOnline: true, hasStory: true, phone: "+7 999 999 99 99"))
//}
