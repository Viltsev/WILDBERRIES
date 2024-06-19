//
//  NavigationBarView.swift
//  WBApp
//
//  Created by Данила on 19.06.2024.
//

import SwiftUI

struct NavigationTopView: View {
    var title: String?
    var icon: String?
    var isPadding: Bool
    
    var body: some View {
       navigationBar()
    }
}

extension NavigationTopView {
    @ViewBuilder
    func navigationBar() -> some View {
        HStack(spacing: 0) {
            iconView()
            titleView()
        }
        .padding(.horizontal, isPadding ? 13 : 0)
    }
    
    @ViewBuilder
    func iconView() -> some View {
        if let icon = icon {
            Button {
                
            } label: {
                Image(icon)
                    .font(.system(size: 14, weight: .semibold))
            }
        }
    }
    
    @ViewBuilder
    func titleView() -> some View {
        if let title = title {
            Text(title)
                .font(.subheading1())
                .padding(.leading, icon != nil ? 0 : 8)
        }
    }
}

