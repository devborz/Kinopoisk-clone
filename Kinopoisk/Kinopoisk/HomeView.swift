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
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(0..<4, id: \.self) { i in
                            HomeTab(name: tabNames[i])
                        }
                    }.padding(20)
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
    @State var name: String
    var body: some View {
        Text(name)
            .bold()
            .font(.system(size: 20, weight: .bold, design: .default))
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
