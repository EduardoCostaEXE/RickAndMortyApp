//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Cabral Costa, Eduardo on 05/05/23.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
