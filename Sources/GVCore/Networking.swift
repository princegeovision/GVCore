//
//  Networking.swift
//  GVCore
//
//  Created by geovision on 2020/11/20.
//

import Foundation


extension GVCore {
    public class Networking {
        
        
        /// Responsible for handling all networking calls
        /// - Warning: Must create before using any Public APIs.
        public class Manager {
            
            public init() {}
            
            private let session = URLSession.shared
            
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void ){
                let task = session.dataTask(with: url) { data, response, error in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                task.resume()
            }
        }
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}

