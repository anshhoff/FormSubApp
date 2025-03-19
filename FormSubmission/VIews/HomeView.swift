//
//  HomeView.swift
//  FormSubmission
//
//  Created by Ansh Hardaha on 19/03/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = FormViewModel()
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.50, green: 0.80, blue: 0.77, alpha: 1.00))
                .ignoresSafeArea()
            VStack {
                
                if !networkMonitor.isConnected {
                    Text("⚠️ No Internet Connection")
                        .foregroundColor(.red)
                        .bold()
                        .padding()
                }
                
                Text("Enter Your Details")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                    .fontDesign(.rounded)
                
                TextField("Enter Your Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                TextField("Enter your Email", text: Binding(
                    get: { viewModel.email },
                    set: { viewModel.email =  $0.lowercased() }
                ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .padding()
                    
                          
                Button("Submit") {
                    if networkMonitor.isConnected {
                        viewModel.submitForm()
                    } else {
                        print("No internet Connection")
                        viewModel.saveFormData()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(UIColor(red: 1.00, green: 0.71, blue: 0.20, alpha: 1.00)))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .disabled(viewModel.name.isEmpty || viewModel.email.isEmpty)
                
                Text(viewModel.responseMessage)
                    .foregroundColor(Color.blue)
                    .bold()
                    .padding()
            }
            .padding()
            .onAppear {
                viewModel.loadFormData()
            }
        }
    }
}

#Preview {
    HomeView()
}
