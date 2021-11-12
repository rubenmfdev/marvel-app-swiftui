//
//  MarvelDetailViewModel.swift
//  marvel-app
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
import Combine

protocol MarvelDetailViewModelProtocol {
    func loadCharacter()
    func getCharacter() -> CharacterEntity?
}

class MarvelDetailViewModel: MarvelDetailViewModelProtocol {
    
    // MARK: - Attributes
    
    var character: CharacterEntity?
    var getCharacterWithIdUseCase: GetCharacterWithIdUseCaseProtocol
    var filter: CharacterFilterEntity = CharacterFilterEntity()
    var characterId: Int
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initializer
    
    init(getCharacterWithIdUseCase: GetCharacterWithIdUseCaseProtocol, characterId: Int) {
        self.getCharacterWithIdUseCase = getCharacterWithIdUseCase
        self.characterId = characterId
    }
    
    // MARK: - MarvelListViewModelProtocol
    
    func loadCharacter() {
        let cancellable = self.getCharacterWithIdUseCase.execute(
            input: GetCharacterWithIdUseCaseInput(
                characterId: self.characterId,
                filters: self.filter
            )
        )
            .sink { result in
                switch result {
                case let .success(value):
                    if let results = value.data?.results {
                        self.character = results.first
                        //TODO
                    } else {
                        //TODO
                    }
                case let .failure(error):
                    //TODO
                    return
                }
            }
        self.cancellables.insert(cancellable)
        
    }
    
    func getCharacter() -> CharacterEntity? {
        return self.character
    }
    
}
