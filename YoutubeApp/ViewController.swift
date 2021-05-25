//
//  ViewController.swift
//  YoutubeApp
//
//  Created by 宮野智宏 on 2021/05/08.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var videoListCollectionView: UICollectionView!
    
    private let cellId = "cellId"
    private var videoItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoListCollectionView.delegate = self
        videoListCollectionView.dataSource = self
        
        videoListCollectionView.register(UINib(nibName: "VideoListCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        
        fetchYoutubeSearchInfo()
        
    }
    
    private func fetchYoutubeSearchInfo() {
        let urlString = "https://www.googleapis.com/youtube/v3/search?q=messi&key=AIzaSyBtwGWxjxdMNFQZoB_UWkJMWE5jLcdndS0&part=snippet"
        
        let request = AF.request(urlString)
        
        request.responseJSON { (response) in
            do {
                guard let data = response.data else { return }
                let decode = JSONDecoder()
                let video = try decode.decode(Video.self, from: data)
                self.videoItems = video.items
                
                self.videoListCollectionView.reloadData()
            } catch {
                print("変換に失敗しました。: ", error)
            }
            
            
           print("response: ", response)
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width
        
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videoListCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoListCell
        cell.videoItem = videoItems[indexPath.row]
        
        return cell
    }
    
    
}

