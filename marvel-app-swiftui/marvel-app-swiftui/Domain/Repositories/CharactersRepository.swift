//
//  CharactersRepository.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation
import Combine

protocol CharactersRepository {
    func getCharacters(filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never>
    func getCharacterWithId(_ characterId: Int, filters: CharacterFilterEntity) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never>
}
