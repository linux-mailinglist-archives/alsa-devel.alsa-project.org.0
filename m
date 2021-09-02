Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A183FEB02
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 11:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42DA11796;
	Thu,  2 Sep 2021 11:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42DA11796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630574207;
	bh=5KiKnCEEyuHhcXOC/4xVJddOlape7OoXTwxVeY73JY8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k11ZYa5ctcJL9O8eFR1J1f+Z6gCCyshzDKicmyMpdi3PhAKUry0RL4L3y+3NcL74X
	 QglWhqIyqysHQvRbeopOm0CNf4MBjiYyDBAhRE7Ws82APNhooGaen+hBKYcmXioXVT
	 6q/FggZ+jshZecN117V+z6FKs/CNLnuMSe+EU8UQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB7B7F8028D;
	Thu,  2 Sep 2021 11:15:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F6ECF80269; Thu,  2 Sep 2021 11:15:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B281BF80125
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 11:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B281BF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="k1YBKmWE"
Received: by mail-lj1-x236.google.com with SMTP id m4so2279088ljq.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Sep 2021 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b7w0R6VDMHv6UT6JVPqf/kPPNWm6Bp4/tXYIQLznWTU=;
 b=k1YBKmWEwL6N9mTcLBnnh9GXkTMM6CzZR88O0IWOtw1nWLcAZ73gDLxqtcTBWTtiyB
 qbhxJjU4nHODlJYbvWegWLmzBsHnWZrVEjLUO0RbEmuHzI8C4gwPuYD5ak6btJdmnDGo
 GKRyY3efJIqpC1MF3zaxCuTZ1MJEfK2DGCpdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b7w0R6VDMHv6UT6JVPqf/kPPNWm6Bp4/tXYIQLznWTU=;
 b=nev17oNmrmhMtY5NbHbM77BN/00TxfD2CdqjouJOj6xSMBhccJVyFoLp84irV7Z3FG
 3V6fwdhUaDzNs3PQOstjgmy/eroLmQavmrSmtPSkQJfXMHl5NJKFcraSiddjXCN74Jpm
 DRZ3lqLmzVz9TmXBsTO4sA5fpb0Am9b7nIxcWK7AJ84KvfwUYVmFGJ18j65+pUXeQVXb
 swv9Iz5JR40cjHNulLyzXXbScPfcVHXGeSKm8Vg8gnOud2RlgBJ7dKdntXWsAf1jyC+p
 uJSfUJ3J3OILTzeU2/AbyyDcr507OrXNtZFp9pf//SJHxnSKeySSoVUp+y4TCQazvQCB
 Jahg==
X-Gm-Message-State: AOAM5320AJ4VfMFREWvW4eToKnYbk4H/d28TR8G7TmqtlTRRkt5tPB9+
 CPm2NKtNKg3SVgXydojl05SgtBV4Tal9zA/jNr4/og==
X-Google-Smtp-Source: ABdhPJwVjOpDQBYigzY6w6VwefwZ+wyf8d0BezP9x8Aknsr+qgTjHr7dO/m7wLJWzzH4RENiT2Uh7fAV4c8H0EpokpU=
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr1736095ljm.18.1630574117548; 
 Thu, 02 Sep 2021 02:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181740.3a0a69f2@canb.auug.org.au>
 <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
 <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
 <CAMuHMdXVxNfQYwP7+iMq+CbuDx3wjHgG2xsr9jP4WwL4OLLL-Q@mail.gmail.com>
 <43d231a765a2106b6ef0cbbe842ba3ec37b45878.camel@mediatek.com>
In-Reply-To: <43d231a765a2106b6ef0cbbe842ba3ec37b45878.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 Sep 2021 17:15:06 +0800
Message-ID: <CAGXv+5HPCUBziGoW9gbtHYGvF9_Pt6JPAFY2CuX05jOnoQUcnw@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 1
 [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko]
To: Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bicycle Tsai <bicycle.tsai@mediatek.com>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Thu, Sep 2, 2021 at 4:52 PM Trevor Wu <trevor.wu@mediatek.com> wrote:
>
> On Thu, 2021-09-02 at 10:22 +0200, Geert Uytterhoeven wrote:
> > Hi Trevor,
> >
> > On Thu, Sep 2, 2021 at 4:37 AM Trevor Wu <trevor.wu@mediatek.com>
> > wrote:
> > > On Wed, 2021-09-01 at 13:55 -0700, Randy Dunlap wrote:
> > > > On 9/1/21 1:17 AM, Stephen Rothwell wrote:
> > > > > Please do not add any v5.16 related code to your linux-next
> > > > > included
> > > > > branches until after v5.15-rc1 has been released.
> > > > >
> > > > > Changes since 20210831:
> > > > >
> > > >
> > > >
> > > > on x86_64:
> > > >
> > > > ERROR: modpost: "clkdev_add" [sound/soc/mediatek/mt8195/snd-soc-
> > > > mt8195-afe.ko] undefined!
> > > > ERROR: modpost: "clkdev_drop" [sound/soc/mediatek/mt8195/snd-soc-
> > > > mt8195-afe.ko] undefined!
> > > > ERROR: modpost: "clk_unregister_gate"
> > > > [sound/soc/mediatek/mt8195/snd-
> > > > soc-mt8195-afe.ko] undefined!
> > > > ERROR: modpost: "clk_register_gate"
> > > > [sound/soc/mediatek/mt8195/snd-
> > > > soc-mt8195-afe.ko] undefined!
> > > >
> > > > Full randconfig file is attached.
> > > >
> > >
> > > Hi Randy,
> > >
> > > The problem is caused by the dependency declaration, because it's
> > > not a
> > > driver for x86_64.
> > > The dependency declaration has been added in the following patch.
> > >
> > >
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/alsa-devel/patch/7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert*renesas@glider.be/__;Kw!!CTRNKA9wMg0ARbw!wMq130mAo-s45pP6ShQ1S8UIRuJLhwOnCbQNAQHIE2zvNhjAd67h1rlqkIDxJvC5_g$
> > >
> >
> > That is not sufficient, if COMPILE_TEST is enabled.
> >
> > Looks like it needs a dependency on COMMON_CLK, too.
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
>
> Hi Geert,
>
> Because it's a ARM64 driver, ARM64 will select COMMON_CLK.
> It seems that some dependency should be checked if COMPILE_TEST is
> enabled and the driver is compiled on non-ARM64 environment.
> We don't expect the driver can be used on non-ARM64 environment,may I
> remove COMPILE_TEST to solve the problem?
> If the driver only depends on ARCH_MEDIATEK, it must be compiled on
> ARM64.

The whole point of COMPILE_TEST is that it gets compile-tested. It doesn't
have to actually run.

Since the driver is using parts of the common clk framework, it should
declare an explicit dependency, instead of implicitly depending on
other symbols to enable it.

ChenYu
