# Reverse Engineering
----------------------
>Dhishan Amaranath  
>16909360

### Hacking all the way up towards making a KeyGen

  The entry here is an detailed description of thought process and tools used for cracking an MAC application and finally making a KeyGen.

  The crackme used here is an MSJ [Mac Serial Junkie] 2009 challenge and can be found at [https://reverse.put.as/wp-content/uploads/2010/05/MSJ20091.zip][crackme].

    According to Merriam-Webster Dictionary, Reverse Engineering (RE) is "disassemble or analyze in detail in order to discover concepts involved in manufacture."

  As the definition goes, We need to understand the logic which went into the application. As we are all aware, the final executable any CPU can run is an Binary File which consists of just 0's and 1's. The process before this was an assembly language code generated usually from an high level language.

## Handyman:
- file
- strings
- class-dump
- OTX
- lldb

The first question about the binary is what is the type of the file or in more detail what architecture the binary is made for.

UNIX based system have an built in utility called `file` for finding the type of the executable. This works usually by finding the metadata stored in the binary itself.

```sh
Dhishan:crackme$ file Challenge\ #1.app/
Challenge #1.app/: directory
```
The Application which we could see with that cute logos are basically a directory. That further allows us to change directory into them and find our binaries

**file**

```sh
Dhishan:crackme$ file Challenge\ #1.app/Contents/MacOS/Challenge\ #1
Challenge #1.app/Contents/MacOS/Challenge #1: Mach-O universal binary with 2 architectures
Challenge #1.app/Contents/MacOS/Challenge #1 (for architecture i386):	Mach-O executable i386
Challenge #1.app/Contents/MacOS/Challenge #1 (for architecture ppc):	Mach-O executable ppc
```

The `file` commands tells us that the binary is a multiple architecture compatible.
>And by knowing that the binary is an i386 architecture, we know the data size of the registers or instructions we are dealing with are 32 bits.

Also we can see our pc architecture using the following command
```sh
uname -a
```

**strings**

There is another GNU built in utility called `strings` which prints all the strings inside the binary.
Remember that the each character is a byte *Each memory unit is a byte too* and a set of characters stored together in a binary are strings. There is more to that but thats all we need to know about it.

```sh
Dhishan:crackme$ strings Challenge\ #1.app/Contents/MacOS/Challenge\ #1
```

This gave me a huge list of strings and with a little observation I was able to categorize them, A sample is as below

|Variables  |  Methods 	                |   UI	       |
|---	      |---	                      |---	         |
|   name	  |  validateSerial:forName: 	|   mainWindow |
|  serial 	|  isRegistered 	          |   nameField	 |
|   length	|   verifyRegistration	    |   serialField|
|           |   isEqual                 |              |

From this list we already know a lot of details like the application has two UI fields for name and serial, and `validateSerial:forName:` method kind of hints us that the serial is validated against the user name.

**class-dump**

The next tool I discuss here is to retrieve the names of classes, methods etc. Its a part of the Otool we discuss later. This genius tool gives the names of the classes and methods used in the application for any MAC-O files built using Objective-C.

```sh
Dhishan:class-dump$ ./class-dump ../crackme/Challenge\ #1.app/Contents/MacOS/Challenge\ #1
@interface Level1 : NSObject
{
    id errorSheet;
    id incorrectSerialSheet;
    id mainWindow;
    id nameField;
    id registeredSheet;
    id serialField;
    id welcomeSheet;
    BOOL hasBeenRegistered;
}

- (void)awakeFromNib;
- (void)applicationDidFinishLaunching:(id)arg1;
- (void)continueWelcomeButton:(id)arg1;
- (void)quitCorrectSerialButton:(id)arg1;
- (void)okErrorSheetButton:(id)arg1;
- (void)okIncorrectSerialButton:(id)arg1;
- (void)cancelButton:(id)arg1;
- (void)unregisterButton:(id)arg1;
- (void)emailResults:(id)arg1;
- (void)verifyRegistration:(id)arg1;
- (BOOL)isRegistered;
- (BOOL)validateSerial:(id)arg1 forName:(id)arg2;
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(id)arg1;

@end
```
Now our intuition of the methods we categorized from the `strings` tool is validated.

**OTX**

With this information in hand we are more than ready to disassemble our binary.
There are various tools which disassemble our binary and my favorite is OTX. Its an GUI which uses the Otool in background provided by Xcode to disassemble. Assembly files have *.asm* extension.

**lldb**

The most important tool I will be using is a debugger, Which basically allows us to peek at CPU level, how the application is executed instruction by instruction. One such widely used debugger is `GDB`. I will be using `lldb` an Apple's version of the gdb.

You can learn more on using LLDB
[Practical Debugging with LLDB][Practical Debugging with LLDB]
[Dancing with the debugger][Dancing with the debugger]
[GDB vs LLDB commands][GDB vs LLDB commands]


## Diving into the Impossible
* * *
### Making sense of the Assembly

**Function 1:**

__**`(void)verifyRegistration:(id)arg1`**__

With a little knowledge of computer architecture I was quickly able to decode the first few lines of the asm which are function call conventions. More can be found [Here][x86 Caller conventions]

```assembly
+0  0000288e  pushl     %ebp
+1  0000288f  movl      %esp,%ebp
+3  00002891  pushl     %esi
+4  00002892  pushl     %ebx
+5  00002893  subl      $0x20,%esp
```

Without further looking into the next line of assembly I followed the code to next call instruction a little down the line.
```assembly
+26  000028a8  calll    0x0000505e -[(%esp,1) stringValue]
```
There were many such calling instructions and each time there were repeated instructions moving data into the stack. And each call was made to the same address `0x0000505e` but different scenarious.

```assembly
+52  000028c2  calll    0x0000505e  -[(%esp,1) isEqual:]
+61  000028cb  calll    0x0000504a   _NSBeep
+127  0000290d  calll   0x0000505e   -[(%esp,1) stringValue]
```

It was a clear indication that the function at `0x0000505e` should be some kind of call handling method.

`$esp` represented stack pointer and details of other registers can be found at [x86 Registers][x86 Registers]

For all purposes I considered the method at `0x0000505e` as an Black Box where the arguments were pushed on the stack orderly. The next instructions after the call repeatedly involved use of General Purpose Register `$EAX` So I was able to deduce that the return from the call must be put in `$EAX`.

Now a little more to confirm, I ran the application with our debugger `lldb` using
```shell
Dhishan:MacOS$ sudo lldb Challenge\ #1
```

disassembled code from *OTX* gave me the relative address of the function and was able to place breakpoints before the call and step through the code. Findings revealed that changes before and after the call involved only `$EAX` and `$EDX` and no alteration to the stack.

Example Screenshot:
![][S_After_Call]

The example call above was made with arguments `(id)nameField` and an address pointed at `0x0000403c` in stack. As we had already discovered from `strings` tool, The nameField appears to contain the the name value. The address might correspond to a function name `stringValue` because the result was string representation of our *userid*. The result as expected in the `$EAX` register was `@"'a'"`. The format is String representation in the Objective-C.

>This confirmed that the before the call, stack contained the function addresses in some form and the arguments. And the results were put in the `$EAX` register and call was returned.

**validateSerial:forName:**

The next important function was ` validateSerial:forName:` with two arguments (id)nameField and (id)serialField. From the function name and set of arguments passed, this looks like the function which validates the serial with the corresponding name. Breakpointing at the start of the function and using `bt` in lldb, I was able to get the call stack as below:

![][S_bt]

The function was called from our previous function with the name, serial and address of the function pushed in the stack. Tracing back the stack I was able to deduce the location of serial and the name fields to be :
-Serial at `0x10(EBP)`
-name at `0x14(EBP)`

The next snipped which was interesting was a jump based on the result of a stack to the end of the function. This cant be good. It appears like a return statement if some condition is not validated.

```assembly
+9  00002aa7  movl          0x00004040,%eax       length
+14  00002aac  movl          %eax,0x04(%esp)
+18  00002ab0  movl          0x10(%ebp),%eax               
+21  00002ab3  movl          %eax,(%esp)
+24  00002ab6  calll         0x0000505e           -[(%esp,1) length]
+29  00002abb  cmpl          $0x08,%eax
+32  00002abe  jne           0x00002c4e                   
```
This call is made to a function called length with serial as an argument. The result is tested with an immediate value of 8 `cmpl  $0x08,%eax`.
It is intuitive that the designer is testing for the length of the serial to be 8 characters

*So our First deduction with respect to serial:*
>The length of the password should be 8 characters

Scrolling down the assembly the next two calls were little different they were interdependent. i.e. The result of one function is used for the other

```assembly
movl          0x14(%ebp),%eax
movl          %eax,(%esp)
calll         0x0000505e                    -[(%esp,1) lossyCString]
movl          %eax,(%esp)
calll         0x00005063                    _strlen
movl          %eax,0xd0(%ebp)
```
The name at `0x14(%ebp)` is passed into a function called lossyCString and the result is passed into a function called `_strlen`. It is clear that the user id is converted into string and its length is found.
The length is stored in the stack at location `0xd0(%ebp)`

The code snippet below with an unconditional jump and the jump if above with a compare instruction, hints us that there is a loop.
```assembly
jmp           0x00002b27
....
cmpl          %ebx,0xd0(%ebp)
ja            0x00002af0
```

And looking briefly inside the loop, it was sort of an algorithm and I named it algorithm 1.

A similar structure was found couple of lines later with slight modifications and I called it Algorithm 2.

And for each algorithm loop comparator constant is an value it stored earlier at `0xd0(%ebp)` which is the length of the name field.

Now we have two black boxes [Not really black though] running different algorithms taking the same inputs [nameField].
After each algorithm, there was a Repetition of a code snipped which called our call handler with the arguments

1) result of the algorithms
2) `0x`
3) 'stringWithFormat'
4) 'NSString'

