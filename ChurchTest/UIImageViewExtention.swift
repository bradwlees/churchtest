//
//  UIImageViewExtention.swift
//  ChurchTest
//
//  Created by Brad Lees on 7/31/17.
//  Copyright © 2017 Innovativeware. All rights reserved.
//

import UIKit

extension UIImageView {
    func imageFrom(link:String, contentMode: UIViewContentMode) {
        
        guard let url = URL(string: link) else {
            print("Not a valid URL \(link)")
            return
        }
        

        
        let (imageExists, individualImage) = DataManager.sharedManager.imageDownloaded(fileName: url.lastPathComponent)
        
        if imageExists {
            self.image = individualImage
        } else {
        
            URLSession.shared.dataTask(with: url, completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async() {
                    self.contentMode =  contentMode
                    if let data = data {
                        if let myImage = UIImage(data: data) {
                            self.image = UIImage(data: data)
                            
                            if let data = UIImageJPEGRepresentation(myImage, 1) {
                                let filename = DataManager.sharedManager.documentsDirectory().appendingPathComponent(url.lastPathComponent)
                                try? data.write(to: filename)
                            }
                        }
                    }
                }
            }).resume()
        
        }
        

    }
    
    
}
