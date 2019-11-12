//
//  Song.swift
//  rvc29_p4
//
//  Created by Rafael Chaves on 10/24/19.
//  Copyright © 2019 Rafael Chaves. All rights reserved.
//

import Foundation

class Song {
    
    var imageName: String
    var songName: String
    var artistName: String
    var albumName: String
    init(imageName: String, songName: String, artistName: String, albumName: String) {
        self.imageName = imageName
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
    }
}
