//
//  CollectionViewCell.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 01.02.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
