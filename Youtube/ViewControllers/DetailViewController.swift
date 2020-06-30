//
//  DetailViewController.swift
//  Youtube
//
//  Created by Carlos Cardona on 30/06/20.
//  Copyright © 2020 D O G. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // Check if there is a video
        guard video != nil else {
            return
        }
        
        // Create the embed url
        let embedUrlStirng = Constants.YT_EMBED_URL + video!.videoID
        
        // Load it into the webbview
        let url = URL(string: embedUrlStirng)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Set the title
        titleLabel.text = video!.title
        
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        
        // Set the description
        textView.text = video!.description
    }
    

}
