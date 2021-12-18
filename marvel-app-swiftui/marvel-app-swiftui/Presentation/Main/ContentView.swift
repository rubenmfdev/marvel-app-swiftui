//
//  ContentView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 20/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Attributes
    
    @StateObject var mainViewModel = MainViewModel()
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            if self.mainViewModel.splashShowed {
                MarvelListView()
            } else {
                SplashView()
            }
        }
        .environmentObject(self.mainViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
