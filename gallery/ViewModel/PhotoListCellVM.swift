//
//  PhotoListCellVM.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import Foundation
import UIKit

class PhotoListCellVM: ObservableObject {
    
    @Published var id: [String]
    @Published var author: [String]
    @Published var width: [String]
    @Published var height: [String]
    @Published var uiImage: UIImage
    
    var idFromSearchBar: String
    var authorFromSearchBar: String
    var widthFromSearchBar: String
    var heightFromSearchBar: String
    
    init(photo: Photo, image: UIImage, idFromSearchBar: String, authorFromSearchBar: String, widthFromSearchBar: String, heightFromSearchBar: String) {
        id = []
        author = []
        width = []
        height = []
        uiImage = image
        
        self.idFromSearchBar = idFromSearchBar
        
        // 앞뒤 공백 제거
        let trimmed = authorFromSearchBar.trimmingCharacters(in: .whitespacesAndNewlines)
        // 여러 공백을 하나로 줄이기
        let collapsed = trimmed.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
        self.authorFromSearchBar = collapsed
        
        self.widthFromSearchBar = widthFromSearchBar
        self.heightFromSearchBar = heightFromSearchBar
        
        id = highlightKeyword(text: photo.id ?? "", keyword: self.idFromSearchBar)
        author = highlightKeyword(text: photo.author ?? "", keyword: self.authorFromSearchBar)
        width =  highlightKeyword(text: String(photo.width ?? 0), keyword: self.widthFromSearchBar)
        height = highlightKeyword(text: String(photo.height ?? 0), keyword: self.heightFromSearchBar)
    }
    
    private func highlightKeyword(text: String, keyword: String) -> [String] {
        guard !keyword.isEmpty else { return [text] }
        
        var result: [String] = []
        let lowercasedText = text.lowercased()
        let lowercasedKeyword = keyword.lowercased()
        
        var searchRange = lowercasedText.startIndex..<lowercasedText.endIndex
        
        while let foundRange = lowercasedText.range(of: lowercasedKeyword, options: [], range: searchRange) {
            // 원래 문자열 기준에서 앞부분 자르기
            let beforeRange = searchRange.lowerBound..<foundRange.lowerBound
            let beforeText = String(text[beforeRange])
            result.append(beforeText)
            
            // 매칭된 키워드 추가
            let matchText = String(text[foundRange])
            result.append(matchText)
            
            // 다음 검색 범위 업데이트
            searchRange = foundRange.upperBound..<lowercasedText.endIndex
        }
        
        // 남은 텍스트 추가
        if searchRange.lowerBound < lowercasedText.endIndex {
            let remainingText = String(text[searchRange])
            result.append(remainingText)
        }
        
        return result
    }
    
}
