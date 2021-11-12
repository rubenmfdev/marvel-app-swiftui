//
//  ComicList.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct ComicListDTO: Decodable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [ComicSummaryDTO]?
}

extension ComicListDTO {
    func toDomain() -> ComicListEntity {
        return ComicListEntity(
            available: self.available ?? 0,
            returned: self.returned ?? 0,
            collectionURI: self.collectionURI ?? "",
            items: self.getItems()
        )
    }
}

private extension ComicListDTO {
    func getItems() -> [ComicSummaryEntity]? {
        self.items?.map({ dto in
            dto.toDomain()
        })
    }
}

