//
//  TopTabBar.swift
//  sharkle
//
//  Created by 김우성 on 2022/03/09.
//

import SwiftUI

struct TopTabBar: View {
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Button{
                selected = 0
            } label: {
                Text("MY")
                    .font(.system(size: 18, weight: selected == 0 ? .bold : .medium))
                    .foregroundColor(
                        selected == 0 ? .black : .gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            Button{
                selected = 1
            } label: {
                Text("모집중")
                    .font(.system(size: 18, weight: selected == 1 ? .bold : .medium))
                    .foregroundColor(selected == 1 ? .black : .gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            Button{
                selected = 2
            } label: {
                Text("전체")
                    .font(.system(size: 18, weight: selected == 2 ? .bold : .medium))
                    .foregroundColor(selected == 2 ? .black : .gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            Button{
                selected = 3
            } label: {
                Text("분야별")
                    .font(.system(size: 18, weight: selected == 3 ? .bold : .medium))
                    .foregroundColor(selected == 3 ? .black : .gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 42, maxHeight: 42)
        .background(.white)
    }
}

struct TopTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TopTabBar(selected: .constant(0))
    }
}
