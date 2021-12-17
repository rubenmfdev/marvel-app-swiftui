//
//  PullToRefreshView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 16/12/21.
//

import Foundation
import SwiftUI

struct ScrollViewOffset<Content: View>: View {
    let axes: Axis.Set
    let showsIndicators: Bool
    let content: () -> Content
    let onOffsetChange: ((CGFloat) -> Void)?
    
    init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = false,
        @ViewBuilder content: @escaping () -> Content,
        onOffsetChange: ((CGFloat) -> Void)?
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.content = content
        self.onOffsetChange = onOffsetChange
    }
    
    var body: some View {
        ScrollView(self.axes, showsIndicators: self.showsIndicators) {
            offsetReader
            content()
                .padding(.top, -8)
        }
        .coordinateSpace(name: "frameLayer")
        .onPreferenceChange(OffsetPreferenceKey.self, perform: self.onOffsetChange ?? self.defaultOffsetAction)
    }
    
    var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .named("frameLayer")).minY
                )
        }
        .frame(height: 0) 
    }
    
    func defaultOffsetAction(offest: CGFloat) {
        return
    }
}

struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
