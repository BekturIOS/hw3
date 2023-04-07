//
//  PostModel.swift
//  GetAndPostRequest
//
//  Created by Бексултан Мусаев on 31/3/23.
//

import Foundation

struct PostDatum: Codable {
    let userID, id: Int?
    let title, body: String?

    
    
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
typealias PostData = [PostDatum]
