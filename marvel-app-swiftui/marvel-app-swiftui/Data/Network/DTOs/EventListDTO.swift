//
//  EventList.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct EventListDTO: Decodable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [EventSummaryDTO]?
}

extension EventListDTO {
    func toDomain() -> EventListEntity {
        return EventListEntity(
            available: self.available ?? 0,
            returned: self.returned ?? 0,
            collectionURI: self.collectionURI ?? "",
            items: self.getItems()
        )
    }
}

private extension EventListDTO {
    func getItems() -> [EventSummaryEntity]? {
        self.items?.map({ dto in
            dto.toDomain()
        })
    }
}

