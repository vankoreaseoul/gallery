//
//  ApiError.swift
//  gallery
//
//  Created by Heawon Seo on 4/3/25.
//

import Foundation
import Alamofire

extension AFError {
    func getMessage() -> String {
        switch self {
        // 네트워크 오류
        case .sessionTaskFailed, .serverTrustEvaluationFailed, .sessionInvalidated, .requestRetryFailed:
            return "인터넷 연결을 확인해주세요."

        // 요청 오류
        case .invalidURL, .createURLRequestFailed, .parameterEncodingFailed, .parameterEncoderFailed, .urlRequestValidationFailed, .requestAdaptationFailed:
            return "잘못된 요청이 발생했습니다."

        // 응답 오류
        case .responseValidationFailed, .responseSerializationFailed, .multipartEncodingFailed:
            return "서버에서 데이터를 불러올 수 없습니다."

        // 사용자 취소
        case .explicitlyCancelled, .downloadedFileMoveFailed:
            return "요청이 취소되었습니다."

        // 기본값 (예상치 못한 오류)
        default:
            return "알 수 없는 오류가 발생했습니다. 문제가 지속되면 고객센터로 문의해주세요."
        }
    }
}
