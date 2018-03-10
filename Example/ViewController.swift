//
//  ViewController.swift
//  Example
//
//  Created by yuzushioh on 2018/01/01.
//  Copyright © 2018 yuzushioh. All rights reserved.
//

import UIKit
import HDWalletKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mnemonic = Mnemonic.create()
        // nuclear you cage screen tribe trick limb smart dad voice nut jealous
        
        let seed = Mnemonic.createSeed(mnemonic: mnemonic)
        let wallet = HDWallet(seed: seed, network: .main(.bitcoin))
        
        do {
            let privateKey = try wallet.generateExternalPrivateKey(at: 0)
            print(privateKey.extended())
            
            let publicKey = privateKey.hdPublicKey()
            print(publicKey.raw.toHexString())
            
        } catch let error {
            print("Error: \(error)")
        }
    }
}
