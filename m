Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E93FD450
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 09:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D8AD15E2;
	Wed,  1 Sep 2021 09:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D8AD15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630480589;
	bh=4moj3FGtkbtLmUtdwu+lFHOxtMDljNhYOfM7XsCrFd8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hZsMlWmDdktr7mCmj9qY96wjPh2raguEct4fRgeVyfMOYOFuWYaZ0BnZsWssdDwjv
	 Lvr1NYDbGmYR0lYhE5g5fXcRedqAqOf+NopJiV8SYUN2k3phqz29Z6jbrMI2I8AFzM
	 ApuxMTaRSUJS4mDu6uSxjYO/yEsQhv+bWOkmq9J0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCE12F8020D;
	Wed,  1 Sep 2021 09:15:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2CD4F80227; Wed,  1 Sep 2021 09:15:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCC25F80171
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 09:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCC25F80171
Received: by mail-vk1-f181.google.com with SMTP id s126so651832vkd.3
 for <alsa-devel@alsa-project.org>; Wed, 01 Sep 2021 00:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QadCFZQ2SQPPYc3LZSgseGA9mPxC2ggiigDkQzPcZ7E=;
 b=ckN9KPVoWNcR/+MuHQWchgnshHwQwQysqrkoll0nCTAw7j7PPWwiwKxH+wNvqSJzC4
 w1TbfL2gxaN/A7iMp2RBARppUKFMXevfBgkPNUMAuvs/Cf7E0XYkr2b61tGSzHtEZkq1
 Rw5dxMaLBG5E6MqeA1gGB1Ba9PdGehoqcRQbNzRnob/1jXleyBsBKz33+9neGDzk+dWj
 1gh746zQhSvXdLnhpQwazMxxXFwjnlmGg6r6jgZH0Blqnh72vdTCV2alR5tTz2F3wR9j
 JNm9RBpeJbKQUNtrgTH2UsyZ0uxIBy1cAOCOc5r65+3KryMgZZG7IeXTfNYeIYuvcj/e
 fKNw==
X-Gm-Message-State: AOAM530adiiocOXZcBxF7/cln2QGaYJRTWW6JXdi0eI7zzJcqZ3N+gSg
 2iUgrd1SJZB8QHATdCKfgn6v7Fqi6IYB6Qxt9TE=
X-Google-Smtp-Source: ABdhPJwsjmzlnZudgyUqICpu9dUfkd2zTmDDo4gWcc2mlI2J0tB7JsSrjrkZZ5a9NdFjWFziJSe1eOA2qgj7wUlPqbA=
X-Received: by 2002:a1f:738f:: with SMTP id o137mr20861558vkc.2.1630480501855; 
 Wed, 01 Sep 2021 00:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
 <535478691c3a9ed31b508f59dc897be57c4213c0.camel@mediatek.com>
In-Reply-To: <535478691c3a9ed31b508f59dc897be57c4213c0.camel@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Sep 2021 09:14:50 +0200
Message-ID: <CAMuHMdUd+j7MYv3LXOH1C45UjEqVVjwm1mmyzpZyv+cuR3cDaw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: SND_SOC_MT8195 should depend on
 ARCH_MEDIATEK
To: Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Wed, Sep 1, 2021 at 5:48 AM Trevor Wu <trevor.wu@mediatek.com> wrote:
> On Tue, 2021-08-31 at 15:18 +0200, Geert Uytterhoeven wrote:
> > The Mediatek MT8195 sound hardware is only present on Mediatek MT8195
> > SoCs.  Hence add a dependency on ARCH_MEDIATEK, to prevent asking the
> > user about this driver when configuring a kernel without Mediatek SoC
> > support.
> >
> > Fixes: 6746cc858259985a ("ASoC: mediatek: mt8195: add platform
> > driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  sound/soc/mediatek/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> > index cf567a89f421b4c0..c8c815f599da90bf 100644
> > --- a/sound/soc/mediatek/Kconfig
> > +++ b/sound/soc/mediatek/Kconfig
> > @@ -187,6 +187,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
> >
> >  config SND_SOC_MT8195
> >       tristate "ASoC support for Mediatek MT8195 chip"
> > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> >       select SND_SOC_MEDIATEK
> >       help
> >         This adds ASoC platform driver support for Mediatek MT8195
> > chip
>
> Hi Geert,
>
> Thanks for your patch first.
> I really missed the dependency declaration.
> But we only test "depends on ARCH_MEDIATEK" internally, maybe removing
> "COMPILE_TEST" like other MTK series is better for the maintenance in
> the future.

If the driver compiles with CONFIG_ARCH_MEDIATEK=n, it is better
to enable compile-testing, as that may catch issues.\
I didn't change the existing MTK symbols, only new symbols.
(adding missing dependencies to existing symbols is in my (huge) backlog ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
