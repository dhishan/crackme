/Users/Dhishan/Documents/Scholastics/AppSec/ReverseEngg/crackme/Challenge #1.app/Contents/MacOS/Challenge#1:

md5: 8a9e7f0342b3f5b989efbaa45ac45014

(__TEXT,__text) section

start:
    +0  0000230c  pushl         $0x00
    +2  0000230e  movl          %esp,%ebp
    +4  00002310  andl          $0xf0,%esp
    +7  00002313  subl          $0x10,%esp
   +10  00002316  movl          0x04(%ebp),%ebx
   +13  00002319  movl          %ebx,0x00(%esp)
   +17  0000231d  leal          0x08(%ebp),%ecx
   +20  00002320  movl          %ecx,0x04(%esp)
   +24  00002324  addl          $0x01,%ebx
   +27  00002327  shll          $0x02,%ebx
   +30  0000232a  addl          %ecx,%ebx
   +32  0000232c  movl          %ebx,0x08(%esp)
   +36  00002330  calll         __start
   +41  00002335  hlt

__start:
    +0  00002336  pushl         %ebp
    +1  00002337  movl          %esp,%ebp
    +3  00002339  pushl         %edi
    +4  0000233a  pushl         %esi
    +5  0000233b  pushl         %ebx
    +6  0000233c  subl          $0x2c,%esp
    +9  0000233f  movl          0x0c(%ebp),%edi
   +12  00002342  movl          0x10(%ebp),%ebx
   +15  00002345  movl          0x08(%ebp),%eax
   +18  00002348  movl          %eax,0x0000300c
   +23  0000234d  movl          %edi,0x00003008
   +29  00002353  movl          %ebx,0x00003004
   +35  00002359  movl          (%edi),%ecx
   +37  0000235b  testl         %ecx,%ecx
   +39  0000235d  jne           0x00002366
   +41  0000235f  movl          $0x00002c5c,%ecx
   +46  00002364  jmp           0x0000237f
   +48  00002366  movl          %ecx,%edx
   +50  00002368  jmp           0x00002378
   +52  0000236a  cmpb          $0x2f,%al                     '/'
   +54  0000236c  je            0x00002373
   +56  0000236e  addl          $0x01,%edx
   +59  00002371  jmp           0x00002378
   +61  00002373  addl          $0x01,%edx
   +64  00002376  movl          %edx,%ecx
   +66  00002378  movzbl        (%edx),%eax
   +69  0000237b  testb         %al,%al
   +71  0000237d  jne           0x0000236a
   +73  0000237f  movl          %ecx,0x00003000
   +79  00002385  movl          %ebx,%eax
   +81  00002387  jmp           0x0000238c
   +83  00002389  addl          $0x04,%eax
   +86  0000238c  movl          (%eax),%edx
   +88  0000238e  testl         %edx,%edx
   +90  00002390  jne           0x00002389
   +92  00002392  leal          0x04(%eax),%esi
   +95  00002395  movl          0x00005000,%eax
  +100  0000239a  movl          (%eax),%eax
  +102  0000239c  testl         %eax,%eax
  +104  0000239e  je            0x000023a2
  +106  000023a0  call          *%eax
  +108  000023a2  movl          0x00005008,%eax
  +113  000023a7  movl          (%eax),%eax
  +115  000023a9  testl         %eax,%eax
  +117  000023ab  je            0x000023af
  +119  000023ad  call          *%eax
  +121  000023af  calll         0x0000504f                    ___keymgr_dwarf2_register_sections
  +126  000023b4  leal          0xe0(%ebp),%eax
  +129  000023b7  movl          %eax,0x04(%esp)
  +133  000023bb  movl          $0x00002c60,(%esp)            __dyld_make_delayed_module_initializer_calls
  +140  000023c2  calll         __dyld_func_lookup
  +145  000023c7  call          *0xe0(%ebp)
  +148  000023ca  leal          0xe4(%ebp),%eax
  +151  000023cd  movl          %eax,0x04(%esp)
  +155  000023d1  movl          $0x00002c90,(%esp)            __dyld_mod_term_funcs
  +162  000023d8  calll         __dyld_func_lookup
  +167  000023dd  movl          0xe4(%ebp),%eax
  +170  000023e0  testl         %eax,%eax
  +172  000023e2  je            0x000023ec
  +174  000023e4  movl          %eax,(%esp)
  +177  000023e7  calll         0x00005054                    _atexit
  +182  000023ec  movl          0x00005004,%eax
  +187  000023f1  movl          $0x00000000,(%eax)
  +193  000023f7  movl          %esi,0x0c(%esp)
  +197  000023fb  movl          %ebx,0x08(%esp)
  +201  000023ff  movl          %edi,0x04(%esp)
  +205  00002403  movl          0x08(%ebp),%eax
  +208  00002406  movl          %eax,(%esp)
  +211  00002409  calll         _main
  +216  0000240e  movl          %eax,(%esp)
  +219  00002411  calll         0x00005059                    _exit
  +224  00002416  nop
  +225  00002417  nop

dyld_stub_binding_helper:
    +0  00002418  pushl         $0x00001000
    +5  0000241d  jmp           *0x00003010
   +11  00002423  nop

__dyld_func_lookup:
    +0  00002424  jmp           *0x00003014

_main:
    +0  0000242a  pushl         %ebp
    +1  0000242b  movl          %esp,%ebp
    +3  0000242d  leave
    +4  0000242e  jmp           0x00005045                    _NSApplicationMain

