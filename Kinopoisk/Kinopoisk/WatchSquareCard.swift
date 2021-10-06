//
//  WatchSquareCard.swift
//  Kinopoisk
//
//  Created by Усман Туркаев on 06.10.2021.
//

import SwiftUI

struct WatchSquareCard: View {
    
    @State var imageWidth = UIScreen.main.bounds.size.width - 40
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(systemName: "film")
                .frame(width: imageWidth, height: imageWidth, alignment: .center)
                .background(Color.secondary)
                .cornerRadius(6)
            VStack(alignment: .center, spacing: nil) {
                Button(action: {
                    
                }, label: {
                    Label("Смотреть", systemImage: "play.fill")
                        .font(.system(size: 16, weight: .bold, design: .default))
                })
                    .frame(width: 150, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.orange)
                    )
                Spacer()
            }
            .frame(width: imageWidth, height: 60, alignment: .center)
        }
    }
}
