Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C048E4FC
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 08:45:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A94E1FA8;
	Fri, 14 Jan 2022 08:44:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A94E1FA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642146345;
	bh=PRqy/Cgd5C7uqxEBcisI54JBRgJgr3F4zoTJaR2jRss=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IykQPV5mrRso+a7rOPkng7TiyvFP62++A3fMVUSmNcmN0pkJHudR25LkvtFlHglL6
	 9h918K+CnVQhOlI2b/lwKh3vMqsVwHhhk23mXPaUdQL0+/F5+H9GhN8kaIEND1P0z3
	 z7BtBMXen87hxWTRFkaB4bPeH+DWGrTWVMAwaWM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98112F80310;
	Fri, 14 Jan 2022 08:44:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECD81F8030F; Fri, 14 Jan 2022 08:44:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62B39F80141
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 08:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62B39F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JrsQ90pI"
Received: by mail-oi1-x22c.google.com with SMTP id e81so11173413oia.6
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 23:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=M4C/cS2a+bexqKmQw9b2scQn5cEngwgJD+EPoubmmSQ=;
 b=JrsQ90pIatru88vLNZIwn7/mL5Syeom6p5pts3goG7zYHirAPR0c2zYj7WC6cYelU8
 zAL74N1YKn5kEbJAoL4NhbMfSYRaVP/t7sU/YQhKCNU73z5GVyiqQDPJ5MY6BtUVHI60
 mLHk8/P2ptxuPmEuJLjLFjeYdkwOewPFLyOHD46eTnHUu+KW8q7CMCTyu9jmZDyab+6j
 9PbIlon/dwO42OAVZ0WNmLicya3Y8iDGoGTl37dnQicYM+AfV1DbD213D/6YcG4pX89K
 Wi4LtJpXDyN5V4g6E8L/3AeSiqyrizJqFkkcAbC/AV78PXzgXuTGO8nUhaWLFFm1VJSP
 dz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=M4C/cS2a+bexqKmQw9b2scQn5cEngwgJD+EPoubmmSQ=;
 b=QC/9YxB2nrfxAdxMlZgmUNZfc9oNPM+ujgApkHJvNNBOzWQfv6zbGBQAcFM72/gkeu
 GVxdfrmxo106Il76QL0W9Rcvg5KV9s+WtNkAc7eGFrxndU3L6mM9c9ge1qunFwkfB20d
 gS1rwlsp6OaybqRfdoS6Km1YtD/VWOL8eOBoI/brm3pW771VuNR9vQbiZzEyq8kYPXJp
 Unou+6/KKrGufSNgaMs1KWdPw14iKfNYJsGyGZfDFockFoyMgBkrMzVLzx/i9/Biqzku
 4/fJt0qaGKheHy6XUqn1mlN5c8fTftNjNTmNFBZYfas+hAiTDcU5BJLIQTwH6fwhQxMs
 w1dw==
X-Gm-Message-State: AOAM530Dgu2YGX12m+vWPJDCd60IoQR4uW+y8ViHSOYcyOKEzubQPGNM
 DiURxxnV9ROwrJdPTHaNgFU=
X-Google-Smtp-Source: ABdhPJyvvfbsudUpijLflEdDcLLcEfnT7y41QxMPKh1j+OcjsOJak7z44/jRnTkaT7TgUoDZufICaQ==
X-Received: by 2002:a05:6808:179c:: with SMTP id
 bg28mr6535704oib.70.1642146263664; 
 Thu, 13 Jan 2022 23:44:23 -0800 (PST)
Received: from geday ([2804:7f2:8006:1a5e:d01e:4c95:c28f:f5b6])
 by smtp.gmail.com with ESMTPSA id w128sm1561402oie.20.2022.01.13.23.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 23:44:23 -0800 (PST)
Date: Fri, 14 Jan 2022 04:44:39 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Re: Behringer UMC202HD issues and a partial solution
Message-ID: <YeEp5xUjf1DAeGTY@geday>
References: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
 <YeB2zEnPlwVEKbTI@geday>
 <e1a7d67d-9862-3085-4e01-091ca443d2df@nandakumar.co.in>
 <YeDw89KZOh4yG7c8@geday>
 <e30962b0-931c-83b4-12fb-aa5e377b4f4d@nandakumar.co.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e30962b0-931c-83b4-12fb-aa5e377b4f4d@nandakumar.co.in>
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

