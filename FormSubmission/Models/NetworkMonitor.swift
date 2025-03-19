//
//  NetworkMonitor.swift
//  FormSubmission
//
//  Created by Ansh Hardaha on 19/03/25.
//

import Network
import Foundation

class NetworkMonitor: ObservableObject {
    @Published var isConnected: Bool = true
    let monitor = NWPathMonitor()
    
    init(){
        let queue = DispatchQueue.global(qos: .background)
            monitor.start(queue: queue)
                
            monitor.pathUpdateHandler = { path in
                DispatchQueue.main.async {
                    self.isConnected = path.status == .satisfied
            }
        }
    }
}
