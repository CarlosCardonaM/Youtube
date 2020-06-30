//
//  Constants.swift
//  Youtube
//
//  Created by Carlos Cardona on 29/06/20.
//  Copyright © 2020 D O G. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyAlyh7vlWvjF85vipVGL1fLEHtYmKjaON8"
    static var PLAYLIST_ID = "UU4LHNX8d8RqnDX0OezgmCTg"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
}
