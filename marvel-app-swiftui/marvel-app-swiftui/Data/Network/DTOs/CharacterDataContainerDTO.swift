//
//  CharacterDataContainer.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct CharacterDataContainerDTO: Decodable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [CharacterDTO]?
}

extension CharacterDataContainerDTO {
    func toDomain() -> CharacterDataContainerEntity {
        return CharacterDataContainerEntity(
            offset: self.offset ?? 0,
            limit: self.limit ?? 0,
            total: self.total ?? 0,
            count: self.count ?? 0,
            results: self.getResults()
        )
    }
}

private extension CharacterDataContainerDTO {
    func getResults() -> [CharacterEntity]? {
        self.results?.map({ dto in
            dto.toDomain()
        })
    }
}
