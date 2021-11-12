//
//  CharactersDataRepository.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation
import Combine

class CharactersDataRepository: CharactersRepository {
    
    // MARK: - Attributes
    
    let dataSource: CharactersNetworkDataSourceProtocol
    
    // MARK: - Initializer
    
    init(dataSource: CharactersNetworkDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    // MARK: - CharactersRepository protocol
    
    func getCharacters(filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never> {
        self.dataSource.getCharacters(filters: filters)
    }
    
    func getCharacterWithId(_ characterId: Int, filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never> {
        self.dataSource.getCharactersWithId(characterId, filters: filters)
    }
}
