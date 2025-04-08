//
//  PhotoDetailVM.swift
//  gallery
//
//  Created by Heawon Seo on 4/7/25.
//

import Foundation
import UIKit

class PhotoDetailVM: ObservableObject {
    
    @Published var image: UIImage
    @Published var isBlackAndWhiteApplied: Bool {
        didSet {
            image = turnOnOffBlackAndWhiteToggleUsecase.execute(isToggleOn: isBlackAndWhiteApplied, originalImage: originalImage)
        }
    }
    private var originalImage: UIImage
    
    @Injected private var turnOnOffBlackAndWhiteToggleUsecase: TurnOnOffBlackAndWhiteToggleUsecase
    
    
    init(image: UIImage, isBlackAndWhiteApplied: Bool) {
        originalImage = image
        
        self.image = originalImage
        self.isBlackAndWhiteApplied = isBlackAndWhiteApplied
    }
    
}
