//
//  PhotoListVM.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import Foundation
import Combine
import UIKit

class PhotoListVM: ObservableObject {
    
    @Published var isLoading: Bool = true
    @Published var alertMsg: String = "" {
        didSet {
            guard !alertMsg.isEmpty else { return }
            isLoading = false
        }
    }
    @Published var photos: [Photo] = []
    
    // MARK: - SearchBar
    @Published var idText: String = ""
    @Published var authorText: String = ""
    @Published var widthText: String = ""
    @Published var heightText: String = ""
    
    // MARK: - 필요한 모든 이미지 다운로드 성공 여부
    private var totalCount: Int = 0
    // 다운로드 성공 리턴을 받은 값들(<- .finished)
    private var mustDownloadedPhotos: [Photo] = [] {
        didSet {
            guard mustDownloadedPhotos.count + undownloadedPhotos.count == totalCount else { return }
            checkAllDownloaded()
        }
    }
    // 다운로드 실패 리턴을 받은 값들(<- .failure)
    private var undownloadedPhotos: [Photo] = [] {
        didSet {
            guard undownloadedPhotos.count + mustDownloadedPhotos.count == totalCount else { return }
            checkAllDownloaded()
        }
    }
    // 실제 다운로드한 값들(<- receiveValue)
    private var downloadedPhotos: [Photo] = []
    
    private var corePhotos: [Photo] = []
    private var isFirstCall: Bool = true
    var images: [String: UIImage] = [:]
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Injected private var startAppUsecase: StartAppUsecase
    @Injected private var writeTextOnSearchBarUsecase: WriteTextOnSearchBarUsecase
    
    init() {
        getSearchTexts()
        configureView()
    }
    
    private func configureView() {
        startAppUsecase.getPhotos()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async { [weak self] in self?.alertMsg = error.getMessage() }
                    break
                }
            } receiveValue: { [weak self] photos in
                self?.configurePhotos(photos: photos)
            }
            .store(in: &cancellables)
    }
    
    private func configurePhotos(photos: [Photo]) {
        totalCount = photos.count
        
        for photo in photos {
            startAppUsecase.getImage(id: photo.id!, width: photo.width!, height: photo.height!)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        if self?.isFirstCall == true { self?.corePhotos.append(photo) }
                        self?.mustDownloadedPhotos.append(photo)
                        break
                        
                    case .failure:
                        self?.undownloadedPhotos.append(photo)
                        break
                    }
                } receiveValue: { [weak self] image in
                    if let hasImage = image, let id = photo.id { self?.images[id] = hasImage }
                    self?.downloadedPhotos.append(photo)
                }
                .store(in: &cancellables)
        }
    }
    
    private func checkAllDownloaded() {
        let photosToRedownload = mustDownloadedPhotos.filter {
                                    guard !downloadedPhotos.contains($0) else { return false }
                                    return true
                                 }
        
        guard !photosToRedownload.isEmpty else {
            corePhotos.sort(by: { Int($0.id!) ?? 0 < Int($1.id!) ?? 0 })
            
            DispatchQueue.main.async { [weak self] in
                self?.photos = self?.corePhotos ?? []
                self?.isLoading = false
            }
            
            startAppUsecase.saveImages(images: images)
            
            return
        }
        
        mustDownloadedPhotos = []
        undownloadedPhotos = []
        downloadedPhotos = []
        isFirstCall = false
        
        configurePhotos(photos: photosToRedownload)
    }
    
    private func getSearchTexts() {
        Publishers.CombineLatest4($idText, $authorText, $widthText, $heightText)
            .sink { [weak self] (idText, authorText, widthText, heightText) in 
                self?.photos = self?.writeTextOnSearchBarUsecase.execute(id: idText, author: authorText, width: widthText, height: heightText, photos: self?.corePhotos ?? []) ?? []
            }
            .store(in: &cancellables)
    }
    
    
}
