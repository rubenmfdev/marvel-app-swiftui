//
//  StoryList.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation
import ObjectMapper

public class StoryListEntity: NSObject, Mappable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [StorySummaryEntity]?

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        available                   <- map["available"]
        returned                    <- map["returned"]
        collectionURI               <- map["collectionURI"]
        items                       <- map["items"]
    }
}
