//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Cabral Costa, Eduardo on 05/05/23.
//

import UIKit

// View responsável por mostrar a lista de personagens, loader, etc.
final class RMCharacterListView: UIView {

    private let viewModel = RMCharacterListViewViewModel()

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false

        return spinner
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false

        //Spinner
        addSubviews(collectionView, spinner)
        addConstraints()
        spinner.startAnimating()

        viewModel.delegate = self
        viewModel.fetchCharacters()

        setUpCollectionView()
    }

    required init?(coder: NSCoder){
        fatalError("Unsupported")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setUpCollectionView(){
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }

}

extension RMCharacterListView: RMCharacterListViewViewModelDelegate{
    func didLoadInitialCharacter() {
        self.spinner.stopAnimating()

        collectionView.isHidden = false
        collectionView.reloadData()

        //collectionView.alpha = 1

        UIView.animate(withDuration: 0.4){
            self.collectionView.alpha = 1
        }
    }
}
