Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D39750DCAC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 11:30:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E1D116E2;
	Mon, 25 Apr 2022 11:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E1D116E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650879056;
	bh=R320qgim4zYEZ6PAyobQnzVk+ZJA8fEBvoJU0HBqq8I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pIpL1rBZUc+ZvkYSrTj3V6SoZu1g+u6PuEUxMnL5G/BjaJpF3RALcebAkvI7iY4GP
	 +96iV9ra0jFGJwYcC+122RHpd1O38waAR+mfCDLgYjcxF+ZloYv5ehTdh3Vtl8J+Ds
	 DpaXjqPNegKxbq5d4dRBfwkXG5RG9CjHhYfwcego=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF4DF8014B;
	Mon, 25 Apr 2022 11:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE22FF8016A; Mon, 25 Apr 2022 11:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 891A9F8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 11:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 891A9F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GCZuUnp9"
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso28145507b3.5
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 02:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7DI/4yWN3y1GMnceS1NFP6W+fM0r79CNMIWUatbJf0I=;
 b=GCZuUnp932JxImCO8yyc4Gc8wkN98T+o2cGsdEEVoxF899i6hRCXUz2OVFWzZcrvXj
 76MEiMn2LB4F2TlZBPj1tpYKE1kWpUxpfMjGKbKEaKhvPn61cEgu+MTEtZuig9QuGO8D
 /cbW5lAIiXLyzhZPP0MKrlG/LXT1vBPRYMD18sTaeN5Kk1qRD2vRnDNdyjpz7Gmr1Udb
 UUgkkwngftahjHMpHyW8CdC42noowsLzEFVjhFvf7W+MglaDl1JpoMd+jWVHPMEkFhS4
 iW2ZTI506E3XEKox9qIvbFG2L4CCcmZZMVYO8DC5FYdqtIJAyzaQjfDeHpyP2RL2H5WX
 EhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7DI/4yWN3y1GMnceS1NFP6W+fM0r79CNMIWUatbJf0I=;
 b=AXDKC+dVzCls9U+IkTwhuIrPP9wZtIMSwCBYW2hvdBYPvuaMSffBTv6L0q9JmRe8Lr
 QKXOkIGUW/DKQ+plCb1AOJNaI9lKlNZEWJAA8cZ91bCDePYr5gJ74AMCgXXa+teHEPWT
 6UaSE9qHJYB/Rg3JS4+lLo178Ekmcdl2ssDGQT19UaHvej9ZtdQemPP4weZVMRs49AU/
 GvMqc/SevdJSJqkG/yOkYbo1V4ubzkMqhIevxCGkwokW0XDub+4Z/Z9Nv394zUR2/4XD
 9xB5Y/2QPNvRbr4xhTd5N5JRC+Y5zMwDPNA9sjhEsI6y7i8L5CQT97E5aHZ9mltP36jB
 4hfg==
X-Gm-Message-State: AOAM5331fctcNHbQj6aqQIGNs13ktmsrsnWZEsjs55lrl1qeLEGQ+p7n
 o6BJJPPpZ0eoFRhUTpmjjlbrKBppJKeZ1a4XyHE=
X-Google-Smtp-Source: ABdhPJzuYw9o/w71YlaAQBnSBo3Oq9wnJmCtC+7inm7LG9vm9W7JrUu2ex+pkxwWlm67/LgyDA1JRGeK+fregfJ01b4=
X-Received: by 2002:a81:6a46:0:b0:2f4:dc3f:e8f8 with SMTP id
 f67-20020a816a46000000b002f4dc3fe8f8mr16106476ywc.292.1650878981595; Mon, 25
 Apr 2022 02:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220421203555.29011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220421203555.29011-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB5922C8287D7EEAB3F9DB60C386F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922C8287D7EEAB3F9DB60C386F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 25 Apr 2022 10:29:15 +0100
Message-ID: <CA+V-a8uGhUMK11BXQX9e-+8bwaq9Gx_AGHBob1KTiT6Npb-8Rw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: sh: rz-ssi: Add a devres action to release the
 DMA channels
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Pavel Machek <pavel@denx.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Biju,

Thank you for the review.

On Fri, Apr 22, 2022 at 7:52 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Lad Prabhakar,
>
> Thanks for the patch.
>
> > Subject: [PATCH 3/3] ASoC: sh: rz-ssi: Add a devres action to release the
> > DMA channels
> >
> > DMA channels requested by rz_ssi_dma_request() in rz_ssi_probe() were never
> > released in the error path apart from one place. This patch fixes this
> > issue by adding a devres action to release the DMA channels and dropping
> > the single rz_ssi_release_dma_channels() call which was placed in the error
> > path in case devm_snd_soc_register_component() failed.
> >
> > Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  sound/soc/sh/rz-ssi.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c index
> > d9a684e71ec3..f04da1bf5680 100644
> > --- a/sound/soc/sh/rz-ssi.c
> > +++ b/sound/soc/sh/rz-ssi.c
> > @@ -912,6 +912,11 @@ static const struct snd_soc_component_driver
> > rz_ssi_soc_component = {
> >       .pcm_construct  = rz_ssi_pcm_new,
> >  };
> >
> > +static void rz_ssi_release_dma_channels_action(void *data) {
> > +     rz_ssi_release_dma_channels(data);
> > +}
> > +
> >  static int rz_ssi_probe(struct platform_device *pdev)  {
> >       struct rz_ssi_priv *ssi;
> > @@ -966,6 +971,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
> >               dev_info(&pdev->dev, "DMA enabled");
> >               ssi->playback.transfer = rz_ssi_dma_transfer;
> >               ssi->capture.transfer = rz_ssi_dma_transfer;
> > +
> > +             ret = devm_add_action_or_reset(&pdev->dev,
> > +                                            rz_ssi_release_dma_channels_action,
> > ssi);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> >       ssi->playback.priv = ssi;
> > @@ -1027,8 +1037,6 @@ static int rz_ssi_probe(struct platform_device *pdev)
> >                                             rz_ssi_soc_dai,
> >                                             ARRAY_SIZE(rz_ssi_soc_dai));
> >       if (ret < 0) {
> > -             rz_ssi_release_dma_channels(ssi);
> > -
>
> Maybe we need to keep this as it is, otherwise DMA channel release will happen
> after CLK disable and Reset assert. Ideally release the channel, disable the clock and assert
> the reset.
>
Ok will move this call to individual error paths.

> Similarly, you may want to add "rz_ssi_release_dma_channels(ssi)" for error path related to
> Pm_runtime_resume_get.
>
yes this needs to go under all error paths except the pio chunk.

>
> Also with this change there is unbalanced release_dma_channels() one from devres and other from remove.
>
Agreed.

Cheers,
Prabhakar

> Regards,
> Biju
>
>
>
> >               pm_runtime_put(ssi->dev);
> >               pm_runtime_disable(ssi->dev);
> >               reset_control_assert(ssi->rstc);
> > --
> > 2.17.1
>
