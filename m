Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286E62FAE05
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 01:28:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1DB41860;
	Tue, 19 Jan 2021 01:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1DB41860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611016129;
	bh=Tgj7jExjLGl1+7M3FfCpRWtqdO9WrY+Oj90L0hkxV+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qubqLBZBN+lX5Pq792g53qdsb7h5VK5fCv5D0yx5dOnepmokjHVxevKRNyQMCLBrP
	 MHz+jUVZWOCtREcwvS3WNY8Wf2PL9gfKSp514oYnxupISwlKPbOU5yLAFnq6t4HPvf
	 r8EI93Sr+WsvFAcFVVslGb/YBa1gkTiYjhaWPaLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DADFF8016E;
	Tue, 19 Jan 2021 01:27:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47C1AF8016E; Tue, 19 Jan 2021 01:27:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD878F800C0
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 01:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD878F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="LGr6+Xz9"
Received: by mail-yb1-xb2a.google.com with SMTP id x78so9869289ybe.11
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 16:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XRaF4AcjIBU0yuwEAUkTt15vHcbut6PNHtOlpD0pOR0=;
 b=LGr6+Xz9MQa2JPHa+2KVvrVumSFcczxPQJcyF9H4JTzVO4lReraTRXhHW6XGnCeeZD
 SPGT6mVRFnUfKG0K1h8vseX4OD603uMCKH28rjj+Vq1RL1dKAdLo9R8sFELJEE6NX18j
 wEcMoW6QrWxQRnppFKpGiwOlByw1lXt3MyxOkHpMBN1H55yDfquydJTtKwVInQpcDtfl
 Ak8M2e1T3Z2NIwdhMNKdRgEjTPxwOs15ZEQiduzujhvqUeK0HI1k21ydlF5QAbqzRneY
 4OUfrXPh67QZrKIdG+lsz9IeppQeBgtgW5sxU788fUPyO3TVRpPaugcy2hT1fX5wlsY9
 zYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XRaF4AcjIBU0yuwEAUkTt15vHcbut6PNHtOlpD0pOR0=;
 b=Y8P2n5bxexYDCF9D4f7V8QN5BZ1WsiD/3V3lsnM4KQElgyKLJoRzgY0CnxbrkbNOkZ
 zCrt0vuXhFQXMDHr1wWPOYLqa68zxwN+0SgtaJopLGQ6+roKp2cpx85oRoD7bG9s64gE
 vDYqdHHSJdIMqeDylkGF2tZTk1ypAWpL2tT0oK7agINGYe5TVmxb93Fu4yyV4XyiFIVY
 Ya3fe71jroTf++wEs+kf7krdNqELUCkcRt1EUmvnzre07eQr7MAIHRcPnl1mCa3xFUET
 XAEWUNrVLgDLmqLVYUUXik2JQDGrdVw099NiiBAFGqGbj//cqkXSzBuYnAMfQXhgs+o/
 1w0A==
X-Gm-Message-State: AOAM530P+pFu3k/EmjGTAgP/zP+oUoi9K0TAKD1nuGVg82j+pAWjInHd
 oxd7nlcd1yk6gw/Y5oJD86ukkPZyuSh5P5luNAUgtQ==
X-Google-Smtp-Source: ABdhPJznom3St1jSHe5wpvvdfOk53rUR6fwbonxis7trnbI16RimpVkER6Bb/R5Fc4+SsUS0IrR6rEK/UG1OEKqZmHs=
X-Received: by 2002:a25:1d5:: with SMTP id 204mr2223107ybb.417.1611016021398; 
 Mon, 18 Jan 2021 16:27:01 -0800 (PST)
MIME-Version: 1.0
References: <CAHXb3bdk71ivJUp9HBRccDvd8SD2F1uFdsC_FxUjhh5zpcQobQ@mail.gmail.com>
 <s5hr1mik7vu.wl-tiwai@suse.de>
 <CAHXb3bdt6mgUcZ0+MH1i7QeYF03MSwx=kad-YBBNeVjqoH=KhA@mail.gmail.com>
 <CAHXb3bcFM0BswbuTe=6vP6JRd=TOf94Gu0FPAZmXT6634bCiAQ@mail.gmail.com>
 <s5hr1migiie.wl-tiwai@suse.de>
 <CAHXb3be9EpEtaEc0iH06wmLMhyizkV7arvgxsT2bWK=aJHKVLA@mail.gmail.com>
 <s5him7thpoz.wl-tiwai@suse.de>
In-Reply-To: <s5him7thpoz.wl-tiwai@suse.de>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Mon, 18 Jan 2021 16:26:51 -0800
Message-ID: <CAHXb3bd8zHFmHxDp=4dNKa90eAT568yCwTWo_5L0Zry1EY45UA@mail.gmail.com>
Subject: Re: Support for NUX MG-300 USB interface
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Unfortunately, the "uac_clock_selector_set_val()" call does not seem to
change anything.

