Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6813365C18A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 15:11:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65523E01E;
	Tue,  3 Jan 2023 15:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65523E01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672755071;
	bh=3I+fhoajLLgBUsmDX8s4xlAONQtg32aH9QeGxirFG44=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dCuyyp2ZtcmEDjpImX7cjIsYVj/NRWzeQDyEFeU1Kh83kD6R0aYlCs17GAOb2o12v
	 wIT1aOuw5GVZoUvh8lDfd19qA1vaA76mwX4iu5N7c4TS8W1tMLW87aI6gqnhjxkurw
	 qHQmvmE2Sr6C/kogT5ydY1LtbAW0QPPRqwfVO59I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C670F80549;
	Tue,  3 Jan 2023 15:09:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B3A8F8047B; Tue,  3 Jan 2023 14:05:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3030DF800C0
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 14:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3030DF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gkqcLNSy
Received: by mail-ot1-x32d.google.com with SMTP id
 m6-20020a9d7e86000000b0066ec505ae93so19026045otp.9
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 05:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFWumH4KGoJlzNmef6ZMjYRxtRsQ29aHRzvDO3z+tjc=;
 b=gkqcLNSyQ1SoNGqsQulv14lK6VLDieljM1vMmMHcBBEj9FvyUJ3xHp86HLZ+XEQu23
 Ajd2INzfS1b+m3xeLAzvp3xVpYqVn0ct/+2skVuSzJcMC//FmDnjZ8/wlAAu60oIfZ5o
 KYrUqEpgJxbAXZ471IAK8m9q7VPTHWMBHF2GyVSUbAaSMQlgXZfIL406ja5fh5TUVbuY
 +J3A9lHDPxjtU1DdMqCg+wTY0KvH8sZTsCelZUOvVQ7Hi1eBDoKmz3Z0lq8QTAIoGKoD
 TaOmxAzPkksr07Ufd/qeBx6dLWAusB2cqkB5jkqGDBU4X/M41tEGYOUaYvX/zcAh3dkY
 PuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zFWumH4KGoJlzNmef6ZMjYRxtRsQ29aHRzvDO3z+tjc=;
 b=rxf6y6OrrpHStVDhu0WLnrxPqOiR/c5BPOlQsQogvJGO521cp34VoxRgd5QimHkV8E
 x7EXYcXhUsqmW6N24OsymPdBtrSegz4PlZj8VDmtExUiWSPx0FmrhZKXpRtG72IT8UU9
 Zd/U3KqHGUF9LB/LcPka2QR3LLNNDGLK/NZnxBoLKTFRnC5icyO1/YGL8jwyJUItCqgG
 WeH6rgLF5A3ijrEN1s5HWNYQhbCdY+NxDM+sfO0eO4hQiiH65G+1kEqr/EdKyi2IMR5L
 h8VExTn6EwPIUUCgu4NTcdmcMrmWg1u0X0QGA6bt8wW/2UnYCAkhfUy9+qsq7Rf4FwIZ
 XIdw==
X-Gm-Message-State: AFqh2kou/WtczPGBWx1w0qTGLa64uszt5JP4ZlMnavfwcr33waAe/+g+
 ymZLmag2WkjDWVKlSQQ8aZwjOGRz3frB6esYPy4=
X-Google-Smtp-Source: AMrXdXsGYVYpKbI6S6663PlQdTnmgt06lm9E/ZDIAC1Rp+m7YS1pi2lxmj7Z5ARv3PUGlUQfOsRhvMKw34pLbAAb7gQ=
X-Received: by 2002:a05:6830:1443:b0:66d:8e24:8038 with SMTP id
 w3-20020a056830144300b0066d8e248038mr2182829otp.9.1672751101733; Tue, 03 Jan
 2023 05:05:01 -0800 (PST)
MIME-Version: 1.0
References: <bebd692d-7d21-6648-6b7a-c91063bb51c2@leemhuis.info>
 <Y7K1WDmPYi3EMOn1@eldamar.lan> <87wn65umye.wl-tiwai@suse.de>
 <CALp6mkJhM1zDcNr9X_7WL09+uqcaAhNFFMhrjme0r7584O+Lgw@mail.gmail.com>
In-Reply-To: <CALp6mkJhM1zDcNr9X_7WL09+uqcaAhNFFMhrjme0r7584O+Lgw@mail.gmail.com>
From: =?UTF-8?B?UMOBTEZGWSBEw6FuaWVs?= <dpalffy@gmail.com>
Date: Tue, 3 Jan 2023 14:04:50 +0100
Message-ID: <CALp6mk+rdqGXySUowxZv3kEEVWrh96m_x-h8xcFNQ9YZPkbc5w@mail.gmail.com>
Subject: Re: [regression, 5.10.y] Bug 216861 - sound disappearance on Acer
 Swift 3 SF314-59-78UR after update to 5.10.157
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 03 Jan 2023 15:09:08 +0100
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

