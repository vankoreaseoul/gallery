//
//  StartAppUsecase.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import Foundation
import Combine
import Alamofire
import UIKit

protocol StartAppUsecase {
    func getPhotos() -> AnyPublisher<[Photo], AFError>
    func getImage(id: String, width: Int, height: Int) -> AnyPublisher<UIImage?, AFError>
    func saveImages(images: [String: UIImage])
}

class StartAppUsecaseImpl: StartAppUsecase {
    
    @Injected private var getPhotoListService: GetPhotoListService
    @Injected private var getImageService: GetImageService
    @Injected private var saveImageService: SaveImageService
    
    func getPhotos() -> AnyPublisher<[Photo], AFError> {
        return getPhotoListService.execute()
    }
    
    func getImage(id: String, width: Int, height: Int) -> AnyPublisher<UIImage?, AFError> {
        return getImageService.execute(id: id, width: width, height: height)
    }
    
    func saveImages(images: [String : UIImage]) {
        saveImageService.execute(images: images)
    }
    
}
