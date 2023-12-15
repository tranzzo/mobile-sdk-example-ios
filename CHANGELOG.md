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
 Added addditional property to PaymentInfoResponse object:
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
