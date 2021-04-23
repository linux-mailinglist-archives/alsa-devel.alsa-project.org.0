Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9432C3698CE
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 20:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231DD16EF;
	Fri, 23 Apr 2021 20:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231DD16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619201189;
	bh=HIuVYF1n6jT6n+KoS/O3AZIhs+4fj1thndIdd+hzB88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRw5787785PlMh7yJFVTrp4NOC/aO5TmTf45KLhu+jP3VCdkiID728sGF5So+3K3u
	 NmcDi32r4BzlMj4HHHCDnm/UFY5tg6DXuvRIqi53LxtdMYZ4Hbew391fo0jtRu8VZl
	 JQIAFv0rsfAeiLERu6XbS7ATvisb4bYfvPvjF6lU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74094F80256;
	Fri, 23 Apr 2021 20:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 573B2F80227; Fri, 23 Apr 2021 20:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C94B6F800AE
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 20:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C94B6F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QnOP6F6x"
Received: by mail-ej1-x62c.google.com with SMTP id r9so75132117ejj.3
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 11:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L9vAFTNt+x+qa+I1D+0esEzjzF132Kml6Vp8LjyHXk8=;
 b=QnOP6F6x7hXdy3N0cpb+YquA/lOO2HrS9ikiGoVgC9NJCCnq8d8/v5KeDdpoyZLMXg
 krgz/V/zpzdplU/vVOepYrBY4tNOOFSI5k1CWvlD9U+2FDnq7fMRcn0PVxF0uE9XLqI5
 nwrbegPnGmtuag9AEJRR27o9oC00kWPI0U35ce1eACSFQur2wRieWjqyJCNaROQ9S6+O
 E72ulMHaNmL40SWZYyeJYg1IgPe11QckkC8plAu8UtAHqv//bXbYcs8m0wI2sw1SVGm5
 znrNuuE8PLJ03CmBoj4g5EqfA4Aga4jy/x2EA45Z01l20mfIZsV46YIp6MBlreq2bUfO
 7pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L9vAFTNt+x+qa+I1D+0esEzjzF132Kml6Vp8LjyHXk8=;
 b=cwXLSkrg9SwAnkxqzZJ8YNzlc+CEJeP+h3xGawZeb6bHIDyhGDhAuz3pvCR979exfR
 TD4sAwp0OFG3ZD3+kv3zHiJ3fjjRKWwKY+bRw58RMi60cvKBWfeofPnWHk1AcQ27kruS
 GxJhoTeI3+VyqBD0ETcA+chDuRQcppP2HziPcljgwo+7MkAfYTmsUpikgzyir7Lm/00p
 hibBaiKeuxsccteMVgIdBW7pJM8tqY9PSnJzpWvn4KayhAY1Lo6T2mPwiGPHH4oLOOBF
 5aDYKemGq+uwKnImg7b9J+3UuIK6yHauOmr+wuRczUJURTowBqhAHnRSiL8KmmW8IBHe
 Qz9w==
X-Gm-Message-State: AOAM531WrS23w0qgpRKh60IrgeHavt6GQxYAfuIlRQwVhYr6AVR1dcz/
 vtVjNpDLsMTdmHJhnHp5UFmCWrt9/DYCNXWEeag=
X-Google-Smtp-Source: ABdhPJw10MriKsx6zlxv30K7uPVlk1Xq+redy+4HCxayNsw5UlFGJNNcUf4Sw9jSdoQlJQY1KSr/UQ1FaRJ6q9LoY6U=
X-Received: by 2002:a17:907:9691:: with SMTP id
 hd17mr5667422ejc.205.1619201090462; 
 Fri, 23 Apr 2021 11:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210422120413.457-1-tiwai@suse.de>
 <20210422120413.457-2-tiwai@suse.de>
 <CAHXb3bcKvPSceMuvrq-X8dUyxdrH6iAHTHq_RgTXoAAiXygwUQ@mail.gmail.com>
 <CAOsVg8rAkwLgLP_LSj6CfYG+1R2oB5-sV4KQhLJMqCEqL2wDQA@mail.gmail.com>
 <s5hlf99788o.wl-tiwai@suse.de>
