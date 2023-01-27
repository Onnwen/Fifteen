//
//  Plant.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 22/01/23.
//

import Foundation

class Plant: Decodable, ObservableObject {
    var name: String
    var plantDetails: PlantDetails
        // var imageURL: URL
        // var scientificName: String
        // var propagationMethods: [String]?
        // var synonyms: [String]?
        // var url: URL?
    
    init(name: String, plantDetails: PlantDetails) {
        self.name = name
        self.plantDetails = plantDetails
            // self.imageURL = imageURL
            // self.scientificName = scientificName
            // self.propagationMethods = propagationMethods
            // self.synonyms = synonyms
            // self.url = url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        plantDetails = try container.decode(PlantDetails.self, forKey: .plantDetails)
            // imageURL = try container.decode(URL.self, forKey: .imageURL)
            // scientificName = try container.decode(String.self, forKey: .scientificName)
            // propagationMethods = try container.decodeIfPresent([String].self, forKey: .propagationMethods)
            // synonyms = try container.decodeIfPresent([String].self, forKey: .synonyms)
            // url = try container.decodeIfPresent(URL.self, forKey: .url)
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "plant_name"
        case plantDetails = "plant_details"
            // case imageURL = "wiki_image"
            // case scientificName = "scientificName"
            // case propagationMethods = "propagation_methods"
            // case synonyms = "synonyms"
            // case url = "url"
    }
}
