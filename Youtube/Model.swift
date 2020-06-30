//
//  Model.swift
//  Youtube
//
//  Created by Carlos Cardona on 29/06/20.
//  Copyright © 2020 D O G. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
        
        // Create a url object
        let url = URL(string: Constants.API_URL)
        guard url != nil else {
            return
        }
        
        // Get a url session object
        let session = URLSession.shared
        
        // Get a data task from the url session
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    // Call the "videosFetched" methods of the delegate
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                }
                
                dump(response)
            }
            catch {
                
            }

        }
        
        // Kick off the task
        dataTask.resume()
    }
}
