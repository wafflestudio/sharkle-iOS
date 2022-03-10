//
//  RootView.swift
//  sharkle
//
//  Created by 김우성 on 2022/03/07.
//

import SwiftUI

struct RootView: View {
    @State private var selectedView: Tab = .home
    
    enum Tab {
        case home
        case search
        case profile
        case setting
    }
    
    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(Tab.home)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(Tab.search)
        }
        .accentColor(Color("MainColor"))
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
