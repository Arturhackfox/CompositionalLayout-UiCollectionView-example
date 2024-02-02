//
//  BookModel.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 01.02.2024.
//

import Foundation

struct BookModel {
    static var images: [String] = [
        "cover1", "cover2", "cover3", "cover4", "cover5", "cover6", "cover7", "cover8", "cover9", "cover10", "cover11", "cover12", "cover13", "cover14", "cover15", "cover16", "cover17", "cover18", "cover19", "cover20",
    ]
}

struct CompositionalModel {
    var mainTitle: String?
    var description: String?
    var image: String
    var numberOfItem: Int?
}

extension CompositionalModel {
    static let modelsArray = [
        [CompositionalModel(mainTitle: "Featured Collection", description: "Biography", image: "all", numberOfItem: 1),
         CompositionalModel(mainTitle: "Featured Collection", description: "Romance", image: "all", numberOfItem: 2),
         CompositionalModel(mainTitle: "Featured Collection", description: "Fiction", image: "all", numberOfItem: 3),
         CompositionalModel(mainTitle: "Featured Collection", description: "Poetry", image: "all", numberOfItem: 4),
         CompositionalModel(mainTitle: "Featured Collection", description: "Philosophy", image: "all", numberOfItem: 5)
        ],
        [
            CompositionalModel(mainTitle: nil, description: nil, image: "cover1"),
            CompositionalModel(mainTitle: nil, description: nil, image: "cover2"),
            CompositionalModel(mainTitle: nil, description: nil, image: "cover3"),
            CompositionalModel(mainTitle: nil, description: nil, image: "cover4"),
            CompositionalModel(mainTitle: nil, description: nil, image: "cover5"),
        ],
        [
            CompositionalModel(mainTitle: "Book one", description: "Description of book one", image: "cover7", numberOfItem: 1),
            CompositionalModel(mainTitle: "Book two", description: "Description of book two", image: "cover8", numberOfItem: 2),
            CompositionalModel(mainTitle: "Book three", description: "Description of book three", image: "cover9", numberOfItem: 3),
            CompositionalModel(mainTitle: "Book four", description: "Description of book four", image: "cover10", numberOfItem: 4),
            CompositionalModel(mainTitle: "Book five", description: "Description of book five", image: "cover11", numberOfItem: 5),
            CompositionalModel(mainTitle: "Book six", description: "Description of book six", image: "cover12", numberOfItem: 6),
            CompositionalModel(mainTitle: "Book seven", description: "Description of book seven", image: "cover13", numberOfItem: 7),
            CompositionalModel(mainTitle: "Book nine", description: "Description of book nine", image: "cover14", numberOfItem: 8),
            CompositionalModel(mainTitle: "Book ten", description: "Description of book ten", image: "cover15", numberOfItem: 9),
        ]
    ]
}
