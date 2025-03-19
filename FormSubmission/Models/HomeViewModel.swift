//
//  Untitled.swift
//  FormSubmission
//
//  Created by Ansh Hardaha on 20/03/25.
//

import Foundation

struct FormData: Codable {
    let name: String
    let email: String
}

func saveFormData(name: String, email: String) {
    let formData = FormData(name: name, email: email)
    if let encodedData = try? JSONEncoder().encode(formData) {
        UserDefaults.standard.set(encodedData, forKey: "savedFormData")
    }
}

func loadFormData() -> FormData? {
    if let savedData = UserDefaults.standard.data(forKey: "savedFormData"),
       let decodedData = try? JSONDecoder().decode(FormData.self, from: savedData) {
        return decodedData
    }
    return nil
}
