//
//  NetworkManager.swift
//  FormSubmission
//
//  Created by Ansh Hardaha on 19/03/25.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    
    private init(){}
    
    func submitForm(name: String, email: String, url: URL, completion: @escaping (Result<String, Error>) -> Void) {
        let body: [String: Any] = ["name": name, "email": email]
        let jsonData = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data returned"])))
                
                return
            }
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                let message = "Success: \(jsonResponse)"
                completion(.success(message))
                print("Data sent to the Api \(message)")
            } else {
                completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid Data"])))
            }
        }
        .resume()
    }
    
}
