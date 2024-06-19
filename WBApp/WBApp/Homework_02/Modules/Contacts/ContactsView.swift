//
//  ContactsView.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @State private var searchedText: String = ""
    
    var body: some View {
        content()
    }
}

extension ContactsView {
    @ViewBuilder
    func content() -> some View {
        NavigationStack {
            VStack {
                SearchBarView(searchedText: $searchedText)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                listView()
            }
            .navigationBarItems(leading: NavigationTopView(title: String.contactsTitle),
                                trailing: NavigationTopView(icon: UIEnums.Icons.plus))
        }
    }
    
    @ViewBuilder
    func listView() -> some View {
        List(Contact.filterContacts(searchedText)) { contact in
            ContactRowView(contact: contact)
                .padding(5)
        }
        .listStyle(.plain)
    }
    
    @ViewBuilder
    func ContactRowView(contact: Contact) -> some View {
        Button {
            print("gooooo")
        } label: {
            HStack(spacing: 12) {
                ProfileAvatarView(
                    isOnline: contact.isOnline,
                    hasStory: contact.hasStory,
                    image: contact.image,
                    name: contact.name
                )
                userInfoView(contact)
                Spacer()
            }
            .background(.white)
        }
    }
    
    @ViewBuilder
    func userInfoView(_ contact: Contact) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(contact.name)
                .font(.body1())
                .foregroundStyle(Color.neutralActive)
                .frame(height: 24)
            
            Text(Contact.getLastSeenTitle(lastSeen: contact.lastSeen))
                .font(.metaData1())
                .foregroundStyle(Color.disabled)
                .frame(height: 20)
            
            Spacer()
        }
        .frame(height: 56)
    }
}


#Preview {
    ContactsView()
}
