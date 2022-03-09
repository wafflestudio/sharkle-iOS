//
//  ClubRow.swift
//  sharkle
//
//  Created by 김우성 on 2022/03/09.
//

import SwiftUI

struct ClubRow: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "")
                .frame(width: 358, height: 156, alignment: .center)
                .background(Color("TagTextBackgroundColor"))
                .cornerRadius(10, corners: [.topLeft, .topRight])
            
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .top) {
                    Text("와플 스튜디오")
                        .font(.system(size: 18, weight: .medium))
                        .padding(.leading, 10)

                    
                    Spacer()
                    
                    Text("2022.02.25")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color("TagTextBackgroundColor"))
                        .padding(.trailing, 5)
                }
                
                Text("현재 20기 모집중입니다. 와플스튜디오는 개발 동아리입니다.")
                    .font(.system(size: 10, weight: .regular))
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .padding(.leading, 10)
                }
            .frame(width: 358, height: 60)
            .background(.white)
            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
        }
        .frame(width: 358, height: 216, alignment: .bottom)
        .shadow(color: .gray, radius: 5, x: 0, y: 1)
    }
}

struct ClubRow_Previews: PreviewProvider {
    static var previews: some View {
        ClubRow()
    }
}
