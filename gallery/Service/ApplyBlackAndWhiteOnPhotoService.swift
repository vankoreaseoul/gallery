//
//  ApplyBlackAndWhiteOnPhotoService.swift
//  gallery
//
//  Created by Heawon Seo on 4/7/25.
//

import Foundation
import UIKit

class ApplyBlackAndWhiteOnPhotoService {
    
    func execute(originalImage: UIImage) -> UIImage {
        var image: UIImage = originalImage
        
        let ciImage = CIImage(image: image)
        let filter = CIFilter(name: "CIPhotoEffectMono")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        if let output = filter?.outputImage {
            let context = CIContext()
            if let cgImage = context.createCGImage(output, from: output.extent) {
                image = UIImage(cgImage: cgImage)
            }
        }
        return image
    }
}
