//
//  ContentView.swift
//  FormSubmission
//
//  Created by Ansh Hardaha on 19/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = FormViewModel()
    
    var body: some View {
        NavigationView {
            HomeView()
        }
        .onAppear {
            viewModel.loadFormData() 
        }
    }
}

#Preview {
    ContentView()
}

