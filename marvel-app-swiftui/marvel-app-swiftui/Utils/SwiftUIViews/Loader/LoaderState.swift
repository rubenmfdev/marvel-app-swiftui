//
//  LoaderState.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 18/11/21.
//

import Foundation

enum LoaderState<T> {
    case loading
    case success(T)
    case failed(ErrorEntity)
}
