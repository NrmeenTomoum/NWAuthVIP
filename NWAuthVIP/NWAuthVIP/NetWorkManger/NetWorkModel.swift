//
//  NetWorkModel.swift
//  NWAuthVIP
//
//  Created by iOS on 8/20/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

public enum Lang: String {
    case AR
    case EN
    case FR
}
struct Constants {
  
   struct  Server{
        static let baseURL = "YOURURL"
        }
}
enum ContentType: String {
    case json = "application/json"
}
enum HTTPHeaderField: String {
    case authentication = "Auth-Token"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case language = "Language"
    case locale = "Locale"
    case IP = "IP"
    case device = "Device"
    case OS = "OS"
    case OSVersion = "OS-Version"
}
enum ErrorCode: String {
    case ACCESS_TOKEN_MISSING
    case ACCESS_TOKEN_INVALID
    case ACCESS_TOKEN_EXPIRED
    case  USER_NOT_LOGGED_IN
    case  GRANT_TYPE_MISSING
    case GRANT_TYPE_INVALID
    case  USERNAME_MISSING
    case PASSWORD_MISSING
    case CREDENTIALS_INVALID
    case REFRESH_TOKEN_MISSING
    case REFRESH_TOKEN_INVALID
    case REFRESH_TOKEN_EXPIRED
    case SERVER_DOWN
    case DECODE_ERROR
    case UNKOWN_ERROR
}
struct APIError: Codable {
    var errorCode: String?
}
struct User: Codable {
    var fullName: String
    var username: String
    var interests: [String]
}

////{"fullName": "Abou Abdo","username": "abou","interests":["Writing", "Reading", "Oreo"]}
//struct User: Codable {
//    var fullName: String
//    var username: String
//    var interests: [String]
//}
struct LoginResponse: Codable {
    var accessToken: String?
    var  accessTokenUnixExpiry: TimeInterval?
    var     refreshToken: String?
    var refreshTokenUnixExpiry: TimeInterval?
    //    var scope : String
}
struct AuthCheckResponse: Codable {
    var value1: String
    var value2: String
    //    var aud: [String]
    //    var user_name: String
    //    var scope: [String]
    //    var active: Bool
    //    var exp: Int
    //    var authorities: [String]
    //    var client_id: String
}

struct Testrespond: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