-(void)[Level1 awakeFromNib]:
    +0  00002433  pushl         %ebp
    +1  00002434  movl          %esp,%ebp
    +3  00002436  pushl         %esi
    +4  00002437  pushl         %ebx
    +5  00002438  subl          $0x10,%esp
    +8  0000243b  movl          0x08(%ebp),%esi
   +11  0000243e  movb          $0x00,0x20(%esi)              (BOOL)hasBeenRegistered
   +15  00002442  movl          0x00004000,%eax               standardUserDefaults
   +20  00002447  movl          %eax,0x04(%esp)
   +24  0000244b  movl          0x00004058,%eax               NSUserDefaults
   +29  00002450  movl          %eax,(%esp)
   +32  00002453  calll         0x0000505e                    +[NSUserDefaults standardUserDefaults]
   +37  00002458  movl          0x00004004,%edx               objectForKey:
   +43  0000245e  movl          $0x00003018,0x08(%esp)        hasBeenRegistered
   +51  00002466  movl          %edx,0x04(%esp)
   +55  0000246a  movl          %eax,(%esp)
   +58  0000246d  calll         0x0000505e                    -[(%esp,1) objectForKey:]
   +63  00002472  movl          0x00004008,%edx               isEqual:
   +69  00002478  movl          $0x00003028,0x08(%esp)        YES
   +77  00002480  movl          %edx,0x04(%esp)
   +81  00002484  movl          %eax,(%esp)
   +84  00002487  calll         0x0000505e                    -[(%esp,1) isEqual:]
   +89  0000248c  testb         %al,%al
   +91  0000248e  je            0x00002517                    return;
   +97  00002494  movl          0x00004000,%eax               standardUserDefaults
  +102  00002499  movl          %eax,0x04(%esp)
  +106  0000249d  movl          0x00004058,%eax               NSUserDefaults
  +111  000024a2  movl          %eax,(%esp)
  +114  000024a5  calll         0x0000505e                    +[NSUserDefaults standardUserDefaults]
  +119  000024aa  movl          0x00004004,%edx               objectForKey:
  +125  000024b0  movl          $0x00003038,0x08(%esp)        name
  +133  000024b8  movl          %edx,0x04(%esp)
  +137  000024bc  movl          %eax,(%esp)
  +140  000024bf  calll         0x0000505e                    -[(%esp,1) objectForKey:]
  +145  000024c4  movl          %eax,%ebx
  +147  000024c6  movl          0x00004000,%eax               standardUserDefaults
  +152  000024cb  movl          %eax,0x04(%esp)
  +156  000024cf  movl          0x00004058,%eax               NSUserDefaults
  +161  000024d4  movl          %eax,(%esp)
  +164  000024d7  calll         0x0000505e                    +[NSUserDefaults standardUserDefaults]
  +169  000024dc  movl          0x00004004,%edx               objectForKey:
  +175  000024e2  movl          $0x00003048,0x08(%esp)        serial
  +183  000024ea  movl          %edx,0x04(%esp)
  +187  000024ee  movl          %eax,(%esp)
  +190  000024f1  calll         0x0000505e                    -[(%esp,1) objectForKey:]
  +195  000024f6  movl          %ebx,0x0c(%esp)
  +199  000024fa  movl          %esi,(%esp)
  +202  000024fd  movl          %eax,0x08(%esp)
  +206  00002501  movl          0x0000400c,%eax               validateSerial:forName:
  +211  00002506  movl          %eax,0x04(%esp)
  +215  0000250a  calll         0x0000505e                    -[(%esp,1) validateSerial:forName:]
  +220  0000250f  testb         %al,%al
  +222  00002511  je            0x00002517                    return;
  +224  00002513  movb          $0x01,0x20(%esi)              (BOOL)hasBeenRegistered
  +228  00002517  addl          $0x10,%esp
  +231  0000251a  popl          %ebx
  +232  0000251b  popl          %esi
  +233  0000251c  leave
  +234  0000251d  ret

-(void)[Level1 applicationDidFinishLaunching:]:
    +0  0000251e  pushl         %ebp
    +1  0000251f  movl          %esp,%ebp
    +3  00002521  pushl         %ebx
    +4  00002522  subl          $0x24,%esp
    +7  00002525  movl          0x08(%ebp),%ebx
   +10  00002528  movl          0x00004010,%eax               isRegistered
   +15  0000252d  movl          %ebx,(%esp)
   +18  00002530  movl          %eax,0x04(%esp)
   +22  00002534  calll         0x0000505e                    -[(%esp,1) isRegistered]
   +27  00002539  testb         %al,%al
   +29  0000253b  je            0x00002568
   +31  0000253d  movl          0x0000500c,%eax
   +36  00002542  movl          (%eax),%edx
   +38  00002544  movl          $0x00000000,0x18(%esp)
   +46  0000254c  movl          $0x00000000,0x14(%esp)
   +54  00002554  movl          $0x00000000,0x10(%esp)
   +62  0000255c  movl          0x0c(%ebx),%eax               (id)mainWindow
   +65  0000255f  movl          %eax,0x0c(%esp)
   +69  00002563  movl          0x14(%ebx),%eax               (id)registeredSheet
   +72  00002566  jmp           0x00002591
   +74  00002568  movl          0x0000500c,%eax
   +79  0000256d  movl          (%eax),%edx
   +81  0000256f  movl          $0x00000000,0x18(%esp)
   +89  00002577  movl          $0x00000000,0x14(%esp)
   +97  0000257f  movl          $0x00000000,0x10(%esp)
  +105  00002587  movl          0x0c(%ebx),%eax               (id)mainWindow
  +108  0000258a  movl          %eax,0x0c(%esp)
  +112  0000258e  movl          0x1c(%ebx),%eax               (id)welcomeSheet
  +115  00002591  movl          %eax,0x08(%esp)
  +119  00002595  movl          0x00004014,%eax               beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:
  +124  0000259a  movl          %edx,(%esp)
  +127  0000259d  movl          %eax,0x04(%esp)
  +131  000025a1  calll         0x0000505e                    -[(%esp,1) beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:]
  +136  000025a6  addl          $0x24,%esp
  +139  000025a9  popl          %ebx
  +140  000025aa  leave
  +141  000025ab  ret

