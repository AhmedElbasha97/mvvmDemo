//
//  APIHandler.swift
//  ios mvvm app
//
//  Created by ahmedelbasha on 10/25/20.
//  Copyright © 2020 ahmedelbasha. All rights reserved.
//

import Foundation
import UIKit
class ApiHandler{
    typealias completionBlock = ([User]) -> ()
    func getDataFromApi(strURL: String, completionBlock: @escaping completionBlock) {
        if let unwrabbedURL = URL(string: strURL){
            URLSession.shared.dataTask(with: unwrabbedURL, completionHandler: { (data, response, error) in
                if data != nil{
                    let jsonDecooder = JSONDecoder()
                    let userArr = try? jsonDecooder.decode([User].self, from: data!)
                    if userArr != nil{
                    completionBlock(userArr!)
                    }else{
                    let dummyArr: [User] = []
                    completionBlock(dummyArr )
                        
                    }
                }else{
                    let dummyArr: [User] = []
                    completionBlock(dummyArr )
                    
                }
            }).resume()
        }
    }
}



