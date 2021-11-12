//
//  Character.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct CharacterEntity {
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
        return  "\(thumbnail.path ?? "").\(thumbnail.imageExtension ?? "")"
    }
}
