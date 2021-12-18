//
//  FontModifier.swift
//  marvel-app-swiftui
//
//  Created by Ruben Marquez on 18/12/21.
//

import Foundation
import SwiftUI

enum FontTypes {
    case h1
    case h2
    case h3
    case label
    
    var font: Font {
        switch self {
        case .h1:
            return Font.system(.title)
        case .h2:
            return Font.system(.title2)
        case .h3:
            return Font.system(.title3)
        case .label:
            return Font.system(.body)
        }
    }
}

struct FontModifier: ViewModifier {
    
    // MARK: - Attributes
    let type: FontTypes
    
    // MARK: - Initializers
    
    init(_ type: FontTypes) {
        self.type = type
    }
    
    // MARK: - Body
    
    func body(content: Content) -> some View {
        content
            .font(type.font)
    }
}

extension View {
    func customFont(_ type: FontTypes) -> some View {
        modifier(FontModifier(type))
    }
}
