//
//  NewsModel.swift
//  GetAndPostRequest
//
//  Created by Бексултан Мусаев on 31/3/23.
//

import Foundation

struct DataModel: Codable {
    let products: [Product]?
    let total, skip, limit: Int?
}
// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title, description: String?
    let thumbnail: String?
    
    init(id: Int?, title: String?, description: String? = nil, thumbnail: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
    }
}
