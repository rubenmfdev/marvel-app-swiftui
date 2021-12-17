//
//  MarvelDetailView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 16/12/21.
//

import Foundation
import SwiftUI

struct MarvelDetailView: View {
    
    // MARK: - Attributes
    
    @ObservedObject var viewModel: MarvelDetailViewModel

    // MARK: - Initializers
    
    init(characterId: Int) {
        self.viewModel = MarvelDetailViewModel(
            characterId: characterId
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            switch self.viewModel.state {
            case .loading:
                placeholder
            case let .failed(error):
                self.getFailedView(error: error)
            case let .success(data):
                self.getSuccessList(data: data)
            }
        }
        .onAppear(perform: self.viewModel.onAppear)
    }
}

extension MarvelDetailView {
    
    var placeholder: some View {
        self.getView(
            isPlaceholder: true,
            data: CharacterEntity.mock
        )
    }
    
    func getFailedView(error: ErrorEntity) -> some View {
        Text("error".localize)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
    }
    
    func getSuccessList(data: CharacterEntity) -> some View {
        self.getView(
            isPlaceholder: false,
            data: data
        )

    }
    
    func getView(isPlaceholder: Bool, data: CharacterEntity) -> some View {
        Image(Constants.Images.comicPlaceholderName)
    }
}

struct MarvelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelDetailView(characterId: 0)
    }
}
