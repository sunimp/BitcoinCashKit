//
//  BitcoinCashBlockValidatorHelper.swift
//
//  Created by Sun on 2019/4/15.
//

import Foundation

import BitcoinCore

public class BitcoinCashBlockValidatorHelper: IBitcoinCashBlockValidatorHelper {
    // MARK: Properties

    private let coreBlockValidatorHelper: IBlockValidatorHelperWrapper

    // MARK: Lifecycle

    public init(coreBlockValidatorHelper: IBlockValidatorHelperWrapper) {
        self.coreBlockValidatorHelper = coreBlockValidatorHelper
    }

    // MARK: Functions

    public func suitableBlockIndex(for blocks: [Block]) -> Int? { // works just for 3 blocks
        guard blocks.count == 3 else {
            return nil
        }
        let suitableBlock = blocks.sorted(by: { $1.timestamp > $0.timestamp })[1]

        return blocks.firstIndex(where: { $0.height == suitableBlock.height })
    }

    public func previous(for block: Block, count: Int) -> Block? {
        coreBlockValidatorHelper.previous(for: block, count: count)
    }

    public func previousWindow(for block: Block, count: Int) -> [Block]? {
        coreBlockValidatorHelper.previousWindow(for: block, count: count)
    }
}
