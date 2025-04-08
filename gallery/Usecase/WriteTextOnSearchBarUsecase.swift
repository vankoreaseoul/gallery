//
//  WriteTextOnSearchBarUsecase.swift
//  gallery
//
//  Created by Heawon Seo on 4/5/25.
//

import Foundation

protocol WriteTextOnSearchBarUsecase {
    func execute(id: String, author: String, width: String, height: String, photos: [Photo]) -> [Photo]
}

class WriteTextOnSearchBarUsecaseImpl: WriteTextOnSearchBarUsecase {
    
    @Injected private var searchPhotoListService: SearchPhotoListService
    
    func execute(id: String, author: String, width: String, height: String, photos: [Photo]) -> [Photo] {
        return searchPhotoListService.execute(id: id, author: author, width: width, height: height, photos: photos)
    }
    
}
