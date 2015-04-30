//
//  MyStructTypes.m
//  CCSpriteVertexesCrashTest
//
//  Created by Thayer J Andrews on 4/30/15.
//  Copyright (c) 2015 Thayer J Andrews. All rights reserved.
//

#import "MyStructTypes.h"

CCSpriteVertexes CCSpriteVertexesInit()
{
    CCSpriteVertexes result;
    result.bl.position = GLKVector4Make(1,2,3,4);
    result.bl.texCoord1 = GLKVector2Make(5,6);
    result.bl.texCoord2 = GLKVector2Make(7,8);
    result.bl.color = GLKVector4Make(9,10,11,12);
    
    result.br.position = GLKVector4Make(13,14,15,16);
    result.br.texCoord1 = GLKVector2Make(17,18);
    result.br.texCoord2 = GLKVector2Make(19,20);
    result.br.color = GLKVector4Make(21,22,23,24);

    result.tl.position = GLKVector4Make(25,26,27,28);
    result.tl.texCoord1 = GLKVector2Make(29,30);
    result.tl.texCoord2 = GLKVector2Make(31,32);
    result.tl.color = GLKVector4Make(33,34,35,36);

    result.tr.position = GLKVector4Make(37,38,39,40);
    result.tr.texCoord1 = GLKVector2Make(41,42);
    result.tr.texCoord2 = GLKVector2Make(43,44);
    result.tr.color = GLKVector4Make(45,46,47,48);

    return result;
}

BrokenStruct BrokenStructInit()
{
    BrokenStruct result;
    result.data.data[0] = 1;
    result.data.data[1] = 2;
    result.data.data[2] = 3;
    result.data.data[3] = 4;
    memset(result.extra, 0xab, sizeof(result.extra));
    return result;
}

WorkingStruct1 WorkingStruct1Init()
{
    WorkingStruct1 result;
    result.data.data[0] = 1;
    result.data.data[1] = 2;
    result.data.data[2] = 3;
    result.data.data[3] = 4;
    memset(result.extra, 0xcd, sizeof(result.extra));
    return result;
}

WorkingStruct2 WorkingStruct2Init()
{
    WorkingStruct2 result;
    result.data.data[0] = 1;
    result.data.data[1] = 2;
    result.data.data[2] = 3;
    result.data.data[3] = 4;
    memset(result.extra, 0xef, sizeof(result.extra));
    return result;
}
