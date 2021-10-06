//
//  HorizontalCardView.swift
//  Kinopoisk
//
//  Created by Усман Туркаев on 06.10.2021.
//

import SwiftUI

struct HorizontalCardView: View {
    
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
