Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1F449959
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 17:17:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B101E166F;
	Mon,  8 Nov 2021 17:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B101E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636388247;
	bh=asZ/sVwGHsWDCYa8XDrk7i8QcNTPDLCb4VrqLMt+z3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqBqqU4SkIntkQlbFcwHlCKVtQRIhTLcy8IiyfULFnw2cEHeMt98BpmuNYrAWnwsD
	 S1XskP5X9TAZuHltHl0zGSXPWEAtCh7kekLR2BsI5/hVMlGuw9YsEgnrAVp0gxloe3
	 tuKiwHzF9t8Ttiq/EMVQjvUYfH8LSe6v3Aqg71Ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA04F804B1;
	Mon,  8 Nov 2021 17:16:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55A65F8049E; Mon,  8 Nov 2021 17:16:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64326F801D8;
 Mon,  8 Nov 2021 17:15:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64326F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oCywnaqb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26C2661361;
 Mon,  8 Nov 2021 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636388157;
 bh=asZ/sVwGHsWDCYa8XDrk7i8QcNTPDLCb4VrqLMt+z3o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oCywnaqbpSa/QwbX6TUoWP7MsDTbsz1jNn3oDGFdUHEOg75fDNBbSzz4zPMBcMJT6
 fBgCHY/42kNadeUfQmkNyjoMFKXAJoZ5kQ3BY+1RwJpqXSwfu1GSqNZvtfuQzMkpd1
 SiJ90XR2/Qfa8GP+Xv0Cx4tk0R+96xX4AOyZPjyfBdPZ2XABQDRshgB+pNtWYP6h8b
 KOXqahEPAcjmfppIAj0ZjxePmrUy5dwYeSojtQ6PJgJngqPxOrhrNIAd2O6IC/4CSV
 KHXujGQvH+kK4/K2H00krTeKF92mBFyaEkwnQQ4w24jkxW4uY0N+aK93UpUNOL8DoP
 BgQrW/4PXQl+A==
Received: by mail-wr1-f46.google.com with SMTP id d27so27840849wrb.6;
 Mon, 08 Nov 2021 08:15:57 -0800 (PST)
X-Gm-Message-State: AOAM530LOc4WYUBz/lVz6h3CjPBCS+gwX6OgTLzzKqdHXrstJ1E8CFVk
 a+XfzoyF8+o/Ucmdamb4R8E7v4ig1+hprD0oGaI=
X-Google-Smtp-Source: ABdhPJzp2bDGxymnbqVY/EXNx8KUdXs5WzV+5o1cDrcdwEzQur7dRTqrCI3OSwS01nYrbCGPYnqSjos3LsYgoxN+Q1c=
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr368308wrx.71.1636388155592; 
 Mon, 08 Nov 2021 08:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20211108111132.3800548-1-arnd@kernel.org>
 <63c5b1fb-575e-f026-5a76-f08a366f7f38@linux.intel.com>
 <bae1a17c-af6e-d77a-19e7-f3f6408951fa@nxp.com>
In-Reply-To: <bae1a17c-af6e-d77a-19e7-f3f6408951fa@nxp.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Nov 2021 17:15:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2-=-JM+p2b4v4F8O9O2ZhB-3Uhd_F+gcGAinAztSDH9A@mail.gmail.com>
Message-ID: <CAK8P3a2-=-JM+p2b4v4F8O9O2ZhB-3Uhd_F+gcGAinAztSDH9A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: build compression interface into snd_sof.ko
To: Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Bud Liviu-Alexandru <budliviu@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Colin Ian King <colin.king@canonical.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sound-open-firmware@alsa-project.org
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

On Mon, Nov 8, 2021 at 3:13 PM Daniel Baluta <daniel.baluta@nxp.com> wrote:
> On 11/8/21 3:39 PM, Pierre-Louis Bossart wrote:
> > On 11/8/21 5:11 AM, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> Fixes: 858f7a5c45ca ("ASoC: SOF: Introduce fragment elapsed notificati=
on API")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > It's Monday morning and my memory is still foggy but I think we fixed
> > this problem with https://eur01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2Fthesofproject%2Flinux%2Fpull%2F3180&amp;data=
=3D04%7C01%7Cdaniel.baluta%40nxp.com%7C25ac869cfd1040f1be1708d9a2bd3460%7C6=
86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637719755777370422%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;sdata=3DE4K2DPkpLX2SgVJ1K99Qs3uz7l7mS96gIzYlJw9akbg%3D&amp;res=
erved=3D0,
> > where we changed the Kconfigs for i.MX. We haven't sent this update
> > upstream for some reason.
> >
> > Arnd, can you share the configuration that breaks with the existing
> > upstream code, I can check if the problem still exists.

https://pastebin.com/6JqM6Gkr

> Maybe someone forgot :) to send
> https://github.com/thesofproject/linux/pull/3180/commits/7122edc88d13db8b=
a835bdb20f7444ae535f9ffa
> upstream.
>
> I think that's me.
>
> Arnd can you run your scripts with
> https://github.com/thesofproject/linux/pull/3180/commits/7122edc88d13db8b=
a835bdb20f7444ae535f9ffa.
> I also attached the patch

I added that to my randconfig tree now. I did a cherry-pick of that
commit, I tried a 'git merge'
first, but that pulled in a lot of other stuff that conflicts with linux-ne=
xt.

Your patch does not fix the link error though, I'm fairly sure we need
my one-liner
on top still. In this case, SND_SOC_SOF=3Dy gets selected by
SND_SOC_SOF_INTEL_COMMON=3Dy, while SND_SOC_SOF_COMPRESS=3Dm gets
selected by SND_SOC_SOF_IMX_COMMON=3Dm, and then ignored because the Makefi=
le
only cares about =3Dy objects built into the common module.

       Arnd
