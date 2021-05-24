//
//  VideoListCell.swift
//  YoutubeApp
//
//  Created by 宮野智宏 on 2021/05/09.
//

import UIKit

class VideoListCell: UICollectionViewCell {
    
    var videoItem: Item {
        didSet {
            
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
