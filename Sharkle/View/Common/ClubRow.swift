//
//  ClubRow.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import SwiftUI

struct ClubRow: View {
    var body: some View {
        HStack() {
            VStack(alignment: .leading, spacing: 15) {
                Text("동아리 이름 1")
                    .frame(height: 16, alignment: .leading)
                    .font(.system(size: 18, weight: .medium))
                    .lineLimit(1)
                
                Text("현재 20기 모집중입니다. 와플스튜디오는 개발동아리 입니다. 신청기한은 2월 19일까지 입니다 .")
                    .frame(alignment: .leading)
                    .font(.system(size: 14, weight: .light))
                    .lineLimit(2)
            }
            .padding(.leading, 20)
            
            Spacer()
            
            Image(systemName: "")
                .frame(width: 84, height: 84, alignment: .center)
                .background(Color("LightGray"))
                .cornerRadius(15)
                .padding(.trailing, 20)
        }
        .padding(.vertical, 10)
    }
}

struct ClubRow_Previews: PreviewProvider {
    static var previews: some View {
        ClubRow()
    }
}
