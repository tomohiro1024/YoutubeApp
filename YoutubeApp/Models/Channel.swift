//
//  Channel.swift
//  YoutubeApp
//
//  Created by 宮野智宏 on 2021/05/27.
//

import Foundation

class Channel: Decodable {
    
    let items: [ChannelItem]
    
}

class ChannelItem: Decodable {
    
    let snippet: ChannelSnippet
    
}

class ChannelSnippet: Decodable {
    
    let thumbnails: Thumbnail
    
}

