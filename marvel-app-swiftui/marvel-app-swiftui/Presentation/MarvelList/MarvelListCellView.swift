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
                AsyncImageView(
                    urlString: character.thumbnailURL(),
                    placeholderName: Constants.Images.comicPlaceholderName,
                    imageHeight: self.imageSize,
                    imageWidth: self.imageSize
                )
                .foregroundColor(Color.black)
                Text(character.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct MarvelListCellView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelListCellView(character: CharacterEntity.mock)
    }
}
