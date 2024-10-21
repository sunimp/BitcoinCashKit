//
//  ForkValidator.swift
//  BitcoinCashKit
//
//  Created by Sun on 2019/6/11.
//

import Foundation

import BitcoinCore

public class ForkValidator: IBlockChainedValidator {
    // MARK: Properties

    private let concreteValidator: IBitcoinCashBlockValidator
    private let forkHeight: Int
    private let expectedBlockHash: Data

    // MARK: Lifecycle

    public init(concreteValidator: IBitcoinCashBlockValidator, forkHeight: Int, expectedBlockHash: Data) {
        self.concreteValidator = concreteValidator
        self.forkHeight = forkHeight
        self.expectedBlockHash = expectedBlockHash
    }

    // MARK: Functions

    public func validate(block: Block, previousBlock: Block) throws {
        if block.headerHash != expectedBlockHash {
            throw BitcoinCoreErrors.BlockValidation.wrongHeaderHash
        }

        try concreteValidator.validate(block: block, previousBlock: previousBlock)
    }

    public func isBlockValidatable(block: Block, previousBlock _: Block) -> Bool {
        block.height == forkHeight
    }
}
