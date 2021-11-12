//
//  GetCharactersUseCase.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation
import Combine

protocol GetCharactersUseCaseProtocol {
    func execute(input: GetCharactersUseCaseInput) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never>
}

class GetCharactersUseCase: GetCharactersUseCaseProtocol {

    // MARK: - Attributes
    
    let repository: CharactersRepository
    
    // MARK: - Initializer
    
    init(repository: CharactersRepository) {
        self.repository = repository
    }
    
    // MARK: - GetCharactersUseCaseProtocol
    
    func execute(input: GetCharactersUseCaseInput) -> AnyPublisher<Result<CharacterDataWrapperEntity, ErrorEntity>, Never> {
        self.repository.getCharacters(filters: input.filters)
    }
}

struct GetCharactersUseCaseInput {
    let filters: CharacterFilterEntity
}
