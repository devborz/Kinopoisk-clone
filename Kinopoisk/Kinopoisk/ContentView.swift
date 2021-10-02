//
//  ContentView.swift
//  Kinopoisk
//
//  Created by Усман Туркаев on 26.09.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Label("", systemImage: "house")
            }
            MediaView().tabItem {
                Label("", systemImage: "rectangle.portrait.on.rectangle.portrait")
            }
            SearchView().tabItem {
                Label("", systemImage: "magnifyingglass")
            }
            AccountView().tabItem {
                Label("", systemImage: "person.crop.circle")
            }
        }
        .accentColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
