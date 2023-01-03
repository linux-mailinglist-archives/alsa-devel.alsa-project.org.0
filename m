Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABB465C189
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 15:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0155E033;
	Tue,  3 Jan 2023 15:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0155E033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672755051;
	bh=Qz06XMtouRfH/wPLlrYvuba17i0EUg6Hu7qEZnHozB4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o1mft22Zmfz5Fu6Q14431pk4CC/Qu2Wy2OHnbUMjLw9P7E7mXssfuu0TSSfCRB/HG
	 cx1D8efFmNpAnYL9osfkrMH/zYBQIRyJVqEUlI1FolX1j3yI46ov/BFujxRn7VqrTr
	 DjUVEQgAPnBuNq74m4XjVJO7Y1WJYzMzBkcMyMqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84870F8053D;
	Tue,  3 Jan 2023 15:09:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6ACCF803DC; Tue,  3 Jan 2023 13:06:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60D9CF800F8
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 13:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60D9CF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ALaG+727
Received: by mail-ot1-x330.google.com with SMTP id
 i26-20020a9d68da000000b00672301a1664so18959979oto.6
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 04:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H6/SWKzs6qkLWgBAth0AeQA8Jjlx9Y6B705KxzHA+/g=;
 b=ALaG+7271lfMDz8v6BYDPhRm7E8aRkT2wLeMbd5E3guAwwM87KALs1lN7I9Z07gdTA
 5OlvR+eX92dYo7X8CNb4gq1FfktXJzg9iFnWhdb2t1UXtAXGGmn8ug4RcmRKz4m15PXG
 yZ9vwgu/bBkCOVrF6FIrCzhZGNRtJ/oU+Gwirjb7xV8oliv/L8TTv+QHwzRnG49WtUPg
 uWaGHaO/AkVULFrJpSaOOCo7zYO1kXUx6pP7bTwFN1Cw+sdGjWBPbb+EBldG4KeQngeD
 LRQASwCkW8c6lxBw8a67RIicQ4/LlYErrV17D6a0kHC0hDMNtUsEs8A7vfOy6Dlwz9pn
 iWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H6/SWKzs6qkLWgBAth0AeQA8Jjlx9Y6B705KxzHA+/g=;
 b=hVX70sYNqxRYWlZlt1//tHcpu+xMdxXRtbLUM8lGUdrFfaaZGVI1ZOVth7nEakZ8nR
 IFfpngbg0aYLnCZptfTkJ0H62bYMdRs99qPiJv+637IOLAxkLHgDIswsyWbAMDyBkfPT
 +Ff12piu3pWZJLzEf+xv+4VhCxQxZz1FY94y1uqQm688vJUSCFPH2GcR7dyyKTj59EZA
 kaF1tsErMo65YAgb9+kIipTrv/1+Y7gKTOQu6CjWiPraU5bW7hUxaOpPSW94Jts0YaDM
 8G3AWVKvKAthgcW6DWbRJUiDku92ttV7MgujSKAzmofeXz2oqCD1pKGfSlDJvcoGDNeL
 0kiA==
X-Gm-Message-State: AFqh2komzJZ29CEwKaGoVgQouxQu02V/8DdUu/Zc8S9Nw6A2Fy1Aaxv7
 xcZMtnu5bI1ZLcYuuwEYQbwJziewMbihY2SbANw=
X-Google-Smtp-Source: AMrXdXuzZ4CccyY3Qm0LGhtXRSxwpNVs+0GaryhqargDF68Tfh7jqQH3CSxItUlAfJI3h+L8jDvm5hALQ3IXcUKK7hk=
X-Received: by 2002:a05:6830:1443:b0:66d:8e24:8038 with SMTP id
 w3-20020a056830144300b0066d8e248038mr2174009otp.9.1672747570666; Tue, 03 Jan
 2023 04:06:10 -0800 (PST)
MIME-Version: 1.0
References: <bebd692d-7d21-6648-6b7a-c91063bb51c2@leemhuis.info>
 <Y7K1WDmPYi3EMOn1@eldamar.lan> <87wn65umye.wl-tiwai@suse.de>
In-Reply-To: <87wn65umye.wl-tiwai@suse.de>
From: =?UTF-8?B?UMOBTEZGWSBEw6FuaWVs?= <dpalffy@gmail.com>
Date: Tue, 3 Jan 2023 13:05:59 +0100
Message-ID: <CALp6mkJhM1zDcNr9X_7WL09+uqcaAhNFFMhrjme0r7584O+Lgw@mail.gmail.com>
Subject: Re: [regression, 5.10.y] Bug 216861 - sound disappearance on Acer
 Swift 3 SF314-59-78UR after update to 5.10.157
