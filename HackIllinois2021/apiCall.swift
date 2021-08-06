//
//  apiCall.swift
//  HackIllinois2021
//
//  Created by Guanwen yan on 7/22/21.
//

import Foundation

class apiCall {
    
    func fetch(completion: @escaping ([Mentors]) -> Void) {
        
        guard let url = URL(string: "https://api.hackillinois.org/upload/blobstore/mentors/") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let datas = try! JSONDecoder().decode(API.self, from: data!)
            
                completion(datas.data)
            
        }.resume()
    }
}
