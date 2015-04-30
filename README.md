# CCSpriteVertexesCrashTest
A simplified test case to demonstrate a crash we're seeing in Cocos2D-spritebuilder. In Cocos2D's CCEffects classes we are seeing a crash on iPhone 4s (probably all 32-bit devices though) when assigning to CCEffectRenderPassInputs's verts property which is of type CCSpriteVertexes. Digging into this it appears to be a compiler or runtime problem related to struct size and struct member alignment. This repo contains a greatly simplified test case that reproduces the problem.

## Targets and schemes

- **CCSpriteVertexesCrashTest** : No test config defines are set, the test config is controlled by MyTestConfig.h. The default behavior is to use property assignment and the mock Cocos2D structs.
- **MockCCStructsDirectMethodCalls** : Structures mirroring the original Cocos2D structs are used with direct method calls.
- **MockCCStructsPropertyAssignment** : Structures mirroring the original Cocos2D structs are used with property assignment.
- **SimpleStructsDirectMethodCalls** : Simplified structures that still trigger the problem are used with direct method calls.
- **SimpleStructsPropertyAssignment** : Simplified structures that still trigger the problem are used with property assignment.

## Expected Results

### A Crashing Case

On the following config I see the results below:

- Xcode 6.3.1 (6D1002)
- iOS 8.3 (12F70)
- iPhone 4s (MD377LL/A)

**MockCCStructsDirectMethodCalls:**

Console output:

```
Application did finish launching.
Starting the test cases:
  - Direct method calls
  - Mock Cocos2D structs
Executing a broken assignment.
```

Error:

```
error: memory read failed for 0x40000000
```

**MockCCStructsPropertyAssignment:**

Console output:

```
Application did finish launching.
Starting the test cases:
  - Property assignment
  - Mock Cocos2D structs
Executing a broken assignment.
```

Error:

```
error: memory read failed for 0x40000000
```

**SimpleStructsDirectMethodCalls:**

Console output:

```
Application did finish launching.
Your working structure (1) is 80 bytes large.
Your working structure (2) is 64 bytes large.
Your broken structure is 80 bytes large.
Starting the test cases:
  - Direct method calls
  - Simplified test structs
Executing a working assignment (1).
Completed the working assignment (1).
Executing a working assignment (2).
Completed the working assignment (2).
Executing a broken assignment.
```

Error:

```
error: memory read failed for 0x40000000
```

**SimpleStructsPropertyAssignment:**

Console output:

```
Application did finish launching.
Your working structure (1) is 80 bytes large.
Your working structure (2) is 64 bytes large.
Your broken structure is 80 bytes large.
Starting the test cases:
  - Property assignment
  - Simplified test structs
Executing a working assignment (1).
Completed the working assignment (1).
Executing a working assignment (2).
Completed the working assignment (2).
Executing a broken assignment.
```

Error:

```
error: memory read failed for 0x40000000
```


### A Successful Case

On the following config I see the results below:

- Xcode 6.3.1 (6D1002)
- iOS 8.3 (12F70)
- iPhone 6 (MG632LL/A)

**MockCCStructsDirectMethodCalls:**

Console output:

```
Application did finish launching.
Starting the test cases:
  - Direct method calls
  - Mock Cocos2D structs
Executing a broken assignment.
Completed the broken assignment.
We made it past the error case! Huzzah!
```

Error: NA


**MockCCStructsPropertyAssignment:**

Console output:

```
Application did finish launching.
Starting the test cases:
  - Property assignment
  - Mock Cocos2D structs
Executing a broken assignment.
Completed the broken assignment.
We made it past the error case! Huzzah!
```

Error: NA


**SimpleStructsDirectMethodCalls:**

Console output:

```
Application did finish launching.
Your working structure (1) is 80 bytes large.
Your working structure (2) is 64 bytes large.
Your broken structure is 80 bytes large.
Starting the test cases:
  - Direct method calls
  - Simplified test structs
Executing a working assignment (1).
Completed the working assignment (1).
Executing a working assignment (2).
Completed the working assignment (2).
Executing a broken assignment.
Completed the broken assignment.
We made it past the error case! Huzzah!
```

Error: NA


**SimpleStructsPropertyAssignment:**

Console output:

```
Application did finish launching.
Your working structure (1) is 80 bytes large.
Your working structure (2) is 64 bytes large.
Your broken structure is 80 bytes large.
Starting the test cases:
  - Property assignment
  - Simplified test structs
Executing a working assignment (1).
Completed the working assignment (1).
Executing a working assignment (2).
Completed the working assignment (2).
Executing a broken assignment.
Completed the broken assignment.
We made it past the error case! Huzzah!
```

Error: NA


