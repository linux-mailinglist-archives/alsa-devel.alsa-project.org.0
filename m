Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C937F86AED0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 13:09:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 039BD850;
	Wed, 28 Feb 2024 13:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 039BD850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709122196;
	bh=l3pBDLWFyzAGu++96uwl60SwdR/cU/GBhoiJF6uTvIM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hKynByDherzU1DsouiMBXSMG4SrFo3IGrZnJVPiHgE2LOHpRPAtVIbJtnbtt1gCNL
	 aZvf6Vt2ZsMz8gRbUnDVcQtvLtfWp7POL6Hrh3V9ISmcg1DGGQkJJ9roSI/sc8tGN0
	 Jz+CrVLETLjDHIJRJgvrbC0I1HcNSLF+5m6uGCJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB16AF805AC; Wed, 28 Feb 2024 13:09:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D73BF80579;
	Wed, 28 Feb 2024 13:09:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 375A4F801C0; Wed, 28 Feb 2024 13:09:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23486F80104
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 13:08:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23486F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MlG4f1yI
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-565ef8af2f5so4093782a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Feb 2024 04:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709122137; x=1709726937;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbLjqooAWtlU81gEkX3wLxyqeLVc3vVkMCLnNy88V2s=;
        b=MlG4f1yITJd1E3aJD7ClcQbPCwd7VEj+qIjC15syG8iHIpbxDcmADlJbCvjgnjDuKk
         WHTekp+FE3/w0T1DOu26nZJtNmiTev41MP2iRkF8P0tPfaWG2WGMWCAdEsGI11zMy8b6
         DxVR5vpMeV6GhmkdT67T5gdoJF1OATYIwNkO4axaqo0OYu7a9I07dqvWN/0nItOI3ws4
         r6l2J6wbj7sRqt6QhxURZHI3bsEwJWR6FE2CxNDVIw3DZH7QkIn07ncasncNzJKEppn2
         +f0qhHIgVJqt2JfAD9bZarY3QfS5ZP6vgX7YxSh7B8jg69sgWPnW3SVCjr4NG5EVtv+f
         uhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709122137; x=1709726937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbLjqooAWtlU81gEkX3wLxyqeLVc3vVkMCLnNy88V2s=;
        b=ePzOEMae4TyhCYoauiCRmcTYhSpZJPErioZBlqPq7R0yW+rKBM7d6TObC50Ml+Qw9M
         xo6F+fAQx76ZCe98ZCbD5RPIhY6VXTU9BeKMF6ipo/aFviAr20nH3R7I2mFoeXWBweWy
         clHgoXXrokgEllhyO5pditbiZGyqf+7gPnauR46JiBDIi0eXKEY48w2Pqsh0yV+ZJj2I
         ZTMykY/LOZF5nOXer0IHh9H4U0NkrOkIsj0KALzyGgS2OtlCYMIH7D9odPPfb+Zm4tRl
         UHlfFzmV/hS+uTYBOtK8AGfj3slohDI3qvsV9Xc2Ju0k+m1m1WV+Fku9fyXYLDMEE52A
         dumw==
X-Gm-Message-State: AOJu0YzceA9xzDw1BEjVEO99JDotRqyED9RJSzzn9yRouGwDtSxManRm
	fPEVGBmLiidoqxpd23nfxcubHuBh9tfEb4QeBSxkGKkus1zg1ME4pruP8VSH9nY39fLaGJbTTRw
	Ww1er7ujEkjrXSCsM006WAQPtZw==
X-Google-Smtp-Source: 
 AGHT+IGTL4B8Xh5At+t7yaXpHhaTkbTS7mhCIPDldzlvdSqN0I9MeW+rkdZBZF0L+WgdvXIhY7bopMFPwtfg9/ZaBvg=
X-Received: by 2002:a17:906:4809:b0:a3f:1b49:c92b with SMTP id
 w9-20020a170906480900b00a3f1b49c92bmr8524041ejq.48.1709122137300; Wed, 28 Feb
 2024 04:08:57 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
 <d7ae7dadbefb6dcd26e4ab17e25d76c506d479a9.camel@tsoy.me>
