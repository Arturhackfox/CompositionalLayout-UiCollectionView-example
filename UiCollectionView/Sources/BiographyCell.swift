//
//  BiographyCell.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 02.02.2024.
//

import UIKit

class BiographyCollectionCell: UICollectionViewCell {
    static let identifier = "BiographyCollectionCell"
    
    // MARK: Ui
    private lazy var bookCoverImage: UIImageView = {
        let image = UIImage(named: "all")
        let imageView = UIImageView(image: image)
        
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true

        
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 7
        imageView.layer.shouldRasterize = true
        imageView.layer.rasterizationScale = UIScreen.main.scale
        

        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "Featured Collection"
        label.textColor = .white
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.text = "Book name"
        label.textColor = .white
        
        return label
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
        addSubview(collectionLabel)
        addSubview(titleLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            bookCoverImage.topAnchor.constraint(equalTo: topAnchor),
            bookCoverImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookCoverImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookCoverImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            collectionLabel.bottomAnchor.constraint(equalTo: bookCoverImage.topAnchor, constant: 20),
            collectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            titleLabel.bottomAnchor.constraint(equalTo: bookCoverImage.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7)
          
            
            ])
    }
    

    func configure(with data: CompositionalModel, index: Int) {
        self.collectionLabel.text = data.description
        self.titleLabel.text = data.mainTitle
    }
        
}

#Preview {
    MovieSecondViewController()
    }
