//
//  CompositionalCell.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 01.02.2024.
//

import UIKit

class CompositionalCell: UICollectionViewCell {
    static let identifier = "CompositionalCell"
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        backgroundColor = .systemBackground
        backgroundColor = .systemGreen
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Layout
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    func configure(with imageName: String) {
        
    }
}
