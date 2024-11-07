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
    
    private var sessionToken: String = {
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
    private let products = [Product(id: "1", url: "https://www.example.com", category: "Test", name: "Test product", description: "Test product", amount: 9.99, currency: "UAH", priceType: .vat, vat: 0.0, qty: 1.0, payload: "Test payload", customerEmail: "", unit: .pc, taxes: nil)]

    private var localizationConfig: LocalizationConfig = {
        var config = LocalizationConfig()
        config.main_title = "Оплата замовлення"
        config.enter_amount_title = "Розмір внеску"
        config.enter_amount_placeholder =  "Введіть сумму"
        config.pay_via_card_title = "Оплата карткою"
        config.pay_button_title = "Оплатити"
        config.wrong_card_data_title = "Картка з помилкою"
        config.card_number_placeholder = "Введіть чи відскануйте"
        config.card_exp_month_placeholder = "ММ"
        config.card_exp_year_plaecholder = "ГГ"
        config.card_cvv_placeholder = "CVV"
        config.cancel_payment_title = "Відміна оплати"
        config.cancel_payment_description = "Ви хочете скасувати оплату?"
        config.cancel_payment_confirm = "Скасувати"
        config.cancel_payment_cancel = "Продовжити"
        
        return config
    }()
    
    private var colorConfig: ColorConfig = {
        var config = ColorConfig()
        config.pay_button_enable_color = #colorLiteral(red: 0, green: 0.1176470588, blue: 0.831372549, alpha: 1)
        config.pay_button_disabled_color = #colorLiteral(red: 0.5803921569, green: 0.6274509804, blue: 0.9333333333, alpha: 1)
        config.fixed_amount_color = #colorLiteral(red: 0, green: 0.1176470588, blue: 0.831372549, alpha: 1)
        config.background_color = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 1, alpha: 1)
        config.section_backround_color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        config.border_color = #colorLiteral(red: 0.8078431373, green: 0.831372549, blue: 0.8823529412, alpha: 1)
        config.placeholder_color = #colorLiteral(red: 0.3882352941, green: 0.4431372549, blue: 0.5058823529, alpha: 1)
        config.title_color = #colorLiteral(red: 0.2705882353, green: 0.3058823529, blue: 0.3568627451, alpha: 1)
        config.input_color = #colorLiteral(red: 0.1294117647, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        config.error_color = #colorLiteral(red: 1, green: 0.6509803922, blue: 0.6509803922, alpha: 1)
        
        return config
    }()
    
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
        let additionalData = AdditionalData(serverUrl: nil, products: products, merchantMcc: nil, payload: nil)
        let customerData = CustomerData(customerEmail: "test@email.com", customerPhone: "0506426008")
        
        TranzzoPaymentSDK.makePayment(rootController: self,
                                           delegate: self,
                                           paymentData: PaymentData(type: paymentType,
                                                                    keyConfig: keyConfig,
                                                                    customerData: customerData,
                                                                    additionalData: additionalData),
                                      uiConfig: PaymentContollerConfig(colorConfig: colorConfig,
                                                                       localizationConfig: localizationConfig,
                                                                       showApplePayForm: true,
                                                                       showCreditCardForm: true)
        )
    }
    
    
    @IBAction private func fixexAmountButtonTapped(_ sender: AnyObject) {
        let paymentType = FixedAmountPaymentType(orderId: UUID().uuidString,
                                                 amount: 1.0,
                                                 description: "Test product",
                                                 tokenCards: tokenCards)
        let keyConfig = KeyConfig(sessionToken: sessionToken, apiKey: apiKey, posId: posId)
        let additionalData = AdditionalData(serverUrl: nil, products: products, merchantMcc: nil, payload: nil)
        let customerData = CustomerData(customerEmail: "test@email.com", customerPhone: "0506426008")
        
        TranzzoPaymentSDK.makePayment(rootController: self,
                                      delegate: self,
                                      paymentData: PaymentData(type: paymentType,
                                                               keyConfig: keyConfig,
                                                               customerData: customerData,
                                                               additionalData: additionalData),
                                      uiConfig: PaymentContollerConfig(colorConfig: colorConfig,
                                                                       localizationConfig: localizationConfig,
                                                                       showApplePayForm: true,
                                                                       showCreditCardForm: false)
        )
    }
    
    @IBAction private func lookupButtonTapped(_ sender: AnyObject) {
        let paymentType = LookupPaymentType(orderId: UUID().uuidString, description: "Test description")

        let keyConfig = KeyConfig(sessionToken: sessionToken,
                                  apiKey: apiKey,
                                  posId: posId)

        let additionalData = AdditionalData(serverUrl: nil,
                                            products: nil,
                                            merchantMcc: nil,
                                            payload: nil)
        let customerData = CustomerData(customerEmail: "tempmail@gmail.com",
                                        customerPhone: "380506541111")
        
        TranzzoPaymentSDK.makePayment(rootController: self,
                                      delegate: self,
                                      paymentData: PaymentData(type: paymentType,
                                                               keyConfig: keyConfig,
                                                               customerData: customerData,
                                                               additionalData: additionalData))
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