```assembly
movl          $0x00003078,0x08(%esp)     # Ascii(0x3078) = 0x
movl          %eax,0x0c(%esp)            # Output of the algorithm is in $eax
movl          0x00004028,%eax            # Memory at 0x00004028 points to methodstringWithFormat
movl          %eax,0x04(%esp)            # Memory at 0x00004054 points to class NSString
movl          0x00004054,%eax
movl          %eax,(%esp)
calll         0x0000505e
```

The result from the call in the register `$eax` was little ambiguous and with the help of Google I was able to figure out the syntax and wanted to reconstruct the code to better understand.

With a little tweaking and experimenting in Xcode in Objective-C I was able to reproduce the assembly snippet.


```objc
NSString *s = [NSString stringWithFormat:@"0x%x",decimal];
```

```assembly
0x1000012b9 <+25>:  movl   $0x1a0a, -0x44(%rbp)      ; imm = 0x1A0A
0x1000012c0 <+32>:  movq   0x17a1(%rip), %rdi        ; (void *)0x00007fff75828e28: NSString
0x1000012c7 <+39>:  movq   0x1782(%rip), %rsi        ; "stringWithFormat:"
0x1000012ce <+46>:  leaq   0xd7b(%rip), %rdx         ; @"0x%x"
0x1000012d5 <+53>:  movq   0xd34(%rip), %rax         ; (void *)0x00007fff974434c0: objc_msgSend
0x1000012f7 <+87>:  callq  0x10000148a
```
The instruction was compiled to my system architecture and was little different in the Register names and found the mapping and found out the function used in the original is the same as I guessed it.

