//
//  video.swift
//  YoutubeApp
//
//  Created by 宮野智宏 on 2021/05/15.
//

import Foundation

class Video: Decodable {
    
    let kind: String
    let items: [Item]
    
}

class Item: Decodable {
    
    var channel: Channel?
    let snippet: Snippet
    
}

class Snippet: Decodable {
    
    let publishedAt: String
    let channelId: String
    let title: String
    let description: String
    let thumbnails: Thumbnail
    
}

class Thumbnail: Decodable {
    
    let medium: Thumbnailinfo
    let high: Thumbnailinfo
    
}

class Thumbnailinfo: Decodable {
    
    let url: String
    let width: Int?
    let height: Int?
    
}
