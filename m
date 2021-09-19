Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B854B410C95
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Sep 2021 19:11:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 339DD168E;
	Sun, 19 Sep 2021 19:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 339DD168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632071501;
	bh=qCyY3fdRBImM7PgjB46GnBUCgbRh/wYjKOcdz1K03Mo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qzyhUefPXLjwv3GLLk6o9PXxXeq+UCbfVm1mBLxD2h3QmCen+RXhR8R2QceT5+itP
	 LjbGmgKxVFM+dT9QxMI/YI36MsifQZNKBluyMEdAvKSRs3nAaHZ5BUYzXokKWnSYvM
	 jsHXuMWAvcoEZzGHFzU/18WxpHOXU62K/eNtwN0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74095F8026A;
	Sun, 19 Sep 2021 19:10:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39971F80268; Sun, 19 Sep 2021 19:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D4611F80152
 for <alsa-devel@alsa-project.org>; Sun, 19 Sep 2021 19:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4611F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1632071406839119911-webhooks-bot@alsa-project.org>
References: <1632071406839119911-webhooks-bot@alsa-project.org>
Subject: Problems with ALSA MIDI raw devices after upgrading to kernel 5.14
Message-Id: <20210919171021.39971F80268@alsa1.perex.cz>
Date: Sun, 19 Sep 2021 19:10:21 +0200 (CEST)
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

alsa-project/alsa-lib issue #178 was opened from lentferj:

I installed 5.14 kernel from this source (https://github.com/geoffreybennett/scarlett-gen2/releases) on Debian Buster to test out the better USB audio latency.

I found that both Bitwig and Ardour6 cannot start anymore when using ALSA MIDI raw devices. In Bitwig the sound engine keeps crashing and Ardour6 doesn't start at all when choosing raw devices.

In Ardour6 I see this:
```
ALSA lib rawmidi_hw.c:100:(snd_rawmidi_hw_params) SNDRV_RAWMIDI_IOCTL_PARAMS failed: Invalid argument
ardour-6.9.0: rawmidi.c:268: snd_rawmidi_open_conf: Assertion `err >= 0' failed.
Aborted
```

I also tried to access devices directly with amidi, same result.

```
$ amidi --dump -p hw:5
ALSA lib rawmidi_hw.c:100:(snd_rawmidi_hw_params) SNDRV_RAWMIDI_IOCTL_PARAMS failed: Invalid argument
amidi: rawmidi.c:268: snd_rawmidi_open_conf: Assertion `err >= 0' failed.
Aborted
```

I manually upgraded alsa-lib and alsa-utils to 1.2.5, but I still have the same problem:

```
$ which amidi
/usr/bin/amidi
lentferj@ts-d20:~$ ls -l /usr/bin/amidi
-rwxr-xr-x 1 root root 57064 Sep 19 18:34 /usr/bin/amidi
lentferj@ts-d20:~$ ldd /usr/bin/amidi
    linux-vdso.so.1 (0x00007ffc50c9b000)
    libasound.so.2 => /usr/lib/libasound.so.2 (0x00007f9c97c85000)
    libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f9c97b02000)
    libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f9c97afd000)
    libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f9c97adc000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f9c9791b000)
    librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f9c97911000)
    /lib64/ld-linux-x86-64.so.2 (0x00007f9c97dc0000)
lentferj@ts-d20:~$ ls -l /usr/lib/libasound.so.2
lrwxrwxrwx 1 root root 18 Sep 19 18:29 /usr/lib/libasound.so.2 -> libasound.so.2.0.0
lentferj@ts-d20:~$ ls -l /usr/lib/libasound.so.2.0.0
-rwxr-xr-x 1 root root 5242136 Sep 19 18:29 /usr/lib/libasound.so.2.0.0
lentferj@ts-d20:~$ uname -a
Linux ts-d20 5.14.0 0000021 SMP Mon Aug 30 00:46:47 UTC 2021 x86_64 GNU/Linux


lentferj@ts-d20:~$ amidi -l
Dir Device Name
IO hw:2,0,0 Saffire 6USB2.0 MIDI 1
IO hw:3,0,0 Neutron(1) MIDI 1
IO hw:4,0,0 Pulse2 MIDI 1
IO hw:5,0,0 LPK25 MIDI 1
lentferj@ts-d20:~$ amidi --dump -p hw:5
ALSA lib rawmidi_hw.c:100:(snd_rawmidi_hw_params) SNDRV_RAWMIDI_IOCTL_PARAMS failed: Invalid argument
amidi: rawmidi.c:256: snd_rawmidi_open_conf: Assertion `err >= 0' failed.
Abgebrochen 
```

When booting back to a 5.10 kernel the problems disappear.

I also reported this on the Ardour Tracker ( https://tracker.ardour.org/view.php?id=8800 ).

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/178
Repository URL: https://github.com/alsa-project/alsa-lib
