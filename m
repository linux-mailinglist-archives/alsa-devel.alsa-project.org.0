Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B43FFAEF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 09:19:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2BB617DE;
	Fri,  3 Sep 2021 09:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2BB617DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630653547;
	bh=iwRBskpOB9faC2Eq6dqRGmYYIhJT9lg+vjGYWgvmBtk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3KMkZZF7yn7gsPjKRI7LFQ6ASJe16zIWgPyuxay0qPIIyQ11/GpxvxkGjTGDgulS
	 BeWw9qAoxmrzHBrTUNTD3Q8zxmI2zAu0vy3JUys/BGKrnV6CrLp5yqU86mO4daNH0F
	 ejM7zbVbUwuPZne78aj9ewNLDa5L/Jua4b/NeQlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28608F80256;
	Fri,  3 Sep 2021 09:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE32EF800B5; Fri,  3 Sep 2021 09:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66C3FF800B5
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 09:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66C3FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="HMYZWGRV"
Received: by mail-lj1-x22e.google.com with SMTP id y6so8190908lje.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 00:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fBPFZDdudXT9nLyNa5jIhm1InOCc+X/nullyt3ssKfA=;
 b=HMYZWGRVfbuPlEk2Fi9n+aluSUDZFov3xnXvw3NkJsZxgQOhzS4UEfd6AmNC0MjomZ
 pVetIl95zkIc+acmuL7xJ2uCWVrE0Fi/S3Yrz96OQIXepcuHzo3SJlV+C+D/8YY36ObQ
 2czD+fZyOqbil310sVL6vVE/l8pi1r2EzZTfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fBPFZDdudXT9nLyNa5jIhm1InOCc+X/nullyt3ssKfA=;
 b=WH1ZcfwqOk4Zr+TPKxNCHUDVWTtTkeCQ/1gJ6lfCkwtKDeajyljvC9B5WxQgeTdUqH
 vzlYSBtOhtgRHUb82QBJkLYGPnW0FxeAafBfxrqOOT/1PVyGLnbYjZivwvlz2sfmqOwI
 Xpt06FmDcp9jmAFh6xKCl7fRjUsfrnAI08v4NbVAPtephP2DvjbDTfAPTYuCdphvMcT7
 DoI6CAUepIH85xc9pTgQ+90aTuW9WPB+MtzT0z5Eb1CEZlruRigUBvfOyuguL58uauXi
 bAkuv1/ZqLauh2KWsaoHeXuFc4wz0iVwmtrJ2j6B/b2SRFrYhY9suiJv/vwRzG0xmoBz
 ytBQ==
X-Gm-Message-State: AOAM532cnxkd8TZDONPMUxj9+cJrN5UCI0nfFHisoGR99i3pz90I18n3
 J3Sns+h8i6VKivnM3C9N0cm1XMjEef3czPsAKZclyA==
X-Google-Smtp-Source: ABdhPJwyAjvWIoz2kJco/SwHAa7+pc3/F79fMs0FabkcA/zUxzsCRz+0c0N+gXIasHWNuy2ARRrVSBISK69nnDE5/mw=
X-Received: by 2002:a05:651c:211a:: with SMTP id
 a26mr1840127ljq.305.1630653457485; 
 Fri, 03 Sep 2021 00:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181740.3a0a69f2@canb.auug.org.au>
 <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
 <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
 <CAMuHMdXVxNfQYwP7+iMq+CbuDx3wjHgG2xsr9jP4WwL4OLLL-Q@mail.gmail.com>
 <43d231a765a2106b6ef0cbbe842ba3ec37b45878.camel@mediatek.com>
 <CAGXv+5HPCUBziGoW9gbtHYGvF9_Pt6JPAFY2CuX05jOnoQUcnw@mail.gmail.com>
 <13a16d4b47d4cb36061add729eca6c35ad84c814.camel@mediatek.com>
In-Reply-To: <13a16d4b47d4cb36061add729eca6c35ad84c814.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Sep 2021 15:17:26 +0800
Message-ID: <CAGXv+5E-BtTea=V6nQTHtHMYwA_-FeD=yLgEohS7AzEsaOCqZg@mail.gmail.com>
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

