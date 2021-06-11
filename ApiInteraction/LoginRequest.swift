//
//  LoginRequest.swift
//  ApiInteraction
//
//  Created by Clay Suttner on 6/11/21.
//

import Foundation
import Alamofire

struct LoginModel: Codable {
    let email: String
    let password: String
}

struct LoginRequest {
    static func post() {
        let baseURLString = "https://games-for-good-demo.herokuapp.com/login"
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(baseURLString, method: .post, parameters: LoginModel(email: "rkoch@mindgrub.com", password: "password"), encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
        }
    }
}
