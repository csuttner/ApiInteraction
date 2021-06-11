//
//  LoginRequest.swift
//  ApiInteraction
//
//  Created by Clay Suttner on 6/11/21.
//

import Foundation
import Alamofire

struct LoginResponseModel: Codable {
    let email: String
    let password: String
}

struct LoginRequest {
    static func post() {

    }
}
