//
//  Poll.swift
//  Clicker
//
//  Created by Kevin Chan on 2/3/18.
//  Copyright © 2018 CornellAppDev. All rights reserved.
//

import UIKit

// Superclass needed to save Polls to UserDefaults
class Poll: NSObject, NSCoding {
   
    var id: Int
    var name: String
    var code: String
    
    init(id: Int, name: String, code: String) {
        self.id = id
        self.name = name
        self.code = code
    }
    
    init(json: [String:Any]) {
        self.id = json["id"] as! Int
        self.name = json["name"] as! String
        self.code = json["code"] as! String
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeInteger(forKey: "id")
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let code = aDecoder.decodeObject(forKey: "code") as! String
        self.init(id: id, name: name, code: code)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(code, forKey: "code")
    }
}