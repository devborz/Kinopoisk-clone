//
//  HomeView.swift
//  Kinopoisk
//
//  Created by Усман Туркаев on 27.09.2021.
//

import SwiftUI

struct HomeView: View {
    
    var tabNames = [
        "Мое кино",
        "Магазин",
        "Покупки",
        "Загрузки"
    ]
    
    @State var selectedTab = 0
    
    @Namespace var animation
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ScrollViewReader { value in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 0) {
                            
                            ForEach(0..<4, id: \.self) { i in
                                HomeMenuTab(index: i, name: tabNames[i], animation: animation, current: $selectedTab)
                                    .onTapGesture {
                                        selectedTab = i
                                        withAnimation {
                                            value.scrollTo(i)
                                        }
                                        print(i)
                                    }
                                    .frame(height: 55)
                                    .padding(.leading, 20)
                                    .padding(.trailing, i == 3 ? 20 : 0)
                            }
                        }
                        .frame(height: 55)
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(0..<4, id: \.self) { i in
                            switch selectedTab {
                            case 0:
                                WatchSquareCard()
                            default:
                                HorizontalCardView()
                            }
                        }
                    }.padding(.horizontal, 20)
                }
            }
            .navigationTitle("Онлайн-кинотеатр")
        }
    }
}

