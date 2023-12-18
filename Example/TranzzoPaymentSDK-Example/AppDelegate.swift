//
//  AppDelegate.swift
//  TranzzoPaymentsSDK-Example
//
//  Created by Vitalii Stepanov on 20.04.2022
import UIKit
import TranzzoPaymentSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        

        var localizationConfig = LocalizationConfig()
        localizationConfig.main_title = "Оплата замовлення"
        localizationConfig.enter_amount_title = "Розмір внеску"
        localizationConfig.enter_amount_placeholder =  "Введіть сумму"
        localizationConfig.pay_via_card_title = "Оплата карткою"
        localizationConfig.pay_button_title = "Оплатити"
        localizationConfig.wrong_card_data_title = "Картка з помилкою"
        localizationConfig.card_number_placeholder = "Введіть чи відскануйте"
        localizationConfig.card_exp_month_placeholder = "ММ"
        localizationConfig.card_exp_year_plaecholder = "ГГ"
        localizationConfig.card_cvv_placeholder = "CVV"
        localizationConfig.cancel_payment_title = "Відміна оплати"
        localizationConfig.cancel_payment_description = "Ви хочете скасувати оплату?"
        localizationConfig.cancel_payment_confirm = "Скасувати"
        localizationConfig.cancel_payment_cancel = "Продовжити"
        
        var colorConfig = ColorConfig()
        colorConfig.pay_button_enable_color = #colorLiteral(red: 0, green: 0.1176470588, blue: 0.831372549, alpha: 1)
        colorConfig.pay_button_disabled_color = #colorLiteral(red: 0.5803921569, green: 0.6274509804, blue: 0.9333333333, alpha: 1)
        colorConfig.fixed_amount_color = #colorLiteral(red: 0, green: 0.1176470588, blue: 0.831372549, alpha: 1)
        colorConfig.background_color = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 1, alpha: 1)
        colorConfig.section_backround_color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        colorConfig.border_color = #colorLiteral(red: 0.8078431373, green: 0.831372549, blue: 0.8823529412, alpha: 1)
        colorConfig.placeholder_color = #colorLiteral(red: 0.3882352941, green: 0.4431372549, blue: 0.5058823529, alpha: 1)
        colorConfig.title_color = #colorLiteral(red: 0.2705882353, green: 0.3058823529, blue: 0.3568627451, alpha: 1)
        colorConfig.input_color = #colorLiteral(red: 0.1294117647, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        colorConfig.error_color = #colorLiteral(red: 1, green: 0.6509803922, blue: 0.6509803922, alpha: 1)
        
        
        TranzzoPaymentSDK.setConfig(paymentConfig: PaymentsConfig(environment: .sandbox, currency: "UAH", applePay: ApplePayConfig(merchantId: "merchant.com.tranzzo.msdk", countryCode: "UA"), enableLogging: true), uiConfig: PaymentContollerConfig(colorConfig: ColorConfig(), localizationConfig: localizationConfig))
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

