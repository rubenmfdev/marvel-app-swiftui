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
        HStack {
            Image(Constants.Images.comicPlaceholderName)
                .resizable()
                .frame(width: self.imageSize, height: self.imageSize, alignment: .leading)
            Text(character.name)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct MarvelListCellView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelListCellView(character: CharacterEntity.mock)
    }
}
