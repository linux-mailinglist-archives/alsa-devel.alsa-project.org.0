Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3DB48DDF5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 20:01:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DD83208F;
	Thu, 13 Jan 2022 20:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DD83208F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642100493;
	bh=9lFN5NmWtJLTkbSJUQWn+YCo6BV77fMjZBZLaztrA6Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fUcGWGWGEFr9ZgzncI8zzcVKvkf+0UDOafAOJtVKLckB61t0fBrcFQHW/zEs8crkR
	 HxAXr+FfMcZSkIvFWlpoZSi2Y3pwPEFhG6I2PhTwuPV4ZNaKfUn3CKpPFKhF34WV1F
	 NnN4APBVzcvp6XhE9n8OjYe6NejLTgnkw3QX8gQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA8CF80141;
	Thu, 13 Jan 2022 20:00:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A11F80054; Thu, 13 Jan 2022 20:00:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAF8CF80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 20:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAF8CF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EbDF5PAu"
Received: by mail-ot1-x333.google.com with SMTP id
 s8-20020a0568301e0800b00590a1c8cc08so7368617otr.9
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 11:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6KTv+BNcxq5vSd0al31YnmvbO83eGSvLZ5muf/jBs60=;
 b=EbDF5PAusptVhAnl2J96pzkOdm/+HOy4u1yUpwGMuxEF6+ItS7A0iZiOxcMo4wcn+0
 H+0wjEK66Kmy4GjDzdn2nwmT7uPA+Tj5Av4yNrT5mf9u5o+JVq4fcvmsnDBZMiyhCDGs
 sYa1QkINz97eJc9aY40ndiGca5u8ufSWED5d8s31GWKmUotxzfRG36c6lfUDVWBDHhZn
 JpYPzW8WTs2UJ1oXMXSFW5JyWLzn3BEAaiFmug5C14Mm6C7hQnRgPhEzMHoeGDARXCyu
 Ri1UViEaUvwCHdm9pfXNK7L4bNyWdZj5Q5JyqDzF130yFRQxw1bzQ7Ypr8b+EuIdKwZn
 8iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6KTv+BNcxq5vSd0al31YnmvbO83eGSvLZ5muf/jBs60=;
 b=5QwsV1AQZxCNAi8tnYx8twzQN8hmzk/ltmwX7XwkQqepCspAwtvgSi9Sl1YL82atrM
 qq0rrqEGvpwQ0NFruVs2FRNf1czLYzY2LwQPt+7XL6awAS6kOUJGystAHPp9o1zPEXre
 Nhq8gRvOblspBE8fgrYz6Z0DfD79TiTfq6Kb9KoTywki3wr0f8IrfcCjQLfn9ZJNEqsY
 C+n3Fr8nPEfWw9GBNCDMlyye3Q49AcD0xE3kLMGMJmQMYKBDB1CIlFqsFzrE9U1Ejh7F
 BBsKI9NMa4E695WREXZ/ZyJNiSIVFh2TnMcjzfJuRrzdBNSxiRIcsUAOFdqjaMIF5wJa
 xQtw==
X-Gm-Message-State: AOAM531H+R8bwr9zdS7n1v/+xgj5dpHJ2ZPuATejYRzUFecs2kW1FSdR
 7a1LftIY2fjedX6JroBGDD0=
X-Google-Smtp-Source: ABdhPJxC7d/iAAyRyXhC2QKIxNJ2f3mPIC1I2JIISJniHL7OpVqH26EFzb1e95WaJVuHiP1yNj8AfQ==
X-Received: by 2002:a05:6830:4115:: with SMTP id
 w21mr4144423ott.256.1642100414197; 
 Thu, 13 Jan 2022 11:00:14 -0800 (PST)
Received: from geday ([2804:7f2:8002:f237:d475:1acd:9c67:d4cd])
 by smtp.gmail.com with ESMTPSA id ay40sm838199oib.1.2022.01.13.11.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:00:13 -0800 (PST)
Date: Thu, 13 Jan 2022 16:00:28 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Re: Behringer UMC202HD issues and a partial solution
Message-ID: <YeB2zEnPlwVEKbTI@geday>
References: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
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

