Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0CC3FEA94
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 10:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B6517A3;
	Thu,  2 Sep 2021 10:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B6517A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630571060;
	bh=90+X5xBqY4DmZhUUacO3zXRCXSEXaY5Y88vX5mMnzv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+oNkgwRzcKODjvHarlKKn7OJVB9+Jt5NYg7zsBIWWMyR1quykT6PpTKyBRv6Yw1n
	 5wHM0HlVX5ZUnz2vqGgfvQWoRfOBWJubkK69t+Tt25kOLFswNZlrwITY1dgjpcH2Yi
	 LwW18s1jwOUivxHMVwHo74ffdGluQQjzHa/+FBYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C6E1F8025B;
	Thu,  2 Sep 2021 10:23:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E65EF80269; Thu,  2 Sep 2021 10:23:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2645FF800AF
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 10:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2645FF800AF
Received: by mail-vs1-f43.google.com with SMTP id p14so782067vsm.2
 for <alsa-devel@alsa-project.org>; Thu, 02 Sep 2021 01:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HNCpdSsGpy5YO2fKUf5jrX7dkYGtMSNaPXgN/Pc9hLg=;
 b=gEi8DzQBY3azeB8JZdTluBxc0232u3JuX03wlyUndSqbjQ7bhJzfKEPOHbVKjH8Xht
 s1vQqEuckMBYViXdZcvIeQvUlVTzAZ58yf3aBPSIRIeTGCflRb7Lc6osu5Kmk8NsaLEB
 jQFUf49HDbROu4Kw+l1MwiPysyNdfP76p8EOe5X+ScjRTjxKpWKZ/bhoaZ96wr5XfVGq
 AJ85IqXfM4xoaMp9XqLiEjB/RPvLLFjyX/cGoWhzmHgtzQs+UTecSEq1atayQFDDz46w
 GhJCX+3Bosv3k3J9Os7jJ+SI7v0DrZSW6a2BjuuIyIHW30P1NHemcVkjPp328F2qhEAd
 kPPA==
X-Gm-Message-State: AOAM531rl0EWPbtNNuZHx0GIZQBEEfmthaTPRSwsV3UfLzGTMsoE/5Iu
 cjKA1lTAUMnp3lDlOQhw/jH0SimbxMP7WWiLcGE=
X-Google-Smtp-Source: ABdhPJyNJSOdmU3np2Afm9GG+piP6Z5QWWRSIHEGOqDNKIIMn+kfSujuXQrMi+smK4QAXyICbviEls6eGdpJ4fgr8OY=
X-Received: by 2002:a67:c789:: with SMTP id t9mr985119vsk.60.1630570972366;
 Thu, 02 Sep 2021 01:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181740.3a0a69f2@canb.auug.org.au>
 <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
 <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
In-Reply-To: <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Sep 2021 10:22:40 +0200
Message-ID: <CAMuHMdXVxNfQYwP7+iMq+CbuDx3wjHgG2xsr9jP4WwL4OLLL-Q@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 1
 [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko]
To: Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bicycle Tsai <bicycle.tsai@mediatek.com>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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

Hi Trevor,

On Thu, Sep 2, 2021 at 4:37 AM Trevor Wu <trevor.wu@mediatek.com> wrote:
> On Wed, 2021-09-01 at 13:55 -0700, Randy Dunlap wrote:
> > On 9/1/21 1:17 AM, Stephen Rothwell wrote:
> > > Please do not add any v5.16 related code to your linux-next
> > > included
> > > branches until after v5.15-rc1 has been released.
> > >
> > > Changes since 20210831:
> > >
> >
> >
> > on x86_64:
> >
> > ERROR: modpost: "clkdev_add" [sound/soc/mediatek/mt8195/snd-soc-
> > mt8195-afe.ko] undefined!
> > ERROR: modpost: "clkdev_drop" [sound/soc/mediatek/mt8195/snd-soc-
> > mt8195-afe.ko] undefined!
> > ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-
> > soc-mt8195-afe.ko] undefined!
> > ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-
> > soc-mt8195-afe.ko] undefined!
> >
> > Full randconfig file is attached.
> >
>
> Hi Randy,
>
> The problem is caused by the dependency declaration, because it's not a
> driver for x86_64.
> The dependency declaration has been added in the following patch.
>
> https://patchwork.kernel.org/project/alsa-devel/patch/7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be/

That is not sufficient, if COMPILE_TEST is enabled.

Looks like it needs a dependency on COMMON_CLK, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
