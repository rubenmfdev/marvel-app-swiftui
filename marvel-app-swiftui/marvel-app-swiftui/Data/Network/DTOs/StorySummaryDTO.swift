//
//  StorySummary.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct StorySummaryDTO: Decodable {
    var resourceURI: String?
    var name: String?
    var type: String?
}

extension StorySummaryDTO {
    func toDomain() -> StorySummaryEntity {
        return StorySummaryEntity(
            resourceURI: self.resourceURI ?? "",
            name: self.name ?? "",
            type: self.type ?? ""
        )
    }
}

