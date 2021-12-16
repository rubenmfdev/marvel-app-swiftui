//
//  Image.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct ImageDTO: Decodable {
    var path: String?
    var imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
            case path
            case imageExtension = "extension"
        }
}

extension ImageDTO {
    func toDomain() -> ImageEntity {
        return ImageEntity(
            path: self.path ?? "",
            imageExtension: self.imageExtension ?? ""
        )
    }
}

