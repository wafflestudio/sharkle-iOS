//
//  HomeView.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import SwiftUI

struct HomeView: View {
    @State private var selected: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TopTabBar(selected: $selected)
                    .padding(.top, 0)
                    .clipped()
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 5)
                
                switch selected {
                case 0:
                    MyPageView()
                default:
                    MyPageView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "person.circle")
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "magnifyingglass.circle")
                            .foregroundColor(.black)
                    }
                    
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "bell.circle")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
