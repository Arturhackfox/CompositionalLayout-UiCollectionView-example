//
//  BookCoverCollectionCell.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 01.02.2024.
//

import UIKit

class BookCoverCollectionCell: UICollectionViewCell {
    static let identifier = "BookCoverCollectionCell"
    
    // MARK: Ui
    private lazy var bookCoverImage: UIImageView = {
        let image = UIImage(named: "cover1")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        imageView.layer.shouldRasterize = true
        imageView.layer.rasterizationScale = UIScreen.main.scale
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "78%"
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var icon: UIImageView = {
        let image = UIImage(systemName: "cloud")
        let imageview = UIImageView(image: image)
        imageview.contentMode = .scaleAspectFit
        imageview.tintColor = .white
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        return imageview
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Layout
    
    private func setupHierarchy() {
        addSubview(bookCoverImage)
        addSubview(label)
        addSubview(icon)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            bookCoverImage.topAnchor.constraint(equalTo: topAnchor),
            bookCoverImage.bottomAnchor.constraint(equalTo:bottomAnchor, constant: -20),
            bookCoverImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookCoverImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            icon.topAnchor.constraint(equalTo: bookCoverImage.bottomAnchor, constant: 4),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor),
            icon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
}
