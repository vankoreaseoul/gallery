//
//  SaveImageService.swift
//  gallery
//
//  Created by Heawon Seo on 4/9/25.
//

import Foundation
import UIKit
import Kingfisher

class SaveImageService {
    
    @Injected private var cache: ImageCache
    
    func execute(images: [String: UIImage]) {
        images.forEach {
            let id = $0.key
            let image = $0.value
            
            cache.retrieveImage(forKey: id, callbackQueue: .dispatch(.global(qos: .background))) { [weak self] result in
                switch result {
                case .success(let value):
                    if let _ = value.image {
                        
                    } else {
                        self?.cache.store(image, forKey: id)
                    }
                case .failure:
                    self?.cache.store(image, forKey: id)
                }
            }
        }
    }
}
