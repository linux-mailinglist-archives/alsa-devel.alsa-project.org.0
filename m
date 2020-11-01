Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D13822A3DF6
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:47:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3D641777;
	Tue,  3 Nov 2020 08:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3D641777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389679;
	bh=X0VGArSkETjFnPpVwjCaUpIQQ1Rxoungv0YH9ns6cRg=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jj21uSEaiRVXqCFNO1SfxGngaUi+Ygdl9yXdK6TxJFxV818nzwSKybnncNoNXlynm
	 N+TdclT8k+6A7GlY9y43ri2cSE6GxB547+2DRjQIt4dX9wQdpC5Y32k+jT9gVWB0Lm
	 9NZIPIj7qAQ2eCAMmC2DQp4dCwMtQMcwoZhcF/IY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD6EDF804C2;
	Tue,  3 Nov 2020 08:45:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42215F80162; Sun,  1 Nov 2020 22:47:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10094F8015D
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 22:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10094F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P777mPN7"
Received: by mail-oo1-xc2b.google.com with SMTP id c25so2915041ooe.13
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 13:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=C7aBqVDObZ+DTGBqCZ1ww1UuT3O1lER0KYZkNqOekqM=;
 b=P777mPN7xSMFnIUEx3mQfd9Hyn4QizzlOEepvo1CUPh0qcO5JxgLbOQ1sP/Ye74xj8
 vLvawMDsH44wAjxhhYRKRNPVh+YpIHsxoOFpuA7IFHXhbPKqsGlrAC5ojjA0HwY/KsqD
 /a2LpTm9eRy+ITj3YMQmRGDitXjib/FO+Px1dmpS6RzTJddBHoBJ9eW5xnavWvI3zjqH
 a+RhvXm7WIFE6UNbshqj3tiXxu2CFGm4rKz/w1wM8YFkZ2s1UiBGksYo18Ww7HfoPdx3
 Qjo8wUxNLFB3850AhVgd/PrWAWZeOzYnz76aF7LkPAMHKb+Y9thwplWS9hhVsV3Qr/g7
 KrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=C7aBqVDObZ+DTGBqCZ1ww1UuT3O1lER0KYZkNqOekqM=;
 b=gv0ZmKgHUSn8mqWJ+/4/jj7JKkz65w/YBQZy+x+o/UVaUakQ860cHlCTP26yWO35DP
 f+7T5JnObfEeRuAFS3ld0tstkw3VsJLBMwW9MiIUdZayw0BKPaZK+LaaUCZ/fbdMD7Nd
 UQzYpaGHwfgw1gKL8FtSkE9yYnAJTHkm1wZLyY+hKZJvIjECZjmbC0IsC/DfJlQ2tcZG
 ae6r+FnBo90mZt4OTxAp0T6eOZAthqNgTSX4NTNEwL7MvRPqyjAQb8RsbHdeRnN4Y3FN
 k19JbHXWB2LMSl3/BrWWBi0GDBLGtVeHx/abKeAHrTwHh2Oe6eLKIVImdzIOgtZUzwH/
 A42Q==
X-Gm-Message-State: AOAM5315pffe4PPz+7Gpz14urgGV9C82lxihtaOuXEexDdX1F2s/i8BK
 Djd/ZOID4H3IXsOqZGQXRpsBr0GmEf9EBT/1eESoFqo312tGUA==
X-Google-Smtp-Source: ABdhPJxCTvpg86V5AXXvJBQvFoMJ0Z5KfYiPGzfbPp+tFB2jfton68sfhgPBZ7oPhQijaqxJR4SzJMkZh+UT7L1URl8=
X-Received: by 2002:a4a:b601:: with SMTP id z1mr9894169oon.83.1604267245984;
 Sun, 01 Nov 2020 13:47:25 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?VGFtw6FzIEjDoW1vcg==?= <hamuguy@gmail.com>
Date: Sun, 1 Nov 2020 16:47:15 -0500
Message-ID: <CAOoeSP+sPgxziFPPTWsCWHTK7cotXQPxJiZwJnj6ciEpK06zsA@mail.gmail.com>
Subject: snd_bt87x on Kworld KW-TV878RF
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:22 +0100
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi,

After reinstalling Linux (Xubuntu 20.04.1) on my old computer the sound
stopped working on my Kworld KW-TV878RF tuner card. I load the bttv module
with options "card=78 radio=1" and snd-bt87x with "load_all". The
corresponding dmesg is below:

[   15.626992] bttv: driver version 0.9.19 loaded
[   15.626994] bttv: using 8 buffers with 2080k (520 pages) each for capture
[   15.627024] bttv: Bt8xx card found (0)
[   15.627166] bttv: 0: Bt878 (rev 17) at 0000:04:01.0, irq: 18, latency:
32, mmio: 0xf0001000
[   15.627177] bttv: 0: using: Jetway TV/Capture JW-TV878-FBK, Kworld
KW-TV878RF [card=78,insmod option]
[   15.627359] bttv: 0: tuner type=5
[   15.908280] bttv: 0: audio absent, no audio device found!
[   16.454464] bttv: 0: Setting PLL: 28636363 => 35468950 (needs up to
100ms)
[   16.496037] bttv: PLL set ok
[   16.497200] bttv: 0: registered device video0
[   16.497273] bttv: 0: registered device vbi0
[   16.497357] bttv: 0: registered device radio
...
[  682.784918] snd_bt87x 0000:04:01.1: unknown card 0x878-0x00:0x00
[  682.784919] snd_bt87x 0000:04:01.1: please mail id, board name, and, if
it works, the correct digital_rate option to <alsa-devel@alsa-project.org>
[  682.785084] snd_bt87x 0000:04:01.1: bt87x0: Using board 0, analog,
digital (rate 32000 Hz)

The lspci output is:
04:01.0 Multimedia video controller: Brooktree Corporation Bt878 Video
Capture (rev 11)
Flags: bus master, medium devsel, latency 32, IRQ 18
Memory at f0001000 (32-bit, prefetchable) [size=4K]
Capabilities: [44] Vital Product Data
Capabilities: [4c] Power Management version 2
Kernel driver in use: bttv
Kernel modules: bttv

04:01.1 Multimedia controller: Brooktree Corporation Bt878 Audio Capture
(rev 11)
Flags: bus master, medium devsel, latency 32, IRQ 18
Memory at f0000000 (32-bit, prefetchable) [size=4K]
Capabilities: [44] Vital Product Data
Capabilities: [4c] Power Management version 2
Kernel driver in use: snd_bt87x

uname -a
Linux ubuntu 5.4.0-52-generic #57-Ubuntu SMP Thu Oct 15 10:57:00 UTC 2020
x86_64 x86_64 x86_64 GNU/Linux

Regards,

Tamas
