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
                ScrollView(.vertical) {
                    ClubItemsRow()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("최신 게시글")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.leading, 15)
                        
                        ForEach(1..<10) { _ in
                            ClubRow()
                        }
                    }
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
