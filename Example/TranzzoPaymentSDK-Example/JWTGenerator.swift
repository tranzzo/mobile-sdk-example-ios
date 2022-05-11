//
//  JWTGenerator.swift
//  TranzzoPaymentsSDK-Example
//
//  Created by Vitalii Stepanov on 10.05.2022.
//

import Foundation
import SwiftJWT

class JWTGenerator {
    struct JWTPayload: Claims {
        let name: String
        let iat: Int
    }

    static var sessionToken: String = {
        let myIat = Int(NSDate().timeIntervalSince1970)
        let myPayload = JWTPayload(name: "John Doe", iat: myIat)
        var myJWT = JWT(claims: myPayload)
        let key = "UnE2Tmc4N0FnVm1JMmxHcGRIdmJ4aHZq"
        let keyData = key.data(using: .utf8)!
        let signer = JWTSigner.hs256(key: keyData)
        return try! myJWT.sign(using: signer)
    }()
}
