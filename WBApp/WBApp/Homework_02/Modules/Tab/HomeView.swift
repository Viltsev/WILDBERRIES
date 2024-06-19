//
//  TabView.swift
//  WBApp
//
//  Created by Данила on 18.06.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var activeTab: MainTab = .contacts
    @State private var allTabs: [AnimatedTab] = MainTab.allCases.compactMap { tab -> AnimatedTab in
        return .init(tab: tab)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                ContactsView()
                    .setupTab(.contacts)
                Text("чаты")
                    .setupTab(.chats)
                Text("больше")
                    .setupTab(.more)
            }
            
            CustomTabBar()
        }
    }
}

extension HomeView {
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
                VStack(spacing: 4) {
                    Image(tab.rawValue)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(activeTab == tab ? .brand : .neutralActive)
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation(.bouncy) {
                        activeTab = tab
                    }
                }
                
            }
        }
        .background(.white)
    }
}

extension View {
    @ViewBuilder
    func setupTab(_ tab: MainTab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    HomeView()
}
