//
//  SwiftyBenches.swift
//  LanguageBenchmarks
//
//  Created by Michael Redig on 4/28/20.
//  Copyright © 2020 Red_Egg Productions. All rights reserved.
//

import Foundation

class SwiftyBenches {

	func benchmark(iterations: Int, benchmark: (Int) -> Void) -> TimeInterval {
		let start = CFAbsoluteTimeGetCurrent()
		for i in 0..<iterations {
			benchmark(i)
		}
		let end = CFAbsoluteTimeGetCurrent()
		return end - start
	}

	func fibSequence(nthValue nth: Int) -> UInt64 {
		guard nth > 0 else { return 0 }
		if nth == 1 {
			return 1
		}
		return fibSequence(nthValue: nth - 1) + fibSequence(nthValue: nth - 2)
	}

	func fibSequenceWithCache(nthValue nth: Int) -> UInt64 {
		var cache = [UInt64?]()
		return fibSequenceWithCacheHelper(nthValue: nth, cache: &cache)
	}

	private func fibSequenceWithCacheHelper(nthValue nth: Int, cache: inout [UInt64?]) -> UInt64 {
		guard nth >= 0 else { return 0 }
		if cache.isEmpty {
			cache = [UInt64?](repeating: nil, count: nth + 1)
			cache[0] = 0
			cache[1] = 1
		}

		if let answer = cache[nth] {
			return answer
		} else {
			let answer = fibSequenceWithCacheHelper(nthValue: nth - 1, cache: &cache) + fibSequenceWithCacheHelper(nthValue: nth - 2, cache: &cache)
			cache[nth] = answer
			return answer
		}
	}


}
