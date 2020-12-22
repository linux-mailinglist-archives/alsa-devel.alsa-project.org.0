Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1562E2023
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:49:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F91180A;
	Wed, 23 Dec 2020 18:48:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F91180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608745784;
	bh=S7CIbWUQ5EtWy4K2smd2DLLQocrv83d6WnTC8JsR1RE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZKMoYP4y75/ICy9IxDtb5acfbmfmpwgZE0cyNXxswh45AoK4aqGN8lWepdpACvRND
	 ACvnQWTknZn+gp2QJntToPpO8YKqN08z/NLVYO/Jf3AE0UoHi//UHRGQGJA+V2WhUX
	 3L36zp8kQcHy2ZtBcJ9xRMgH6tI4G8BhZgqIrdFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 218B1F804FE;
	Wed, 23 Dec 2020 18:45:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFE13F80224; Tue, 22 Dec 2020 06:23:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65702F800BC
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 06:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65702F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bertschiettecatte-com.20150623.gappssmtp.com
 header.i=@bertschiettecatte-com.20150623.gappssmtp.com header.b="Fz53xhuA"
Received: by mail-yb1-xb2f.google.com with SMTP id f6so2153181ybq.13
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 21:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bertschiettecatte-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=S7CIbWUQ5EtWy4K2smd2DLLQocrv83d6WnTC8JsR1RE=;
 b=Fz53xhuAh/3yeQBT15LPK2yJoZq8fR10vNkiI9wkt34bgulH4rESx2QL2IaHCcXbhm
 OvLg73B1yCUeKY+Ur2dvpyhKxvrHrZoKdbBuod+BvEpspdNsCbrDi6lyOFO3rEIsZsDO
 TxolGJrRj1IVHXozMq2Fbn5lHIldMVI4pgWovjH3TuA/eiaGsHESnNJ5ziVsalaH/MXk
 knmjOXJyvc3D3S2q50ebfcQNMsvaEAJU4E1IuMZezykcaSa2z7LMyH2JH/nXsDhJ6opN
 VdkkOeY6RajrXAUfiYm6eedowTk8FXERkjoaKALI7fLySqLIQgXCfKQJNpRF74NtCt1X
 YU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=S7CIbWUQ5EtWy4K2smd2DLLQocrv83d6WnTC8JsR1RE=;
 b=eX88eIC5xz4E/5VI2xD4COB09CTt3caPdMDdbIeX67UFEg5YaUanBsAVG8rWGa9n5I
 KBa96zpuHOzXOF68Bolxy+C2o+t3vlLKmukJuhFIWWe0wvDPzRr8n6dRPoY6L3q8kJtf
 MgpGdk5M5sfVPij97QobPF8mQUuIeW10WaEa51aA5jZewfnBts0yU5mzLb2ELHGaJGAy
 ITwDCAyyjPqoPoiRL04+NpxouOSH11p9Voz0/ywadd5FuKhdd086x6+j8XSxsakE7eSA
 AgoodkKkHBvr1F3Y02KmMqNqKPTT+g+4AtJ7n54lLMHJ64pV9NbmbU0li2NI0vD1BLtG
 zuWg==
X-Gm-Message-State: AOAM532DkgWgqii3UmWZWQdBPsTnVzpQK8aHh4f/1z4x5gfbDSBI5wbh
 AVmR6i3MROGK5j42B2q/hSDFOsJB7tWqXeo8K1uRcqybu+VBoIW0
X-Google-Smtp-Source: ABdhPJzkXP36hCm8NxEUGZDerO6mVnzAlbCcw8yoRorOriPPp3LwKl71IK5NZRnZHeJDfbloJjXby3AUE7f4+VeA5yQ=
X-Received: by 2002:a25:8608:: with SMTP id y8mr27287081ybk.324.1608614593547; 
 Mon, 21 Dec 2020 21:23:13 -0800 (PST)
MIME-Version: 1.0
References: <CALd3UbSrAqYFe5Z-S6NMKGaVMvOZx7C4zV5O7CwtTKPmV+UeVQ@mail.gmail.com>
In-Reply-To: <CALd3UbSrAqYFe5Z-S6NMKGaVMvOZx7C4zV5O7CwtTKPmV+UeVQ@mail.gmail.com>
From: Bert Schiettecatte <bert@bertschiettecatte.com>
Date: Mon, 21 Dec 2020 21:23:02 -0800
Message-ID: <CALd3UbS6MtKQEdhXQXH2GmU1EvZgS52XcTPihZ5wjb=4FaiYXA@mail.gmail.com>
Subject: Fwd: question about alsa tracepoints and alsa debugging
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Dec 2020 18:45:49 +0100
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
