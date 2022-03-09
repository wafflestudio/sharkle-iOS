//
//  ClubItem.swift
//  sharkle
//
//  Created by 김우성 on 2022/03/09.
//

import SwiftUI

struct ClubItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(systemName: "")
                .frame(width: 84, height: 84, alignment: .center)
                .background(.gray)
                .cornerRadius(15)
            
            Text("동아리 이름 1")
                .frame(width: 84, height: 16, alignment: .center)
                .font(.system(size: 14, weight: .medium))
                .lineLimit(1)
            
            Text("#태그")
                .frame(width: 32, height: 14, alignment: .center)
                .background(Color("TagTextBackgroundColor"))
                .cornerRadius(7)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct ClubItem_Previews: PreviewProvider {
    static var previews: some View {
        ClubItem()
    }
}
