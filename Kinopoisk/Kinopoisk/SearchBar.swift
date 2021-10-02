//
//  SearchBar.swift
//  Kinopoisk
//
//  Created by Усман Туркаев on 27.09.2021.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State var isEditing = false
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding(.leading, 10)
                TextField("Поиск", text: $text, onEditingChanged: { isEditing in
                    withAnimation(.easeOut) {
                        self.isEditing = isEditing
                    }
                })
            }
            .frame(minHeight: 40)
            .background(Color(UIColor.systemGray5))
            .cornerRadius(10)
            
            if isEditing {
                Button("Cancel") {
                    UIApplication.shared.endEditing()
                }
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .padding(.horizontal, 15)
        .padding(.bottom, 10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}

// extension for keyboard to dismiss
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
