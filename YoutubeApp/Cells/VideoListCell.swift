//
//  VideoListCell.swift
//  YoutubeApp
//
//  Created by 宮野智宏 on 2021/05/09.
//

import UIKit
import Nuke

class VideoListCell: UICollectionViewCell {
    
    var videoItem: Item? {
        didSet {
            
            if let url = URL(string: videoItem?.snippet.thumbnails.medium.url ?? "") {
                
                Nuke.loadImage(with: url, into: thumbnailImageView)
                
            }
            
            titleLabel.text = videoItem?.snippet.title
            discriptionLabel.text = videoItem?.snippet.description
            
        }
    }
    
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        channelImageView.layer.cornerRadius = 40 / 2

    }
    

    
}
