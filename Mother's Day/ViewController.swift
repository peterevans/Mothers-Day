//
//  ViewController.swift
//  Mother's Day
//
//  Created by Peter Evans on 1/12/16.
//  Copyright © 2016 Peter Evans. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var randomImageView: UIImageView!
    
    var size:Int = 0
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
    }
    
    override func viewWillAppear(animated: Bool) {
        print("called viewWillAppear")
        
        randomImageView.image = getRandomImage()
        print(randomImageView.image)
        
        print("completed randomImage")
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("called viewDidDisappear")
        print(randomImageView.image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRandomImage() -> UIImage {
        
        print("getting collection")
        let collection = PHAssetCollection.fetchAssetCollectionsWithType(.SmartAlbum, subtype: .SmartAlbumFavorites, options: nil)
        
        print("getting image")
        let images = PHAsset.fetchAssetsInAssetCollection(collection[0] as! PHAssetCollection, options: nil)
        
        size = images.count
        print(size)
        
        index = Int(arc4random_uniform(UInt32(size)))
        print(index)
        
        
        let asset:PHAsset = images[index] as! PHAsset
        
        print(asset)
        
        return getAssetThumbnail(asset)
    }
    
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.defaultManager()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.synchronous = true
        manager.requestImageForAsset(asset, targetSize: CGSize(width: 450.0, height: 450.0), contentMode: .AspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        print(thumbnail)
        return thumbnail
    }


}

