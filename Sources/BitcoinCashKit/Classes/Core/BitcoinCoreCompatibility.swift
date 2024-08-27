//
//  BitcoinCoreCompatibility.swift
//  BitcoinCashKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import BitcoinCore

// MARK: - DifficultyEncoder + IBitcoinCashDifficultyEncoder

extension DifficultyEncoder: IBitcoinCashDifficultyEncoder { }

// MARK: - BlockValidatorHelper + IBlockValidatorHelperWrapper

extension BlockValidatorHelper: IBlockValidatorHelperWrapper { }

// MARK: - BlockMedianTimeHelper + IBitcoinCashBlockMedianTimeHelper

extension BlockMedianTimeHelper: IBitcoinCashBlockMedianTimeHelper { }
