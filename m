Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D57E8857C7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Mar 2024 12:06:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 677F7233B;
	Thu, 21 Mar 2024 12:06:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 677F7233B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711019188;
	bh=QlfvN9NQ9R/No2HiqMa2X7K4ocVJ0bPq+jK/6/msJzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iDh4JeTbI+qkzX4czbfqBlyjc7xLo30R6B6ulQk7mFlt756aeHUTIqE2io+f0VTDz
	 3LNC5MUSCPJ82AD3/kkwLUft1QUyC5HsK7aj2hMYYi2t+CUEUDPeIsO8t7M3DSfGNL
	 iIInU81Q96EQELiyJb+QVkEnLZiDBnWXqZc/6Bcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D667AF805A9; Thu, 21 Mar 2024 12:05:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BC4EF8057A;
	Thu, 21 Mar 2024 12:05:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9650EF804E7; Thu, 21 Mar 2024 12:03:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCD99F8025F
	for <alsa-devel@alsa-project.org>; Thu, 21 Mar 2024 12:02:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD99F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gYfuTglQ
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so116020166b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Mar 2024 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711018975; x=1711623775;
 darn=alsa-project.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDNyX0AiKPrC8AviS7IVldISvtonHe9G+xO3FdYtcVc=;
        b=gYfuTglQSEa1zw+rYTd5C7k8zgmwBOgL1f6G/KFdorthZbo7x3m/VZpMg3AYW19/vW
         ZHdyCqTp6Z8Yp5AN/ceqxSvStncc3+XVK1cPcJoF66Zo1IDOg/rc7wlBRYOBbbiQcbEq
         fDjpsnMsU+AXPvNTLe5RlScHJQ13JXRnq7PxoXyQOJqN3EI0ovHJURWB77ipOhx2WTGs
         4hgtlJDNr1Tc8znWbXVc2XBB9NjSDxnfJaZTzqM781UfJ6vP4oKC/wXloxF3C9lhzQCJ
         rD4K/dJhKdSi+IdNaeYQUGgnJgbhuXvSjeNYIRbY78dVoKb9IxOA6iXOf1IirihJrujp
         an0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711018975; x=1711623775;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDNyX0AiKPrC8AviS7IVldISvtonHe9G+xO3FdYtcVc=;
        b=X7lZZ43oDEKGVPeQ8Vst134Z3pFPqcDNbENoBxWWcR4qi3HVn/WjZ2zzesmjWc6fMS
         Z7oLRQbWXorXgQtLYvDhRSJKexw2J9oSlw/Wb1XcABV710n476S4HfUuiAwdbhCK1y4+
         BEjUQ+Lp0kWuT5539H356JYDFKBtqjwi952VeNM8cRWoq1120cdJiImvHxyCwrnmNQZM
         Zh2aql07wJiaR9B8vrD8pXS5vXI0qIa3iPJk1fSf3V6/3tqjA6vMyeCTxZxhzyObUiO9
         1AUIlyWiBq7Of3hVzuXM62mMEzjB86BhyBxnBlOLmwC3K/6BjD6j33UMnNlVbuu75RJN
         EHdA==
X-Gm-Message-State: AOJu0YyMPVmT/FYB6/vVoLfcRkkm4nPGQEpmj5M7UxtK/bDgbyeQPyPy
	Rt2VlPI9xCPHN/tZDK1hcMSZIqEnhJ6qY2qNMbrnbYkGu2GR2iyEMKjRfrw/RXm7tUqHCDYxLIq
	N/u+8wE5TcAq1TGLZu6N77QoWcEYFcmzYwA==
X-Google-Smtp-Source: 
 AGHT+IH//Jwf5CUmKqrC7k+Qyd4d4VR5qK0UT1BjkZczQjrGB+mQeYPY6MEwnwpZhTCKNf/F5hbWKnl+fOvfY18ye1o=
X-Received: by 2002:a17:907:7e83:b0:a46:aa7d:3e8b with SMTP id
 qb3-20020a1709077e8300b00a46aa7d3e8bmr12095945ejc.69.1711018974673; Thu, 21
 Mar 2024 04:02:54 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
 <d7ae7dadbefb6dcd26e4ab17e25d76c506d479a9.camel@tsoy.me>
 <CAL3-7MrdbdL81irT20kVNbpwGh8-xbFNaCaNyHkPK2tuViUKXw@mail.gmail.com>
