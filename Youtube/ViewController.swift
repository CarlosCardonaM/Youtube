//
//  ViewController.swift
//  Youtube
//
//  Created by Carlos Cardona on 29/06/20.
//  Copyright © 2020 D O G. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set it's self as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    
    }
    


}


// MARK: - Model Delegate Methods

extension ViewController: ModelDelegate {
    
    func videosFetched(_ videos: [Video]) {
        // Set the returned videos to our videos property
        self.videos = videos
        
        // Refresh the tableview
        
        tableView.reloadData()
    }
    
    
}


// MARK: - TableView Delegate and Datasource Methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        
        // Configure the cell
        
        
        // Get the title for the video in question
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


