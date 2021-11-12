//
//  EventSummary.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct EventSummaryDTO: Decodable {
    var resourceURI: String?
    var name: String?
}

extension EventSummaryDTO {
    func toDomain() -> EventSummaryEntity {
        return EventSummaryEntity(
            resourceURI: self.resourceURI ?? "",
            name: self.name ?? ""
        )
    }
}

