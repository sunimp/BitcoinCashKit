//
//  EDAValidator.swift
//  BitcoinCashKit
//
//  Created by Sun on 2019/4/15.
//

import Foundation

import BigInt
import BitcoinCore

// MARK: - EDAValidator

public class EDAValidator {
    // MARK: Properties

    private let difficultyEncoder: IBitcoinCashDifficultyEncoder
    private let blockHelper: IBitcoinCashBlockValidatorHelper
    private let blockMedianTimeHelper: IBitcoinCashBlockMedianTimeHelper
    private let maxTargetBits: Int

    // MARK: Lifecycle

    public init(
        encoder: IBitcoinCashDifficultyEncoder,
        blockHelper: IBitcoinCashBlockValidatorHelper,
        blockMedianTimeHelper: IBitcoinCashBlockMedianTimeHelper,
        maxTargetBits: Int
    ) {
        difficultyEncoder = encoder
        self.blockHelper = blockHelper
        self.blockMedianTimeHelper = blockMedianTimeHelper

        self.maxTargetBits = maxTargetBits
    }

    // MARK: Functions

    private func medianTimePast(block: Block) -> Int {
        blockMedianTimeHelper.medianTimePast(block: block) ?? block.height
    }
}

// MARK: IBlockChainedValidator

extension EDAValidator: IBlockChainedValidator {
    public func validate(block: Block, previousBlock: Block) throws {
        if previousBlock.bits == maxTargetBits {
            if block.bits != maxTargetBits {
                throw BitcoinCoreErrors.BlockValidation.notEqualBits
            }
            return
        }
        guard let cursorBlock = blockHelper.previous(for: previousBlock, count: 6) else {
            throw BitcoinCoreErrors.BlockValidation.noPreviousBlock
        }
        let mpt6blocks = medianTimePast(block: previousBlock) - medianTimePast(block: cursorBlock)
        if mpt6blocks >= 12 * 3600 {
            let decodedBits = difficultyEncoder.decodeCompact(bits: previousBlock.bits)
            let pow = decodedBits >> 2
            let powBits = min(difficultyEncoder.encodeCompact(from: decodedBits + pow), maxTargetBits)

            guard powBits == block.bits else {
                throw BitcoinCoreErrors.BlockValidation.notEqualBits
            }
        } else {
            guard previousBlock.bits == block.bits else {
                throw BitcoinCoreErrors.BlockValidation.notEqualBits
            }
        }
    }

    public func isBlockValidatable(block _: Block, previousBlock _: Block) -> Bool {
        true
    }
}
