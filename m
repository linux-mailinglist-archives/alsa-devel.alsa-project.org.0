Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF46F5068
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 08:53:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E9513C2;
	Wed,  3 May 2023 08:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E9513C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683096828;
	bh=dtQiaaW8W0LIhY5BpofaIONQd53vVMRbZm5B4Pbu0HI=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J08iqFqftSQZxEFH21AG9jFWT0r+gpz0SsowDp6YcQwkiaf+00v0wsyr7Osr4IcHm
	 +uiamDilKZgFHjGYq7fhMPKz2WX7BigFZ1oz2MQb2fhw1tAIEDIr5iYIaR9vqtMqoQ
	 WYQVJjedb1cHoUo0KrVebWY05Swv9ZnSu+M1nBMs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA4B5F8055C;
	Wed,  3 May 2023 08:51:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D1ECF8049E; Mon,  1 May 2023 15:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D53A6F80137
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 15:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D53A6F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JROj0wwb
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-42e507b5cd1so1974393137.1
        for <alsa-devel@alsa-project.org>;
 Mon, 01 May 2023 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682947006; x=1685539006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbXEvFB7fjq+XNje0q8/whu20PA7ZnvvxDaqHqn67jk=;
        b=JROj0wwb1l3eOFSLa9rEKJc5s0k0LWcKvx5jCTwdWQmGxxASbdMO8EbUOQWWt2WBl8
         EqIoTvZQ730nEV+oYwJBvDvsQ/3ZcgJmSEA2V1Eirv4U2xTaCfbVFccvA8qJ4ZEfrL/+
         5/D8J11SpapU+EGld5Pkl2JZFOWFLu/hWEqpNmzZa7LKbROky9PVnba0MnaFo/2i2mT4
         RQja4pQ6PqnFjukT02mmYAVAzrJv6pUCKjenHWNdQidQ2UA3FISEsRgYQW/N4X1/CObc
         IsfPCRrFQsRnDIHJ2oPIf7nu1Wslud1BFu3V67oI6+vTPtJcQedfZ9t/TZWfmkFN95V7
         RrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682947006; x=1685539006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbXEvFB7fjq+XNje0q8/whu20PA7ZnvvxDaqHqn67jk=;
        b=eJi0JEAWoxazzeqPTim/zjeSxGACqt6lb0Ai2PSAd9vgUq7zmTcgl66Pg8j/HNkiJ5
         nqSQU2emGOheh94gLDNT4VC1QrHgdPlRFi+FT0+znS+AbxPZRzsBc2VwgbGfR3o5zk/L
         rSaqCvlcydG6Fz0tM69cZGI4rJCQUx2EbrWqNHP8MzEvhdtGKmSlEqj1DzTLtlbG6Uoe
         0JGjwc2TLhxo6VSRlwNBixEAiSX7T09zMKxEjDwifGC6/EpMmrWv6zelnuZJo+OQeI/J
         u5/2yoGT6ngCc8H4O/kg0x+L/egGzXeuNnXbsZBl2s54wDYUgeUY07Sye9WGQBn/8pYZ
         pgxg==
X-Gm-Message-State: AC+VfDztMqc0bPhcbrXY2VNC2yXb+zkAKNmPlRm7lBq+ydSiZsMxoiXy
	/3A8EoFbD2vwyYXAtStK2kzFrjT1LhQuxv6C50A=
X-Google-Smtp-Source: 
 ACHHUZ6iFi8AEfQHzOY3l5qhxjS8jsu2YT5vX7WEuxTKuD680EpS7Vqj7vwUIXg9ZrkmEqwvMrVIWT9N2dzKYnjDEdg=
X-Received: by 2002:a67:ed49:0:b0:42c:9732:d17f with SMTP id
 m9-20020a67ed49000000b0042c9732d17fmr5847758vsp.1.1682947005662; Mon, 01 May
 2023 06:16:45 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
 <ZE9B4avbDtIXOu4O@debian.me> <87r0s0pnim.wl-tiwai@suse.de>
