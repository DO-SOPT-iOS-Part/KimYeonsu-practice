//
//  UserInfoDataModel.swift
//  4Week-seminar
//
//  Created by yeonsu on 11/11/23.
//

import Foundation

// MARK: - UserInfoDataModel
struct UserInfoDataModel: Codable {
    let username, nickname: String
    
    enum CodingKeys: CodingKey {
        case username
        case nickname
    }
}
