//
//  SqliteManager.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/14.
//  Copyright © 2018 wenshuai. All rights reserved.
//

import UIKit

class SqliteManager: NSObject {
    
    static let sharedInstance: SqliteManager = SqliteManager()

    var pathToDataBase:String!

    var dataBase:FMDatabase!

    override init() {
        super.init()
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        pathToDataBase = documentDirectory.appending("/dataBase.sqlite")
        createDataBase()
    }
    
    func createDataBase() {
        dataBase = FMDatabase(path: pathToDataBase)
        
        if dataBase.open() {
            let createUserMessageSQL = "create table if not exists UserMessageTab(books_ID integer PRIMARY KEY AUTOINCREMENT,books_text text,books_time text);"
            do {
                try dataBase.executeUpdate(createUserMessageSQL, values: nil)
            } catch  {
                print("用户信息表创建失败")
            }
        }
    }

    //查询
    func selectUserMessage() -> NSMutableArray {

        let modelArr = NSMutableArray()

        if dataBase.open() {
            var rs:FMResultSet!
            
            do {
                rs = try dataBase.executeQuery("SELECT * FROM UserMessageTab", values: nil)

                while rs.next() {
                    let model = UserMessageModel()
                    model.books_ID = rs.string(forColumn: "books_ID")!
                    model.books_text = rs.string(forColumn: "books_text")!
                    model.books_time = rs.string(forColumn: "books_time")!
                    modelArr.add(model)
                }
                
                dataBase.close()
                
            } catch  {
                
            }
            
        }
        return modelArr
    }

    //增加
    func saveUserMessageModel(userMessageModel:UserMessageModel) {
        
        if dataBase.open() {
            let model = userMessageModel
            
            do {

                let parameters = [model.books_text,model.books_time] as [Any]
                print(parameters)

                let success:Bool = dataBase.executeUpdate("insert into UserMessageTab (books_text,books_time) values (?,?)", withArgumentsIn: parameters)
                
                if success {
                    print("插入数据成功")
                }else {
                    print("插入数据失败")
                }
                
                dataBase.close()
                
            }
            
        }
    }
    
    //删除
    func deleteUserMessage() {
        if dataBase.open() {
            let parameters = [""] as [Any]
            if dataBase.executeUpdate("DELETE FROM UserMessageTab", withArgumentsIn: parameters) {
                print("删除数据成功")
            }else {
                print("删除数据失败")
            }
            dataBase.close()
        }
    }
    
}
