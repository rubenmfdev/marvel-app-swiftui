//
//  StoryList.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct StoryListDTO: Decodable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [StorySummaryDTO]?
}

extension StoryListDTO {
    func toDomain() -> StoryListEntity {
        return StoryListEntity(
            available: self.available ?? 0,
            returned: self.returned ?? 0,
            collectionURI: self.collectionURI ?? "",
            items: self.getItems()
        )
    }
}

private extension StoryListDTO {
    func getItems() -> [StorySummaryEntity]? {
        self.items?.map({ dto in
            dto.toDomain()
        })
    }
}
