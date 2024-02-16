//
//  ViewController.swift
//  TranzzoPaymentSDK-Example
//
//  Created by Vitalii Stepanov on 20.04.2022.
//

import UIKit
import SwiftJWT
import TranzzoPaymentSDK

class ViewController: UIViewController {
    private struct JWTPayload: Claims {
        let name: String
        let iat: Int
    }
    
    var sessionToken: String = {
        let myIat = Int(NSDate().timeIntervalSince1970)
        let myPayload = JWTPayload(name: "John Doe", iat: myIat)
        var myJWT = JWT(claims: myPayload)
        let key = "UnZhY2tJejgwNEM0ZVFnNzhDU1ZiWGtL"
        let keyData = key.data(using: .utf8)!
        let signer = JWTSigner.hs256(key: keyData)
        return try! myJWT.sign(using: signer)
    }()

    private let apiKey = "be209028-7248-4b08-8cda-9ea36d38fcfb"
    private let posId = "8d6ba88a-6e45-42cd-9626-f6a6d182ddae"
    private let tokenCards = [TokenCardModel(mask: "411111******1111", token: "Njg4NDQyOTRhOGE3NGI1OWEzOWI4NmZlYzIxNjM4NzY6MmhkY2l6b1FESDA5czF0amVF",isDefault: true),
                              TokenCardModel(mask: "545454******5454", token: "YTYxZWVhOGI3NmNhNDY0YTk4NDQ0YTQ3ZWNiNDY0YjA6SzA5OTF2YWV0dzdpck95OU5", isDefault: false)]
    let products = [Product(id: "1", url: "https://www.example.com", category: "Test", name: "Test product", description: "Test product", amount: 9.99, currency: "UAH", priceType: .vat, vat: 0.0, qty: 1.0, payload: "Test payload", customerEmail: "", unit: .pc, taxes: nil)]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func anyAmountButtonTapped(_ sender: AnyObject) {
        let paymentType = AnyAmountPaymentType(orderId: UUID().uuidString, 
                                               description: "Test product",
                                               proposedAmounts: [9.99, 14.99, 29.99],
                                               tokenCards: tokenCards)
                                    
        let keyConfig = KeyConfig(sessionToken: sessionToken, apiKey: apiKey, posId: posId)
        let additionalData = AdditionalData(method: .purchase, payment3dsBypass: .supported, serverUrl: nil, products: products, merchantMcc: nil, payload: nil)
        let customerData = CustomerData(customerEmail: "test@email.com", customerPhone: "0506426008")
        
        TranzzoPaymentSDK.makePayment(rootController: self,
                                           delegate: self,
                                           paymentData: PaymentData(type: paymentType,
                                                                    keyConfig: keyConfig,
                                                                    customerData: customerData,
                                                                    additionalData: additionalData)
        )
    }
    
    
    @IBAction private func fixexAmountButtonTapped(_ sender: AnyObject) {
        let paymentType = FixedAmountPaymentType(orderId: UUID().uuidString,
                                                 amount: 1.0,
                                                 description: "Test product",
                                                 tokenCards: tokenCards)
        let keyConfig = KeyConfig(sessionToken: sessionToken, apiKey: apiKey, posId: posId)
        let additionalInfo = AdditionalData(method: .purchase, payment3dsBypass: .supported, serverUrl: nil, products: products, merchantMcc: nil, payload: nil)
        let customerData = CustomerData(customerEmail: "test@email.com", customerPhone: "0506426008")
        
        TranzzoPaymentSDK.makePayment(rootController: self, delegate: self, paymentData: PaymentData(type: paymentType, keyConfig: keyConfig, customerData: customerData, additionalData: additionalInfo))
    }
    
}

extension ViewController: TranzzoPaymentDelegate {
    func paymentSuccess(_ results: PaymentInfoResponse) {
        print("paymentSuccess \(results)")
    }
    
    func paymentFailed(_ error: TranzzoError) {
        print("paymentFailed \(error)")
    }
    
    func paymentCanceled() {
        print("paymentCancel")
    }
}

