//
//  PlantDetails.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 27/01/23.
//

import Foundation

class PlantDetails: Decodable, ObservableObject {
    var commonNames: [String]?
    var scientificName: String
    
    init(commonNames: [String], scientificName: String) {
        self.commonNames = commonNames
        self.scientificName = scientificName
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        commonNames = try container.decode([String]?.self, forKey: .commonNames)
        scientificName = try container.decode(String.self, forKey: .scientificName)
    }
    
    enum CodingKeys: String, CodingKey {
        case commonNames = "common_names"
        case scientificName = "scientific_name"
    }
}