In-Reply-To: 
 <CAL3-7MrdbdL81irT20kVNbpwGh8-xbFNaCaNyHkPK2tuViUKXw@mail.gmail.com>
From: Ian Malone <ibmalone@gmail.com>
Date: Thu, 21 Mar 2024 11:02:43 +0000
Message-ID: 
 <CAL3-7MrJOHdzozP+MVE9hPmC3zWFhT93d2vJbb5AhOCJQKW9Lg@mail.gmail.com>
Subject: correct way to add a device quirk Re: synaptics hi-res audio usb
 device duplex, usb bandwidth issues
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RFHX4U4SNIFQTFPOAR772QC6T2HEF644
X-Message-ID-Hash: RFHX4U4SNIFQTFPOAR772QC6T2HEF644
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RFHX4U4SNIFQTFPOAR772QC6T2HEF644/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 28 Feb 2024 at 12:08, Ian Malone <ibmalone@gmail.com> wrote:
>
> On Tue, 27 Feb 2024 at 20:45, Alexander Tsoy <alexander@tsoy.me> wrote:
> >
> > =D0=92 =D0=9F=D0=BD, 26/02/2024 =D0=B2 13:05 +0000, Ian Malone =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > > Hi,
> > >
> > > In short I have a USB to 3.5mm adapter which seems not to work in
> > > duplex mode on USB2.0 systems, possibly due to a bandwidth
> > > calculation
> > > bug.
> > >
> > > This is an evolution of an issue I previously posted on the users
> > > list
> > > with no luck. I have an Anker USB-C to 3.5mm audio dongle (lsusb:
> > > Conexant Systems (Rockwell), Inc. Hi-Res Audio) which I've used for
> > > some time on my phone (Android with USB-3.2). On trying to use it
> > > with
> > > an older T420 laptop recently with only USB-2.0 ports I discovered it
> > > will not work in duplex mode. Input-only and output-only profiles
> > > work
> > > (tested recording and playback with audacity), but with duplex no
> > > sound is recorded (Fedora 39, pipewire).

> > >
> > > In dmesg this error appears when this happens (microphone opened, for
> > > example by pavucontrol):
> > > [  294.825544] usb 1-1.1: cannot submit urb 0, error -28: not enough
> > > bandwidth
> > > (T420, Fedora 39, kernel 6.7.5)
> >
> > Sorry, I somehow misread the first part of an email and was under
> > impression that the problem is only with xhci host controller. Here I
> > can only add that I have a system with the same "6 Series/C200 Series"
> > chipset where I cannot reproduce this issue. But my full-speed card has
> > a lower wMaxPacketSize.
> >
>
> Yes, a brief summary would on EHCI this device doesn't work in duplex
> while XHCI works but moans a bit in the log, the same EHCI hardware
> works in duplex on Win7.
>

After a brief foray into EHCI (some of the issues are EHCI scheduling
limits for full speed devices, the 24 bit duplex comes right up
against FS limits). I've found two things:
1. Adding a wireplumber rule to force 16 bit for the microphone/input
endpoint reduces the bandwidth requirement enough that it will work in
duplex. (Changing profile to and from duplex in pavucontrol appears to
change it back to 24 bit and then fail, needing a wireplumber restart
to fix it).

2. The 16 bit alt mode for the output endpoint seems to be
misconfigured in the firmware, it reports 768byte max packet size
which should be 384bytes (2 channels * 2 bytes * 96kHz * 1ms). I can
hack the sound/usb driver to overwrite this packet size in the output
driver (and then it works correctly), but I can't figure out how to
correctly write a quirk to reconfigure that alt mode. My attempt is an
attachment on
https://bugzilla.kernel.org/show_bug.cgi?id=3D218603, but I haven't
managed to define a QUIRK_AUDIO_FIXED_ENDPOINT that actually works (it
takes data, but no sound plays) and the other interfaces need to be
explicily specified QUIRK_AUDIO_STANDARD_INTERFACE,
QUIRK_AUDIO_STANDARD_MIXER or the USB probe fails (at least they work
if this is done). What is the correct way to do it? (Not sure the
driver has the machinery to apply an overridden max packet size in
this way either, seems it needs to update the value in the usb
structure, but knowing how to get a working endpoint quirk working
would be a start.)

--=20
imalone
