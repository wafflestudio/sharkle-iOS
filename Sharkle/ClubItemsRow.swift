//
//  ClubItemsRow.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import SwiftUI

struct ClubItemsRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("지금 알림 신청 중!")
                .font(.system(size: 24, weight: .bold))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(1..<10) { _ in
                        ClubItem()
                    }
                }
            }
            .frame(width: 360, height: 128)
        }
    }
}

struct ClubItemsRow_Previews: PreviewProvider {
    static var previews: some View {
        ClubItemsRow()
    }
}
