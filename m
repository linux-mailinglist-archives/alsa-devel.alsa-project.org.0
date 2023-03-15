Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDF6BA590
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 04:25:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E6E5133E;
	Wed, 15 Mar 2023 04:24:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E6E5133E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678850713;
	bh=Ps0cqBmZygFaSENSO7VmXatZ6FjL19BXv3q0ZWV/p+M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i8PPOp1N4ga9XyX3hzyQX79b1AphoFBqfQ1nk0a/fQRQwiEA/+qmuVr26dgmgB5th
	 pl3RADbIUzX/VnqDNbDdT8vtCmbZpJqM8JNki0PG5lVL6WxLXCWzFUDwpQmwA/8aNK
	 n/G0hg/OLQ6p0Sue4homARvgSFiR+0um54hnezrw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BD7BF8032D;
	Wed, 15 Mar 2023 04:24:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C1EEF80423; Wed, 15 Mar 2023 04:24:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E001F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 04:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E001F800C9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1678850646933089018-webhooks-bot@alsa-project.org>
References: <1678850646933089018-webhooks-bot@alsa-project.org>
Subject: libasound.so.2 segmentation fault
Message-Id: <20230315032418.8C1EEF80423@alsa1.perex.cz>
Date: Wed, 15 Mar 2023 04:24:18 +0100 (CET)
Message-ID-Hash: OAMYSLCBVMFVOVNFZOLICXI2ZVUTBVCU
X-Message-ID-Hash: OAMYSLCBVMFVOVNFZOLICXI2ZVUTBVCU
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAMYSLCBVMFVOVNFZOLICXI2ZVUTBVCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #306 was opened from zmzeeshan1:

The problematic frame identified in the error message is _snd_pcm_adpcm_open, which is a function within the libasound.so.2 library. This function appears to be causing the segmentation fault.

See below error

1. A fatal error has been detected by the Java Runtime Environment:
#

2. SIGSEGV (0xb) at pc=0x28b931ea, pid=15187, tid=371194784
#

3. JRE version: 6.0_43-b01

4. Java VM: Java HotSpot(TM) Server VM (20.14-b01 mixed mode linux-x86 )

5. Problematic frame:

6. C [libasound.so.2+0x521ea] _snd_pcm_adpcm_open+0x2e4
#

7. If you would like to submit a bug report, please visit:

