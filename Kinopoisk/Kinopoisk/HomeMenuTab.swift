//
//  HomeMenuTab.swift
//  Kinopoisk
//
//  Created by Усман Туркаев on 06.10.2021.
//

import SwiftUI

struct HomeMenuTab: View {
    var index: Int
    @State var name: String
    
    var animation: Namespace.ID
    
    @Binding var current: Int
    
    var body: some View {
        VStack(spacing: 2) {
            Text(name)
                .bold()
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(Color(index == current ? UIColor.label : UIColor.secondaryLabel))
                .animation(.easeOut(duration: 0.25))
                .transition(.opacity)
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(.clear)
                    .frame(height: 3)
                if index == current {
                    RoundedRectangle(cornerRadius: 1.5)
                        .fill(.orange)
                        .frame(height: 3)
                        .animation(.easeOut(duration: 0.25))
                        .matchedGeometryEffect(id: "tab", in: animation)
                }
            }
        }
    }
}

