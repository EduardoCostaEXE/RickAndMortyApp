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

    enum RMServiceError: Error{
        case failedToCreateRequest
        case failedToGetData
    }

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
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else{
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }

            // Decode
            do{
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }

//    MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest?{
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod

        return request
    }

}
