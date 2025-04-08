//
//  ApiManager.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import Foundation
import Alamofire

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
}

class ApiManager<Target: TargetType> {
    func request(target: Target) -> DataRequest {
        return AF.request(target.baseURL + target.path)
    }
}
