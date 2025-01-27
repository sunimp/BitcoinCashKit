//
//  CashAddress.swift
//  BitcoinCashKit
//
//  Created by Sun on 2019/4/23.
//

import Foundation

import BitcoinCore

public class CashAddress: Address, Equatable {
    // MARK: Properties

    public let type: AddressType
    public let lockingScriptPayload: Data
    public let stringValue: String
    public let version: UInt8

    // MARK: Computed Properties

    public var scriptType: ScriptType {
        switch type {
        case .pubKeyHash: .p2pkh
        case .scriptHash: .p2sh
        }
    }

    public var lockingScript: Data {
        switch type {
        case .pubKeyHash: OpCode.p2pkhStart + OpCode.push(lockingScriptPayload) + OpCode.p2pkhFinish
        case .scriptHash: OpCode.p2shStart + OpCode.push(lockingScriptPayload) + OpCode.p2shFinish
        }
    }

    // MARK: Lifecycle

    public init(type: AddressType, payload: Data, cashAddrBech32: String, version: UInt8) {
        self.type = type
        lockingScriptPayload = payload
        stringValue = cashAddrBech32
        self.version = version
    }

    // MARK: Static Functions

    public static func == (lhs: CashAddress, rhs: some Address) -> Bool {
        guard let rhs = rhs as? CashAddress else {
            return false
        }
        return lhs.type == rhs.type && lhs.lockingScriptPayload == rhs.lockingScriptPayload && lhs.version == rhs
            .version
    }
}