![][S_xode1]
![][S_xode2]

>From the above experiment I was able to conclude that the `name` is taken as input and passed into two different algorithms and the individual results are converted into strings and stored in stack.

Next code snipped as expected should be something related to serial:

```assembly
movl          %ebx,0x08(%esp)           -EBX = 0 @+267
movl          %esi,0x0c(%esp)           -ESI = 4 @+262
movl          %eax,0xdc(%ebp)           
movl          0x00004048,%eax           -substringWithRange
movl          %eax,0x04(%esp)
movl          0x10(%ebp),%eax
movl          %eax,(%esp)
calll         0x0000505e                -[(%esp,1) substringWithRange:]
```

We know the location of the serial is at `0x10(EBP)` and it is pushed into stack with the another argument `substringWithRange` and two more arguments `0 [$EBX]` & `4 [$ESI]`. It is almost clear that the serial is sent into a function called substringWithRange with two more arguments 0 and 4. The substringWithRange function from the Objective-C strings class takes the string, the start index and the length and returns the substring.

Again I was able to reproduce and verify with Xcode.
```objc
 NSString  *foo = [foo1 substringWithRange:NSMakeRange(0, 4)];
```
![][S_xcode3]

Also a little bit of googling I was able to find out that the `foo` above contains the pointer to the memory location containing the returned string and similarly so should be the Contents of the `$eax` register when the call returns. Using LLDB I verified it as follows and voila! :blush:

