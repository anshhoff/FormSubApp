//
//  FormViewModel.swift
//  FormSubmission
//
//  Created by Ansh Hardaha on 19/03/25.
//

import Foundation
import SwiftUI

class FormViewModel: ObservableObject {
    @Published var responseMessage: String = ""
    @Published var isSubmitting: Bool = false
    @Published var name: String = ""
    @Published var email: String = ""
    
    func submitForm() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        isSubmitting = true
        responseMessage = ""
        
        NetworkManager.shared.submitForm(name: name, email: email, url: url) { [weak self] result in
            DispatchQueue.main.async {
                self?.isSubmitting = false
                switch result {
                case .success(let message):
                    self?.responseMessage = message
                    self?.clearSavedData()
                case .failure:
                    self?.responseMessage = "Submission failed! Data saved for later."
                    self?.saveFormData()
                }
            }
        }
    }
    
    func saveFormData() {
        let formData = FormData(name: name, email: email)
        if let encodedData = try? JSONEncoder().encode(formData) {
            UserDefaults.standard.set(encodedData, forKey: "savedFormData")
        }
    }
    
    func loadFormData() {
        if let savedData = UserDefaults.standard.data(forKey: "savedFormData"),
           let decodedData = try? JSONDecoder().decode(FormData.self, from: savedData) {
            name = decodedData.name
            email = decodedData.email
        }
    }

    func clearSavedData() {
        UserDefaults.standard.removeObject(forKey: "savedFormData")
    }
}
