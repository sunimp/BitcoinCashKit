//
//  TestNet.swift
//
//  Created by Sun on 2018/7/18.
//

import Foundation

import BitcoinCore

class TestNet: INetwork {
    let bundleName = "BitcoinCash"

    let maxBlockSize: UInt32 = 32 * 1024 * 1024
    let pubKeyHash: UInt8 = 0x6F
    let privateKey: UInt8 = 0xEF
    let scriptHash: UInt8 = 0xC4
    let bech32PrefixPattern = "bchtest"
    let xPubKey: UInt32 = 0x043587CF
    let xPrivKey: UInt32 = 0x04358394
    let magic: UInt32 = 0xF4E5F3F4
    let port = 18333
    let coinType: UInt32 = 1
    let sigHash: SigHashType = .bitcoinCashAll
    var syncableFromApi = true
    var blockchairChainID = ""

    let dnsSeeds = [
        "testnet-seed.bitcoinabc.org",
        "testnet-seed-abc.bitcoinforks.org",
    ]

    let dustRelayTxFee = 1000 // https://github.com/Bitcoin-ABC/bitcoin-abc/blob/master/src/policy/policy.h#L78
}
