//
//  SwiftyBenches.swift
//  LanguageBenchmarks
//
//  Created by Michael Redig on 4/28/20.
//  Copyright © 2020 Red_Egg Productions. All rights reserved.
//

import Foundation

class SwiftyBenches {

	func fibSequence(nthValue nth: Int) -> UInt64 {
		guard nth > 0 else { return 0 }
		if nth == 1 {
			return 1
		}
		return fibSequence(nthValue: nth - 1) + fibSequence(nthValue: nth - 2)
	}

	func fibSequenceWithCache(nthValue nth: Int, cache: inout [UInt64?]) -> UInt64 {
		guard nth >= 0 else { return 0 }
		if cache.isEmpty {
			cache = [UInt64?](repeating: nil, count: nth + 1)
			cache[0] = 0
			cache[1] = 1
		}

		if let answer = cache[nth] {
			return answer
		} else {
			let answer = fibSequenceWithCache(nthValue: nth - 1, cache: &cache) + fibSequenceWithCache(nthValue: nth - 2, cache: &cache)
			cache[nth] = answer
			return answer
		}
	}


}
