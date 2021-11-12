//
//  ComicSummary.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct ComicSummaryDTO: Decodable {
    var resourceURI: String?
    var name: String?
}

extension ComicSummaryDTO {
    func toDomain() -> ComicSummaryEntity {
        return ComicSummaryEntity(
            resourceURI: self.resourceURI ?? "",
            name: self.name ?? ""
        )
    }
}

