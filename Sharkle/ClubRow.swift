//
//  ClubRow.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import SwiftUI

struct ClubRow: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "")
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 156, alignment: .center)
                .background(Color("DarkGray"))
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
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 60)
            .background(.white)
            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
        }
        .frame(height: 216, alignment: .bottom)
        .padding(.horizontal, 15)
        .shadow(color: Color("DarkGray"), radius: 10, x: 0, y: 0)
    }
}

struct ClubRow_Previews: PreviewProvider {
    static var previews: some View {
        ClubRow()
    }
}
