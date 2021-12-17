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

extension LoaderState {
    func isSuccess() -> Bool {
        switch self {
        case .loading:
            return false
        case .success:
            return true
        case .failed:
            return false
        }
    }
}
