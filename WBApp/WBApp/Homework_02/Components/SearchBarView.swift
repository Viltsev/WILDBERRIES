//
//  SearchBarView.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchedText: String
    
    var body: some View {
        content()
    }
}

extension SearchBarView {
    @ViewBuilder
    func content() -> some View {
        HStack(spacing: 0) {
            Group {
                Image(UIEnums.Icons.search)
                    .padding(.horizontal, 8)
                
                TextField(String.searchBarTitle, text: $searchedText)
                    .font(.body1())
                    .submitLabel(.search)
            }
            .padding(.vertical, 6)
        }
        .frame(maxWidth: .infinity)
        .background(Color.neutralOffWhite)
        .cornerRadius(4)
    }
}
