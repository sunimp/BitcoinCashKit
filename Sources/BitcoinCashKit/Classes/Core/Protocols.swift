//
//  Protocols.swift
//  BitcoinCashKit
//
//  Created by Sun on 2019/4/22.
//

import Foundation

import BigInt
import BitcoinCore

// MARK: - IBitcoinCashDifficultyEncoder

// BitcoinCore Compatibility

public protocol IBitcoinCashDifficultyEncoder {
    func decodeCompact(bits: Int) -> BigInt
    func encodeCompact(from bigInt: BigInt) -> Int
}

// MARK: - IBitcoinCashHasher

public protocol IBitcoinCashHasher {
    func hash(data: Data) -> Data
}

// MARK: - IBitcoinCashBlockValidator

public protocol IBitcoinCashBlockValidator {
    func validate(block: Block, previousBlock: Block) throws
    func isBlockValidatable(block: Block, previousBlock: Block) -> Bool
}

// MARK: - IBitcoinCashBlockValidatorHelper

// ###############################

public protocol IBitcoinCashBlockValidatorHelper {
    func suitableBlockIndex(for blocks: [Block]) -> Int?

    func previous(for block: Block, count: Int) -> Block?
    func previousWindow(for block: Block, count: Int) -> [Block]?
}

// MARK: - IBlockValidatorHelperWrapper

public protocol IBlockValidatorHelperWrapper {
    func previous(for block: Block, count: Int) -> Block?
    func previousWindow(for block: Block, count: Int) -> [Block]?
}

// MARK: - IBitcoinCashBlockMedianTimeHelper

public protocol IBitcoinCashBlockMedianTimeHelper {
    var medianTimePast: Int? { get }
    func medianTimePast(block: Block) -> Int?
}
