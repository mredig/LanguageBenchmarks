//
//  CBenches.c
//  LanguageBenchmarks
//
//  Created by Michael Redig on 4/29/20.
//  Copyright © 2020 Red_Egg Productions. All rights reserved.
//

#include "CBenches.h"


uint64_t fibSequenceNthValue(long nth) {
	if (nth <= 0) {
		return 0;
	}
	if (nth == 1) {
		return 1;
	}
	return fibSequenceNthValue(nth - 1) + fibSequenceNthValue(nth - 2);
}

uint64_t fibSequenceNthValueCache(long nth) {
	uint64_t cache[nth + 1];
	cache[0] = 123;
	return fibSequenceNthValueCacheHelper(nth, cache);
}

uint64_t fibSequenceNthValueCacheHelper(long nth, uint64_t *cache) {
	if (nth < 0) {
		return 0;
	}
	if (cache[0] == 123) {
		for (int i = 0; i < nth + 1; i++) {
			cache[i] = 0;
		}
		cache[0] = 0;
		cache[1] = 1;
	}

	if (cache[nth] != 0) {
		return cache[nth];
	} else {
		uint64_t answer = fibSequenceNthValueCacheHelper(nth - 1, cache) + fibSequenceNthValueCacheHelper(nth - 2, cache);
		cache[nth] = answer;
		return answer;
	}
}
