//
//  MockView.swift
//  WBApp
//
//  Created by Данила on 06.06.2024.
//

import SwiftUI

struct MockView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Color.white
            .ignoresSafeArea()
            .overlay {
                content()
            }
        
    }
}

extension MockView {
    @ViewBuilder
    func content() -> some View {
        VStack(alignment: .center) {
            Text("Пользовательское соглашение")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.neutralActive)
                .multilineTextAlignment(.center)
                .padding(.vertical, 18)
                .padding(.horizontal, 48)
            dismissButton()
        }
    }
    
    @ViewBuilder
    func dismissButton() -> some View {
        Button {
            dismiss.callAsFunction()
        } label: {
            VStack {
                Text("Dismiss")
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
    MockView()
}