-(void)[Level1 continueWelcomeButton:]:
    +0  000025ac  pushl         %ebp
    +1  000025ad  movl          %esp,%ebp
    +3  000025af  pushl         %ebx
    +4  000025b0  subl          $0x14,%esp
    +7  000025b3  movl          0x08(%ebp),%ebx
   +10  000025b6  movl          0x0000500c,%eax
   +15  000025bb  movl          (%eax),%edx
   +17  000025bd  movl          0x1c(%ebx),%eax               (id)welcomeSheet
   +20  000025c0  movl          %eax,0x08(%esp)
   +24  000025c4  movl          0x00004018,%eax               endSheet:
   +29  000025c9  movl          %edx,(%esp)
   +32  000025cc  movl          %eax,0x04(%esp)
   +36  000025d0  calll         0x0000505e                    -[(%esp,1) endSheet:]
   +41  000025d5  movl          0x1c(%ebx),%edx               (id)welcomeSheet
   +44  000025d8  movl          %ebx,0x10(%ebp)
   +47  000025db  movl          0x0000401c,%eax               orderOut:
   +52  000025e0  movl          %edx,0x08(%ebp)
   +55  000025e3  movl          %eax,0x0c(%ebp)
   +58  000025e6  addl          $0x14,%esp
   +61  000025e9  popl          %ebx
   +62  000025ea  leave
   +63  000025eb  jmp           0x0000505e                    _objc_msgSend

-(void)[Level1 quitCorrectSerialButton:]:
    +0  000025f0  pushl         %ebp
    +1  000025f1  movl          %esp,%ebp
    +3  000025f3  pushl         %esi
    +4  000025f4  pushl         %ebx
    +5  000025f5  subl          $0x10,%esp
    +8  000025f8  movl          0x08(%ebp),%ebx
   +11  000025fb  movl          0x0000500c,%esi
   +17  00002601  movl          0x14(%ebx),%eax               (id)registeredSheet
   +20  00002604  movl          (%esi),%edx
   +22  00002606  movl          %eax,0x08(%esp)
   +26  0000260a  movl          0x00004018,%eax               endSheet:
   +31  0000260f  movl          %edx,(%esp)
   +34  00002612  movl          %eax,0x04(%esp)
   +38  00002616  calll         0x0000505e                    -[(%esp,1) endSheet:]
   +43  0000261b  movl          0x14(%ebx),%edx               (id)registeredSheet
   +46  0000261e  movl          %ebx,0x08(%esp)
   +50  00002622  movl          0x0000401c,%eax               orderOut:
   +55  00002627  movl          %edx,(%esp)
   +58  0000262a  movl          %eax,0x04(%esp)
   +62  0000262e  calll         0x0000505e                    -[(%esp,1) orderOut:]
   +67  00002633  movl          (%esi),%edx
   +69  00002635  movl          %ebx,0x10(%ebp)
   +72  00002638  movl          0x00004020,%eax               terminate:
   +77  0000263d  movl          %edx,0x08(%ebp)
   +80  00002640  movl          %eax,0x0c(%ebp)
   +83  00002643  addl          $0x10,%esp
   +86  00002646  popl          %ebx
   +87  00002647  popl          %esi
   +88  00002648  leave
   +89  00002649  jmp           0x0000505e                    _objc_msgSend

-(void)[Level1 okErrorSheetButton:]:
    +0  0000264e  pushl         %ebp
    +1  0000264f  movl          %esp,%ebp
    +3  00002651  pushl         %ebx
    +4  00002652  subl          $0x14,%esp
    +7  00002655  movl          0x08(%ebp),%ebx
   +10  00002658  movl          0x0000500c,%eax
   +15  0000265d  movl          (%eax),%edx
   +17  0000265f  movl          0x04(%ebx),%eax               (id)errorSheet
   +20  00002662  movl          %eax,0x08(%esp)
   +24  00002666  movl          0x00004018,%eax               endSheet:
   +29  0000266b  movl          %edx,(%esp)
   +32  0000266e  movl          %eax,0x04(%esp)
   +36  00002672  calll         0x0000505e                    -[(%esp,1) endSheet:]
   +41  00002677  movl          0x04(%ebx),%edx               (id)errorSheet
   +44  0000267a  movl          %ebx,0x10(%ebp)
   +47  0000267d  movl          0x0000401c,%eax               orderOut:
   +52  00002682  movl          %edx,0x08(%ebp)
   +55  00002685  movl          %eax,0x0c(%ebp)
   +58  00002688  addl          $0x14,%esp
   +61  0000268b  popl          %ebx
   +62  0000268c  leave
   +63  0000268d  jmp           0x0000505e                    _objc_msgSend

