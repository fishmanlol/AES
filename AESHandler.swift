//
//  Encryption.swift
//  AESEncrption
//
//  Created by tongyi on 5/21/19.
//  Copyright © 2019 tongyi. All rights reserved.
//

import Foundation
import CryptoSwift

class AESHandler {
    
    static func AESEncryptToBase64(key: String, originString: String) -> String? {
        
        do {
            let aes = try AES(key: key.bytes, blockMode: ECB(), padding: .pkcs7)
            
            let encrypted = try aes.encrypt(originString.bytes)
            
            return encrypted.toBase64()
        } catch(let error) {
            print("Encryption error: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func AESDecryptTFromBase64(key: String, encrptedString: String) -> String? {
        
        do {
            let aes = try AES(key: key.bytes, blockMode: ECB(), padding: .pkcs7)
            
            let decrypted = try encrptedString.decryptBase64ToString(cipher: aes)
            
            return decrypted
        } catch(let error) {
            print("Decryption error: \(error.localizedDescription)")
            return nil
        }
        
    }
}

//##Encrption protocal
//
//* Algorithm: AES
//* Key length: 128bits
//* Key: aitmed.com123456
//* Padding: PKCS7
//* Mode: ECB
//
//##JSON
//
//* Key1: jwt
//* Key2: tvt
//
//##Example
//
//* origin json: {"jwt":123,"tvt":456}
//* encrypted: MJnkQPppMMl5wjGMwrhl6sPTUVbyp1Rw3V+kXlHepcQ=
