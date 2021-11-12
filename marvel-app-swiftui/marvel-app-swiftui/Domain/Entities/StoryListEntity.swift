//
//  StoryList.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct StoryListEntity {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [StorySummaryEntity]?
}
