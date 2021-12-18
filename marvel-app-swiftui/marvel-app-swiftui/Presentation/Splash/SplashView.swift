//
//  SplashView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 18/12/21.
//

import Foundation
import SwiftUI

struct SplashView: View {
    
    // MARK: - Attribute
    
    @EnvironmentObject var mainViewModel: MainViewModel

    // MARK: - Body

    var body: some View {
        VStack {
            LottieView(
                animationName: "ironMan"
            ) {
                self.mainViewModel.splashShowed = true
            }
            .ignoresSafeArea()
            .scaledToFill()
        }
        .navigationBarHidden(true)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
