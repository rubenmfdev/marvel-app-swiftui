//
//  CharactersNetworkDataSource.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation
import Combine

protocol CharactersNetworkDataSourceProtocol {
    func getCharacters(filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never>
    func getCharactersWithId(_ characterId: Int, filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never>
}

class CharactersNetworkDataSource: CharactersNetworkDataSourceProtocol {
    func getCharacters(filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never> {
        self.getCharactersAdapter(filters: filters)
            .map { result in
                result.map { dto in
                    dto.toDomain()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func getCharactersWithId(_ characterId: Int, filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never> {
        self.getCharacterWithIdAdapter(characterId, filters: filters)
            .map { result in
                result.map { dto in
                    dto.toDomain()
                }
            }
            .eraseToAnyPublisher()
    }
}

private extension CharactersNetworkDataSource {
    func getCharactersAdapter(filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperDTO, ErrorEntity>, Never>{
        let router = CharactersRouter(.character(filters: filters))
        return NetworkManager.shared().requestObject(router)
    }
    
    func getCharacterWithIdAdapter(_ characterId: Int, filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperDTO, ErrorEntity>, Never> {
        let router = CharactersRouter(.characterWithId(characterId, filters: filters))
        return NetworkManager.shared().requestObject(router)
    }
}