In-Reply-To: <s5hlf99788o.wl-tiwai@suse.de>
From: Lucas <jaffa225man@gmail.com>
Date: Fri, 23 Apr 2021 13:04:38 -0500
Message-ID: <CAOsVg8rPfh-scSmmJSVASPTw7o3vw_zZ05YzVZ_JYFJHbcOcyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Generic application of implicit fb
 to Roland/BOSS devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, "Keith A . Milner" <maillist@superlative.org>,
 Mike Oliphant <oliphant@nostatic.org>
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

On Fri, Apr 23, 2021 at 2:47 AM Takashi Iwai <tiwai@suse.de> wrote:

> Is this really with snd-usb-audio driver?  Please check the entry in
> /proc/asound/modules (or traverse via sysfs).
>

No, I see it's not.  It's using the correct snd_ua101 module

This rather sounds like a generic problem of the implicit feedback.
> Please give the kernel log with snd_usb_audio.dyndbg=+p boot option
> with some notion which timestamp corresponding to which action
> (e.g. starting playback, stopping recording, etc).
>

Okay, that's good news!  Thanks, and here's that:

I turned the INTEGRA-7 on at 11:59:00
It started fully at 11:59:27, which is probably when the kernel could see
it:

[ 1632.073938] usb 1-1.6: new high-speed USB device number 5 using ehci-pci
[ 1634.034266] usb 1-1.6: New USB device found, idVendor=0582,
idProduct=015b, bcdDevice= 1.00
[ 1634.034274] usb 1-1.6: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 1634.034277] usb 1-1.6: Product: INTEGRA-7
[ 1634.034279] usb 1-1.6: Manufacturer: Roland
[ 1634.036522] usb 1-1.6: 1:1: added playback implicit_fb sync_ep 8e, iface
2:1
[ 1634.036527] usb 1-1.6: 1:1: add audio endpoint 0xd
[ 1634.036539] usb 1-1.6: Creating new data endpoint #d
[ 1634.036541] usb 1-1.6: Creating new data endpoint #8e
[ 1634.036638] usb 1-1.6: 1:1 Set sample rate 96000, clock 0
[ 1634.036891] usb 1-1.6: 2:1: added capture implicit_fb sync_ep d, iface
1:1
[ 1634.036894] usb 1-1.6: 2:1: add audio endpoint 0x8e
[ 1634.036997] usb 1-1.6: 2:1 Set sample rate 96000, clock 0
[ 1634.082834] usb 1-1.6: Open EP 0x8e, iface=2:1, idx=0
[ 1634.082840] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=19184, periods=4, implicit_fb=1
[ 1634.082843] usb 1-1.6: Open EP 0xd, iface=1:1, idx=0
[ 1634.082844] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=19184, periods=4, implicit_fb=1
[ 1634.082847] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1634.083011] usb 1-1.6: Setting usb interface 2:1 for EP 0x8e
[ 1634.083143] usb 1-1.6: 2:1 Set sample rate 96000, clock 0
[ 1634.083146] usb 1-1.6: Setting params for data EP 0x8e, pipe 0x70580
[ 1634.083160] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.083162] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1634.083246] usb 1-1.6: Setting usb interface 1:1 for EP 0xd
[ 1634.083416] usb 1-1.6: 1:1 Set sample rate 96000, clock 0
[ 1634.083421] usb 1-1.6: Setting params for data EP 0xd, pipe 0x68500
[ 1634.083444] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.085019] usb 1-1.6: Closing EP 0x8e (count 1)
[ 1634.085022] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1634.085144] usb 1-1.6: EP 0x8e closed
[ 1634.085146] usb 1-1.6: Closing EP 0xd (count 1)
[ 1634.085148] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1634.085273] usb 1-1.6: EP 0xd closed
[ 1634.085652] usb 1-1.6: Open EP 0x8e, iface=2:1, idx=0
[ 1634.085655] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=19184, periods=4, implicit_fb=1
[ 1634.085658] usb 1-1.6: Open EP 0xd, iface=1:1, idx=0
[ 1634.085659] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=19184, periods=4, implicit_fb=1
[ 1634.085661] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1634.085826] usb 1-1.6: Setting usb interface 2:1 for EP 0x8e
[ 1634.085873] usb 1-1.6: 2:1 Set sample rate 96000, clock 0
[ 1634.085879] usb 1-1.6: Setting params for data EP 0x8e, pipe 0x70580
[ 1634.085884] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.085886] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1634.086018] usb 1-1.6: Setting usb interface 1:1 for EP 0xd
[ 1634.086139] usb 1-1.6: 1:1 Set sample rate 96000, clock 0
[ 1634.086153] usb 1-1.6: Setting params for data EP 0xd, pipe 0x68500
[ 1634.086158] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.086292] usb 1-1.6: Closing EP 0x8e (count 1)
[ 1634.086294] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1634.086400] usb 1-1.6: EP 0x8e closed
[ 1634.086403] usb 1-1.6: Closing EP 0xd (count 1)
[ 1634.086404] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1634.086524] usb 1-1.6: EP 0xd closed
[ 1634.086817] usb 1-1.6: Open EP 0xd, iface=1:1, idx=0
[ 1634.086820] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=19184, periods=4, implicit_fb=1
[ 1634.086822] usb 1-1.6: Open EP 0x8e, iface=2:1, idx=0
[ 1634.086824] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=19184, periods=4, implicit_fb=1
[ 1634.086826] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1634.086858] usb 1-1.6: Setting usb interface 1:1 for EP 0xd
[ 1634.086993] usb 1-1.6: 1:1 Set sample rate 96000, clock 0
[ 1634.086996] usb 1-1.6: Setting params for data EP 0xd, pipe 0x68500
[ 1634.087000] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.087001] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1634.087106] usb 1-1.6: Setting usb interface 2:1 for EP 0x8e
[ 1634.087272] usb 1-1.6: 2:1 Set sample rate 96000, clock 0
[ 1634.087279] usb 1-1.6: Setting params for data EP 0x8e, pipe 0x70580
[ 1634.087284] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.087295] usb 1-1.6: Starting data EP 0xd (running 0)
[ 1634.087320] usb 1-1.6: 12 URBs submitted for EP 0xd
[ 1634.087322] usb 1-1.6: Starting data EP 0x8e (running 0)
[ 1634.087338] usb 1-1.6: 12 URBs submitted for EP 0x8e
[ 1634.088270] usb 1-1.6: Reopened EP 0x8e (count 1)
[ 1634.088273] usb 1-1.6: Reopened EP 0xd (count 1)
[ 1634.088286] usb 1-1.6: Closing EP 0x8e (count 2)
[ 1634.088288] usb 1-1.6: Closing EP 0xd (count 2)
[ 1634.088599] usb 1-1.6: Reopened EP 0x8e (count 1)
[ 1634.088601] usb 1-1.6: Reopened EP 0xd (count 1)
[ 1634.088612] usb 1-1.6: Stopping data EP 0x8e (running 1)
[ 1634.088616] usb 1-1.6: Stopping data EP 0xd (running 1)
[ 1634.101964] usb 1-1.6: Closing EP 0xd (count 2)
[ 1634.101972] usb 1-1.6: Closing EP 0x8e (count 2)
[ 1634.102043] usb 1-1.6: Closing EP 0x8e (count 1)
[ 1634.102045] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1634.102129] usb 1-1.6: EP 0x8e closed
[ 1634.102132] usb 1-1.6: Closing EP 0xd (count 1)
[ 1634.102134] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1634.102255] usb 1-1.6: EP 0xd closed
[ 1634.107863] usb 1-1.6: Open EP 0xd, iface=1:1, idx=0
[ 1634.107867] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=19184, periods=4, implicit_fb=1
[ 1634.107869] usb 1-1.6: Open EP 0x8e, iface=2:1, idx=0
[ 1634.107871] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=19184, periods=4, implicit_fb=1
[ 1634.107873] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1634.107992] usb 1-1.6: Setting usb interface 1:1 for EP 0xd
[ 1634.108137] usb 1-1.6: 1:1 Set sample rate 96000, clock 0
[ 1634.108147] usb 1-1.6: Setting params for data EP 0xd, pipe 0x68500
[ 1634.108161] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.108164] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1634.108236] usb 1-1.6: Setting usb interface 2:1 for EP 0x8e
[ 1634.108376] usb 1-1.6: 2:1 Set sample rate 96000, clock 0
[ 1634.108384] usb 1-1.6: Setting params for data EP 0x8e, pipe 0x70580
[ 1634.108393] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.108413] usb 1-1.6: Starting data EP 0xd (running 0)
[ 1634.108452] usb 1-1.6: 12 URBs submitted for EP 0xd
[ 1634.108454] usb 1-1.6: Starting data EP 0x8e (running 0)
[ 1634.108470] usb 1-1.6: 12 URBs submitted for EP 0x8e
[ 1634.108782] usb 1-1.6: Reopened EP 0x8e (count 1)
[ 1634.108785] usb 1-1.6: Reopened EP 0xd (count 1)
[ 1634.108796] usb 1-1.6: Closing EP 0x8e (count 2)
[ 1634.108797] usb 1-1.6: Closing EP 0xd (count 2)
[ 1634.109076] usb 1-1.6: Reopened EP 0x8e (count 1)
[ 1634.109078] usb 1-1.6: Reopened EP 0xd (count 1)
[ 1634.109089] usb 1-1.6: Stopping data EP 0x8e (running 1)
[ 1634.109093] usb 1-1.6: Stopping data EP 0xd (running 1)
[ 1634.121982] usb 1-1.6: Closing EP 0xd (count 2)
[ 1634.121987] usb 1-1.6: Closing EP 0x8e (count 2)
[ 1634.122023] usb 1-1.6: Closing EP 0x8e (count 1)
[ 1634.122024] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1634.122136] usb 1-1.6: EP 0x8e closed
[ 1634.122139] usb 1-1.6: Closing EP 0xd (count 1)
[ 1634.122141] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1634.122250] usb 1-1.6: EP 0xd closed
[ 1634.136890] usb 1-1.6: Open EP 0xd, iface=1:1, idx=0
[ 1634.136895] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=524288, periods=2, implicit_fb=1
[ 1634.136898] usb 1-1.6: Open EP 0x8e, iface=2:1, idx=0
[ 1634.136899] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=524288, periods=2, implicit_fb=1
[ 1634.136901] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1634.137059] usb 1-1.6: Setting usb interface 1:1 for EP 0xd
[ 1634.137214] usb 1-1.6: 1:1 Set sample rate 96000, clock 0
[ 1634.137225] usb 1-1.6: Setting params for data EP 0xd, pipe 0x68500
[ 1634.137235] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.137238] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1634.137362] usb 1-1.6: Setting usb interface 2:1 for EP 0x8e
[ 1634.137500] usb 1-1.6: 2:1 Set sample rate 96000, clock 0
[ 1634.137508] usb 1-1.6: Setting params for data EP 0x8e, pipe 0x70580
[ 1634.137517] usb 1-1.6: Set up 12 URBS, ret=0
[ 1634.137608] usb 1-1.6: Starting data EP 0xd (running 0)
[ 1634.137630] usb 1-1.6: 12 URBs submitted for EP 0xd
[ 1634.137632] usb 1-1.6: Starting data EP 0x8e (running 0)
[ 1634.137648] usb 1-1.6: 12 URBs submitted for EP 0x8e
[ 1634.138532] usb 1-1.6: 1:1 Start Playback PCM
[ 1634.139021] usb 1-1.6: Reopened EP 0x8e (count 1)
[ 1634.139024] usb 1-1.6: Reopened EP 0xd (count 1)
[ 1634.139549] usb 1-1.6: Starting data EP 0x8e (running 1)
[ 1634.139553] usb 1-1.6: Starting data EP 0xd (running 1)
[ 1634.139554] usb 1-1.6: 2:1 Start Capture PCM
[ 1639.143013] usb 1-1.6: Stopping data EP 0xd (running 2)
[ 1639.143022] usb 1-1.6: Stopping data EP 0x8e (running 2)
[ 1639.143026] usb 1-1.6: 2:1 Stop Capture PCM
[ 1639.143083] usb 1-1.6: Closing EP 0x8e (count 2)
[ 1639.143086] usb 1-1.6: Closing EP 0xd (count 2)
[ 1639.144139] usb 1-1.6: Stopping data EP 0x8e (running 1)
[ 1639.144147] usb 1-1.6: Stopping data EP 0xd (running 1)
[ 1639.144150] usb 1-1.6: 1:1 Stop Playback PCM
[ 1639.157925] usb 1-1.6: Closing EP 0xd (count 1)
[ 1639.157933] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1639.158186] usb 1-1.6: EP 0xd closed
[ 1639.158190] usb 1-1.6: Closing EP 0x8e (count 1)
[ 1639.158192] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1639.158431] usb 1-1.6: EP 0x8e closed

