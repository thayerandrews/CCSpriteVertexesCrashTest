//
//  MyTestClass.m
//  CCSpriteVertexesCrashTest
//
//  Created by Thayer J Andrews on 4/30/15.
//  Copyright (c) 2015 Thayer J Andrews. All rights reserved.
//

#import "MyTestClass.h"

@implementation MyTestClass

#if TEST_WITH_DIRECT_METHOD_CALLS
#if TEST_WITH_MOCK_CC_STRUCTS
-(void)setVerts:(CCSpriteVertexes)verts
{
    _verts = verts;
}
#else
-(void)setWorking1:(WorkingStruct1)working1
{
    _working1 = working1;
}

-(void)setWorking2:(WorkingStruct2)working2
{
    _working2 = working2;
}

-(void)setBroken:(BrokenStruct)broken
{
    _broken = broken;
}
#endif
#endif

@end
