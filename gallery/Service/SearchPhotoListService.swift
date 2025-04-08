//
//  SearchPhotoListService.swift
//  gallery
//
//  Created by Heawon Seo on 4/5/25.
//

import Foundation

class SearchPhotoListService {
    
    func execute(id: String, author: String, width: String, height: String, photos: [Photo]) -> [Photo] {
        var newPhotos: [Photo] = photos
        
        if !id.isEmpty {
            newPhotos = searchById(id: id, photos: newPhotos)
        }
        
        newPhotos = searchByAuthor(author: author, photos: newPhotos)
        
        if !width.isEmpty {
            newPhotos = searchByWidth(width: width, photos: newPhotos)
        }
        
        if !height.isEmpty {
            newPhotos = searchByHeight(height: height, photos: newPhotos)
        }
        
        return newPhotos
    }
    
    private func searchById(id: String, photos: [Photo]) -> [Photo] {
        let filteredPhotos = photos.filter {
            if $0.id!.hasPrefix(id) {
                return true
            } else {
                return false
            }
        }
        return filteredPhotos
    }
    
    private func searchByAuthor(author: String, photos: [Photo]) -> [Photo] {
        // 앞뒤 공백 제거
        let trimmed = author.trimmingCharacters(in: .whitespacesAndNewlines)
        // 여러 공백을 하나로 줄이기
        let collapsed = trimmed.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
        // 대문자 무시
        let newAuthor = collapsed.lowercased()
        
        if newAuthor.isEmpty {
            return photos
        } else {
            let filteredPhotos = photos.filter {
                if $0.author!.lowercased().contains(newAuthor) {
                    return true
                } else {
                    return false
                }
            }
            return filteredPhotos
        }
    }
    
    private func searchByWidth(width: String, photos: [Photo]) -> [Photo] {
        let filteredPhotos = photos.filter {
            if String($0.width!).hasPrefix(width) {
                return true
            } else {
                return false
            }
        }
        return filteredPhotos
    }
    
    private func searchByHeight(height: String, photos: [Photo]) -> [Photo] {
        let filteredPhotos = photos.filter {
            if String($0.height!).hasPrefix(height) {
                return true
            } else {
                return false
            }
        }
        return filteredPhotos
    }
    
}
