//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Cabral Costa, Eduardo on 03/05/23.
//

import Foundation

// Objeto que representa o dado solicitado individualmente
final class RMRequest {
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }

    private let endpoint: RMEndpoint

    private let pathComponents: Set<String>

    private let queryParameters: [URLQueryItem]

//    Construcão da url para requisicão
    private var urlString: String{
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue

        if !pathComponents.isEmpty{
            string += "/"
            pathComponents.forEach({
                string += "/\($0)"
            })
        }

        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")

            string += argumentString
        }

        return string
    }

    public var url: URL? {
        return URL(string: urlString)
    }

    public let httpMethod = "GET"

    // MARK:  - Public

    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
