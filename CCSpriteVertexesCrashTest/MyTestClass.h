//
//  MyTestClass.h
//  CCSpriteVertexesCrashTest
//
//  Created by Thayer J Andrews on 4/30/15.
//  Copyright (c) 2015 Thayer J Andrews. All rights reserved.
//

#import "MyStructTypes.h"
#import "MyTestConfig.h"

#import <Foundation/Foundation.h>


@interface MyTestClass : NSObject

#if TEST_WITH_MOCK_CC_STRUCTS
@property (nonatomic, assign) CCSpriteVertexes verts;
#else
@property (nonatomic, assign) WorkingStruct1 working1;
@property (nonatomic, assign) WorkingStruct2 working2;
@property (nonatomic, assign) BrokenStruct broken;
#endif

@end
