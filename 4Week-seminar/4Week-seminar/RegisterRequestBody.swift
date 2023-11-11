//
//  RegisterRequestBody.swift
//  4Week-seminar
//
//  Created by yeonsu on 11/11/23.
//

import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}
