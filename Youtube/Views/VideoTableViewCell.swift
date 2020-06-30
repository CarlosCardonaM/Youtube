//
//  VideoTableViewCell.swift
//  Youtube
//
//  Created by Carlos Cardona on 30/06/20.
//  Copyright © 2020 D O G. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func setCell(_ vid:Video) {
        self.video = vid
        
        // Make sure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Set the title and date Label
        self.titleLabel.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared url session object
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                // Save the data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check that the downloades url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video
                    return
                }
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set ythe image vew
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        // Start data task
        dataTask.resume()
    }

}