And confirming, 5.10.161 with e8444560b4d9302a511f0996f4cfdf85b628f4ca
and 636110411ca726f19ef8e87b0be51bb9a4cdef06 cherry-picked works for
me.

On Tue, Jan 3, 2023 at 1:05 PM P=C3=81LFFY D=C3=A1niel <dpalffy@gmail.com> =
wrote:
>
> Another report: https://bugs.archlinux.org/task/76795
> Apparently, folks at alsa-devel traced down the dependencies of that patc=
h, see the mail thread at https://lore.kernel.org/all/dc65501c-c2fd-5608-c3=
d9-7cea184c3989%40opensource.cirrus.com/
>
> On Mon, Jan 2, 2023 at 1:42 PM Takashi Iwai <tiwai@suse.de> wrote:
>>
>> On Mon, 02 Jan 2023 11:43:36 +0100,
>> Salvatore Bonaccorso wrote:
>> >
>> > Hi,
>> >
>> > [Adding as well Richard Fitzgerald and P=C3=81LFFY D=C3=A1niel to reci=
pients]
>> >
>> > On Fri, Dec 30, 2022 at 09:08:57AM +0100, Thorsten Leemhuis wrote:
>> > > Hi, this is your Linux kernel regression tracker speaking.
>> > >
>> > > I noticed a regression report in bugzilla.kernel.org. As many (most?=
)
>> > > kernel developer don't keep an eye on it, I decided to forward it by
>> > > mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=3D216=
861 :
>> > >
>> > > >  Sergey 2022-12-29 10:07:51 UTC
>> > > >
>> > > > Created attachment 303497 [details]
>> > > > pulseaudio.log
>> > > >
>> > > > Sudden sound disappearance was reported for some laptops, e.g.
>> > > >
>> > > > Acer Swift 3 SF314-59-78UR 11th Gen Intel(R) Core(TM) i7-1165G7 @ =
2.80GHz
>> > > >
>> > > > # lspci
>> > > > 0000:00:1f.3 Multimedia audio controller: Intel Corporation Tiger =
Lake-LP Smart Sound Technology Audio Controller (rev 20)
>> > > >         Subsystem: Acer Incorporated [ALI] Device 148c
>> > > >         Flags: bus master, fast devsel, latency 32, IRQ 197, IOMMU=
 group 12
>> > > >         Memory at 601f270000 (64-bit, non-prefetchable) [size=3D16=
K]
>> > > >         Memory at 601f000000 (64-bit, non-prefetchable) [size=3D1M=
]
>> > > >         Capabilities: [50] Power Management version 3
>> > > >         Capabilities: [80] Vendor Specific Information: Len=3D14 <=
?>
>> > > >         Capabilities: [60] MSI: Enable+ Count=3D1/1 Maskable- 64bi=
t+
>> > > >         Kernel driver in use: sof-audio-pci
>> > > >
>> > > > I am attaching the pulseaudio and dmesg logs
>> > > >
>> > > > This bug started reproducing after updating the kernel from 5.10.1=
56 to 5.10.157
>> > > >
>> > > > Bisection revealed the commit being reverted:
>> > > >
>> > > > c34db0d6b88b1da95e7ab3353e674f4f574cccee is the first bad commit
>> > > > commit c34db0d6b88b1da95e7ab3353e674f4f574cccee
>> > > > Author: Richard Fitzgerald <rf@opensource.cirrus.com>
>> > > > Date:   Fri Nov 4 13:22:13 2022 +0000
>> > > >
>> > > >     ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()
>> > > >
>> > > >     [ Upstream commit 39bd801d6908900e9ab0cdc2655150f95ddd4f1a ]
>> > > >
>> > > >     The DAI tx_mask and rx_mask are set by snd_soc_dai_set_tdm_slo=
t()
>> > > >     and used by later code that depends on the TDM settings. So
>> > > >     __soc_pcm_open() should not be obliterating those mask values.
>> > > >
>> > > > [...]
>> > > > Original bug report: https://bugzilla.altlinux.org/44690
>> > >
>> > > See the ticket for more details.
>> > >
>> > > BTW, let me use this mail to also add the report to the list of trac=
ked
>> > > regressions to ensure it's doesn't fall through the cracks:
>> > >
>> > > #regzbot introduced: c34db0d6b88b1d
>> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D216861
>> > > #regzbot title: sound: asoc: sudden sound disappearance
>> > > #regzbot ignore-activity
>> >
>> > FWIW, we had as well reports in Debian after having updated the kernel
>> > from 5.10.149 based one to 5.10.158 based one in the last point
>> > releases, they are at least:
>> >
>> > https://bugs.debian.org/1027483
>> > https://bugs.debian.org/1027430
>>
>> I got another report while the commit was backported to 5.14-based
>> openSUSE Leap kernel, and I ended up with dropping it.
>>
>> So, IMO, it's safer to drop this patch from the older stable trees.
>> As far as I see, 5.15.y and 5.10.y got this.
>>
>> Unless anyone gives a better fix, I'm going to submit a revert patch
>> for those trees.
>>
>>
>> thanks,
>>
>> Takashi