To: Takashi Iwai <tiwai@suse.de>
X-Mailman-Approved-At: Tue, 03 Jan 2023 15:09:08 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>, Sergey <zagagyka@basealt.ru>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Another report: https://bugs.archlinux.org/task/76795
Apparently, folks at alsa-devel traced down the dependencies of that patch,
see the mail thread at
https://lore.kernel.org/all/dc65501c-c2fd-5608-c3d9-7cea184c3989%40opensour=
ce.cirrus.com/

On Mon, Jan 2, 2023 at 1:42 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 02 Jan 2023 11:43:36 +0100,
> Salvatore Bonaccorso wrote:
> >
> > Hi,
> >
> > [Adding as well Richard Fitzgerald and P=C3=81LFFY D=C3=A1niel to recip=
ients]
> >
> > On Fri, Dec 30, 2022 at 09:08:57AM +0100, Thorsten Leemhuis wrote:
> > > Hi, this is your Linux kernel regression tracker speaking.
> > >
> > > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> > > kernel developer don't keep an eye on it, I decided to forward it by
> > > mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=3D2168=
61
> :
> > >
> > > >  Sergey 2022-12-29 10:07:51 UTC
> > > >
> > > > Created attachment 303497 [details]
> > > > pulseaudio.log
> > > >
> > > > Sudden sound disappearance was reported for some laptops, e.g.
> > > >
> > > > Acer Swift 3 SF314-59-78UR 11th Gen Intel(R) Core(TM) i7-1165G7 @
> 2.80GHz
> > > >
> > > > # lspci
> > > > 0000:00:1f.3 Multimedia audio controller: Intel Corporation Tiger
> Lake-LP Smart Sound Technology Audio Controller (rev 20)
> > > >         Subsystem: Acer Incorporated [ALI] Device 148c
> > > >         Flags: bus master, fast devsel, latency 32, IRQ 197, IOMMU
> group 12
> > > >         Memory at 601f270000 (64-bit, non-prefetchable) [size=3D16K=
]
> > > >         Memory at 601f000000 (64-bit, non-prefetchable) [size=3D1M]
> > > >         Capabilities: [50] Power Management version 3
> > > >         Capabilities: [80] Vendor Specific Information: Len=3D14 <?=
>
> > > >         Capabilities: [60] MSI: Enable+ Count=3D1/1 Maskable- 64bit=
+
> > > >         Kernel driver in use: sof-audio-pci
> > > >
> > > > I am attaching the pulseaudio and dmesg logs
> > > >
> > > > This bug started reproducing after updating the kernel from 5.10.15=
6
> to 5.10.157
> > > >
> > > > Bisection revealed the commit being reverted:
> > > >
> > > > c34db0d6b88b1da95e7ab3353e674f4f574cccee is the first bad commit
> > > > commit c34db0d6b88b1da95e7ab3353e674f4f574cccee
> > > > Author: Richard Fitzgerald <rf@opensource.cirrus.com>
> > > > Date:   Fri Nov 4 13:22:13 2022 +0000
> > > >
> > > >     ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()
> > > >
> > > >     [ Upstream commit 39bd801d6908900e9ab0cdc2655150f95ddd4f1a ]
> > > >
> > > >     The DAI tx_mask and rx_mask are set by snd_soc_dai_set_tdm_slot=
()
> > > >     and used by later code that depends on the TDM settings. So
> > > >     __soc_pcm_open() should not be obliterating those mask values.
> > > >
> > > > [...]
> > > > Original bug report: https://bugzilla.altlinux.org/44690
> > >
> > > See the ticket for more details.
> > >
> > > BTW, let me use this mail to also add the report to the list of track=
ed
> > > regressions to ensure it's doesn't fall through the cracks:
> > >
> > > #regzbot introduced: c34db0d6b88b1d
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D216861
> > > #regzbot title: sound: asoc: sudden sound disappearance
> > > #regzbot ignore-activity
> >
> > FWIW, we had as well reports in Debian after having updated the kernel
> > from 5.10.149 based one to 5.10.158 based one in the last point
> > releases, they are at least:
> >
> > https://bugs.debian.org/1027483
> > https://bugs.debian.org/1027430
>
> I got another report while the commit was backported to 5.14-based
> openSUSE Leap kernel, and I ended up with dropping it.
>
> So, IMO, it's safer to drop this patch from the older stable trees.
> As far as I see, 5.15.y and 5.10.y got this.
>
> Unless anyone gives a better fix, I'm going to submit a revert patch
> for those trees.
>
>
> thanks,
>
> Takashi
>