-(void)[Level1 okIncorrectSerialButton:]:
    +0  00002692  pushl         %ebp
    +1  00002693  movl          %esp,%ebp
    +3  00002695  pushl         %ebx
    +4  00002696  subl          $0x14,%esp
    +7  00002699  movl          0x08(%ebp),%ebx
   +10  0000269c  movl          0x0000500c,%eax
   +15  000026a1  movl          (%eax),%edx
   +17  000026a3  movl          0x08(%ebx),%eax               (id)incorrectSerialSheet
   +20  000026a6  movl          %eax,0x08(%esp)
   +24  000026aa  movl          0x00004018,%eax               endSheet:
   +29  000026af  movl          %edx,(%esp)
   +32  000026b2  movl          %eax,0x04(%esp)
   +36  000026b6  calll         0x0000505e                    -[(%esp,1) endSheet:]
   +41  000026bb  movl          0x08(%ebx),%edx               (id)incorrectSerialSheet
   +44  000026be  movl          %ebx,0x10(%ebp)
   +47  000026c1  movl          0x0000401c,%eax               orderOut:
   +52  000026c6  movl          %edx,0x08(%ebp)
   +55  000026c9  movl          %eax,0x0c(%ebp)
   +58  000026cc  addl          $0x14,%esp
   +61  000026cf  popl          %ebx
   +62  000026d0  leave
   +63  000026d1  jmp           0x0000505e                    _objc_msgSend

-(void)[Level1 cancelButton:]:
    +0  000026d6  movl          0x0000500c,%eax

Anon???:
    +0  000026db  pushl         %ebp
    +1  000026dc  movl          %esp,%ebp
    +3  000026de  movl          (%eax),%edx
    +5  000026e0  movl          0x08(%ebp),%eax
    +8  000026e3  movl          %eax,0x10(%ebp)
   +11  000026e6  movl          0x00004020,%eax               terminate:
   +16  000026eb  movl          %edx,0x08(%ebp)
   +19  000026ee  movl          %eax,0x0c(%ebp)
   +22  000026f1  leave
   +23  000026f2  jmp           0x0000505e                    _objc_msgSend

-(void)[Level1 unregisterButton:]:
    +0  000026f7  pushl         %ebp
    +1  000026f8  movl          %esp,%ebp
    +3  000026fa  pushl         %ebx
    +4  000026fb  subl          $0x14,%esp
    +7  000026fe  movl          0x00004000,%eax               standardUserDefaults
   +12  00002703  movl          0x08(%ebp),%ebx
   +15  00002706  movl          %eax,0x04(%esp)
   +19  0000270a  movl          0x00004058,%eax               NSUserDefaults
   +24  0000270f  movl          %eax,(%esp)
   +27  00002712  calll         0x0000505e                    +[NSUserDefaults standardUserDefaults]
   +32  00002717  movl          $0x00003018,0x0c(%esp)        hasBeenRegistered
   +40  0000271f  movl          $0x00000000,0x08(%esp)
   +48  00002727  movl          0x00004024,%edx               setObject:forKey:
   +54  0000272d  movl          %eax,(%esp)
   +57  00002730  movl          %edx,0x04(%esp)
   +61  00002734  calll         0x0000505e                    -[(%esp,1) setObject:forKey:]
   +66  00002739  movl          0x00004000,%eax               standardUserDefaults
   +71  0000273e  movl          %eax,0x04(%esp)
   +75  00002742  movl          0x00004058,%eax               NSUserDefaults
   +80  00002747  movl          %eax,(%esp)
   +83  0000274a  calll         0x0000505e                    +[NSUserDefaults standardUserDefaults]
   +88  0000274f  movl          $0x00003038,0x0c(%esp)        name
   +96  00002757  movl          $0x00000000,0x08(%esp)
  +104  0000275f  movl          0x00004024,%edx               setObject:forKey:
  +110  00002765  movl          %eax,(%esp)
  +113  00002768  movl          %edx,0x04(%esp)
  +117  0000276c  calll         0x0000505e                    -[(%esp,1) setObject:forKey:]
  +122  00002771  movl          0x00004000,%eax               standardUserDefaults
  +127  00002776  movl          %eax,0x04(%esp)
  +131  0000277a  movl          0x00004058,%eax               NSUserDefaults
  +136  0000277f  movl          %eax,(%esp)
  +139  00002782  calll         0x0000505e                    +[NSUserDefaults standardUserDefaults]
  +144  00002787  movl          $0x00003048,0x0c(%esp)        serial
  +152  0000278f  movl          $0x00000000,0x08(%esp)
  +160  00002797  movl          0x00004024,%edx               setObject:forKey:
  +166  0000279d  movl          %eax,(%esp)
  +169  000027a0  movl          %edx,0x04(%esp)
  +173  000027a4  calll         0x0000505e                    -[(%esp,1) setObject:forKey:]
  +178  000027a9  movl          0x0000500c,%eax
  +183  000027ae  movl          (%eax),%edx
  +185  000027b0  movl          0x14(%ebx),%eax               (id)registeredSheet
  +188  000027b3  movl          %eax,0x08(%esp)
  +192  000027b7  movl          0x00004018,%eax               endSheet:
  +197  000027bc  movl          %edx,(%esp)
  +200  000027bf  movl          %eax,0x04(%esp)
  +204  000027c3  calll         0x0000505e                    -[(%esp,1) endSheet:]
  +209  000027c8  movl          0x14(%ebx),%edx               (id)registeredSheet
  +212  000027cb  movl          %ebx,0x10(%ebp)
  +215  000027ce  movl          0x0000401c,%eax               orderOut:
  +220  000027d3  movl          %edx,0x08(%ebp)
  +223  000027d6  movl          %eax,0x0c(%ebp)
  +226  000027d9  addl          $0x14,%esp
  +229  000027dc  popl          %ebx
  +230  000027dd  leave
  +231  000027de  jmp           0x0000505e                    _objc_msgSend

