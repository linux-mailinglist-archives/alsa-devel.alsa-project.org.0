Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6E02075BC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 16:32:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99020185E;
	Wed, 24 Jun 2020 16:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99020185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593009123;
	bh=vbvqyLg8QHmspqnBx1cqkVMV+xZaBefJlzpZLc4g5Y0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYe+gjDI+dYvkw+AaM31fy9yfxinM4ANAbc4moZ8wapJnKDNlZlxx3iokFr5HV3u0
	 ab/1tr8/hgC2/UEbFp7tEiGSQAXGzsaj+hGQs4BGJHG5GyGwdxZTi1XTcwXP/2beGI
	 /NConLrqVjfdORlrcgu+mSslVz0xaw98FOH7ZJwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C93B7F8015A;
	Wed, 24 Jun 2020 16:30:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E14B7F8015B; Wed, 24 Jun 2020 16:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D728BF80084
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 16:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D728BF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bG/KweiT"
Received: by mail-io1-xd43.google.com with SMTP id i25so2383629iog.0
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=c0OL3or/jNukylu4SLW7xZjyvLR74uApDtLzGY2kh5U=;
 b=bG/KweiTdUUc5tNHeF68ffWzobMQ0INN+e4iJf20UJNuU5VIqbpDjWjYyNbyi7wTRz
 IYWh+dLcw9AV7o7PBzzZo7VlYZrCsIHEkPjEs8lSRZmmsQRDUy/Xq7mHYpSpv/+pdt3b
 VKXellLuFo+jYoZ2D9usoLmOq7XXebu08/HaauKLTew4VUbASwp2/B39jOjpW/z3cf9x
 rDbh68hBVW81QYB0XbFeKrgOEQMT9FxKnzPDv/yksxHVJDoaP9/B+e8R+3nRqZoDRU5n
 qCoBRzYq1xJKB6gCIUbPIA/f1h1skY6ggv59bKEw+n8gOnq536JrCBGBaQGdNI1kC5rq
 9jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=c0OL3or/jNukylu4SLW7xZjyvLR74uApDtLzGY2kh5U=;
 b=N+xBJlx5tGEGqWaz8/fVVp5MXXiH1kOLub31AgQRZFUG6bJAADGR6xianfjKif3YjC
 /O6cRrkhSlXkAniR0vdjMnJFvMYTWmw2u9zbVbkCxGWuQDCEyOU3tF5JxpkCfXEZEp6R
 TTroV9a4HpxBywcljcrcf5of3ld1Z+71LhIYuRFoMNG4WJX+0U+wx2C3emqMd2cG/JBI
 hcK8pvdAZMmBgNe2YAV7PeNbxKDOJf5JMUJhNVg0f1/hAekuupVwZ2CnVvy737nBLoGz
 6xNfyd1NrM5VCwQPXYhgDS5AfQ4qspTocFCIuDBcICXPN1LhsxrbaYVxEvmAdHUcyZa7
 4zJA==
X-Gm-Message-State: AOAM5328SWc8zGGrSs6kCj5LLBTBmxwCOTSQGkn6TQ5drq5vjS9DkEJJ
 N6lzBVAvJMnUyhN41mWs5+p0hfy7aPhqFSHU1Ai82A==
X-Google-Smtp-Source: ABdhPJxHW2kXFpMMz6E/2n9qUbnzrilg1B8qbM6zjZPIh9Xi73WtRIA4XDwKNJi/bVsPBDUQWMmBpqXsplw4V0s5dS4=
X-Received: by 2002:a05:6602:146:: with SMTP id
 v6mr31073100iot.170.1593009001104; 
 Wed, 24 Jun 2020 07:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-1zuv3SeumhdMbqXjZU0tbmh7HB9LwTK2bfNTe5nOCmz4BgA@mail.gmail.com>
 <s5h366ln2vc.wl-tiwai@suse.de> <1665408.c0yUS1ZBRE@gluon>
