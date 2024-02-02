//
//  CompositionalViewController.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 01.02.2024.
//

import UIKit

class CompositionalViewController: UIViewController {
    
    // MARK: - Ui
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CompositionalCell.self, forCellWithReuseIdentifier: CompositionalCell.identifier)
        collection.register(BookCoverCollectionCell.self, forCellWithReuseIdentifier: BookCoverCollectionCell.identifier)
        collection.register(ListCollectionCell.self, forCellWithReuseIdentifier: ListCollectionCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"
        view.backgroundColor = .black
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func createLayout() -> UICollectionViewCompositionalLayout {

        // Возвращение созданного макета для использования в коллекции
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                // Section -> Group -> item -> size
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                       heightDimension: .fractionalHeight(1 / 4.5))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 1)
                
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                
                // Установка поведения прокрутки
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                return layoutSection
                
            case 1:
                // Section -> Group -> item -> size
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(0.5))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 10)
                
                
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 2.5, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
                
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                return layoutSection
            default:
                // Section -> Group -> item -> size
                let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                                      heightDimension: .fractionalHeight(1))
                let bigItem = NSCollectionLayoutItem(layoutSize: bigItemSize)
                bigItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(0.5))
                let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
                smallItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let rightGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                                            heightDimension: .fractionalHeight(1))
                
                let rightGroupLayout = NSCollectionLayoutGroup.vertical(layoutSize: rightGroupSize, subitem: smallItem, count: 2)
                
                let mainGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                           heightDimension: .estimated(500))

                let finalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: mainGroupSize, subitems: [bigItem, rightGroupLayout])

                let layoutSection = NSCollectionLayoutSection(group: finalGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 35, leading: 0, bottom: 0, trailing: 0)
                
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
                
                return layoutSection
            }
        }
    }

    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
}

extension CompositionalViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 20
        case 1:
            return 10
         default:
            return 9
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCoverCollectionCell.identifier, for: indexPath) as? BookCoverCollectionCell
            let currentImage = BookModel.images[indexPath.item]
            cell?.configure(with: currentImage)
            return cell ?? UICollectionViewCell()
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionCell.identifier, for: indexPath) as? ListCollectionCell
            let currentModel = CompositionalModel.modelsArray[indexPath.section][indexPath.item]
            cell?.configure(with: currentModel)
            
            return cell ?? UICollectionViewCell()
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompositionalCell.identifier, for: indexPath)
            cell.backgroundColor = .systemOrange
            return cell
        }
    }
}


#Preview {
        CompositionalViewController()
    }
