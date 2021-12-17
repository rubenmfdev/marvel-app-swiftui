//
//  MarvelListCellView.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 8/12/21.
//

import Foundation
import SwiftUI

struct MarvelListCellView: View {
    
    // MARK: - Attributes
    
    let imageSize: CGFloat = 90
    var character: CharacterEntity
    
    // MARK: - Body
    
    var body: some View {
        NavigationLink(
            destination:
                MarvelDetailView(characterId: character.id)
        ) {
            HStack {
                ImageLoaderView(url: URL(string: character.thumbnailURL()), placeholder: self.getPlaceHolder) { uiImage in
                    self.getImage(uiImage: uiImage)
                }
                .foregroundColor(Color.black)
                Text(character.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.black)
            }
        }
    }
}

private extension MarvelListCellView {
    
    @ViewBuilder
    func getPlaceHolder() -> some View {
        self.getModifiedImage(
            image: Image(Constants.Images.comicPlaceholderName)
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
                width: self.imageSize,
                height: self.imageSize,
                alignment: .leading
            )
            .aspectRatio(contentMode: .fill)
    }
}

struct MarvelListCellView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelListCellView(character: CharacterEntity.mock)
    }
}
