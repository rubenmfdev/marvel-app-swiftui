//
//  Loader.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 18/11/21.
//

import Foundation
import SwiftUI
import Combine

struct Loader: View {

    // MARK: - Attributes
    
    private var state: LoaderState<Any>
    private var getPlaceholderView: () -> AnyView
    private var getErrorView: (Error) -> AnyView
    private var getContentView: (Any) -> AnyView
    
    // MARK: - Initializer

    init(
        state: LoaderState<Any>,
        getPlaceholderView: @escaping () -> AnyView,
        getErrorView: @escaping (Error) -> AnyView,
        getContentView: @escaping (Any) -> AnyView
    ) {
        self.state = state
        self.getPlaceholderView = getPlaceholderView
        self.getErrorView = getErrorView
        self.getContentView = getContentView
    }
    
    var body: some View {
        Text("")
    }

}
