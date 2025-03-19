//
//  FormViewModel.swift
//  FormSubmission
//
//  Created by Ansh Hardaha on 19/03/25.
//

import Foundation

class FormViewModel: ObservableObject {
    @Published var responseMessage: String = ""
    @Published var isSubmitting: Bool = false
    
    func submitForm(name: String, email: String){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        isSubmitting = true
        responseMessage = ""
        
        NetworkManager.shared.submitForm(name: name, email: email, url: url) { [weak self] result in
            DispatchQueue.main.async {
                self?.isSubmitting = false
                switch result {
                case .success(let message):
                    self?.responseMessage = message
                case .failure(let error):
                    self?.responseMessage = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}
