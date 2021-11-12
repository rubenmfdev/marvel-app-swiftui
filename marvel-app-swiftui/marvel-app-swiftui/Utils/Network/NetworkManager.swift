//
//  NetworkManager.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

import Foundation
import Alamofire
import Combine

class NetworkManager {
    
    // MARK: - Attributes
    
    private let sessionManager: Session
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager(sessionManager: Session())
        return networkManager
    }()
    
    // MARK: - Initializers
    
    private init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }
    
    // MARK: - Accessors
    
    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
    
    // MARK: - Public methods
    
    func requestObject<T: Decodable>(_ router: BaseRouter) -> AnyPublisher<Result<T, ErrorEntity>, Never> {
        self.sessionManager.request(router)
            .validate()
            .publishDecodable(type: T.self)
            .map { response in
                let dataResponse = response.mapError { error in
                    return ErrorEntity.GenericError
                }
                switch dataResponse.result {
                case let .success(item):
                    return .success(item)
                case let .failure(error):
                    return .failure(error)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