I began playing the long file.wav at 12:00:00
aplay -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo

[ 1682.241471] usb 1-1.6: Open EP 0xd, iface=1:1, idx=0
[ 1682.241478] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=96000, periods=4, implicit_fb=1
[ 1682.241482] usb 1-1.6: Open EP 0x8e, iface=2:1, idx=0
[ 1682.241484] usb 1-1.6:   channels=2, rate=96000, format=S32_LE,
period_bytes=96000, periods=4, implicit_fb=1
[ 1682.241487] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1682.241608] usb 1-1.6: Setting usb interface 1:1 for EP 0xd
[ 1682.241746] usb 1-1.6: 1:1 Set sample rate 96000, clock 0
[ 1682.241754] usb 1-1.6: Setting params for data EP 0xd, pipe 0x68500
[ 1682.241761] usb 1-1.6: Set up 12 URBS, ret=0
[ 1682.241764] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1682.241988] usb 1-1.6: Setting usb interface 2:1 for EP 0x8e
[ 1682.242126] usb 1-1.6: 2:1 Set sample rate 96000, clock 0
[ 1682.242136] usb 1-1.6: Setting params for data EP 0x8e, pipe 0x70580
[ 1682.242144] usb 1-1.6: Set up 12 URBS, ret=0
[ 1682.242176] usb 1-1.6: Starting data EP 0xd (running 0)
[ 1682.242202] usb 1-1.6: 12 URBs submitted for EP 0xd
[ 1682.242204] usb 1-1.6: Starting data EP 0x8e (running 0)
[ 1682.242223] usb 1-1.6: 12 URBs submitted for EP 0x8e
[ 1682.242373] usb 1-1.6: 1:1 Start Playback PCM

