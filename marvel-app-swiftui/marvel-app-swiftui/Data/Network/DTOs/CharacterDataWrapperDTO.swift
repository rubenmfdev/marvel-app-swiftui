//
//  CharacterDataWrapper.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation

struct CharacterDataWrapperDTO: Decodable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var data: CharacterDataContainerDTO?
    var etag: String?
}

extension CharacterDataWrapperDTO {
    func toDomain() -> CharacterDataWrapperEntity {
        return CharacterDataWrapperEntity(
            code: self.code ?? 0,
            status: self.status ?? "",
            copyright: self.copyright ?? "",
            attributionText: self.attributionText ?? "",
            attributionHTML: self.attributionHTML ?? "",
            data: self.data?.toDomain(),
            etag: self.etag ?? ""
        )
    }
}