![][S_appsr1]
![][S_memread]

A similar call was made for the last 4 character of the serial.
```assembly
calll   0x0000505e      
-[(%esp,1) substringWithRange:] Stack = Serial, substringWithRange, ESI = 4, EDI = 4
```

The next interesting code snippet was a comparison one:
```assembly
00002c0f  movl          %ebx,(%esp)
00002c14  movl          0xd8(%ebp),%eax
00002c17  movl          %eax,0x08(%esp)
00002c1b  movl          0x00004008,%eax
00002c20  movl          %eax,0x04(%esp)
00002c24  calll         0x0000505e                -[(%esp,1) isEqual:]
00002c29  testb         %al,%al
00002c2b  je            0x00002c4e                    return;
```
If you recall, the result of algorithm 1 - string converted value was put into `0xd8(%ebp)`. We can now observe that the result of algorithm 1 is passed with the first 4 characters of the serial to an function called isEqual. The result in al [byte addressable $eax register] now tells if both the arguments were equal.

```assembly
testb         %al,%al
je            0x00002c4e
```
The AL register value if 1 then the zero flag is not set and then jump wont happen to the end of the function, which means, they should be equal.

Exactly similar arguments were passed but variation this time was the result of algorithm 2 with last 4 characters of the serial.

If you are thinking what I am thinking, then we know we just cracked our application.:blush:

however the code snippet below for clarification
```assembly
00002c40  calll         0x0000505e                    -[(%esp,1) isEqual:]
00002c45  movl          $0x00000001,%edx
00002c4a  testb         %al,%al
00002c4c  jne           0x00002c5
00002c4e  xorl          %edx,%edx
00002c50  addl          $0x3c,%esp
00002c53  movl          %edx,%eax
```

If you Remember your digital logic class you would know that xoring the value with itself would result in 0. If the result is equal then `$edx` would be 1 other wise its 0 from the xor result. And we know for sure that the function returns the result in the `$EAX` register.

>The first digits of the serial value should be equal to algorithm one and the last four digits to the result of algorithm 2. As we saw earlier the algorithms used the `name` and presented the results.

Decoding the algorithms were relatively easy and I made a python GUI application for generating serial based on the username

![][S_keygen]
![][S_success]


[x86 Caller conventions]: https://en.wikibooks.org/wiki/X86_Disassembly/Calling_Conventions
[x86 Registers]: http://www.eecg.toronto.edu/~amza/www.mindsec.com/files/x86regs.html
[Practical Debugging with LLDB]: http://debugging-with-lldb.blogspot.com/
[Dancing with the debugger]: https://www.objc.io/issues/19-debugging/lldb-debugging/
[GDB vs LLDB commands]: https://developer.apple.com/library/mac/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-command-examples.html
[S_After_Call]: http://i.imgur.com/cnNabId.png
[S_bt]: http://i.imgur.com/27IvfVS.png
[S_xode1]: http://i.imgur.com/ochNTM8.png
[S_xode2]: http://i.imgur.com/mbeh9ux.png
[S_xcode3]: http://i.imgur.com/px7QxMG.png)
[S_memread]: http://i.imgur.com/5qlmQoL.png
[S_appsr1]: http://i.imgur.com/eELIQ4w.png
[S_keygen]: http://i.imgur.com/DDD55lO.png
[S_success]: http://i.imgur.com/N7RCFBO.png
[crackme]: <https://reverse.put.as/wp-content/uploads/2010/05/MSJ20091.zip>
