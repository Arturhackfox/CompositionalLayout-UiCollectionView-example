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
        label.font = .systemFont(ofSize: 15, weight: .semibold)
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
    
    private lazy var mainStack: UIStackView = {
       let hstack = UIStackView()
        hstack.axis = .vertical
        hstack.alignment = .center
        hstack.distribution = .fill
        hstack.translatesAutoresizingMaskIntoConstraints = false
        
        return hstack
    }()
    
    private lazy var bottomStack: UIStackView = {
       let hstack = UIStackView()
        hstack.axis = .horizontal
        hstack.alignment = .center
        hstack.distribution = .fill
        hstack.spacing = 10
        hstack.translatesAutoresizingMaskIntoConstraints = false
        
        return hstack
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
        addSubview(mainStack)
        mainStack.addArrangedSubview(bookCoverImage)
        mainStack.addArrangedSubview(bottomStack)
        bottomStack.addArrangedSubview(label)
        bottomStack.addArrangedSubview(icon)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.bottomAnchor.constraint(equalTo:bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
          
            ])
    }
    
    override func prepareForReuse() {
        self.bookCoverImage.image = nil
    }
    
    func configure(with imageName: String) {
        self.bookCoverImage.image = UIImage(named: imageName)
        self.label.text = String(Int.random(in: 0...100)) + "%"
    }
    
}
