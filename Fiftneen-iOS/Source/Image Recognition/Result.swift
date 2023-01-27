//
//  Result.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 27/01/23.
//

import Foundation

class Result: Decodable, ObservableObject {
    var id: Int
    var suggestions: [Plant]
    
    init(id: Int, suggestions: [Plant]) {
        self.id = id
        self.suggestions = suggestions
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        suggestions = try container.decode([Plant].self, forKey: .suggestions)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case suggestions = "suggestions"
    }
}
