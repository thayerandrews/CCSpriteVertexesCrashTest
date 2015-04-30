//
//  MyStructTypes.h
//  CCSpriteVertexesCrashTest
//
//  Created by Thayer J Andrews on 4/30/15.
//  Copyright (c) 2015 Thayer J Andrews. All rights reserved.
//

#import <GLKit/GLKit.h>


////////////////////////////////////////////////////////////
//
// Cocos2D structs that originally triggered the problem
//

// A single vertex
typedef struct CCVertex
{
    GLKVector4 position;
    GLKVector2 texCoord1, texCoord2;
    GLKVector4 color;
} CCVertex;


// 4 vertices that define the quad for a sprite
typedef struct CCSpriteVertexes
{
    CCVertex bl, br, tr, tl;
} CCSpriteVertexes;

CCSpriteVertexes CCSpriteVertexesInit();


////////////////////////////////////////////////////////////
//
// Simplified types that also trigger the problem
//

// Functional equivalent of GLKVector4. 4 floats and aligned(16) attribute.
struct _Float4Aligned16Struct
{
    float data[4];
} __attribute__((aligned(16)));
typedef struct _Float4Aligned16Struct Float4Aligned16Struct;


// 4 floats but no additional alignment attribute.
struct _Float4UnalignedStruct
{
    float data[4];
};
typedef struct _Float4UnalignedStruct Float4UnalignedStruct;


// Yields an 80 byte allocation (4 floats * 4 bytes/float + 49 extra bytes == 65 bytes -> aligned(16) == 80 bytes)
//
// Result: Crashes.
// Conclusion: ??
//
typedef struct BrokenStruct
{
    Float4Aligned16Struct data;
    char extra[49];
} BrokenStruct;


// Yields an 80 byte allocation (4 floats * 4 bytes/float + 64 extra bytes == 80 bytes)
//
// Result: Does not crash.
// Conclusion: The total size alone is not the problem.
//
typedef struct WorkingStruct1
{
    Float4UnalignedStruct data;
    char extra[64];
    
} WorkingStruct1;


// Yields an 64 byte allocation (4 floats * 4 bytes/float + 48 extra bytes == 64 bytes -> aligned(16) == 64 bytes)
//
// Result: Does not crash.
// Conclusion: It's not just the alignment attribute that's the problem. It's some combination of the alignment
// and the total size.
typedef struct WorkingStruct2
{
    Float4Aligned16Struct data;
    char extra[48];
} WorkingStruct2;


BrokenStruct BrokenStructInit();
WorkingStruct1 WorkingStruct1Init();
WorkingStruct2 WorkingStruct2Init();

