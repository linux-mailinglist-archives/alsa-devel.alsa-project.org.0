Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D72E1820
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 05:33:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E40516B4;
	Wed, 23 Dec 2020 05:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E40516B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608698007;
	bh=S7CIbWUQ5EtWy4K2smd2DLLQocrv83d6WnTC8JsR1RE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9yVFeT5GNlZrVcySl0fEjsg7XiTi4YQe9OPVJ3Hh76vtYhb5XzMdpt8E+Mv4LC3n
	 M6fzsn4Kxg8bc0QX8PHzSRH0aAbUp9UUTVpvYvOw4zVNBBXP9dMVCNAwaOlZDSzXFS
	 3F7wnabDWNaHRjuV9cLQ0Ye7tVqOA6p71erWQoXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EC82F801EB;
	Wed, 23 Dec 2020 05:31:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA065F801D5; Wed, 23 Dec 2020 05:31:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFAD0F8013F
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 05:31:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFAD0F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bertschiettecatte-com.20150623.gappssmtp.com
 header.i=@bertschiettecatte-com.20150623.gappssmtp.com header.b="dndGR/OL"
Received: by mail-yb1-xb33.google.com with SMTP id k78so13537599ybf.12
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 20:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bertschiettecatte-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=S7CIbWUQ5EtWy4K2smd2DLLQocrv83d6WnTC8JsR1RE=;
 b=dndGR/OLXsEd8TJhtj33sY+HFy9NnDh44uXKD5TPSgxFIQyjN07+j0XKJBVjdQyQQk
 XbWi33x5dPoNAinzBSboBOTmZy29aHL9dj7zggZ1/eLVT6YkhJ5WYGd3t7NRPBuJytQe
 USaGf12L31ThwSkUcxUkgU2y+/GCbTteQJbKIkpsf3IOoMcMkMtgDQ3Pm7hceTfa92Ne
 PX3zlingXoawyTNDk4olARWtU5LmxXRmLV0GKi4L+yzOK/cyaLqa6oJ5RbW2fd70m072
 dHTD8a1T7WGv0h2LMBFuGAw16EXpZdUQvH99N4s8P1maO5v/Z93da9si5mubDOTw5/XI
 IVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=S7CIbWUQ5EtWy4K2smd2DLLQocrv83d6WnTC8JsR1RE=;
 b=m1dGiAkizOcvZH1bMsrfR2rhT94HAN+dtR3T3rxZ/ojbwzOhkorel91FEhti6/xE5i
 UN+NUNqOWstEXR/noZjROqJWA52KVUAianueD5hjkFE2HGIeBiav2RXoz9FTfzCi0Hvw
 ycmFWH/iWIsINRZiy0wRvnTXErZFE5fjQ4mqRc4ADqzfpDVA5wqItBSyIVgN1DEoLvX4
 METNyDEBmolmS2iusFEYUSTtJ9LXjJZK5T9hN5w98UpHJTcHRyqVVj8nl2daIJsxEZf4
 TwsIrzpDVp/pvOWYhMlVkJia+b3upnmIg46iS5CIarYnD9rkbrg8JEU/7d+jP3fb6iki
 yObQ==
X-Gm-Message-State: AOAM531AOxGdJhW8aWgmZHaOvLo456nZ2dk8yA4ixnVZPKffLMiVdfet
 4JJtH5R4Sa7FyMAmvLUSzz/f9QgTXI/v6+IUmaiUvdwhlg0ZTQ==
X-Google-Smtp-Source: ABdhPJzyRxIrmykSgDqhC9h90/PPxeraeiE4kGbWDWgo3oqJ5UA5C4ckCd5BRGr2R4IX3D2ChnjGGgeEIpXv7AfVnO8=
X-Received: by 2002:a25:2d61:: with SMTP id s33mr35530376ybe.36.1608697905223; 
 Tue, 22 Dec 2020 20:31:45 -0800 (PST)
MIME-Version: 1.0
References: <CALd3UbSrAqYFe5Z-S6NMKGaVMvOZx7C4zV5O7CwtTKPmV+UeVQ@mail.gmail.com>
 <CALd3UbS6MtKQEdhXQXH2GmU1EvZgS52XcTPihZ5wjb=4FaiYXA@mail.gmail.com>
In-Reply-To: <CALd3UbS6MtKQEdhXQXH2GmU1EvZgS52XcTPihZ5wjb=4FaiYXA@mail.gmail.com>
From: Bert Schiettecatte <bert@bertschiettecatte.com>
Date: Tue, 22 Dec 2020 20:31:34 -0800
Message-ID: <CALd3UbQuDU6asvTkQTP48ct4hT9euUGUoenD5TW2ZD7gbuHPag@mail.gmail.com>
Subject: question about alsa tracepoints and alsa debugging
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hi all,

I have a rk3288 board I am working with, it has two ADCs and one DAC.
The ADCs are connected via an FPGA to the rk3288. The DAC is directly
connected to the I2S port of the rk3288. The rk3288 generates the
master clock. I am using buildroot and busybox and kernel 5.9.12
(stable).

I have a driver which receives the ADC data from the FPGA via SDIO.
When I run speaker-test in the background and use arecord to record
simultaneously in the foreground, both arecord and speaker-test seem
to lock up. When I run speaker-test alone I do not have a problem. The
playback device uses the rockchip_i2s.c driver while the capture
device uses my SDIO driver.

My driver based on dw_mmc.c calls snd_pcm_period_elapsed() for each
buffer of frames that is ready. I can see that this is being called
for a while when I start arecord in the foreground, until the lockup
occurs. The moment I start arecord, the console output from
speaker-test stops, so it's locked up by starting arecord. Previously
this was working fine on kernel 4.11. However, since I updated to
kernel 5.9.12 this no longer works. Has anything changed between 4.11
and 5.9.12 that could be the cause of the problem?

commands used for starting playback / trace capture and for recording -
./perf record -F 99 -g -e snd_pcm:* -e sched:sched_switch -e
sched:sched_wakeup -e irq:* speaker-test -D
hw:CARD=ak4458ak5558aud,DEV=0 -c8 -r192000 -FS32_LE -tsine &
arecord -Dhw:CARD=ak4458ak5558aud,DEV=1 -fS32_LE -c16 -r192000
/mnt/ramdisk/rec.wav

I enabled the kernel options as described at
https://www.kernel.org/doc/html/v5.9/sound/designs/tracepoints.html
and have used perf to record a trace, which can be access here -
https://kernel-debugging.s3-us-west-1.amazonaws.com/perf.data.script.211220202054.txt
(exported using "perf script")

The trace file shows "lockdep_recursion" at some point so I am
wondering if my problem has to do with a deadlock somehow being
caused. However, I also see handle_mm_fault, and do_page_fault, which
has to do with memory mapping? So I'm not sure what the problem
exactly is and what to do next to find out what's wrong.

Thanks in advance for your help and interest and patience,
Bert
