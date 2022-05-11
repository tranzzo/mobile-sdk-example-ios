//
//  ViewController.swift
//  TranzzoPaymentSDK-Example
//
//  Created by Vitalii Stepanov on 20.04.2022.
//

import UIKit
import TranzzoPaymentSDK

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func anyAmountButtonTapped(_ sender: AnyObject) {
        let paymentType = AnyAmountPaymentType(orderId: UUID().uuidString, description: "Test product", proposedAmounts: [9.99, 14.99, 29.99])
        let keyConfig = KeyConfig(sessionToken: JWTGenerator.sessionToken, apiKey: "28e957dc-aff7-4575-bd0f-739ec9bc77ee", posId: "064ec3f8-8abb-414b-9eb3-49d977213967")
        let additionalData = AdditionalData(method: .purchase, serverUrl: nil, products: nil, merchantMcc: nil, payload: nil)
        let customerData = CustomerData(customerEmail: "test@email.com", customerPhone: "123456789")
        
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
                                                 amount: 0.15,
                                                 description: "Test product")
        let keyConfig = KeyConfig(sessionToken: JWTGenerator.sessionToken, apiKey: "28e957dc-aff7-4575-bd0f-739ec9bc77ee", posId: "064ec3f8-8abb-414b-9eb3-49d977213967")
        let additionalInfo = AdditionalData(method: .purchase, serverUrl: nil, products: nil, merchantMcc: nil, payload: nil)
        let customerData = CustomerData(customerEmail: "test@email.com", customerPhone: "123456789")
        
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

