//
//  SearchBarView.swift
//  gallery
//
//  Created by Heawon Seo on 4/5/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var idText: String
    @Binding var authorText: String
    @Binding var widthText: String
    @Binding var heightText: String
    
    private func didTapView() {
        UIApplication.shared.keyboardDismiss()
    }
    
    var body: some View {
        
        VStack(spacing: 8) {
            TextField("Id",text: $idText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(8)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(4)
                .keyboardType(.numberPad)
            
            TextField("Author",text: $authorText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(8)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(4)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled()
            
            TextField("Width",text: $widthText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(8)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(4)
                .keyboardType(.numberPad)
            
            TextField("Height",text: $heightText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(8)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(4)
                .keyboardType(.numberPad)
        }
        .padding(.bottom, 40)
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
        .onTapGesture {
            didTapView()
        }
        
    }
}

#Preview {
    SearchBarView(idText: .constant(""), authorText: .constant(""), widthText: .constant(""), heightText: .constant(""))
}
