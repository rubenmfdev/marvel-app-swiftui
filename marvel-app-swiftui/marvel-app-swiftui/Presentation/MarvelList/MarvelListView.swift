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
        .navigationTitle("marvelList_title".localize)
    }
}

extension MarvelListView {
    
    var placeholder: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(CharacterEntity.getMockList(), id: \.id) { element in
                    MarvelListCellView(character: element)
                }
            }
            .redacted(reason: .placeholder)
        }
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
        InfiniteScrollView(
            data: data,
            onEndReached: self.viewModel.onEndReached,
            onPullToRefresh: self.viewModel.onPullToRefresh
        ) { element in
            MarvelListCellView(character: element)
        }
    }
}

struct MarvelListView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelListView()
    }
}
