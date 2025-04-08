//
//  PhotoApi.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import Foundation
import Alamofire

enum PhotoApi {
    case fetchPhotos
    case fetchPhoto(id: String, width: Int, height: Int)
}

extension PhotoApi: TargetType {
    var baseURL: String { return SERVICE_URL }
    
    var path: String {
        switch self {
        case .fetchPhotos:
            return "/v2/list"
        case .fetchPhoto(let id, let width, let height):
            return "/id/\(id)/\(width)/\(height)"
        }
    }
}