In-Reply-To: <d7ae7dadbefb6dcd26e4ab17e25d76c506d479a9.camel@tsoy.me>
From: Ian Malone <ibmalone@gmail.com>
Date: Wed, 28 Feb 2024 12:08:45 +0000
Message-ID: 
 <CAL3-7MrdbdL81irT20kVNbpwGh8-xbFNaCaNyHkPK2tuViUKXw@mail.gmail.com>
Subject: Re: synaptics hi-res audio usb device duplex, usb bandwidth issues
To: alexander@tsoy.me
Cc: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PC2MMAQMSBKE2PP4DKL6QQCKYZNGIFPF
X-Message-ID-Hash: PC2MMAQMSBKE2PP4DKL6QQCKYZNGIFPF
X-MailFrom: ibmalone@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PC2MMAQMSBKE2PP4DKL6QQCKYZNGIFPF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 27 Feb 2024 at 20:45, Alexander Tsoy <alexander@tsoy.me> wrote:
>
> =D0=92 =D0=9F=D0=BD, 26/02/2024 =D0=B2 13:05 +0000, Ian Malone =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> > Hi,
> >
> > In short I have a USB to 3.5mm adapter which seems not to work in
> > duplex mode on USB2.0 systems, possibly due to a bandwidth
> > calculation
> > bug.
> >
> > This is an evolution of an issue I previously posted on the users
> > list
> > with no luck. I have an Anker USB-C to 3.5mm audio dongle (lsusb:
> > Conexant Systems (Rockwell), Inc. Hi-Res Audio) which I've used for
> > some time on my phone (Android with USB-3.2). On trying to use it
> > with
> > an older T420 laptop recently with only USB-2.0 ports I discovered it
> > will not work in duplex mode. Input-only and output-only profiles
> > work
> > (tested recording and playback with audacity), but with duplex no
> > sound is recorded (Fedora 39, pipewire). This is easily reproduced by
> > looking at the pavucontrol volume monitor for Output Devices, if I
> > switch the device to Analog or Digital Input in configuration then
> > the
> > Input Devices level monitor for it shows activity if I speak into or
> > tap the microphone. With duplex selected there is no activity, the
> > level monitor bar may or may not display. I can switch between the
> > two
> > behaviours by changing the profile. Various applications such as
> > Audacity and Zoom appear to hang when accessing this microphone with
> > the duplex profile set. I've used pipewire configuration to force the
> > format to 16LE only (playback and recording), but this has not
> > helped.
> >
> > In dmesg this error appears when this happens (microphone opened, for
> > example by pavucontrol):
> > [  294.825544] usb 1-1.1: cannot submit urb 0, error -28: not enough
> > bandwidth
> > (T420, Fedora 39, kernel 6.7.5)
>
> Sorry, I somehow misread the first part of an email and was under
> impression that the problem is only with xhci host controller. Here I
> can only add that I have a system with the same "6 Series/C200 Series"
> chipset where I cannot reproduce this issue. But my full-speed card has
> a lower wMaxPacketSize.
>

Yes, a brief summary would on EHCI this device doesn't work in duplex
while XHCI works but moans a bit in the log, the same EHCI hardware
works in duplex on Win7.

I've got another adaptor (KTMicro/KT USB Audio, vendor "Huawei
Technologies Co., Ltd") which on the Legion 5 Pro USB 3.0 side ports
doesn't cause the same complaining that the Synaptics/Hi-Res
Audio/Conexant Systems (Rockwell) device (not had a chance to test it
on the T420 yet as it sits in the office). The KTMicro device has
similar playback, but mono input with only 16LE format, wMaxPacketSize
0x0060  1x 96 bytes, while the Synaptics has 24 bit stereo, and
wMaxPacketSize sizes 0x00c0  1x 192 bytes and 0x0120  1x 288 bytes in
the input descriptors (and a 0x0300  1x 768 bytes output descriptor).

Best filed as a bug in the driver? (The Tab A/SM-T510 may be a blind
alley, although it is supposed to be USB2.0 I've been able to dump the
logs and its using an XHCI controller.)

--=20
imalone
