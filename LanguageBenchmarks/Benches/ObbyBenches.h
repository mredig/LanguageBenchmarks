//
//  ObbyBenches.h
//  LanguageBenchmarks
//
//  Created by Michael Redig on 4/28/20.
//  Copyright © 2020 Red_Egg Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObbyBenches : NSObject

- (instancetype)init;

-(uint64_t)fibSequenceNthValue:(NSInteger)nth;
-(uint64_t)fibSequenceNthValue:(NSInteger)nth withCache:(NSMutableArray * _Nullable)cache;

@end

NS_ASSUME_NONNULL_END
