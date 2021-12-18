//
//  AsyncImageView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 18/12/21.
//

import Foundation
import SwiftUI
import Combine

struct AsyncImageView: View {
    
    // MARK: - Attributes
    
    private let urlString: String
    private let placeholderName: String
    private let imageHeight: CGFloat?
    private let imageWidth: CGFloat?

    // MARK: - Init

    init(
        urlString: String,
        placeholderName: String,
        imageHeight: CGFloat? = nil,
        imageWidth: CGFloat? = nil
    ) {
        self.urlString = urlString
        self.placeholderName = placeholderName
        self.imageHeight = imageHeight
        self.imageWidth = imageWidth
    }
    
    var body: some View {
        ImageLoaderView(
            url: URL(string: urlString),
            placeholder: self.getPlaceHolder
        ) { uiImage in
            self.getImage(uiImage: uiImage)
        }
    }
}

private extension AsyncImageView {
    @ViewBuilder
    func getPlaceHolder() -> some View {
        self.getModifiedImage(
            image: Image(self.placeholderName)
        )
    }
    
    @ViewBuilder
    func getImage(uiImage: UIImage) -> some View {
        self.getModifiedImage(image: Image(uiImage: uiImage))
    }
    
    @ViewBuilder
    func getModifiedImage(image: Image) -> some View {
        image
            .resizable()
            .frame(
                width: self.imageWidth,
                height: self.imageHeight,
                alignment: .leading
            )
            .aspectRatio(contentMode: .fit)
    }
}
