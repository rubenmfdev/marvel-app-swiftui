//
//  MarvelListViewModel.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation
import Combine

class MarvelListViewModel: ObservableObject {
    
    // MARK: - Publishers

    @Published var state: LoaderState<[CharacterEntity]> = .loading

    // MARK: - Attributes

    var characters: [CharacterEntity] = []
    var getCharactersUseCase: GetCharactersUseCaseProtocol
    var filter: CharacterFilterEntity = CharacterFilterEntity()
    var isLoadingData: Bool = false
    var hasMoreData: Bool = true
    private var cancellables = Set<AnyCancellable>()
    var isPullingToRefresh = false

    // MARK: - Initializer
    
    init(getCharactersUseCase: GetCharactersUseCaseProtocol) {
        self.getCharactersUseCase = getCharactersUseCase
        self.state = .loading
        self.loadCharacters()
    }
}

// MARK: - Public methods
extension MarvelListViewModel {
    func onPullToRefresh() {
        self.state = .loading
        self.resetCharacters()
        self.loadCharacters()
        self.isPullingToRefresh = false
    }
    
    func onEndReached() {
        if self.state.isSuccess() {
            self.loadCharacters()
        }
    }
}

private extension MarvelListViewModel {
    func loadCharacters() {
        let cancellable = self.getCharactersUseCase.execute(input: GetCharactersUseCaseInput(filters: self.filter))
            .sink { result in
                switch result {
                case let .success(value):
                    if let count = value.data?.count, let results = value.data?.results {
                        self.filter.offset = (self.filter.offset ?? 0) + count
                        self.characters.append(contentsOf: results)
                        self.state = .success(self.characters)
                        self.hasMoreData = results.count > 0
                    } else {
                        self.state = .failed(.GenericError)
                    }
                case let .failure(error):
                    self.state = .failed(error)
                }
            }
        self.cancellables.insert(cancellable)
    }
    
    func resetCharacters() {
        self.characters = []
        self.filter = CharacterFilterEntity()
    }
}

extension MarvelListViewModel {
    convenience init() {
        // Inyection
        let getCharactersUseCase = GetCharactersUseCase(
            repository: CharactersDataRepository(
                dataSource: CharactersNetworkDataSource()
            )
        )
        self.init(getCharactersUseCase: getCharactersUseCase)
    }
}
