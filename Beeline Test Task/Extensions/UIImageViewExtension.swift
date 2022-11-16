//
//  UIImageViewExtension.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
let activityIndicator = UIActivityIndicatorView()

//convenient image downloading and seting

extension UIImageView {
    public func setImageFromUrl(urlString: String) {
        var fetchedImage = UIImage()
        
        guard let url = URL(string:urlString) else {return}
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            DispatchQueue.main.async {
                self.image = imageFromCache
            }
            return
        } else {
            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: url) else { return }
                fetchedImage = UIImage(data: data)!
                
                DispatchQueue.main.async {
                    self.image = fetchedImage
                    imageCache.setObject(fetchedImage, forKey: url as AnyObject)
                }
            }
        }
    }
}


