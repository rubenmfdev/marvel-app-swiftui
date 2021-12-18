//
//  Character.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct CharacterEntity: Identifiable {
    var id: Int
    var name: String
    var characterDescription: String
    var modified: String
    var resourceURI: String
    var urls: [UrlEntity]?
    var thumbnail: ImageEntity?
    var comics: ComicListEntity?
    var stories: StoryListEntity?
    var events: EventListEntity?
    var series: SeriesListEntity?
    
    func thumbnailURL() -> String {
        guard let thumbnail = self.thumbnail else { return "" }
        return  "\(thumbnail.path).\(thumbnail.imageExtension)"
    }
}

extension CharacterEntity {
    static var mock: CharacterEntity {
        return CharacterEntity(
            id: 0,
            name: "Comic test title & Avengers",
            characterDescription: "Test description",
            modified: "17/08/1997",
            resourceURI: "",
            urls: nil,
            thumbnail: nil,
            comics: nil,
            stories: nil,
            events: nil,
            series: nil
        )
    }
    
    static func getMockList(size: Int = 10) -> [CharacterEntity] {
        var list = [CharacterEntity]()
        if size < 1 { return list }
        for _ in 0...size {
            list.append(CharacterEntity.mock)
        }
        return list
    }
}
