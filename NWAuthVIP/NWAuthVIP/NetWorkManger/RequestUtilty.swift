//
//  NWAuthVIP.h
//  NWAuthVIP
//
//  Created by iOS on 7/23/19.
//  Copyright © 2019 iOS. All rights reserved.
//
import Foundation
import Alamofire
extension Dictionary {
    /// Merge and return a new dictionary
    func merge(with: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
        var copy = self
        for (key, value) in with {
            // If a key is already present it will be overritten
            copy[key] = value
        }
        return copy
    }
    /// Merge in-place
    mutating func append(with: Dictionary<Key, Value>) {
        for (key, value) in with {
            // If a key is already present it will be overritten
            self[key] = value
        }
    }
}
class RequestUtilty {
    
    class func prepareHeader(isAuth: Bool, customHeaders: [String: String]?) -> HTTPHeaders {
        var headerMergedDic: [String: String]?
        let basicHeaders = [
            HTTPHeaderField.acceptType.rawValue: ContentType.json.rawValue,
            HTTPHeaderField.contentType.rawValue: ContentType.json.rawValue,
      //      HTTPHeaderField.language.rawValue: Lang.EN.rawValue,
            HTTPHeaderField.locale.rawValue: Locale.current.identifier,
     //       HTTPHeaderField.IP.rawValue: IPPublic.getIPAddress() ?? "",
            HTTPHeaderField.device.rawValue: UIDevice.current.name,
            HTTPHeaderField.OS.rawValue: "iOS",
            HTTPHeaderField.OSVersion.rawValue: UIDevice.current.systemVersion
        ]
        if  let header =  customHeaders {
            headerMergedDic =  basicHeaders.merge(with: header)
        } else {
            headerMergedDic = basicHeaders
        }
        var  headers = HTTPHeaders.init(headerMergedDic!)
        
        if isAuth {
            headers[HTTPHeaderField.authentication.rawValue] = ContentType.json.rawValue
        }
        return headers
    }
    
    class func prepareUrl(isRelativeUrl: Bool, url: String) -> URL {
        let   pathOfURL: URL?
        if isRelativeUrl {
            pathOfURL = URL(fileURLWithPath: Constants.Server.baseURL).appendingPathComponent(url)
        } else {
            pathOfURL =  URL(string: url)
        }
        
        return pathOfURL!
        
    }
    
    /*
     encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
     var urlRequest = try urlRequest.asURLRequest()
     
     guard let parameters = parameters else { return urlRequest }
     
     if let method = urlRequest.method, destination.encodesParametersInURL(for: method) {
     guard let url = urlRequest.url else {
     throw AFError.parameterEncodingFailed(reason: .missingURL)
     }
     
     if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
     let percentEncodedQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + query(parameters)
     urlComponents.percentEncodedQuery = percentEncodedQuery
     urlRequest.url = urlComponents.url
     }*/
    
    class    func prepareQueryParameters(_ value: String, params: [String: String]?) -> String? {
        var components = URLComponents(string: value)
        if let paramters = params {
            components?.queryItems = paramters.map { element in URLQueryItem(name: element.key, value: element.value) }
        }
        return components?.url?.absoluteString
    }
    class func isValidToken() -> Bool {
        // mins 1m from
        let secondDate = Date()
        var firstDate =  Date()
        if let tokenTime = TimeInterval(exactly: 23.23)
            // replace this date with you token timestamp "UserStatus.getTokenTimestamp()"
        {
            firstDate = Date(timeIntervalSince1970: tokenTime)
        }
        return firstDate < secondDate
    }
}
