//
//  SeriesSummary.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct SeriesSummaryDTO: Decodable {
    var resourceURI: String?
    var name: String?
}

extension SeriesSummaryDTO {
    func toDomain() -> SeriesSummaryEntity {
        return SeriesSummaryEntity(
            resourceURI: self.resourceURI ?? "",
            name: self.name ?? ""
        )
    }
}


