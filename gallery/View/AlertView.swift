//
//  AlertView.swift
//  gallery
//
//  Created by Heawon Seo on 4/6/25.
//

import SwiftUI

struct AlertView: View {
    
    @Binding var msg: String
    
    private func didTapOkBtn() { msg = "" }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Gallery")
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 28)
                .padding(.vertical, 6)
                .background(.green.opacity(0.9))
            
            Text(msg)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 8)
                .padding(.top, 16)
                .padding(.bottom, 28)
            
            Button {
                didTapOkBtn()
            } label: {
                Text("Ok")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 20)
                    .background(.green.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding(.bottom, 16)

        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea(.all)
        }
        
        
    }
}

#Preview {
    AlertView(msg: .constant("text"))
}
