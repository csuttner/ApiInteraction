//
//  LoginRequest.swift
//  ApiInteraction
//
//  Created by Clay Suttner on 6/11/21.
//

import Foundation
import Alamofire

struct LoginModel: Codable {
    let email: String?
    let password: String?
}

struct SuccessResponseModel: Codable {
    let token: String
}

struct ErrorResponseModel: Codable {
    let message: String
}

enum LoginError: Error {
    case serverError(message: String)
    case decodingError(description: String)
    case responseError(description: String)
}

struct LoginRequest {
    static func post(loginModel: LoginModel, completion: @escaping (Result<SuccessResponseModel, LoginError>) -> Void) {
        let baseURLString = "https://games-for-good-demo.herokuapp.com/login"
        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(baseURLString,
                   method: .post,
                   parameters: loginModel,
                   encoder: JSONParameterEncoder.default,
                   headers: headers
        ).response { response in
            switch response.result {
            case .success(let data):
                do {
                    if response.response?.statusCode == 200 {
                        let successResponse = try JSONDecoder().decode(SuccessResponseModel.self, from: data!)
                        completion(.success(successResponse))
                    } else {
                        let errorResponse = try JSONDecoder().decode(ErrorResponseModel.self, from: data!)
                        completion(.failure(.serverError(message: errorResponse.message)))
                    }
                } catch let decodingError {
                    completion(.failure(.decodingError(description: decodingError.localizedDescription)))
                }
            case .failure(let responseError):
                completion(.failure(.responseError(description: responseError.localizedDescription)))
            }
        }
    }
}
