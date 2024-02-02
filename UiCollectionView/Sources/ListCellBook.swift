//
//  ListCellBook.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 02.02.2024.
//

import UIKit

class ListCollectionCell: UICollectionViewCell {
    static let identifier = "ListCollectionCell"
    
    // MARK: Ui
    private lazy var bookCoverImage: UIImageView = {
        let image = UIImage(named: "cover1")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 7
        imageView.layer.shouldRasterize = true
        imageView.layer.rasterizationScale = UIScreen.main.scale
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "1"
        label.textColor = .white
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "Book name"
        label.textColor = .white
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Description of some book"
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
        addSubview(numberLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            bookCoverImage.topAnchor.constraint(equalTo: topAnchor),
            bookCoverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -300),
            bookCoverImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookCoverImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            numberLabel.leadingAnchor.constraint(equalTo: bookCoverImage.trailingAnchor, constant: -320),
            numberLabel.centerYAnchor.constraint(equalTo: bookCoverImage.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: numberLabel.centerXAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: numberLabel.centerXAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: -12)
            
            ])
    }
    
    override func prepareForReuse() {
        self.bookCoverImage.image = nil
    }
    
    func configure(with imageName: String, index: Int) {
        self.bookCoverImage.image = UIImage(named: imageName)
        self.numberLabel.text = "\(index)"
    }
    
}

#Preview {
        CompositionalViewController()
    }