-(void)[Level1 emailResults:]:
    +0  000027e3  pushl         %ebp
    +1  000027e4  movl          %esp,%ebp
    +3  000027e6  pushl         %ebx
    +4  000027e7  subl          $0x24,%esp
    +7  000027ea  movl          $0x00003058,0x08(%esp)        http://www.macserialjunkie.com/
   +15  000027f2  movl          0x00004028,%eax               stringWithFormat:
   +20  000027f7  movl          %eax,0x04(%esp)
   +24  000027fb  movl          0x00004054,%eax               NSString
   +29  00002800  movl          %eax,(%esp)
   +32  00002803  calll         0x0000505e                    +[NSString stringWithFormat:]
   +37  00002808  movl          0x00004050,%ebx               NSURL
   +43  0000280e  movl          $0x08000100,0x10(%esp)
   +51  00002816  movl          $0x00000000,0x0c(%esp)
   +59  0000281e  movl          $0x00000000,0x08(%esp)
   +67  00002826  movl          $0x00000000,(%esp)
   +74  0000282d  movl          %eax,0x04(%esp)
   +78  00002831  calll         0x00005040                    _CFURLCreateStringByAddingPercentEscapes
   +83  00002836  movl          0x0000402c,%edx               autorelease
   +89  0000283c  movl          %edx,0x04(%esp)
   +93  00002840  movl          %eax,(%esp)
   +96  00002843  calll         0x0000505e                    -[(%esp,1) autorelease]
  +101  00002848  movl          %eax,0x08(%esp)
  +105  0000284c  movl          0x00004030,%eax               URLWithString:
  +110  00002851  movl          %ebx,(%esp)
  +113  00002854  movl          %eax,0x04(%esp)
  +117  00002858  calll         0x0000505e                    +[NSURL URLWithString:]
  +122  0000285d  movl          %eax,%ebx
  +124  0000285f  movl          0x00004034,%eax               sharedWorkspace
  +129  00002864  movl          %eax,0x04(%esp)
  +133  00002868  movl          0x0000404c,%eax               NSWorkspace
  +138  0000286d  movl          %eax,(%esp)
  +141  00002870  calll         0x0000505e                    +[NSWorkspace sharedWorkspace]
  +146  00002875  movl          %ebx,0x10(%ebp)
  +149  00002878  movl          0x00004038,%edx               openURL:
  +155  0000287e  movl          %edx,0x0c(%ebp)
  +158  00002881  movl          %eax,0x08(%ebp)
  +161  00002884  addl          $0x24,%esp
  +164  00002887  popl          %ebx
  +165  00002888  leave
  +166  00002889  jmp           0x0000505e                    _objc_msgSend

