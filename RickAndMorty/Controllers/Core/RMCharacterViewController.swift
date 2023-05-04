//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Cabral Costa, Eduardo on 03/05/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"

        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "Rick")
            ]
        )
        print(request.url)

        RMService.shared.execute(
            request,
            expecting: RMCharacter.self
        ) {
            result in
        }
    }
}
