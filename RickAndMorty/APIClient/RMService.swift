//
//  RMService.swift
//  RickAndMorty
//
//  Created by Cabral Costa, Eduardo on 03/05/23.
//

import Foundation

// Principal servico de requisicão de API para adquirir dados de Rick e Morty
final class RIMService {

    static let shared = RIMService()

    private init(){}

///    Chamada de API
///    - Parametros:
///      - request: Instancia de requisicão
///      - completion: Callback com os dados ou erro
    public func execute(_ request: RMRequest, completion: @scaping () -> void){

    }
}
