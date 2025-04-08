//
//  PhotoListCellView.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import SwiftUI

struct PhotoListCellView: View {
    
    @ObservedObject var vm: PhotoListCellVM
    
    var body: some View {
        HStack(spacing: 8) {
            Image(uiImage: vm.uiImage)
                .resizable()
                .frame(width: 80, height: 80)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 4) {
                    Text("id:")
                        .foregroundStyle(.blue)
                        .bold()
                    
                    HStack(spacing: 0) {
                        ForEach(0..<vm.id.count, id: \.self) { i in
                            Text(vm.id[i])
                                .background(vm.id[i] == vm.idFromSearchBar ? Color.green.opacity(0.6) : .clear)
                        }
                    }
                }
                
                HStack(spacing: 4) {
                    Text("author:")
                        .foregroundStyle(.blue)
                        .bold()
                    
                    HStack(spacing: 0) {
                        ForEach(0..<vm.author.count, id: \.self) { i in
                            Text(vm.author[i])
                                .lineLimit(1)
                                .background(vm.author[i].lowercased() == vm.authorFromSearchBar.lowercased() ? Color.green.opacity(0.6) : .clear)
                        }
                    }
                }
                
                HStack(spacing: 4) {
                    Text("width:")
                        .foregroundStyle(.blue)
                        .bold()
                    
                    HStack(spacing: 0) {
                        ForEach(0..<vm.width.count, id: \.self) { i in
                            Text(vm.width[i])
                                .background(vm.width[i] == vm.widthFromSearchBar ? Color.green.opacity(0.6) : .clear)
                        }
                    }
                }
                
                HStack(spacing: 4) {
                    Text("height:")
                        .foregroundStyle(.blue)
                        .bold()
                    
                    HStack(spacing: 0) {
                        ForEach(0..<vm.height.count, id: \.self) { i in
                            Text(vm.height[i])
                                .background(vm.height[i] == vm.heightFromSearchBar ? Color.green.opacity(0.6) : .clear)
                        }
                    }
                }
            }
            .font(.system(size: 16))
        }
        .padding(4)

    }
}

#Preview {
    PhotoListCellView(vm: PhotoListCellVM(photo: Photo(id: "0", author: "Alejandro Escamilla", width: 5000, height: 3333), image: UIImage(), idFromSearchBar: "", authorFromSearchBar: "", widthFromSearchBar: "", heightFromSearchBar: ""))
}
