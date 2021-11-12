//
//  CharacterDataContainer.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct CharacterDataContainerEntity {
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [CharacterEntity]?
}
