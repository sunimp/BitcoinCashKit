//
//  BitcoinCoreCompatibility.swift
//  BitcoinCashKit
//
//  Created by Sun on 2019/4/22.
//

import Foundation

import BitcoinCore

// MARK: - DifficultyEncoder + IBitcoinCashDifficultyEncoder

extension DifficultyEncoder: IBitcoinCashDifficultyEncoder { }

// MARK: - BlockValidatorHelper + IBlockValidatorHelperWrapper

extension BlockValidatorHelper: IBlockValidatorHelperWrapper { }

// MARK: - BlockMedianTimeHelper + IBitcoinCashBlockMedianTimeHelper

extension BlockMedianTimeHelper: IBitcoinCashBlockMedianTimeHelper { }
