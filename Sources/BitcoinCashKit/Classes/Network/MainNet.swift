//
//  MainNet.swift
//  BitcoinCashKit
//
//  Created by Sun on 2018/7/18.
//

import Foundation

import BitcoinCore

// MARK: - MainNet

public class MainNet: INetwork {
    // MARK: Properties

    public let bundleName = "BitcoinCash"

    public let maxBlockSize: UInt32 = 32 * 1024 * 1024
    public let pubKeyHash: UInt8 = 0x00
    public let privateKey: UInt8 = 0x80
    public let scriptHash: UInt8 = 0x05
    public let bech32PrefixPattern = "bitcoincash"
    public let xPubKey: UInt32 = 0x0488B21E
    public let xPrivKey: UInt32 = 0x0488ADE4
    public let magic: UInt32 = 0xE3E1F3E8
    public let port = 8333
    public let coinType: UInt32
    public let sigHash: SigHashType = .bitcoinCashAll
    public var syncableFromApi = true
    public var blockchairChainID = "bitcoin-cash"

    public let dnsSeeds = [
        "x5.seed.bitcoinabc.org", // Bitcoin ABC seeder
        "btccash-seeder.bitcoinunlimited.info", // BU backed seeder
        "x5.seeder.jasonbcox.com", // Jason B. Cox
        "seed.deadalnix.me", // Amaury SÉCHET
        "seed.bchd.cash", // BCHD
        "x5.seeder.fabien.cash", // Fabien
    ]

    public let dustRelayTxFee = 3000

    // MARK: Lifecycle

    public init(coinType: CoinType = .type145) {
        self.coinType = coinType.rawValue
    }
}

// MARK: - CoinType

public enum CoinType: UInt32 {
    case type0 = 0
    case type145 = 145
}
