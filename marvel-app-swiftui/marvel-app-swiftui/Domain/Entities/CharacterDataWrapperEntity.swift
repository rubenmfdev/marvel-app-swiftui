//
//  CharacterDataWrapper.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct CharacterDataWrapperEntity {
    var code: Int
    var status: String
    var copyright: String
    var attributionText: String
    var attributionHTML: String
    var data: CharacterDataContainerEntity?
    var etag: String
}

