Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E1E7A70D3
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 05:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A25620C;
	Wed, 20 Sep 2023 05:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A25620C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695179201;
	bh=eJo/GsrLg+qz3VmXxKIyYfx0Nv/6k9vtRMm3O/NdC0g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pXPT4O4M//DOf5QQ8uCwfvghl7VZovcjYqeOV1DSVXhq8c3QGaFu9x8bIxIUsLEc2
	 Mo7C1rEtDiiTEWJiQ8YVv32CCBocA1h4NkaovbX0852pYDAr9Ab1AVX6qAWjmB45ux
	 c4WLe479r8OzYq0qrLIf1Sr3GDaUSgeEwNUtMLq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 074DBF800AA; Wed, 20 Sep 2023 05:05:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20D4FF801F5;
	Wed, 20 Sep 2023 05:05:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC8ECF800F4; Wed, 20 Sep 2023 05:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B6DDF800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 05:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B6DDF800F4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1695179128979596853-webhooks-bot@alsa-project.org>
References: <1695179128979596853-webhooks-bot@alsa-project.org>
Subject: Asurada Spherion aplay: unable to install hw params
Message-Id: <20230920030543.BC8ECF800F4@alsa1.perex.cz>
Date: Wed, 20 Sep 2023 05:05:43 +0200 (CEST)
Message-ID-Hash: 2DO7ULS46JDS3LMSN4F6YPQYACRVUYSE
X-Message-ID-Hash: 2DO7ULS46JDS3LMSN4F6YPQYACRVUYSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DO7ULS46JDS3LMSN4F6YPQYACRVUYSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #354 was opened from leezu:

Dear Alsa developers,

