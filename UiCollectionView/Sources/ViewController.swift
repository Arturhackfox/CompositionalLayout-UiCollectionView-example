//
//  ViewController.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 01.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Ui
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collection.register(BookCoverCollectionCell.self, forCellWithReuseIdentifier: BookCoverCollectionCell.identifier)
        
        return collection
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .black
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    // MARK: - Actions


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: - Количество ячеек в секции
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    // MARK: - Создание кастомной ячейки
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        let cellBookCover = collectionView.dequeueReusableCell(withReuseIdentifier: BookCoverCollectionCell.identifier, for: indexPath) as? BookCoverCollectionCell
        let currentImageName = BookModel.images[indexPath.item]
        cellBookCover?.configure(with: currentImageName)
        
        return cellBookCover ?? UICollectionViewCell()
    }
    
    // MARK: - Сколько айтемов вывести на экран
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 170, height: 340)
    }
    
    // MARK: - Делает отступы для стартового layout по 4 сторонам
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
    }
    
    // MARK: - Минимальный отступ между линиями с объектами Сверху и Снизу

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    // MARK: - Минимальный отступ между объектами Слева и Справа

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       10
    }
    
    // MARK: - Размер хэдэра
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: 2, height: 2)
    }
    
    // MARK: - Размер футера

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        CGSize(width: 2, height: 2)
    }
}

