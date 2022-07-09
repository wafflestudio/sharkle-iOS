//
//  HomeView.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("지금 알림 신청 중!")
                            .font(.system(size: 24, weight: .bold))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack() {
                                ForEach(viewModel.circles, id: \.id) { circle in
                                    ClubItem(circle: circle)
                                }
                            }
                        }
                        .frame(width: 360, height: 128)
                    }
                    
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
            .onAppear {
                self.viewModel.apply()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
