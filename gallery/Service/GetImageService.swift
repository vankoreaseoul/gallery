//
//  GetImageService.swift
//  gallery
//
//  Created by Heawon Seo on 4/4/25.
//

import Foundation
import Combine
import Alamofire
import Kingfisher
import UIKit


class GetImageService {
    
    @Injected private var photoApiRepo: ApiManager<PhotoApi>
    @Injected private var cache: ImageCache
    
    func execute(id: String, width: Int, height: Int) -> AnyPublisher<UIImage?, AFError> {
        return readInCache(id: id)
            .flatMap { [weak self] image -> AnyPublisher<UIImage?, AFError> in
                if let hasImage = image {
                    return Just(hasImage)
                        .setFailureType(to: AFError.self)
                        .eraseToAnyPublisher()
                    
                } else {
                    return self?.readInNetwork(id: id, width: width, height: height) ?? Just(nil).setFailureType(to: AFError.self).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func readInCache(id: String) -> AnyPublisher<UIImage?, Never> {
        return Future<UIImage?, Never> { [weak self] pub in
            self?.cache.retrieveImage(forKey: id, callbackQueue: .dispatch(.global(qos: .background))) { result in
                switch result {
                case .success(let value):
                    if let image = value.image {
                        pub(.success(image))
                        
                    } else {
                        pub(.success(nil))
                        
                    }
                case .failure:
                    pub(.success(nil))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    private func readInNetwork(id: String, width: Int, height: Int) -> AnyPublisher<UIImage?, AFError> {
        return photoApiRepo.request(target: .fetchPhoto(id: id, width: width, height: height))
            .validate(contentType: ["image/*"])
            .publishData()
            .value()
            .receive(on: DispatchQueue.global(qos: .background))
            .map { data in
                return UIImage(data: data)
            }
            .eraseToAnyPublisher()
    }
    
    
}