From doing some more testing, I think that the references to clock id "40"
are ok - it has "40" stored in fmt->clock, but when it uses it,
"__uac_clock_find_source()" gets called and it resolved to the actual clock
source - "41".

Not sure about the "No valid sample rate available for 1:1, assuming a
firmware bug" error, but I suspect it is spurious.
"check_valid_altsetting_v2v3()" is failing for some reason, but it is
ignoring the error.

Playback is completely silent, but the system seems to think it is working.
No apparent errors, and a play operation seems to take the correct amount
of time. Just no audio.

Maybe it is a mixer issue? mixer.c is putting out "RANGE setting not yet
supported" errors on startup.

Here is a sample of dmesg output for a playback session:

[ 4748.260975] usb 1-1.3: Open EP 0x1, iface=1:1, idx=0
[ 4748.260983] usb 1-1.3:   channels=2, rate=48000, format=S32_LE,
period_bytes=48000, periods=4, implicit_fb=0
[ 4748.260988] usb 1-1.3: Open EP 0x81, iface=1:1, idx=1
[ 4748.260992] usb 1-1.3:   channels=2, rate=48000, format=S32_LE,
period_bytes=48000, periods=4, implicit_fb=0
[ 4748.260996] usb 1-1.3: Setting usb interface 1:0 for EP 0x1
[ 4748.261320] usb 1-1.3: 1:1 Set sample rate 48000, clock 40
[ 4748.261873] usb 1-1.3: Setting params for data EP 0x1, pipe 0x9d00
[ 4748.261890] usb 1-1.3: Set up 12 URBS, ret=0
[ 4748.261897] usb 1-1.3: Setting usb interface 1:1 for EP 0x1
[ 4748.262097] usb 1-1.3: Setting params for sync EP 0x81, pipe 0x9d80
[ 4748.262105] usb 1-1.3: Set up 4 URBS, ret=0
[ 4748.262147] usb 1-1.3: Starting data EP 0x1 (running 0)
[ 4748.262180] usb 1-1.3: 12 URBs submitted for EP 0x1
[ 4748.262183] usb 1-1.3: Starting sync EP 0x81 (running 0)
[ 4748.262193] usb 1-1.3: 4 URBs submitted for EP 0x81
[ 4748.262311] usb 1-1.3: 1:1 Start Playback PCM
[ 4762.887812] usb 1-1.3: Stopping sync EP 0x81 (running 1)
[ 4762.887836] usb 1-1.3: Stopping data EP 0x1 (running 1)
[ 4762.887849] usb 1-1.3: 1:1 Stop Playback PCM
[ 4762.902542] usb 1-1.3: Closing EP 0x1 (count 1)
[ 4762.902549] usb 1-1.3: Setting usb interface 1:0 for EP 0x1
[ 4762.902915] usb 1-1.3: EP 0x1 closed
[ 4762.902928] usb 1-1.3: Closing EP 0x81 (count 1)
[ 4762.902935] usb 1-1.3: Setting usb interface 1:0 for EP 0x81
[ 4762.903179] usb 1-1.3: EP 0x81 closed

On Mon, Jan 18, 2021 at 1:59 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 18 Jan 2021 22:15:26 +0100,
> Mike Oliphant wrote:
> >
> > Progress - thanks for the patch!
> >
> > That got rid of the clock errors, and the the device now reports a 48000
> > sample rate, which is correct.
> >
> > Unfortunately, it still isn't working properly. Playback doesn't seem to
> work
> > at all. Capture kind of works - it does record, but the audio is
> extremely
> > noisy.
> >
> > Here is the current dmesg output when the device is connected.
> >
> > Notable is the error "No valid sample rate available for 1:1, assuming a
> > firmware bug".
> >
> > Also notable is "1:1 Set sample rate 48000, clock 40" - where "40" is
> the id
> > of the clock selector - "41" is the id of the actual clock source. So
> maybe
> > something is still getting wired up wrong?
>
> OK, how about the one below instead?
>
>
> Takashi
>
> --- a/sound/usb/clock.c
> +++ b/sound/usb/clock.c
> @@ -298,6 +298,12 @@ static int __uac_clock_find_source(struct
> snd_usb_audio *chip,
>         if (selector) {
>                 int ret, i, cur;
>
> +               if (selector->bNrInPins == 1) {
> +                       uac_clock_selector_set_val(chip,
> selector->bClockID, 1);
> +                       ret = 1;
> +                       goto find_source;
> +               }
> +
>                 /* the entity ID we are looking for is a selector.
>                  * find out what it currently selects */
>                 ret = uac_clock_selector_get_val(chip, selector->bClockID);
> @@ -314,6 +320,7 @@ static int __uac_clock_find_source(struct
> snd_usb_audio *chip,
>                         return -EINVAL;
>                 }
>
> +       find_source:
>                 cur = ret;
>                 ret = __uac_clock_find_source(chip, fmt,
>                                               selector->baCSourceID[ret -
> 1],
>
