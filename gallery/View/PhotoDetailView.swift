//
//  PhotoDetailView.swift
//  gallery
//
//  Created by Heawon Seo on 4/7/25.
//

import SwiftUI

struct PhotoDetailView: View {
    
    @ObservedObject var vm: PhotoDetailVM
    
    var body: some View {
        
        VStack(spacing: 20) {
            ZoomAndRotateView(image: vm.image)
                .background(Color.gray.opacity(0.2))
            
            Toggle("흑백", isOn: $vm.isBlackAndWhiteApplied)
                .padding()
            
            Spacer()
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 32)
        
        
    }
}

#Preview {
    PhotoDetailView(vm: PhotoDetailVM(image: UIImage(), isBlackAndWhiteApplied: false))
}