8. [http://java.sun.com/webapps/bugreport/crash.jsp](https://urldefense.com/v3/__http:/java.sun.com/webapps/bugreport/crash.jsp__;!!IfreIJC_!qo_J8h8ei7sB1WegMzuSTHOV-c1gZ8w_u_rTKok0AvfyibsRON5M1JiKitGJSCLZX5gedjG823YTm6-tbcNFRvr63nl0hRo$)

9. The crash happened outside the Java Virtual Machine in native code.

10. See problematic frame for where to report the bug.
#

--------------- T H R E A D ---------------

Current thread (0x1fe2b000): JavaThread "Direct Clip" daemon [_thread_in_native, id=32499, stack(0x16138000,0x16200000)]

siginfo:si_signo=SIGSEGV: si_errno=0, si_code=1 (SEGV_MAPERR), si_addr=0x00000008

Registers:
EAX=0x4030a800, EBX=0x28be41b0, ECX=0x40306000, EDX=0x00000000
ESP=0x161feb60, EBP=0x161fec28, ESI=0x00000020, EDI=0x00000000
EIP=0x28b931ea, EFLAGS=0x00010206, CR2=0x00000008

Top of Stack: (sp=0x161feb60)
0x161feb60: f5400000 ffffffff 00100000 00000000
0x161feb70: 0806a900 00004092 00000001 161febb7
0x161feb80: abe85bc0 00004092 161feba8 b75f2a6c
0x161feb90: 08070e20 4ba67960 ffffff7d ffffffff
0x161feba0: 161febe0 080705e0 161febc8 b7560a65
0x161febb0: 00080000 00000000 b7a5fa88 b7a5fa88
0x161febc0: f5400000 ffffffff 161febf8 28b88c38
0x161febd0: 00000000 ffbbffca 40316002 4030a002

Instructions: (pc=0x28b931ea)
0x28b931ca: c7 45 a8 00 00 00 00 03 42 04 66 89 4d ac a8 07
0x28b931da: 0f 85 a4 05 00 00 8b 0a c1 e8 03 8b 55 0c 01 c8
0x28b931ea: 8b 4f 08 0f af d1 89 45 b4 03 57 04 f6 c2 07 0f
0x28b931fa: 85 85 05 00 00 c1 ea 03 8b 07 01 c2 f7 c6 07 00

Register to memory mapping:

EAX=0x4030a800 is an unknown value
EBX=0x28be41b0: <offset 0xa31b0> in /lib/libasound.so.2 at 0x28b41000
ECX=0x40306000 is an unknown value
EDX=0x00000000 is an unknown value
ESP=0x161feb60 is pointing into the stack for thread: 0x1fe2b000
EBP=0x161fec28 is pointing into the stack for thread: 0x1fe2b000
ESI=0x00000020 is an unknown value
EDI=0x00000000 is an unknown value

Stack: [0x16138000,0x16200000], sp=0x161feb60, free space=794k
Native frames: (J=compiled Java code, j=interpreted, Vv=VM code, C=native code)
C [libasound.so.2+0x521ea] _snd_pcm_adpcm_open+0x2e4
C [libasound.so.2+0x54f05] _snd_pcm_adpcm_open+0x2fff
C [libasound.so.2+0x55046] _snd_pcm_adpcm_open+0x3140
C [libasound.so.2+0x3fedd] short+0x7a
C [libasound.so.2+0x58dec] short+0xf7
C [libasound.so.2+0x403dd] short+0x1cd
C [libasound.so.2+0x58fe2] short+0x6b
C [libasound.so.2+0x392df] short+0x5c
C [libjsoundalsa.so+0xa54a] DAUDIO_Write+0x4a
C [libjsoundalsa.so+0x77ca] Java_com_sun_media_sound_DirectAudioDevice_nWrite+0x13a
j com.sun.media.sound.DirectAudioDevice.nWrite(J[BIIIFF)I+0
j com.sun.media.sound.DirectAudioDevice.access$1800(J[BIIIFF)I+11
j com.sun.media.sound.DirectAudioDevice$DirectDL.write([BII)I+202
j com.sun.media.sound.DirectAudioDevice$DirectClip.run()V+163
j java.lang.Thread.run()V+11
v ~StubRoutines::call_stub
V [libjvm.so+0x3e1d61] JavaCalls::call_helper(JavaValue*, methodHandle*, JavaCallArguments*, Thread*)+0x1c1
V [libjvm.so+0x5e3558] os::os_exception_wrapper(void [https://jira1.melb.tatm.thales:8443/images/icons/emoticons/star_yellow.png(JavaValue*](https://urldefense.com/v3/__https:/jira1.melb.tatm.thales:8443/images/icons/emoticons/star_yellow.png(JavaValue*__;Kg!!IfreIJC_!qo_J8h8ei7sB1WegMzuSTHOV-c1gZ8w_u_rTKok0AvfyibsRON5M1JiKitGJSCLZX5gedjG823YTm6-tbcNFRvr64P82KC0$), methodHandle*, JavaCallArguments*, Thread*), JavaValue*, methodHandle*, JavaCallArguments*, Thread*)+0x18
V [libjvm.so+0x3e15d5] JavaCalls::call_virtual(JavaValue*, KlassHandle, symbolHandle, symbolHandle, JavaCallArguments*, Thread*)+0xc5
V [libjvm.so+0x3e1698] JavaCalls::call_virtual(JavaValue*, Handle, KlassHandle, symbolHandle, symbolHandle, Thread*)+0x58
V [libjvm.so+0x4660d7] thread_entry(JavaThread*, Thread*)+0xa7
V [libjvm.so+0x6e495f] JavaThread::run()+0x11f
V [libjvm.so+0x5e4dae] java_start(Thread*)+0x14e
C [libpthread.so.0+0x53cc] short+0xac

Java frames: (J=compiled Java code, j=interpreted, Vv=VM code)
j com.sun.media.sound.DirectAudioDevice.nWrite(J[BIIIFF)I+0
j com.sun.media.sound.DirectAudioDevice.access$1800(J[BIIIFF)I+11
j com.sun.media.sound.DirectAudioDevice$DirectDL.write([BII)I+202
j com.sun.media.sound.DirectAudioDevice$DirectClip.run()V+163
j java.lang.Thread.run()V+11
v ~StubRoutines::call_stub

The version of ALSA installed is 

alsa-lib-1.0.6-5.RHEL4.i386.rpm 28-Aug-2006 15:26 302K  
alsa-lib-devel-1.0.6-5.RHEL4.i386.rpm 28-Aug-2006 15:26 807K  
alsa-utils-1.0.6-10.i386.rpm 02-Oct-2009 15:54 125K

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/306
Repository URL: https://github.com/alsa-project/alsa-lib
