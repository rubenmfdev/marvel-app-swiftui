//
//  ContentView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 20/06/2021.
//

import SwiftUI

struct ContentView: View {

    let characters: [CharacterEntity] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(characters, id: \.id) { item in
                    HStack {
                        AsyncImage(url: URL(string: item.thumbnailURL())!,
                                       placeholder: { Text("Loading ...") },
                                       image: { Image(uiImage: $0).resizable() })
                               .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3)
                        Text(item.name ?? "")
                    }
                }
            }.navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
