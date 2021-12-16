//
//  MarvelListView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 18/11/21.
//

import Foundation
import SwiftUI

struct MarvelListView: View {
    
    // MARK: - Attributes
    
    @ObservedObject var viewModel: MarvelListViewModel = MarvelListViewModel()

    
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

extension MarvelListView {
    
    var placeholder: some View {
        self.getList(
            isPlaceholder: true,
            data: CharacterEntity.getMockList()
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
    
    func getSuccessList(data: [CharacterEntity]) -> some View {
        ScrollView {
            self.getList(isPlaceholder: false, data: data)
        }
    }
    
    func getList(isPlaceholder: Bool, data: [CharacterEntity]) -> some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(data, id: \.id) { element in
                    MarvelListCellView(character: element)
                }
            }
            .if(isPlaceholder) { view in
                view.redacted(reason: .placeholder)
            }
        }
    }
}

struct MarvelListView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelListView()
    }
}
