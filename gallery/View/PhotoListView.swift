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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            vm.execute()
        }
        
    }
}

#Preview {
    PhotoListView()
}
