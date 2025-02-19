# Change Log
All notable changes to this project will be documented in this file.

## FORMAT:
## [version sdk] - dd.mm.yyyy

### Added

### Changed

### Fixed

---

## [1.0.2] - 12.08.2022

### Fixed

- Fixed card data validations 

## [1.0.3] - 10.08.2023

### Fixed

- Fixed Swift version 

## [1.0.4] - 12.09.2023

### Added 

- Added new screen for choose tokenized cards
- Added TokenCardModel object to init method AnyAmountPaymentType
- Added TokenCardModel object to init method FixedAmountPaymentType

## [1.0.5] - 31.10.2023

### Fixed
- Fixed access level for PaymentInfoResponse
- Fixed access level for TranzzoError

## [1.0.6] - 08.11.2023

### Added
 Added additional property to PaymentInfoResponse object:
    customerUserAgent: String?
    customerCity: String?
    rrn: String?
    authCode: String?
    dcc: String?
    otpURL: String?
    makePaymentDescription: String?
    customerBirthday: String?
    payway: String?
    customerPatronym: String?
    terminalName: String?
    recipientCcToken: String?
    recipientCcMask: String?
    dccRates: String?
    fee: String?
    trafficSource: String?
    gateway: String?
    paymentSystem: String?
    entityId: String?
    externalTerminalName: String?
    recipientEmail: String?
    recipientPhone: String?
    recipientFname: String?
    recipientLname: String?
    recipientPatronym: String?
    merchantOrderId: String?
    receiptUrl: String?
    processedAmount: Double?
    processedCurrency: String?
    fixedFee: String?
    percentFee: String?
    comment: String?
    terminalFee: String?
    sendTerminalFee: String?
    splitFee: String?
    registryRefNo: String?
    processedAt: String?

## [1.1.7] - 13.11.2023

### Changed
    Removed fee params from PaymentInfoResponse object

## [1.1.9] - 14.12.2023

### Fixed
    Fixed ApplePay

## [1.2.9] - 15.12.2023

#### Fixed
    Fixed ApplePay
    
### Changed
    Changed amout type from Decimal to Double

## [1.3.10] - 18.12.2023

#### Fixed
    Fixed dismissing payment controller

## [1.3.11] - 08.01.2024

#### Fixed
    Fixed long animation for apple pay

## [1.4.12] - 16.02.2024

#### Changed 
 Added additional property to Product object: 
    customerEmail: String?
    unit: ProductUnitType?
    taxes: [ProductTaxe]?
 Added additional property to AdditionalData object: 
    payment3dsBypass: Payment3dsBypassType

#### Fixed
    Fixed timeZoneOffset

## [1.4.13] - 01.03.2024

#### Changed 
  Changed browserScreenWidth and browserScreenHeight type 


## [1.4.15] - 15.04.2024

#### Changed 
  Changed iso for browserLanguage  


## [1.4.16] - 17.07.2024

#### Changed 
  Changed processedAmount type


## [1.5.17] - 01.08.2024

#### Changed 
  Moved property payment3dsBypass from AdditionalData to PaymentType object
  Moved property method from AdditionalData to PaymentType object
#### Added
  Added new card scanner
  Added lookup payment method
  Added arm64 support
#### Fixed 
  Fixed compilation error
  

## [1.5.19] - 25.09.2024

#### Fixed
  Fixed compilation errors


## [1.6.20] - 06.11.2024

#### Changed
  Added uiConfig to makePayment method
  Removed uiConfig from setConfig method


## [1.6.21] - 04.02.2025

#### Fixed 
  Fonts color for section title
  Section title visibility
#### Added
  Added additional property to ApplePayConfig object:
    merchantName: String
    
