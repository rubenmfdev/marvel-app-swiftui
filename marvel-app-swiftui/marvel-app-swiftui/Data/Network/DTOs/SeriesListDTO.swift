//
//  SeriesList.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct SeriesListDTO: Decodable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [SeriesSummaryDTO]?
}

extension SeriesListDTO {
    func toDomain() -> SeriesListEntity {
        return SeriesListEntity(
            available: self.available ?? 0,
            returned: self.returned ?? 0,
            collectionURI: self.collectionURI ?? "",
            items: self.getItems()
        )
    }
}

private extension SeriesListDTO {
    func getItems() -> [SeriesSummaryEntity]? {
        self.items?.map({ dto in
            dto.toDomain()
        })
    }
}

