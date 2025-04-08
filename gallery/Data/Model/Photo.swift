//
//  Photo.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import Foundation

struct Photo: Codable, Equatable, Hashable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        guard let leftId = lhs.id, let rightId = rhs.id else { return false }
        return leftId == rightId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id ?? UUID().uuidString)
    }
    
    var id: String?
    var author: String?
    var width: Int?
    var height: Int?
}
