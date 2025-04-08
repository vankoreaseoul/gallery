//
//  DependencyInjectionContainer.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import Foundation
import Swinject
import Kingfisher

class DependencyInjectionContainer {
    
    static let shared = DependencyInjectionContainer()
    
    let container: Container
    
    private init() {
        container = Container()
        register()
    }
    
    private func register() {
        container.register(ApiManager<PhotoApi>.self) { _ in
            ApiManager<PhotoApi>()
        }
        .inObjectScope(.container)
        
        container.register(ImageCache.self) { _ in
            ImageCache.default
        }
        .inObjectScope(.container)
        
        container.register(GetPhotoListService.self) { _ in
            GetPhotoListService()
        }
        .inObjectScope(.container)
        
        container.register(GetImageService.self) { _ in
            GetImageService()
        }
        .inObjectScope(.container)
        
        container.register(StartAppUsecase.self) { _ in
            StartAppUsecaseImpl()
        }
        .inObjectScope(.container)
        
        
        container.register(SearchPhotoListService.self) { _ in
            SearchPhotoListService()
        }
        .inObjectScope(.container)
        
        container.register(WriteTextOnSearchBarUsecase.self) { _ in
            WriteTextOnSearchBarUsecaseImpl()
        }
        .inObjectScope(.container)
        
        
        container.register(ApplyBlackAndWhiteOnPhotoService.self) { _ in
            ApplyBlackAndWhiteOnPhotoService()
        }
        .inObjectScope(.container)
        
        container.register(TurnOnOffBlackAndWhiteToggleUsecase.self) { _ in
            TurnOnOffBlackAndWhiteToggleUsecaseImpl()
        }
        .inObjectScope(.container)
        
    }
    
}

@propertyWrapper
struct Injected<T> {
    var wrappedValue: T

    init() {
        wrappedValue = DependencyInjectionContainer.shared.container.resolve(T.self)!
    }
}
