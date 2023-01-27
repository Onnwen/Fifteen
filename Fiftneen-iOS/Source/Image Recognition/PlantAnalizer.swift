//
//  PlantAnalizer.swift
//  Fiftneen-iOS
//
//  Created by Onnwen Cassitto on 22/01/23.
//

import Foundation
import UIKit
import SwiftUI

class PlantAnalyzer {
    static func search(image: UIImage, completion: @escaping (Result?, Error?) -> Void) {
        let url = URL(string: "https://api.plant.id/v2/identify")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let imageData = image.jpegData(compressionQuality: 0.5)
        let parameters: [String: Any] = [
            "api_key": "\(apiKey)",
            "images": [imageData!.base64EncodedString()],
            "plant_language": "it",
            "plant_details": ["common_names"]
        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                return
            }
            do {
                let jsonString = String(data: data, encoding: .utf8)!
                let json = deserializeData(from: jsonString)
                print("In postData got response JSON object:\n\(json)")
                
                if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                    print(JSONString)
                }
                
                let plantInfo = try JSONDecoder().decode(Result.self, from: data)
                print(plantInfo)
                completion(plantInfo, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}

func deserializeData(from jsonString: String) -> [String: AnyObject] {
    NSLog("In deserializeData got jsonString: \(jsonString)")
    guard let jsonData = jsonString.data(using: .utf8) else {
        NSLog("In deserializeData fail to get jsonData")
        return [String: AnyObject]()
    }
    guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: AnyObject] else {
        NSLog("In deserializeData fail to decode JSON string")
        return [String: AnyObject]()
    }
    return json
}

extension View {
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

