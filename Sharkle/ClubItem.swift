//
//  ClubItem.swift
//  Sharkle
//
//  Created by 김우성 on 2022/03/15.
//

import SwiftUI

struct ClubItem: View {
    @State var circle: Circle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(systemName: "")
                .frame(width: 84, height: 84, alignment: .center)
                .background(Color("LightGray"))
                .cornerRadius(15)
            
            Text(circle.name)
                .frame(width: 84, height: 16, alignment: .leading)
                .font(.system(size: 14, weight: .medium))
                .lineLimit(1)
                
            
            Text("#" + circle.tag)
                .frame(width: 32, height: 14, alignment: .center)
                .background(Color("DarkGray"))
                .cornerRadius(7)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct ClubItem_Previews: PreviewProvider {
    static var previews: some View {
        ClubItem(circle: Circle(id: 0, type0: 0, type1: 0, name: "Name", bio: "", introduction: "", tag: "태그", tag_integer: [], homepage: Homepage(id: 0, homepage: "", facebook: "", instagram: "", twitter: "", youtube: "", tiktok: "", band: "")))
    }
}
