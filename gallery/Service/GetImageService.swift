//
//  GetPhotoService.swift
//  gallery
//
//  Created by Heawon Seo on 4/4/25.
//

import Foundation
import Combine
import Alamofire

class GetPhotoService {
    
    @Injected private var photoApiRepo: ApiManager<PhotoApi>
    
    func execute(id: Int, width: Int, height: Int) -> AnyPublisher<Data, AFError> {
        return photoApiRepo.request(target: .fetchPhoto(id: id, width: width, height: height))
            .validate()
            .publishData()
            .value()
            .eraseToAnyPublisher()
    }
    
}
