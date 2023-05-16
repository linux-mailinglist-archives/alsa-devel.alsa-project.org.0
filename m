Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A1704234
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 02:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4110D1FE;
	Tue, 16 May 2023 02:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4110D1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684196252;
	bh=J0TbUb9wmtQvS1Dxw6hw2Gzgqfz6L/XNgsDQI9EnfvM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RLW8X/7wIkcIMpyXIWI2TaiAznRjFvQSErGrIdaqftdLQWTLsv+Z56VTZHBU6npee
	 ymbuVqGgJCxX9k4LEeVRQ3ldqjkBdLAOdHI4qWEosxzWlNKzITyoO+NL/BRNBv8p4B
	 a4HBII+mUYFMdU+glFko0rCnHY3ks7nMDfIA45C4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64856F8016D; Tue, 16 May 2023 02:16:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F20BF8025A;
	Tue, 16 May 2023 02:16:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B077F80272; Tue, 16 May 2023 02:16:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E936AF8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 02:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E936AF8016A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684196190423272133-webhooks-bot@alsa-project.org>
References: <1684196190423272133-webhooks-bot@alsa-project.org>
Subject: alsa-lib hangs when mounting a partition while playing a sound file
 using aplay
Message-Id: <20230516001637.8B077F80272@alsa1.perex.cz>
Date: Tue, 16 May 2023 02:16:37 +0200 (CEST)
Message-ID-Hash: YJVNQHDOXL3T6KYCVNQ22QIF7OSUDJ5B
X-Message-ID-Hash: YJVNQHDOXL3T6KYCVNQ22QIF7OSUDJ5B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJVNQHDOXL3T6KYCVNQ22QIF7OSUDJ5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #321 was opened from nachopitt:

Hello,

I'm using alsa-lib to add sound playback functionality to a Embedded Linux system.

Recently I noticed that whenever I mount a UBI partition while there is a sound file being played back with the help of the aplay command, the aplay process hangs forever and the sound playback stops immediately.

```
# aplay -D output1 1.wav &
Playing WAVE '1.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Mono
#
#
# mount -t ubifs /dev/ubi0_5 /opt/conf/Logging
UBIFS (ubi0:5): background thread "ubifs_bgt0_5" started, PID 190
UBIFS (ubi0:5): UBIFS: mounted UBI device 0, volume 5, name "Logging"
UBIFS (ubi0:5): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS (ubi0:5): FS size: 1650688 bytes (1 MiB, 13 LEBs), journal size 1142785 bytes (1 MiB, 8 LEBs)
underrun!!! (at least 0.044 ms loUBIFS (ubi0:5): reserved for root: 0 bytes (0 KiB)
ng)
UBIFS (ubi0:5): media format: w4/r0 (latest is w5/r0), UUID 26A3D522-A34F-4FE4-BF6C-931A9FE59854, small LPT model
#
```

I also prepared a small video that captures the exact moment where the issue is reproduced in case you want it to see it in action:

https://www.youtube.com/watch?v=M9bW2k2CTVs

The only way to recover from this scenario is to kill the stuck aplay process manually and execute it again.

Last time I tried to debug this, I attached the gdbserver to the still stuck aplay process and backtrace showed the following information:

```
(gdb) bt
arm-linux-gnueabihf-gdb bin/aplay       (wd: ~/home_volume/git_repos/alsa/alsa-install/usr)
(gdb) bt
#0  0x76d96ba4 in ?? ()
**#1  0x76f0e222 in snd1_pcm_wait_nocheck (pcm=0x879280, timeout=-1) at pcm.c:2898**
Backtrace stopped: previous frame inner to this frame (corrupt stack?)
(gdb) frame 1
#1  0x76f0e222 in snd1_pcm_wait_nocheck (pcm=0x879280, timeout=-1) at pcm.c:2898
2898                    err_poll = poll(pfd, npfds, timeout);
(gdb)
```

It is clear to me that the `poll` function is waiting for something to change in the file descriptors and it waits infinitely due to the `timeout = -1` argument, but none of the file descriptors in `pfd` ever change or become ready after the mount command is executed during the sound playback.

I'm currently using both alsa-lib and alsa-utils v1.2.6. The SoC is an NXP i.MX6 Solo which includes an Armv7-A 32bits Cortex-A9 Core CPU Platform. Linux Kernel BSP is based on 4.14.98.

Most likely this is an issue with my system configuration, but since you guys are more familiar with alsa than anyone on the planet, I thought you might have some ideas to troubleshoot and debug this because I currently do not have any clue.

Do you know what could cause this behavior?
Is there any possibility that there is an issue in alsa-lib?
Do you have any suggestions to debug and troubleshoot the error to get more information?

Any help will be really appreciated.

Thanks a lot. Best regards.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/321
Repository URL: https://github.com/alsa-project/alsa-lib