-(void)[Level1 verifyRegistration:]:
    +0  0000288e  pushl         %ebp
    +1  0000288f  movl          %esp,%ebp
    +3  00002891  pushl         %esi
    +4  00002892  pushl         %ebx
    +5  00002893  subl          $0x20,%esp
    +8  00002896  movl          0x08(%ebp),%esi
   +11  00002899  movl          0x0000403c,%eax               stringValue
   +16  0000289e  movl          0x10(%esi),%edx               (id)nameField
   +19  000028a1  movl          %eax,0x04(%esp)
   +23  000028a5  movl          %edx,(%esp)
   +26  000028a8  calll         0x0000505e                    -[(%esp,1) stringValue]
   +31  000028ad  movl          0x00004008,%edx               isEqual:
   +37  000028b3  movl          $0x00003068,0x08(%esp)
   +45  000028bb  movl          %edx,0x04(%esp)
   +49  000028bf  movl          %eax,(%esp)
   +52  000028c2  calll         0x0000505e                    -[(%esp,1) isEqual:]
   +57  000028c7  testb         %al,%al
   +59  000028c9  je            0x000028fe
   +61  000028cb  calll         0x0000504a                    _NSBeep
   +66  000028d0  movl          0x0000500c,%eax
   +71  000028d5  movl          (%eax),%edx
   +73  000028d7  movl          $0x00000000,0x18(%esp)
   +81  000028df  movl          $0x00000000,0x14(%esp)
   +89  000028e7  movl          $0x00000000,0x10(%esp)
   +97  000028ef  movl          0x0c(%esi),%eax               (id)mainWindow
  +100  000028f2  movl          %eax,0x0c(%esp)
  +104  000028f6  movl          0x04(%esi),%eax               (id)errorSheet
  +107  000028f9  jmp           0x00002a6c
  +112  000028fe  movl          0x10(%esi),%edx               (id)nameField
  +115  00002901  movl          0x0000403c,%eax               stringValue
  +120  00002906  movl          %edx,(%esp)
  +123  00002909  movl          %eax,0x04(%esp)
  +127  0000290d  calll         0x0000505e                    -[(%esp,1) stringValue]
  +132  00002912  movl          0x18(%esi),%edx               (id)serialField
  +135  00002915  movl          %edx,(%esp)
  +138  00002918  movl          %eax,%ebx
  +140  0000291a  movl          0x0000403c,%eax               stringValue
  +145  0000291f  movl          %eax,0x04(%esp)
  +149  00002923  calll         0x0000505e                    -[(%esp,1) stringValue] [] eax = serial, ebx = name
  +154  00002928  movl          %ebx,0x0c(%esp)
  +158  0000292c  movl          %esi,(%esp)
  +161  0000292f  movl          %eax,0x08(%esp)
  +165  00002933  movl          0x0000400c,%eax               validateSerial:forName:
  +170  00002938  movl          %eax,0x04(%esp)
  +174  0000293c  calll         0x0000505e                    -[(%esp,1) validateSerial:forName:]
  +179  00002941  testb         %al,%al
  +181  00002943  je            0x00002a3e                    ##### jumps if not validated not correct
  +187  00002949  movl          0x00004000,%eax               standardUserDefaults
  +192  0000294e  movl          %eax,0x04(%esp)
  +196  00002952  movl          0x00004058,%eax               NSUserDefaults
  +201  00002957  movl          %eax,(%esp)
  +204  0000295a  calll         0x0000505e                    +[NSUserDefaults standardUserDefaults]
  +209  0000295f  movl          0x00004024,%edx               setObject:forKey:
  +215  00002965  movl          $0x00003018,0x0c(%esp)        hasBeenRegistered
  +223  0000296d  movl          $0x00003028,0x08(%esp)        YES
  +231  00002975  movl          %edx,0x04(%esp)
  +235  00002979  movl          %eax,(%esp)
  +238  0000297c  calll         0x0000505e                    -[(%esp,1) setObject:forKey:]
  +243  00002981  movl          0x00004000,%eax               standardUserDefaults
  +248  00002986  movl          %eax,0x04(%esp)
  +252  0000298a  movl          0x00004058,%eax               NSUserDefaults
  +257  0000298f  movl          %eax,(%esp)
  +260  00002992  calll         0x0000505e                    +[NSUserDefaults standardUserDefaults]
  +265  00002997  movl          0x10(%esi),%edx               (id)nameField
  +268  0000299a  movl          %edx,(%esp)
  +271  0000299d  movl          %eax,%ebx
  +273  0000299f  movl          0x0000403c,%eax               stringValue
  +278  000029a4  movl          %eax,0x04(%esp)
  +282  000029a8  calll         0x0000505e                    -[(%esp,1) stringValue]
  +287  000029ad  movl          %ebx,(%esp)
  +290  000029b0  movl          $0x00003038,0x0c(%esp)        name
  +298  000029b8  movl          %eax,0x08(%esp)
  +302  000029bc  movl          0x00004024,%eax               setObject:forKey:
  +307  000029c1  movl          %eax,0x04(%esp)
  +311  000029c5  calll         0x0000505e                    -[(%esp,1) setObject:forKey:]
  +316  000029ca  movl          0x00004000,%eax               standardUserDefaults
  +321  000029cf  movl          %eax,0x04(%esp)
  +325  000029d3  movl          0x00004058,%eax               NSUserDefaults
  +330  000029d8  movl          %eax,(%esp)
  +333  000029db  calll         0x0000505e                    +[NSUserDefaults standardUserDefaults]
  +338  000029e0  movl          0x18(%esi),%edx               (id)serialField
  +341  000029e3  movl          %edx,(%esp)
  +344  000029e6  movl          %eax,%ebx
  +346  000029e8  movl          0x0000403c,%eax               stringValue
  +351  000029ed  movl          %eax,0x04(%esp)
  +355  000029f1  calll         0x0000505e                    -[(%esp,1) stringValue]
  +360  000029f6  movl          $0x00003048,0x0c(%esp)        serial
  +368  000029fe  movl          %ebx,(%esp)
  +371  00002a01  movl          %eax,0x08(%esp)
  +375  00002a05  movl          0x00004024,%eax               setObject:forKey:
  +380  00002a0a  movl          %eax,0x04(%esp)
  +384  00002a0e  calll         0x0000505e                    -[(%esp,1) setObject:forKey:]
  +389  00002a13  movl          0x0000500c,%eax
  +394  00002a18  movl          (%eax),%edx
  +396  00002a1a  movl          $0x00000000,0x18(%esp)
  +404  00002a22  movl          $0x00000000,0x14(%esp)
  +412  00002a2a  movl          $0x00000000,0x10(%esp)
  +420  00002a32  movl          0x0c(%esi),%eax               (id)mainWindow
  +423  00002a35  movl          %eax,0x0c(%esp)
  +427  00002a39  movl          0x14(%esi),%eax               (id)registeredSheet
  +430  00002a3c  jmp           0x00002a6c
  +432  00002a3e  calll         0x0000504a                    _NSBeep
  +437  00002a43  movl          0x0000500c,%eax
  +442  00002a48  movl          (%eax),%edx
  +444  00002a4a  movl          $0x00000000,0x18(%esp)
  +452  00002a52  movl          $0x00000000,0x14(%esp)
  +460  00002a5a  movl          $0x00000000,0x10(%esp)
  +468  00002a62  movl          0x0c(%esi),%eax               (id)mainWindow
  +471  00002a65  movl          %eax,0x0c(%esp)
  +475  00002a69  movl          0x08(%esi),%eax               (id)incorrectSerialSheet
  +478  00002a6c  movl          %eax,0x08(%esp)
  +482  00002a70  movl          0x00004014,%eax               beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:
  +487  00002a75  movl          %edx,(%esp)
  +490  00002a78  movl          %eax,0x04(%esp)
  +494  00002a7c  calll         0x0000505e                    -[(%esp,1) beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:]
  +499  00002a81  addl          $0x20,%esp
  +502  00002a84  popl          %ebx
  +503  00002a85  popl          %esi
  +504  00002a86  leave
  +505  00002a87  ret

