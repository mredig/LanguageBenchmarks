//
//  ObbyBenches.m
//  LanguageBenchmarks
//
//  Created by Michael Redig on 4/28/20.
//  Copyright © 2020 Red_Egg Productions. All rights reserved.
//

#import "ObbyBenches.h"

@implementation ObbyBenches

- (instancetype)init {
	if (self = [super init]) {
	}
	return self;
}

- (uint64_t)fibSequenceNthValue:(NSInteger)nth {
	if (nth <= 0) {
		return 0;
	}
	if (nth == 1) {
		return 1;
	}
	return [self fibSequenceNthValue: nth - 1] + [self fibSequenceNthValue: nth - 2];
}

- (uint64_t)fibSequenceNthValue:(NSInteger)nth withCache:(NSMutableArray *)cache {
	if (nth < 0) {
		return 0;
	}
	if (cache == nil) {
		cache = [NSMutableArray arrayWithCapacity:nth + 1];
		for (int i = 0; i < (nth + 1); i++) {
			[cache addObject: [NSNull null]];
		}
		cache[0] = @0;
		cache[1] = @1;
	}

	NSObject *item = cache[nth];
	if ([item isKindOfClass:[NSNumber class]]) {
		return [(NSNumber *)item unsignedLongValue];
	} else {
		NSUInteger answer = [self fibSequenceNthValue:nth - 1 withCache:cache] + [self fibSequenceNthValue:nth - 2 withCache:cache];
		cache[nth] = [NSNumber numberWithUnsignedLong:answer];
		return answer;
	}
}

@end