On Thu, Jan 13, 2022 at 08:07:49PM +0530, Nandakumar Edamana wrote:
> Trying to make my Behringer UMC202HD audio interface work with GNU/Linux.
> While doing so, I managed to make a warning disappear by editing a file in
> the kernel source. The main issue I'm having with the interface isn't 
> gone, and
> I am not sure whether to bother you people with that now. However I'd 
> like to
> read your comments on the edit I made regarding the warning.
> 
> Details:
> 
> - Product: 1397:0507 BEHRINGER International GmbH UMC202HD 192k
> - dmesg warning: clock source 41 is not valid, cannot use
> - kernel: linux-5.15.13
> - Edit that made the warning disappear:
> 
> $ diff -u sound/usb/clock.c.orig sound/usb/clock.c
> --- sound/usb/clock.c.orig    2022-01-13 08:14:49.555281286 +0530
> +++ sound/usb/clock.c    2022-01-13 08:18:38.004618792 +0530
> @@ -180,7 +180,11 @@
>        * Sample rate changes takes more than 2 seconds for this device. 
> Clock
>        * validity request returns false during that period.
>        */
> -    if (chip->usb_id == USB_ID(0x07fd, 0x0004)) {
> +    if (chip->usb_id == USB_ID(0x07fd, 0x0004) ||
> +        /* Trying the same for BEHRINGER International GmbH UMC202HD 
> 192k */
> +        chip->usb_id == USB_ID(0x1397, 0x0507)
> +        )
> +    {
>           count = 0;
> 
>           while ((!ret) && (count < 50)) {
> 
> 
> 
> Yes, I was just adding the ID of UMC202HD to an existing workaround. I'm not
> sure if the device's clock should actually be accepted (but I think so 
> because
> the retry works, right?), or if two seconds is the right delay for UMC202HD.
> 
> The real issue I'm having with this device is related to the periodic
> stuttering/pops while playback (recording is okay).

Hi Nandakumar,

You made the dmesg warning go away, but that didn't necessarily solve
the underlying issue. May I ask that you post the "lsusb -v -d
1397:0507" ?

I may ask you to activate dyndbg for the snd-usb-audio module next.

> I remember having read that
> UMC20x is well-supported in Linux. Maybe now they're using a different
> firmware version or something?

Seems to be a different revision indeed, but don't worry, most of the
time these bugs are fixable.

> If you are interested, here is a list of 
> things
> I've already tried:
> 
> - Different ports, including USB 2.0, and disabling xHCI using `setpci`
> - Disconnecting other USB devices
> - Disabling wireless
> - Making sure speech-dispatcher isn't running
> - Old and new GNU/Linux distros on different computers
> - Switching sound servers (PulseAudio and JACK) and direct ALSA
> - Different sampling rates, buffer sizes, etc.
> - Lower volume levels
> - Making sure there are no xruns
> - tsched=0 and 1 for module-udev-detect (pulse)
> - realtime-scheduling, high-priority, and nice-level (pulse)
> - Choosing Performance mode for CPU Governer and disabling Intel Boost
>    (as recommended by Ubuntu Studio dashboard)
> - lowlatency kernel
> - A recent kernel (v5.15.13) built from source with oldconfig
> - Clock source workaround in sound/usb/clock.c
> - Quirk entries in sound/usb/implicit.c (I won't claim I did it right)
> 
> Again, I'd like to hear your comments on the clock detection workaround 
> first,
> since that's the only thing I seem to have solved with all these hours spent
> (except for learning a lot, of course). But if you have time, please 
> consider
> the second (main) issue also. Maybe I'm posting this in the wrong place; 
> if so,
> please let me know where to repost it (official forum or a kernel 
> mailing list).

alsa-devel is the place where finished contributions land, but it's also
a place to ask for lower-level help in ALSA development. Don't worry,
you are in the right place.

> 
> Thank you,
> 
> -- 
> Nandakumar Edamana
> https://nandakumar.org
> 
> GPG Key: https://nandakumar.org/contact/gpgkey.asc
> GPG Key Fingerprint: BA6B 8FDE 644F F861 B638  3E2F 45D6 05FC 646A F75D
> 
