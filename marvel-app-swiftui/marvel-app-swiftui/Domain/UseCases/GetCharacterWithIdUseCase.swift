//
//  GetCharacterUseCase.swift
//  marvel-app
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
import Combine

protocol GetCharacterWithIdUseCaseProtocol {
    func execute(input: GetCharacterWithIdUseCaseInput) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never>
}

class GetCharacterWithIdUseCase: GetCharacterWithIdUseCaseProtocol {

    // MARK: - Attributes
    
    let repository: CharactersRepository
    
    // MARK: - Initializer
    
    init(repository: CharactersRepository) {
        self.repository = repository
    }
    
    // MARK: - GetCharactersUseCaseProtocol
    
    func execute(input: GetCharacterWithIdUseCaseInput) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never> {
        self.repository.getCharacterWithId(input.characterId, filters: input.filters)
    }
}

struct GetCharacterWithIdUseCaseInput {
    let characterId: Int
    let filters: CharacterFilterEntity
}
