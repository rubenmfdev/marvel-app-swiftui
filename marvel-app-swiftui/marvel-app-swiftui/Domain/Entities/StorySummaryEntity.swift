//
//  StorySummary.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation
import ObjectMapper

public class StorySummaryEntity: NSObject, Mappable {
    var resourceURI: String?
    var name: String?
    var type: String?

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        resourceURI                 <- map["resourceURI"]
        name                        <- map["name"]
        type                        <- map["type"]
    }
}