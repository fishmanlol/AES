//
//  JSONHandler.swift
//  AESEncrption
//
//  Created by tongyi on 5/21/19.
//  Copyright © 2019 tongyi. All rights reserved.
//

import Foundation

class JSONHandler {
    
    static func jsonString(from dict: [AnyHashable: Any]) -> String? {
        
        do {
            let data = try JSONSerialization.data(withJSONObject: dict, options: .sortedKeys)
            
            return String(data: data, encoding: .ascii)
        } catch(let error) {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
