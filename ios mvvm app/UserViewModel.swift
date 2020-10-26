//
//  UserViewModel.swift
//  ios mvvm app
//
//  Created by ahmedelbasha on 10/26/20.
//  Copyright © 2020 ahmedelbasha. All rights reserved.
//

import Foundation

class UserViewModel {
    typealias completionBlock2 = ([User]) -> ()
    var apiHandler = ApiHandler()
    var dataSource: [User] = []
    func GetDataFromAPIHandlerClass(URL: String, completionBlock: @escaping completionBlock2){
        apiHandler.getDataFromApi(strURL: URL) {[weak self](UserArr) in
            self?.dataSource = UserArr
            completionBlock(UserArr)
        }
    }
    func GetNumberOfRows() -> Int{
         return dataSource.count
    }
    func GetUserAtIndex(_ index: Int) -> User {
        let user = dataSource[index]
        return user
    }
    func getCellData(index: Int) -> String{
        let user = self.GetUserAtIndex(index)
        let userID = user.userId ?? 0
        let id = user.id ?? 0
        let title = user.title ?? " "
        let body = user.body ?? " "
   return "\(userID)" + "  " + "\(id)" + "  " + title + "  " + body
    }
}