In-Reply-To: <87r0s0pnim.wl-tiwai@suse.de>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Mon, 1 May 2023 21:16:35 +0800
Message-ID: 
 <CAAJw_ZsDdiB=b2PZydQWF2fjSULit3NWE-Bf1icBEryN-GuqUw@mail.gmail.com>
Subject: Re: linux-6.4 alsa sound broken
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: jeff.chua.linux@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YH5JFZKDNR74MP7J4NIMS6DKUW5XGFPQ
X-Message-ID-Hash: YH5JFZKDNR74MP7J4NIMS6DKUW5XGFPQ
X-Mailman-Approved-At: Wed, 03 May 2023 06:51:20 +0000
CC: Bagas Sanjaya <bagasdotme@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Linux Regressions <regressions@lists.linux.dev>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YH5JFZKDNR74MP7J4NIMS6DKUW5XGFPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 1, 2023 at 2:35=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 01 May 2023 06:36:49 +0200,
> Bagas Sanjaya wrote:
> >
> > On Mon, May 01, 2023 at 11:59:12AM +0800, Jeff Chua wrote:
> > > Latest git pull from Linus's tree ... playing a simple sound file wil=
l
> > > resulted in a lot of echo.
> > >
> > > Running on Lenovo X1 with ..
> > > 00:1f.3 Audio device: Intel Corporation Alder Lake PCH-P High
> > > Definition Audio Controller (rev 01)
> > >
> > > I've bisected and reverted the following patch fixed the problem.
> > >
> > > commit 9f656705c5faa18afb26d922cfc64f9fd103c38d
> >
> > Thanks for the regression report. However, where is your dmesg and/or A=
LSA log
> > when the regression occurs? What is the playback test file?
>
> Yes, in addition, which driver is used (provide the alsa-info.sh
> output at best), and which sound backend is used (pipewire, PA or
> dmix) with which application?

/proc/asound# cat cards devices hwdep pcm timers version
 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0x603e1c8000 irq 147
  1:        : sequencer
  2: [ 0- 0]: digital audio playback
  3: [ 0- 0]: digital audio capture
  4: [ 0- 3]: digital audio playback
  5: [ 0- 7]: digital audio playback
  6: [ 0- 8]: digital audio playback
  7: [ 0- 9]: digital audio playback
  8: [ 0- 0]: hardware dependent
  9: [ 0- 2]: hardware dependent
 10: [ 0]   : control
 33:        : timer
00-00: HDA Codec 0
00-02: HDA Codec 2
00-00: ALC287 Analog : ALC287 Analog : playback 1 : capture 1
00-03: HDMI 0 : HDMI 0 : playback 1
00-07: HDMI 1 : HDMI 1 : playback 1
00-08: HDMI 2 : HDMI 2 : playback 1
00-09: HDMI 3 : HDMI 3 : playback 1
G0: system timer : 10000.000us (10000000 ticks)
G3: HR timer : 0.001us (1000000000 ticks)
P0-0-0: PCM playback 0-0-0 : SLAVE
P0-0-1: PCM capture 0-0-1 : SLAVE
P0-3-0: PCM playback 0-3-0 : SLAVE
P0-7-0: PCM playback 0-7-0 : SLAVE
P0-8-0: PCM playback 0-8-0 : SLAVE
P0-9-0: PCM playback 0-9-0 : SLAVE
Advanced Linux Sound Architecture Driver Version k6.3.0.


# test playing with ...
aplay /usr/share/sounds/alsa/Side_Right.wav
Playing WAVE '/usr/share/sounds/alsa/Side_Right.wav' : Signed 16 bit
Little Endian, Rate 48000 Hz, Mono

I'll try to capture the sound ... it's seems to just repeating every
second until the last second. So, if you just play a "beep", its ok.

>
> thanks,
>
> Takashi
