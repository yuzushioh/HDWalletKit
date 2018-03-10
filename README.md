# HDWalletKit
WalletKit is a Swift framwork that enables you to create and use HD wallet([Hierarchical Deterministic Wallets](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)) in your app.

```swift
let mnemonic = Mnemonic.create()
// nuclear you cage screen tribe trick limb smart dad voice nut jealous

let seed = Mnemonic.createSeed(mnemonic: mnemonic)
let wallet = HDWallet(seed: seed, network: .main(.bitcoin))

do {
    let privateKey = try wallet.generateExternalPrivateKey(at: 0)
    let publicKey = privateKey.hdPublicKey()
    
} catch let error {
    print("Error: \(error)")
}
```

## Features
- Mnemonic recovery phrease in [BIP39](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki)
- [BIP32](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)/[BIP44](https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki) HD wallet

## Requirements

- Swift 4.0 or later
- iOS 8.0 or later

## Installation

#### [Carthage](https://github.com/Carthage/Carthage)

- Insert `github "yuzushioh/HDWalletKit"` to your Cartfile.
- Run `carthage update --platform ios`.

## License
WalletKit is released under the [MIT License](LICENSE.md).
