//
//  GetPhotoListService.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import Foundation
import Combine
import Alamofire

class GetPhotoListService {
    
    @Injected private var photoApiRepo: ApiManager<PhotoApi>
    
    func execute() -> AnyPublisher<[Photo], AFError> {
        return Deferred { [weak self] in
            guard let self = self else { return Fail<[Photo], AFError>(error: AFError.explicitlyCancelled).eraseToAnyPublisher() }
            
            return self.photoApiRepo.request(target: .fetchPhotos)
                .validate()
                .publishDecodable(type: [Photo].self)
                .value()
                .receive(on: DispatchQueue.global(qos: .background))
                .map { photos in
                    return photos.filter {
                        guard  let id = $0.id, !id.isEmpty, let width = $0.width, width > 0, let height = $0.height, height > 0 else { return false }
                        return true
                    }
                }
                .eraseToAnyPublisher()
        }
        .subscribe(on: DispatchQueue.global(qos: .background))
        .eraseToAnyPublisher()
    }
    
}
