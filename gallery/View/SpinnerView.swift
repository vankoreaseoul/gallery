//
//  SpinnerView.swift
//  gallery
//
//  Created by Heawon Seo on 4/6/25.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        
        Rectangle()
            .fill(.black.opacity(0.7))
            .ignoresSafeArea(.all)
            .overlay {
                VStack(spacing: 0) {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(2.0)
                        .tint(.white)
                        .padding(.bottom, 40)
                    
                    Text("Loading...")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
            }
        
    }
}

#Preview {
    SpinnerView()
}