On Fri, Sep 3, 2021 at 3:05 PM Trevor Wu <trevor.wu@mediatek.com> wrote:
>
> On Thu, 2021-09-02 at 17:15 +0800, Chen-Yu Tsai wrote:
> > On Thu, Sep 2, 2021 at 4:52 PM Trevor Wu <trevor.wu@mediatek.com>
> > wrote:
> > >
> > > On Thu, 2021-09-02 at 10:22 +0200, Geert Uytterhoeven wrote:
> > > > Hi Trevor,
> > > >
> > > > On Thu, Sep 2, 2021 at 4:37 AM Trevor Wu <trevor.wu@mediatek.com>
> > > > wrote:
> > > > > On Wed, 2021-09-01 at 13:55 -0700, Randy Dunlap wrote:
> > > > > > On 9/1/21 1:17 AM, Stephen Rothwell wrote:
> > > > > > > Please do not add any v5.16 related code to your linux-next
> > > > > > > included
> > > > > > > branches until after v5.15-rc1 has been released.
> > > > > > >
> > > > > > > Changes since 20210831:
> > > > > > >
> > > > > >
> > > > > >
> > > > > > on x86_64:
> > > > > >
> > > > > > ERROR: modpost: "clkdev_add" [sound/soc/mediatek/mt8195/snd-
> > > > > > soc-
> > > > > > mt8195-afe.ko] undefined!
> > > > > > ERROR: modpost: "clkdev_drop" [sound/soc/mediatek/mt8195/snd-
> > > > > > soc-
> > > > > > mt8195-afe.ko] undefined!
> > > > > > ERROR: modpost: "clk_unregister_gate"
> > > > > > [sound/soc/mediatek/mt8195/snd-
> > > > > > soc-mt8195-afe.ko] undefined!
> > > > > > ERROR: modpost: "clk_register_gate"
> > > > > > [sound/soc/mediatek/mt8195/snd-
> > > > > > soc-mt8195-afe.ko] undefined!
> > > > > >
> > > > > > Full randconfig file is attached.
> > > > > >
> > > > >
> > > > > Hi Randy,
> > > > >
> > > > > The problem is caused by the dependency declaration, because
> > > > > it's
> > > > > not a
> > > > > driver for x86_64.
> > > > > The dependency declaration has been added in the following
> > > > > patch.
> > > > >
> > > > >
> > >
> > >
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/alsa-devel/patch/7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert*renesas@glider.be/__;Kw!!CTRNKA9wMg0ARbw!wMq130mAo-s45pP6ShQ1S8UIRuJLhwOnCbQNAQHIE2zvNhjAd67h1rlqkIDxJvC5_g$
> > > > >
> > > >
> > > > That is not sufficient, if COMPILE_TEST is enabled.
> > > >
> > > > Looks like it needs a dependency on COMMON_CLK, too.
> > > >
> > > > Gr{oetje,eeting}s,
> > > >
> > > >                         Geert
> > > >
> > >
> > > Hi Geert,
> > >
> > > Because it's a ARM64 driver, ARM64 will select COMMON_CLK.
> > > It seems that some dependency should be checked if COMPILE_TEST is
> > > enabled and the driver is compiled on non-ARM64 environment.
> > > We don't expect the driver can be used on non-ARM64 environment,may
> > > I
> > > remove COMPILE_TEST to solve the problem?
> > > If the driver only depends on ARCH_MEDIATEK, it must be compiled on
> > > ARM64.
> >
> > The whole point of COMPILE_TEST is that it gets compile-tested. It
> > doesn't
> > have to actually run.
> >
> > Since the driver is using parts of the common clk framework, it
> > should
> > declare an explicit dependency, instead of implicitly depending on
> > other symbols to enable it.
> >
> > ChenYu
>
> Hi ChenYu,
>
> Got it. I will send a patch for the problem.

I believe the background for this is that the kernel gets tested the most
on x86, even for build tests. We want code to get tested more, especially
for API changes for which the authors most likely do not have hardware
to test all combinations.

ChenYu
