//
//  TurnOnOffBlackAndWhiteToggleUsecase.swift
//  gallery
//
//  Created by Heawon Seo on 4/7/25.
//

import Foundation
import UIKit

protocol TurnOnOffBlackAndWhiteToggleUsecase {
    func execute(isToggleOn: Bool, originalImage: UIImage) -> UIImage
}

class TurnOnOffBlackAndWhiteToggleUsecaseImpl: TurnOnOffBlackAndWhiteToggleUsecase {
    
    @Injected private var applyBlackAndWhiteOnPhotoService: ApplyBlackAndWhiteOnPhotoService
    
    func execute(isToggleOn: Bool, originalImage: UIImage) -> UIImage {
        if isToggleOn {
            return applyBlackAndWhiteOnPhotoService.execute(originalImage: originalImage)
        } else {
            return originalImage
        }
    }
    
    
}
