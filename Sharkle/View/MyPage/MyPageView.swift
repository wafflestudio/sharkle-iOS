//
//  MyPageView.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        ScrollView(.vertical) {
            //ClubItemsRow(circles: [Circle])
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Now")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.leading, 15)
                
                ForEach(1..<10) { _ in
                    ClubRow()
                }
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}