//
//  ContentView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 20/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            MarvelListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
