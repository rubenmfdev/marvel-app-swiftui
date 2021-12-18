//
//  Character.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct CharacterDTO: Decodable {
    var id: Int?
    var name: String?
    var characterDescription: String?
    var modified: String?
    var resourceURI: String?
    var urls: [UrlDTO]?
    var thumbnail: ImageDTO?
    var comics: ComicListDTO?
    var stories: StoryListDTO?
    var events: EventListDTO?
    var series: SeriesListDTO?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case characterDescription = "description"
        case modified
        case resourceURI
        case urls
        case thumbnail
        case comics
        case stories
        case events
        case series
    }
}

extension CharacterDTO {
    func toDomain() -> CharacterEntity {
        return CharacterEntity(
            id: self.id ?? 0,
            name: self.name ?? "",
            characterDescription: self.characterDescription ?? "",
            modified: self.modified ?? "",
            resourceURI: self.resourceURI ?? "",
            urls: self.getURLs(),
            thumbnail: self.thumbnail?.toDomain(),
            comics: self.comics?.toDomain(),
            stories: self.stories?.toDomain(),
            events: self.events?.toDomain(),
            series: self.series?.toDomain()
        )
    }
}

private extension CharacterDTO {
    func getURLs() -> [UrlEntity]? {
        self.urls?.map({ dto in
            dto.toDomain()
        })
    }
}
