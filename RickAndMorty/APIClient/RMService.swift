//
//  RMService.swift
//  RickAndMorty
//
//  Created by Cabral Costa, Eduardo on 03/05/23.
//

import Foundation

// Principal servico de requisicão de API para adquirir dados de Rick e Morty
final class RMService {

    static let shared = RMService()

    private init(){}

///    Chamada de API
///    - Parametros:
///      - request: Instancia de requisicão
///      - type: O tipo do objeto que receberá
///      - completion: Callback com os dados ou erro
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
    }
}
