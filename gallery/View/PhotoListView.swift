//
//  ContentView.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import SwiftUI

struct PhotoListView: View {
    
    @StateObject var vm: PhotoListVM = .init()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SearchBarView(idText: $vm.idText, authorText: $vm.authorText, widthText: $vm.widthText, heightText: $vm.heightText)
                
                List {
                    ForEach(vm.photos, id: \.id) { photo in
                        if let image = vm.images[photo.id!] {
                            NavigationLink(value: photo) {
                                PhotoListCellView(vm: PhotoListCellVM(photo: photo, image: image, idFromSearchBar: vm.idText, authorFromSearchBar: vm.authorText, widthFromSearchBar: vm.widthText, heightFromSearchBar: vm.heightText))
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Photo.self) { photo in
                if let image = vm.images[photo.id!] {
                    PhotoDetailView(vm: PhotoDetailVM(image: image, isBlackAndWhiteApplied: false))
                }
            }
            .navigationTitle("Gallery")
            .navigationBarTitleDisplayMode(.inline)
            .clipped()
        }
        .overlay {
            if vm.isLoading {
                SpinnerView()
                
            } else if !vm.alertMsg.isEmpty {
                AlertView(msg: $vm.alertMsg)
            }
        }
        
        
    }
}

#Preview {
    PhotoListView()
}
