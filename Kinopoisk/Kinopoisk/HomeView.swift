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
                                HomeTab(index: i, name: tabNames[i], animation: animation, current: $selectedTab)
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
                            CardView()
                        }
                    }.padding(20)
                }
            }
            .navigationTitle("Онлайн-кинотеатр")
        }
    }
}

struct HomeTab: View {
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

struct CardView: View {
    
    @State var name = "Back to the future"
    @State var description = "Док и Марти летят в будущее"
    
    @State var imageWidth = UIScreen.main.bounds.size.width - 40
    @State var imageHeight = (UIScreen.main.bounds.size.width - 40) / 16 * 9
    
    var body: some View {
        VStack {
            Image(systemName: "film")
                .frame(width: imageWidth, height: imageHeight, alignment: .center)
                .aspectRatio(9/16, contentMode: .fill)
                .background(Color.secondary)
                .cornerRadius(5)
            Text(name)
                .font(.system(size: 17, weight: .semibold, design: .default))
            Text(description)
                .font(.system(size: 12, weight: .regular, design: .default))
        }
    }
}
