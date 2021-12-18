//
//  InfiniteScrollView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 17/12/21.
//

import Foundation
import SwiftUI

struct InfiniteScrollView<Data, Content>: View where Data : RandomAccessCollection, Data.Element : Identifiable, Content : View  {
    
    // MARK: - Attributes
    
    var data: Data
    let content: (Data.Element) -> Content
    let onEndReached: () -> Void
    let onPullToRefresh: () -> Void
    @State private var isPullingToRefresh = false
    
    // MARK: - Initializer
    
    init(
        data: Data,
        onEndReached: @escaping () -> Void,
        onPullToRefresh: @escaping () -> Void,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.onEndReached = onEndReached
        self.onPullToRefresh = onPullToRefresh
        self.content = content
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollViewOffset {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(data, id: \.id) { element in
                    content(element)
                        .onAppear {
                            if data[data.count-10 as! Data.Index].id == element.id {
                                self.onEndReached()
                            }
                        }
                }
            }
        } onOffsetChange: {
            self.onRefresh(offset: $0)
        }
    }
}

private extension InfiniteScrollView {
    func onRefresh(offset: CGFloat) {
        if offset > 20 {
            self.isPullingToRefresh = true
        } else if offset == 0 && self.isPullingToRefresh {
            self.onPullToRefresh()
        } else {
            // Nothing to do
        }
    }
}
