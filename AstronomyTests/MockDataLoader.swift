//
//  MockDataLoader.swift
//  AstronomyTests
//
//  Created by Iyin Raphael on 2/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class MockDataLoader: NetworkDataLoader {
    
    func loadData(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        self.request = request
        DispatchQueue.global().async {
            completion(self.data, self.error)
        }
    }
    
    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        self.url = url
        DispatchQueue.global().async{
            completion(self.data, self.error)
        }
    }
    
    var url: URL?
    var request: URLRequest?
    var data: Data?
    var error: Error?
    
}
