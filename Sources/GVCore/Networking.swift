//
//  Networking.swift
//  GVCore
//
//  Created by geovision on 2020/11/20.
//

import Foundation

protocol NetworkSession {
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void )
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void )
}
//Extension URLSession to Network Session
// for
// (1) NetworkSession can do some part of URLSession stuff.
// (2) DI Test with NetworkSessionMock it's possible.
extension URLSession : NetworkSession {
    
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void ) {
        let task = dataTask(with: request) { data, _, error in
            completionHandler(data, error)
        }
        task.resume()
    }
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { data, _, error in
            completionHandler(data, error)
        }
        task.resume()
    }

}
extension GVCore {
    public class Networking {
        
        
        /// Responsible for handling all networking calls
        /// - Warning: Must create before using any Public APIs.
        public class Manager {
            
            public init() {}
            
            internal var session : NetworkSession = URLSession.shared
            
            /// Call to the live internet to retrieve data from a specific location
            /// - Parameters:
            ///   - url: the location you wish to fetch from.
            ///   - completionHandler: return a result object which signifities the status of the request. 
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void ){
                
                session.get(from: url) { data, error in
                    let htmlResult = String(data:data!, encoding: .utf8)
                    
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                
            }
            
            /// Calls to live internet to send data to specific location
            /// - Parameters:
            ///   - url: the location you wish to send data to
            ///   - body: the object you wish to send over network
            ///   - completionHandler: Returns a result object with status of the request
            public func sendData<I: Codable>(to url :URL, body: I, completionHandler: @escaping (NetworkResult<Data>) -> Void ){
                var request = URLRequest(url: url)
                do {
                    let httpBody = try JSONEncoder().encode(body)
                    request.httpBody = httpBody
                    request.httpMethod = "POST"
                    session.post(with: request) { (data, error) in
                        let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                        return completionHandler(result)
                    }
                } catch let error {
                    return completionHandler(.failure(error))
                }
            }
        }
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}

