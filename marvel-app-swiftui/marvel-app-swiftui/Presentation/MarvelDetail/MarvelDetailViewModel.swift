//
//  MarvelDetailViewModel.swift
//  marvel-app
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
import Combine

class MarvelDetailViewModel: ObservableObject {
    
    // MARK: - Publishers

    @Published var state: LoaderState<CharacterEntity> = .loading
    
    // MARK: - Attributes
    
    var getCharacterWithIdUseCase: GetCharacterWithIdUseCaseProtocol
    var filter: CharacterFilterEntity = CharacterFilterEntity()
    var characterId: Int
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initializer
    
    init(getCharacterWithIdUseCase: GetCharacterWithIdUseCaseProtocol, characterId: Int) {
        self.getCharacterWithIdUseCase = getCharacterWithIdUseCase
        self.characterId = characterId
    }
        
    // MARK: - OnAppear
    
    func onAppear() {
        self.loadCharacter()
    }
}

private extension MarvelDetailViewModel {
    func loadCharacter() {
        self.state = .loading
        let cancellable = self.getCharacterWithIdUseCase.execute(
            input: GetCharacterWithIdUseCaseInput(
                characterId: self.characterId,
                filters: self.filter
            )
        )
            .sink { result in
                switch result {
                case let .success(value):
                    if let results = value.data?.results, let character = results.first {
                        self.state = .success(character)
                    } else {
                        self.state = .failed(.GenericError)
                    }
                case let .failure(error):
                    self.state = .failed(error)
                }
            }
        self.cancellables.insert(cancellable)
    }
}

extension MarvelDetailViewModel {
    convenience init(characterId: Int) {
        let charactersNetworkDataSource = CharactersNetworkDataSource()
        let charactersDataRepository = CharactersDataRepository(dataSource: charactersNetworkDataSource)
        let getCharacterWithIdUseCase = GetCharacterWithIdUseCase(repository: charactersDataRepository)
        self.init(getCharacterWithIdUseCase: getCharacterWithIdUseCase, characterId: characterId)
    }
}
