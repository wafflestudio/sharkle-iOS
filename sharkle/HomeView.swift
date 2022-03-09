//
//  HomeView.swift
//  sharkle
//
//  Created by 김우성 on 2022/03/07.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical) {
            ClubItemsRow()
            
            VStack(spacing: 15) {
                ForEach(1..<10) { _ in
                    ClubRow()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
