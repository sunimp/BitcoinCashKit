//
//  BitcoinCoreCompatibility.swift
//  BitcoinCashKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import BitcoinCore

extension DifficultyEncoder: IBitcoinCashDifficultyEncoder {}
extension BlockValidatorHelper: IBlockValidatorHelperWrapper {}
extension BlockMedianTimeHelper: IBitcoinCashBlockMedianTimeHelper {}