In-Reply-To: <1665408.c0yUS1ZBRE@gluon>
From: Stanislav Kazmin <stas.kazmin@gmail.com>
Date: Wed, 24 Jun 2020 16:29:49 +0200
Message-ID: <CA+-1zuvXNt-J6p_9t4FgfkDBdgdcr=-EGiP+QgHoMv+E14Oa+A@mail.gmail.com>
Subject: Re: [HDAudio][ALC295] speakers not working on Acer Travelmate P614
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
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

I have two more questions on the procedure.

1. can I apply changes through hda-verbs while using the sof drivers or do
I need to use snd-hda-intel?

2. I have windows 10 installed dual to my Linux. Is there a tool I could
use to get the correct pins/coefficients for the Linux driver or quirk?

I am not a Linux developer so it all is very new to me. I am willing to try
anything suggested by someone but I will probably not be able to find out
any commad/setting on my own.

Thanks.

On Tue, Jun 23, 2020, 23:50 Stanislav Kazmin <stas.kazmin@gmail.com> wrote:

> Hello,
>
> so I have tested the following three cases:
> ```
> sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x01
> sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x01
> sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x01
> aplay /usr/share/sounds/alsa/Front_Center.wav
> ```
>
> ```
> sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x02
> sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x02
> sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x02
> aplay /usr/share/sounds/alsa/Front_Center.wav
> ```
>
> ```
> sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x04
> sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x04
> sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x04
> aplay /usr/share/sounds/alsa/Front_Center.wav
> ```
>
> But this did not solved the problem.
>
> > And try turn on EAPD on non-used pins.
>
> I have not found how to do that exactly. Do I have to use the pins which I
> have seen in hdajackretask?
>
> Could you provide an example on how to do it?
>
> And how to start with the coefficient changes properly?
>
> Best,
>
> Stanislav
>
> On Dienstag, 23. Juni 2020 18:49:59 CEST Takashi Iwai wrote:
> > On Tue, 23 Jun 2020 17:49:18 +0200,
> >
> > Stanislav Kazmin wrote:
> > > Hello, I have the following problem on my Acer TravelMate P614-51T-G2:
> > >
> > > I have all the audio sinks correctly identified (like HDMI, DMic,
> > > Headphones) but the internal speakers do not produce any sound.
> > >
> > > What I have tried so far:
> > >
> > > - hard/soft shutdown on Windows and reboot
> > > - disable/re-enable speakers and microphone in BIOS
> > > - uninstall pulseaudio and test alsa alone (so it is defeitely **not**
> a
> > > pulseaudio issue)
> > > - switch from sof-hda-dsp to snd-hda-intel driver (without Dmic
> support)
> > > - retask pins 0x14, 0x16, 0x1b to "Internal Speakers" through
> > > hdajackretask
> > > (only basic, without advanced features)
> > > - removed/reconnected the headphones
> > >
> > > `alsamixer` shows all needed sinks and nothing is muted.
> > >
> > > I already discussed the issue at sof github
> > > https://github.com/thesofproject/ sof/issues/3058 but since the same
> > > issue occurs on `snd-hda-intel` legacy river, I was advised to
> > > communicate with alsa-devel team.
> > >
> > > The alsa-info.sh result are linked at http://alsa-project.org/db/?
> > > f=252f92c7a1df3c755d16ee69353b26d2535a4d81
> > >
> > > I have tested the kernel 5.8-rc1 but it does not make any difference.
> > >
> > > Let me know if I can do anything else to test the issue.
> >
> > It's hard to know and the only way is to some trial-and-errors.
> > The first shot I'd take is to toggle GPIO pins.  You can change the
> > bit via hda-verb program like
> >   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x01
> >   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x01
> >   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x01
> >
> > to turn on the bit 0 of GPIO.  The first 0x01 is the node ID and it's
> > 0x01 on Realtek, and the last 0x01 the GPIO bit 0.  For toggling the
> > bit 1, pass 0x02 in the last argument, and for bit 2, pass 0x04.
> >
> > And try turn on EAPD on non-used pins.  This can be done via hda-verb,
> > too.
> >
> > If this doesn't help, you might need to try some COEF changes as done
> > in various quirks in sound/pci/hda/patch_realtek.c.
> >
> >
> > HTH,
> >
> > Takashi
>
>
>
>
