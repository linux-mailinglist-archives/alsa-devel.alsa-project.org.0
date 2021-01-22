Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CE93006AE
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 16:08:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5186C1F12;
	Fri, 22 Jan 2021 16:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5186C1F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611328096;
	bh=eCKxG9sXtITf1wh4eW6yy0O1hLpTp96sPD91s5qaeeE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J5Fbz2zlEfHTtXDcTyPoQDHF8GiwT0tJCntzf7bMGeYAIMoVh3j3nHhdKMR69udzt
	 8d43unzfVCE8VJEIymzJuQ7Y51g9UFFU/T+H+z/PJmwOk594/PFpjWAy09OKgCCOR3
	 /9iUatVoDbfUqv1l6T8LS3Tg5D3nohlleLaqWC3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADBFAF8019B;
	Fri, 22 Jan 2021 16:06:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0948DF8016E; Fri, 22 Jan 2021 16:06:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C48F4F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 16:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C48F4F80129
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1611327992549335003-webhooks-bot@alsa-project.org>
References: <1611327992549335003-webhooks-bot@alsa-project.org>
Subject: Wrong binds configuration for dmix plugin causes segmentation fault
 in alsa
Message-Id: <20210122150642.0948DF8016E@alsa1.perex.cz>
Date: Fri, 22 Jan 2021 16:06:41 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #117 was opened from elara-leitstellentechnik:

On Debian buster I can get alsa to run into a segmentation fault with the following procedure:
Configure dmix with two channels (binds) for a Mono device. (I am not sure that this is reproducible with any mono device, I tested with a Jabra LINK 230):
```
~$ cat .asoundrc  
pcm."Jabra LINK 230" {  
       type dmix  
       ipc_key 1024  
       slave.pcm "hw:2,0"  
       bindings {  
              0 0  
             # The next line is the problematic line that triggers the segfault
              1 1  
       }  
}  
```
Then when playing any sound file with e.g. mplayer and making it use the dmix device the following happens:
```
$ mplayer -ao alsa:device="Jabra LINK 230" /usr/share/sounds/alsa/Front_Left.wav
MPlayer 1.3.0 (Debian), built with gcc-8 (C) 2000-2016 MPlayer Team
do_connect: could not connect to socket
connect: No such file or directory
Failed to open LIRC support. You will not be able to use your remote control.

Playing /usr/share/sounds/alsa/Front_Left.wav.
libavformat version 58.20.100 (external)
Mismatching header version 58.12.100
Audio only file format detected.
Load subtitles in /usr/share/sounds/alsa/
==========================================================================
Opening audio decoder: [pcm] Uncompressed PCM audio decoder
AUDIO: 48000 Hz, 1 ch, s16le, 768.0 kbit/100.00% (ratio: 96000->96000)
Selected audio codec: [pcm] afm: pcm (Uncompressed PCM)
==========================================================================
[AO_ALSA] alsa-lib: pcm_hw.c:1711:(snd_pcm_hw_open) open '/dev/snd/pcmC2D0p' failed (-77): File descriptor in bad state
AO: [alsa] 48000Hz 2ch s16le (2 bytes per sample)
Video: no video
Starting playback...


MPlayer interrupted by signal 11 in module: play_audio
- MPlayer crashed by bad usage of CPU/FPU/RAM.
  Recompile MPlayer with --enable-debug and make a 'gdb' backtrace and
  disassembly. Details in DOCS/HTML/en/bugreports_what.html#bugreports_crash.
 [ This binary of MPlayer in Debian is currently compiled with
   '--enable-debug'; the debugging symbols are in the package
   'mplayer-dbgsym'.]
```
I appreciate that configuring two bindings for a single-channel audio device is an error, but I am not sure that this justifies a segfault. 
Here is some more information I have been able to extract using gdb:

```
~$ gdb --args mplayer -ao alsa:device="Jabra LINK 230" /usr/share/sounds/alsa/Front_Left.wav
GNU gdb (Debian 8.2.1-2+b3) 8.2.1
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from mplayer...Reading symbols from /usr/lib/debug/.build-id/3a/9816e9d363979a4f76e6cb809a33dffda67d05.debug...done.
done.
(gdb) run
Starting program: /usr/bin/mplayer -ao alsa:device=Jabra\ LINK\ 230 /usr/share/sounds/alsa/Front_Left.wav
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
MPlayer 1.3.0 (Debian), built with gcc-8 (C) 2000-2016 MPlayer Team
do_connect: could not connect to socket
connect: No such file or directory
Failed to open LIRC support. You will not be able to use your remote control.

Playing /usr/share/sounds/alsa/Front_Left.wav.
libavformat version 58.20.100 (external)
Mismatching header version 58.12.100
Audio only file format detected.
Load subtitles in /usr/share/sounds/alsa/
==========================================================================
Opening audio decoder: [pcm] Uncompressed PCM audio decoder
AUDIO: 48000 Hz, 1 ch, s16le, 768.0 kbit/100.00% (ratio: 96000->96000)
Selected audio codec: [pcm] afm: pcm (Uncompressed PCM)
==========================================================================
[AO_ALSA] alsa-lib: pcm_hw.c:1711:(snd_pcm_hw_open) open '/dev/snd/pcmC2D0p' failed (-77): File descriptor in bad state
AO: [alsa] 48000Hz 2ch s16le (2 bytes per sample)
Video: no video
Starting playback...

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff7a09b76 in mix_areas_16_smp (size=4160473088, size@entry=17424, dst=0x555555aa9510, src=0xde020109, sum=0x21fe0f3c, dst_step=2, src_step=4, sum_step=8) at pcm_dmix_x86_64.h:48
48	pcm_dmix_x86_64.h: No such file or directory.
(gdb) where
#0  0x00007ffff7a09b76 in mix_areas_16_smp (size=4160473088, size@entry=17424, dst=0x555555aa9510, src=0xde020109, sum=0x21fe0f3c, dst_step=2, src_step=4, sum_step=8) at pcm_dmix_x86_64.h:48
#1  0x00007ffff7a0ba1c in mix_areas (size=17424, dst_ofs=576, src_ofs=0, dst_areas=0x555555a927f0, src_areas=0x7fffe88b3000, dmix=0x555555a929e0) at pcm_dmix.c:215
#2  snd_pcm_dmix_sync_area (pcm=pcm@entry=0x555555a94850) at pcm_dmix.c:382
#3  0x00007ffff7a0bdfa in snd_pcm_dmix_start (pcm=0x555555a94850) at pcm_dmix.c:619
#4  0x00007ffff79d8b4a in __snd_pcm_start (pcm=0x555555a94850, pcm=0x555555a94850) at pcm_local.h:434
#5  snd1_pcm_write_areas (pcm=pcm@entry=0x555555a94850, areas=areas@entry=0x7fffffffcfd0, offset=offset@entry=0, size=<optimized out>, size@entry=18000, func=func@entry=0x7ffff79e46c0 <snd_pcm_mmap_write_areas>) at pcm.c:7421
#6  0x00007ffff79e4b01 in snd_pcm_mmap_writei (pcm=0x555555a94850, buffer=<optimized out>, size=18000) at pcm_mmap.c:153
#7  0x00005555556242f8 in play (data=0x555555ac4f70, len=<optimized out>, flags=<optimized out>) at libao2/ao_alsa.c:812
#8  0x000055555560bbab in fill_audio_out_buffers () at mplayer.c:2212
#9  main (argc=<optimized out>, argv=<optimized out>) at mplayer.c:3794
(gdb) 

```
To me this looks like the segfault is triggered in pcm_dmix_x86_64.h:48 so I believe it is an alsa problem rather than a problem with mplayer.
I hope this makes sense. If I can support with further information please let me know.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/117
Repository URL: https://github.com/alsa-project/alsa-lib