-(BOOL)[Level1 isRegistered]:
    +0  00002a88  pushl         %ebp
    +1  00002a89  movl          %esp,%ebp
    +3  00002a8b  movl          0x08(%ebp),%eax
    +6  00002a8e  movzbl        0x20(%eax),%eax
   +10  00002a92  leave
   +11  00002a93  ret

-(BOOL)[Level1 applicationShouldTerminateAfterLastWindowClosed:]:
    +0  00002a94  pushl         %ebp
    +1  00002a95  movl          $0x00000001,%eax
    +6  00002a9a  movl          %esp,%ebp
    +8  00002a9c  leave
    +9  00002a9d  ret

-(BOOL)[Level1 validateSerial:forName:]:
    +0  00002a9e  pushl         %ebp
    +1  00002a9f  movl          %esp,%ebp
    +3  00002aa1  pushl         %edi
    +4  00002aa2  pushl         %esi
    +5  00002aa3  pushl         %ebx
    +6  00002aa4  subl          $0x3c,%esp
    +9  00002aa7  movl          0x00004040,%eax               length
   +14  00002aac  movl          %eax,0x04(%esp)
   +18  00002ab0  movl          0x10(%ebp),%eax               #Location of the password  0x10(EBP)
   +21  00002ab3  movl          %eax,(%esp)
   +24  00002ab6  calll         0x0000505e                    -[(%esp,1) length]
   +29  00002abb  cmpl          $0x08,%eax                    ## Length of the password == 8
   +32  00002abe  jne           0x00002c4e
   +38  00002ac4  movl          0x00004044,%eax               lossyCString
   +43  00002ac9  movl          $0x00000004,%esi
   +48  00002ace  xorl          %ebx,%ebx
   +50  00002ad0  movl          %eax,0x04(%esp)               # stack one down = lossyCString
   +54  00002ad4  movl          0x14(%ebp),%eax               # ebp + 0x14 = User id - Stack top
   +57  00002ad7  movl          %eax,(%esp)                   #
   +60  00002ada  calll         0x0000505e                    -[(%esp,1) lossyCString] # eax for user id d - 189060 - Returned the memory location of the copied user ids
   +65  00002adf  movl          %eax,(%esp)                   # now edi points to the destination =
   +68  00002ae2  movl          %eax,%edi
   +70  00002ae4  calll         0x00005063                    _strlen  == len of the user id in eax
   +75  00002ae9  xorl          %ecx,%ecx                     #cleaning the zero flag
   +77  00002aeb  movl          %eax,0xd0(%ebp)
   +80  00002aee  jmp           0x00002b27
   +82  00002af0  movsbl        (%edi,%ebx),%eax              #copies the current character into eax Ascii(char)
   +86  00002af4  incl          %ebx
   +87  00002af5  imull         %esi,%eax                     #current char ascii[eax] * 4[esi] = eax
   +90  00002af8  addl          $0x04,%esi                    #increment esi by 4
   +93  00002afb  movl          %eax,%edx                     #edx has the result
   +95  00002afd  shll          $0x04,%edx                    # edx = eax << 4
   +98  00002b00  subl          %eax,%edx                     # edx -= eax
  +100  00002b02  movl          $0x68db8bad,%eax              # eax = $0x68db8bad
  +105  00002b07  leal          0x0000029a(%edx,%ecx),%ecx    #
  +112  00002b0e  imull         %ecx
  +114  00002b10  movl          %ecx,%eax
  +116  00002b12  sarl          $0x1f,%eax
  +119  00002b15  sarl          $0x0c,%edx
  +122  00002b18  subl          %eax,%edx                   #edx -= eax
  +124  00002b1a  movl          %ecx,%eax
  +126  00002b1c  imull         $0x00002710,%edx,%edx
  +132  00002b22  subl          %edx,%eax
  +134  00002b24  movl          %eax,0xe0(%ebp)
  +137  00002b27  cmpl          %ebx,0xd0(%ebp)
  +140  00002b2a  ja            0x00002af0
  +142  00002b2c  movl          0xe0(%ebp),%eax
  +145  00002b2f  movl          $0x00000004,%esi
  +150  00002b34  xorl          %ebx,%ebx                     #reset ebx
  +152  00002b36  movl          $0x00003078,0x08(%esp)        %i
  +160  00002b3e  movl          %eax,0x0c(%esp)               # result of the algorithm 1 with last character
  +164  00002b42  movl          0x00004028,%eax               stringWithFormat:
  +169  00002b47  movl          %eax,0x04(%esp)
  +173  00002b4b  movl          0x00004054,%eax               NSString
  +178  00002b50  movl          %eax,(%esp)
  +181  00002b53  calll         0x0000505e                    +[NSString stringWithFormat:]  # Stack = NSString ,stringWithFormat , 0x, Result of algorithm 1
  +186  00002b58  movl          %edi,(%esp)                   # edi points to the name field
  +189  00002b5b  movl          %eax,0xd8(%ebp)               # Most likely dec to hex string from previous call
  +192  00002b5e  calll         0x00005063                    _strlen
  +197  00002b63  xorl          %ecx,%ecx
  +199  00002b65  movl          %eax,0xd4(%ebp)
  +202  00002b68  jmp           0x00002b9c
  +204  00002b6a  movsbl        (%edi,%ebx),%eax            # Similar Algorithm slight changes
  +208  00002b6e  incl          %ebx
  +209  00002b6f  imull         %esi,%eax
  +212  00002b72  addl          $0x08,%esi
  +215  00002b75  leal          (%eax,%eax,4),%edx
  +218  00002b78  leal          0x2d(%eax,%edx,2),%edx
  +222  00002b7c  movl          $0x68db8bad,%eax
  +227  00002b81  addl          %edx,%ecx
  +229  00002b83  imull         %ecx
  +231  00002b85  movl          %ecx,%eax
  +233  00002b87  sarl          $0x1f,%eax
  +236  00002b8a  sarl          $0x0c,%edx
  +239  00002b8d  subl          %eax,%edx
  +241  00002b8f  movl          %ecx,%eax
  +243  00002b91  imull         $0x00002710,%edx,%edx
  +249  00002b97  subl          %edx,%eax
  +251  00002b99  movl          %eax,0xe4(%ebp)           # last result stored in the ebp + e4
  +254  00002b9c  cmpl          0xd4(%ebp),%ebx
  +257  00002b9f  jb            0x00002b6a
  +259  00002ba1  movl          0xe4(%ebp),%eax
  +262  00002ba4  movl          $0x00000004,%esi
  +267  00002ba9  xorl          %ebx,%ebx                 # erazing the Contents of ebx == counter
  +269  00002bab  movl          $0x00003078,0x08(%esp)        %i  = 0x
  +277  00002bb3  movl          $0x00000004,%edi
  +282  00002bb8  movl          %eax,0x0c(%esp)               output of algorithm 2 for the last character
  +286  00002bbc  movl          0x00004028,%eax               stringWithFormat:
  +291  00002bc1  movl          %eax,0x04(%esp)
  +295  00002bc5  movl          0x00004054,%eax               NSString
  +300  00002bca  movl          %eax,(%esp)
  +303  00002bcd  calll         0x0000505e                    +[NSString stringWithFormat:] # Stack = NSString ,stringWithFormat , 0x, Result of algorithm 2
  +308  00002bd2  movl          %ebx,0x08(%esp)               EBX = 0 @+267
  +312  00002bd6  movl          %esi,0x0c(%esp)               ESI = 4 @+262
  +316  00002bda  movl          %eax,0xdc(%ebp)               #result is stored in base pointer + DC
  +319  00002bdd  movl          0x00004048,%eax               substringWithRange:
  +324  00002be2  movl          %eax,0x04(%esp)
  +328  00002be6  movl          0x10(%ebp),%eax
  +331  00002be9  movl          %eax,(%esp)
  +334  00002bec  calll         0x0000505e                    -[(%esp,1) substringWithRange:] Stack = Serial, substringWithRange, EBX =0, Const = 4[ESI] [substring start at 0 and 4 characters]
  +339  00002bf1  movl          %esi,0x08(%esp)
  +343  00002bf5  movl          %edi,0x0c(%esp)
  +347  00002bf9  movl          %eax,%ebx
  +349  00002bfb  movl          0x00004048,%eax               substringWithRange:
  +354  00002c00  movl          %eax,0x04(%esp)
  +358  00002c04  movl          0x10(%ebp),%eax
  +361  00002c07  movl          %eax,(%esp)
  +364  00002c0a  calll         0x0000505e                    -[(%esp,1) substringWithRange:] Stack = Serial, substringWithRange, ESI = 4, EDI = 4    [substring start at 4 and 4 characters]
  +369  00002c0f  movl          %ebx,(%esp)
  +372  00002c12  movl          %eax,%esi
  +374  00002c14  movl          0xd8(%ebp),%eax
  +377  00002c17  movl          %eax,0x08(%esp)
  +381  00002c1b  movl          0x00004008,%eax               isEqual:
  +386  00002c20  movl          %eax,0x04(%esp)
  +390  00002c24  calll         0x0000505e                    -[(%esp,1) isEqual:]
  +395  00002c29  testb         %al,%al
  +397  00002c2b  je            0x00002c4e                    return;
  +399  00002c2d  movl          0xdc(%ebp),%eax
  +402  00002c30  movl          %esi,(%esp)
  +405  00002c33  movl          %eax,0x08(%esp)
  +409  00002c37  movl          0x00004008,%eax               isEqual:
  +414  00002c3c  movl          %eax,0x04(%esp)
  +418  00002c40  calll         0x0000505e                    -[(%esp,1) isEqual:]
  +423  00002c45  movl          $0x00000001,%edx
  +428  00002c4a  testb         %al,%al
  +430  00002c4c  jne           0x00002c50                    return;   ## Jumps if call returns the equal that is 1 i.e last 4 should be equal
  +432  00002c4e  xorl          %edx,%edx
  +434  00002c50  addl          $0x3c,%esp
  +437  00002c53  movl          %edx,%eax
  +439  00002c55  popl          %ebx
  +440  00002c56  popl          %esi
  +441  00002c57  popl          %edi
  +442  00002c58  leave
  +443  00002c59  ret



### Keygen::
First 4 digits should be equal to algo 1 in decimal
Second 4 digits from algo 2
