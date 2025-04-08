//
//  ZoomAndRotateView.swift
//  gallery
//
//  Created by Heawon Seo on 4/7/25.
//

import SwiftUI
import UIKit

struct ZoomAndRotateView: UIViewRepresentable {
    
    let image: UIImage
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIView(context: Context) -> UIView {
        let container = UIView()
        container.clipsToBounds = true
        
        let imageView = UIImageView(image: image)
        
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: container.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
        
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePinch(_:)))
        let rotateGesture = UIRotationGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleRotate(_:)))
        
        imageView.addGestureRecognizer(pinchGesture)
        imageView.addGestureRecognizer(rotateGesture)
        
        context.coordinator.imageView = imageView
        
        return container
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.subviews.forEach { if let imageView = $0 as? UIImageView { imageView.image = image } }
    }
    
    
    class Coordinator: NSObject {
        
        weak var imageView: UIImageView?
        
        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            guard let view = imageView else { return }
            view.transform = view.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1
        }
        
        @objc func handleRotate(_ gesture: UIRotationGestureRecognizer) {
            guard let view = imageView else { return }
            view.transform = view.transform.rotated(by: gesture.rotation)
            gesture.rotation = 0
        }
    }
    
}
