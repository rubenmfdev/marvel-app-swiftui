//
//  Url.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct UrlDTO: Decodable {
    var type: String?
    var url: String?
}

extension UrlDTO {
    func toDomain() -> UrlEntity {
        return UrlEntity(
            type: self.type ?? "",
            url: self.url ?? ""
        )
    }
}