I began recording soon after:
arecord -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./duplex.wav
Recording WAVE './duplex.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo

[ 1742.225424] usb 1-1.6: Reopened EP 0x8e (count 1)
[ 1742.225431] usb 1-1.6: Reopened EP 0xd (count 1)
[ 1742.225555] usb 1-1.6: Starting data EP 0x8e (running 1)
[ 1742.225559] usb 1-1.6: Starting data EP 0xd (running 1)
[ 1742.225561] usb 1-1.6: 2:1 Start Capture PCM

I ended arecord at 12:02:00 with ctrl-c:
^CAborted by signal Interrupt...
And playback became abruptly inaudible at 12:02:00 too.

[ 1798.440257] usb 1-1.6: Stopping data EP 0xd (running 2)
[ 1798.440266] usb 1-1.6: Stopping data EP 0x8e (running 2)
[ 1798.440270] usb 1-1.6: 2:1 Stop Capture PCM
[ 1798.440277] usb 1-1.6: Closing EP 0x8e (count 2)
[ 1798.440280] usb 1-1.6: Closing EP 0xd (count 2)

By 12:03:00 (appears to be 12:02:30), aplay had timed out with:
aplay: pcm_write:2061: write error: Input/output error

[ 1828.881035] usb 1-1.6: Stopping data EP 0x8e (running 1)
[ 1828.881049] usb 1-1.6: Stopping data EP 0xd (running 1)
[ 1828.881053] usb 1-1.6: 1:1 Stop Playback PCM
[ 1828.896990] usb 1-1.6: Closing EP 0xd (count 1)
[ 1828.896998] usb 1-1.6: Setting usb interface 1:0 for EP 0xd
[ 1828.897139] usb 1-1.6: EP 0xd closed
[ 1828.897146] usb 1-1.6: Closing EP 0x8e (count 1)
[ 1828.897149] usb 1-1.6: Setting usb interface 2:0 for EP 0x8e
[ 1828.897406] usb 1-1.6: EP 0x8e closed

I can confirm everything else is perfect, as my previous test of this patch
already proved.

Thanks for putting up with my pedantic musings,

  Lucas
