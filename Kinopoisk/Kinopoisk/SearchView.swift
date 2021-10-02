//
//  SearchView.swift
//  Kinopoisk
//
//  Created by Усман Туркаев on 27.09.2021.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            SearchBar(text: .constant(""))
            ScrollView {
                HorizontalSection(title: "Советуем посмотреть", cellRatio: 1)
                HorizontalSection(title: "Кураторы", cellRatio: 1)
                HorizontalSection(title: "Популярные персоны", cellRatio: 1.5)
                HorizontalSection(title: "Родились сегодня", cellRatio: 1.5)
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            Spacer()
        }
    }
}

struct HorizontalSection: View {
    
    @State var title: String
    
    var cellRatio: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
            Spacer()
            Text("Все")
                .foregroundColor(.secondary)
                .font(.system(size: 16, weight: .semibold, design: .default))
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 15)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 10) {
                ForEach(1..<10) { i in
                    HorizontalSectionCell(name: "Name", ratio: cellRatio)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct HorizontalSectionCell: View {
    var name: String
    
    var ratio: CGFloat
    
    var body: some View {
        VStack {
            Image(systemName: "film")
                .cornerRadius(10)
                .frame(width: 120, height: 120 * ratio, alignment: .center)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(5)
            HStack {
                Text(name)
                    .font(.system(size: 12, weight: .semibold, design: .monospaced))
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchView()
    }
}
