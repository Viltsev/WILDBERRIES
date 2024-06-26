//
//  WalkthroughBody.swift
//  WBApp
//
//  Created by Данила on 06.06.2024.
//

import SwiftUI

struct WalkthroughBody: View {
    @State private var isShowModal: Bool = false
    
    var body: some View {
        Color.white
            .ignoresSafeArea()
            .overlay {
                content()
            }
            .sheet(isPresented: $isShowModal, content: {
                MockView()
            })
    }
}

extension WalkthroughBody {
    @ViewBuilder
    func content() -> some View {
        VStack {
            onboardingImage()
            onboardingTitle()
            firstButton()
            secondButton()
        }
    }
        
    @ViewBuilder
    func onboardingImage() -> some View {
        Image(UIEnums.Images.onboardingView)
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 62)
            .padding(.top, 135)
    }
    
    @ViewBuilder
    func onboardingTitle() -> some View {
        Text(String.chatWithFriends)
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.neutralActive)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 47)
            .padding(.top, 42)
    }
    
    @ViewBuilder
    func firstButton() -> some View {
        Button {
            isShowModal.toggle()
        } label: {
            Text(String.userAgreement)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.neutralActive)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 81)
        .padding(.top, 158)
    }
    
    @ViewBuilder
    func secondButton() -> some View {
        Button {
            
        } label: {
            VStack {
                Text(String.startToTalk)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.neutralOffWhite)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 18)
                    .padding(.horizontal, 48)
            }
            .frame(maxWidth: .infinity)
            .background(.brand)
            .cornerRadius(30)
        }
        .padding(.horizontal, 24)
        .padding(.top, 18)
    }
}

#Preview {
    WalkthroughBody()
}
