//
//  NetworkSession.swift
//  TheSeer
//
//  Created by RyzenMac on 9/28/20.
//

import Foundation

final class NetworkSession {
    let session : URLSession
    
    init(session : URLSession = URLSession.shared) {
        self.session = session
    }
    
    func test() {
        let url = URL(string: "wwww.gooogle.cm")!
        let urlRequest = URLRequest(url: url)
        session.dataTask(with: urlRequest) { (data, respond, error) in
            
        }
    }
}