On Fri, Jan 14, 2022 at 10:06:01AM +0530, Nandakumar Edamana wrote:
> Hi Geraldo,

Hi Nandakumar,

> > Have you tried unloading the snd-usb-audio module and the reloading it
> > with implicit_fb=1 as in "modprobe -r snd-usb-audio" and "modprobe
> > snd-usb-audio implicit_fb=1" ?
> >
> > If not, try it. If it works and your playback issues are gone then
> > your device may just need a quirk. If it doesn't work we still
> > have dyndbg to go through.
> It works! Had to switch the devices and options back and forth in 
> pavucontrol
> (sometimes needed even for the choppy playback), but it works.
> 

OK, I'm glad it works at least :)

> So why did my quirks didn't work? Maybe I gave the wrong numbers? Or the 
> code
> was unreachable (I didn't put printk()s, sorry). I guessed the combos from
> `lsusb -v` output, and even tried the combos that didn't make any sense
> (because I didn't know what I was doing).
> 

That's what we have to find out...

> Here's what I tried, one after another (added to 
> playback_implicit_fb_quirks in
> /sound/usb/implicit.c):

I'm glad you warned me preemptively that the following quirks don't
work, so I don't waste my time writing non-working patches and you don't
waste your time testing non-working patches. Thank you.

> 
> IMPLICIT_FB_GENERIC_DEV(0x1397, 0x0507),

This should have been enough for ALSA to pick-up the implicit feedback
mode. Weird...

> 
> /* Didn't work */
> IMPLICIT_FB_FIXED_DEV(0x1397, 0x0507, 0x84, 1),
> 
> /* Interface 2 is actually Capture as per `cat /proc/asound/card1/stream0`,
>   * but "Implicit feedback Data" is found under that
>   * (Interface 1 has explicit Feedback), and a Scarlett quirk seemed to use
>   * a capture interface in playback_implicit_fb_quirks
>   * (I know that it's a capture interface from `lsusb` output posted by 
> someone
>   * online)
>   */
> /* Didn't work */
> IMPLICIT_FB_FIXED_DEV(0x1397, 0x0507, 0x88, 2),
> 
> /* Didn't work */
> /* What am I doing with 0x08 ? */
> IMPLICIT_FB_FIXED_DEV(0x1397, 0x0507, 0x08, 1),
> 
> /* Didn't work */
> /* Why BOTH? But what's FIXED at first? Didn't find any doc. */

BOTH is a quirk for some BOSS devices and at least one Pioneer device,
don't worry I'm pretty sure your device doesn't need it.

FIXED just means we specify the implicit fb sync ep hardcoded, which
is obviously a bit bad but it's there because generic matching
doesn't always work.

> IMPLICIT_FB_BOTH_DEV(0x1397, 0x0507, 0x84, 1),
> 
> /* Didn't work */
> IMPLICIT_FB_SKIP_DEV(0x1397, 0x0507),
> > Last but not least, please use a vanilla kernel for these tests.
> I built it using the source from kernel.org, not apt. But I've used 
> oldconfig,
> and I think patches are being applied while installing the kernel 
> (currently I'm
> using my daily driver installation for this). If it has to be more pure, 
> I 'll
> try. BTW, do you have any distro to recommend that has a near-vanilla 
> kernel for
> experiments like this?

My guess is your workflow for kernels will do for testing a possible
patch in the near-future. I can't recommend any distribution over any
other one, and pretty much all of them patch the kernel heavily.

> 
> Another question: assuming a quirk gets added for this device, is there any
> chance that the quirk would break the experience for those who are already
> using the device (possibly a different revision, but the same ID [1]) 
> without
> any issues?

Yeah, let's make sure it doesn't cause a regression for the other users.

Could you please provide the dyndbg of both working and non-working
cases (without implicit_fb=1)? The documentation for doing so is here
https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html

Please set snd-usb-audio.dyndbg=+p either at boot time or via debugfs
before connecting your USB device, then plug it in.

Thank you,
Geraldo Nascimento

> 
> [1] https://h-node.org/soundcards/view/en/2228/Behringer-UMC202HD
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
