//
//  CheckUserService.swift
//  4Week-seminar
//
//  Created by yeonsu on 11/11/23.
//

import Foundation

class CheckUserService {
    static let shared = CheckUserService()
    private init() {}
    
    func makeRequest(username: String) -> URLRequest {
        print("username은 \(username)")
        let url = URL(string: "http://3.39.54.196/api/v1/members/check?username=\(username)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func CheckUserNameService(username: String) async throws -> CheckUserNameModel? {
        do {
            let request = self.makeRequest(username: username)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return CheckUserNameData(data: data)
        } catch {
            throw error
        }
        
    }
    
    
    private func CheckUserNameData(data: Data) -> CheckUserNameModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(CheckUserNameModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