for [Asurada Spherion](https://www.acer.com/us-en/chromebooks/acer-chromebook-514-cb514-2h-cb514-2ht/pdp/NX.AS1AA.004), https://github.com/torvalds/linux/commit/ad5cc915c300d4ea733da80ae714fdad3787af54 enabled audio support for this hardware in the kernel. https://github.com/alsa-project/alsa-ucm-conf/commit/2667378a6b9120d99e44f783ac4d247fb683d83c added the associated UCM files. Nevertheless, audio does not work even with latest alsa 1.2.10 and linux 6.5.4.

UCM does seem to recognize the device correctly:

<details><summary>ucm output</summary>

```
alsaucm listcards
  0: hw:0
    mt8192_mt6359_rt1015p_rt5682

alsaucm dump text
Verb.HiFi {
        Comment Default
        Device.Speaker {
                Comment Speaker
                Values {
                        CaptureCTL "_ucm0001.hw:mt8192mt6359rt1"
                        PlaybackCTL "_ucm0001.hw:mt8192mt6359rt1"
                        PlaybackPCM "_ucm0001.hw:mt8192mt6359rt1,0"
                        PlaybackPriority 100
                        TQ HiFi
                }
        }
        Device.Headphones {
                Comment Headphones
                Values {
                        CaptureCTL "_ucm0001.hw:mt8192mt6359rt1"
                        JackControl "Headphone Jack"
                        PlaybackCTL "_ucm0001.hw:mt8192mt6359rt1"
                        PlaybackMixerElem DAC1
                        PlaybackPCM "_ucm0001.hw:mt8192mt6359rt1,3"
                        PlaybackPriority 200
                        TQ HiFi
                }
        }
        Device.Mic {
                Comment "Internal Microphone"
                Values {
                        CaptureCTL "_ucm0001.hw:mt8192mt6359rt1"
                        CapturePCM "_ucm0001.hw:mt8192mt6359rt1,10"
                        CapturePriority 100
                        PlaybackCTL "_ucm0001.hw:mt8192mt6359rt1"
                        TQ HiFi
                }
        }
        Device.Headset {
                Comment "Headset Microphone"
                Values {
                        CaptureCTL "_ucm0001.hw:mt8192mt6359rt1"
                        CapturePCM "_ucm0001.hw:mt8192mt6359rt1,11"
                        CapturePriority 200
                        JackControl "Headset Mic Jack"
                        PlaybackCTL "_ucm0001.hw:mt8192mt6359rt1"
                        TQ HiFi
                }
        }
}
```

</details>  

Enabling pulseaudio or wireplumber for audio support yields a dysfunctional system, for example causing any application trying to play audio to hang when wireplumber is enabled. Thus, I tried debugging the issue using lower-level alsa tools, such as aplay. Running aplay fails with `unable to install hw params`:

<details><summary>aplay output</summary>

```
aplay /usr/share/sounds/alsa/Front_Center.wav --verbose --dump-hw-params -D hw:0
Playing WAVE '/usr/share/sounds/alsa/Front_Center.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Mono
HW Params of device "hw:0":
--------------------
ACCESS:  MMAP_INTERLEAVED RW_INTERLEAVED
FORMAT:  S16_LE S24_LE S32_LE
SUBFORMAT:  STD
SAMPLE_BITS: [16 32]
FRAME_BITS: [16 64]
CHANNELS: [1 2]
RATE: [8000 192000]
PERIOD_TIME: (62 6144000]
PERIOD_SIZE: [12 49152]
PERIOD_BYTES: [96 196608]
PERIODS: [2 256]
BUFFER_TIME: [125 12288000]
BUFFER_SIZE: [24 98304]
BUFFER_BYTES: [96 196608]
TICK_TIME: ALL
--------------------
aplay: set_params:1435: Unable to install hw params:
ACCESS:  RW_INTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 16
CHANNELS: 1
RATE: 48000
PERIOD_TIME: 125000
PERIOD_SIZE: 6000
PERIOD_BYTES: 12000
PERIODS: 4
BUFFER_TIME: 500000
BUFFER_SIZE: 24000
BUFFER_BYTES: 48000
TICK_TIME: 0

```

</details> 

Using gdb to debug aplay shows that alsa fails in snd_pcm_hw_prepare when calling ioctl(fd, SNDRV_PCM_IOCTL_PREPARE), due to EINVAL, indicating that the request or argp argument is not valid.

<details><summary>gdb output</summary>
<p>

```
$ gdb aplay
GNU gdb (Debian 13.1-3) 13.1
Copyright (C) 2023 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "aarch64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from aplay...
Reading symbols from /usr/lib/debug/.build-id/fd/47982108e1aa7250d338ed6e26020eeaeee782.debug...
(gdb) break snd_pcm_hw_prepare
Function "snd_pcm_hw_prepare" not defined.
Make breakpoint pending on future shared library load? (y or [n]) y
Breakpoint 1 (snd_pcm_hw_prepare) pending.
(gdb) directory /dev/shm/alsa-lib-1.2.10
Source directories searched: /dev/shm/alsa-lib-1.2.10:$cdir:$cwd
(gdb) run /usr/share/sounds/alsa/Front_Center.wav --verbose --dump-hw-params -D hw:0
Starting program: /usr/bin/aplay /usr/share/sounds/alsa/Front_Center.wav --verbose --dump-hw-params -D hw:0
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1".
Playing WAVE '/usr/share/sounds/alsa/Front_Center.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Mono
HW Params of device "hw:0":
--------------------
ACCESS:  MMAP_INTERLEAVED RW_INTERLEAVED
FORMAT:  S16_LE S24_LE S32_LE
SUBFORMAT:  STD
SAMPLE_BITS: [16 32]
FRAME_BITS: [16 64]
CHANNELS: [1 2]
RATE: [8000 192000]
PERIOD_TIME: (62 6144000]
PERIOD_SIZE: [12 49152]
PERIOD_BYTES: [96 196608]
PERIODS: [2 256]
BUFFER_TIME: [125 12288000]
BUFFER_SIZE: [24 98304]
BUFFER_BYTES: [96 196608]
TICK_TIME: ALL
--------------------

Breakpoint 1, snd_pcm_hw_prepare (pcm=0xaaaaaaafd860) at ./src/pcm/pcm_hw.c:668
668     {
(gdb) n
673             if (hw->prepare_reset_sw_params) {
(gdb) n
682             if (ioctl(fd, SNDRV_PCM_IOCTL_PREPARE) < 0) {
(gdb) n
683                     err = -errno;
(gdb) n
684                     SYSMSG("SNDRV_PCM_IOCTL_PREPARE failed (%i)", err);
(gdb) p err
$1 = -22

```

</p>
</details> 

It is quite possible that there is a kernel bug causing this issue. It would be very helpful if you can advise how to continue debugging this issue, as I'm not sufficiently familiar with the alsa stack. I'm happy to provide additional information. Please let me know what could be helpful.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/354
Repository URL: https://github.com/alsa-project/alsa-lib
