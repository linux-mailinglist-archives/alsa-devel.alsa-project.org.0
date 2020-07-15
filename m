Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980122054B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 08:43:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A201665;
	Wed, 15 Jul 2020 08:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A201665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594795400;
	bh=8y/LvhcOc+rcKqDngnMDUcUhVYtJN74MdN9Tqa88bmI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a6nXuuf3hpkXpuDU2ug69VdlBxzmAgZxrJegfPlk0PhE08JykfoNWycwyutKfsPp2
	 gOoicn98efDHmh/bAaM93gWXhlICSwx02XlIn1QtIGohY4AgbViov6LJRPxQi1QZvE
	 WQlqfHznIlbKahHmQUZpMtikxZhGxo5uEwjLrBiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C739CF80113;
	Wed, 15 Jul 2020 08:41:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33616F8021D; Wed, 15 Jul 2020 08:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4820EF80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 08:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4820EF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="alvhxN7Z"
Received: by mail-pl1-x641.google.com with SMTP id 72so1987825ple.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H3GOXsEias8O11m7veg8//yn3qcFVNyaC+qfLEtL+Ng=;
 b=alvhxN7ZMAQKl7g8xDR8IV6PagrJ9Hahmx//vd3jdPyUs04mYsJSaxa0f8L68+OQ+l
 E3+DxH4KmqLcBJpeV9Jtr26IcaITP+oQr6l47Zv8aHE9du2IrS27lUGCdfK6hvhSFm0E
 AnJa4gH3mgO0SYfVUP/lsMRqaZy/c5gUkHzpKYExnEj2d08k0QFoyDyd+gqaYlNKZegr
 d4bihMgLhmzBMDkqnkc2gq+sxeD2jmO6GA5EQrht3RujORiO3efOGCf9/0izJVYJAjLt
 WXryT0azR8FlK9noO8I9iG9LqC1nhEQ8wjDsmCf5ak4sEtEY9j0xzqPHAf3pv+idT7uJ
 yiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H3GOXsEias8O11m7veg8//yn3qcFVNyaC+qfLEtL+Ng=;
 b=i3JOkWugBLOUtIwPk9l05zMB18sp8fLW1xNj4vxtlCIPfg+cKLnhu/Q8mDA8uOJRHq
 4tivYoHow3tmpM/e4aMeChj+etqnll6NU8KkF6WocLqROVAYE48bG/axCTde0tPvwPOS
 kWS+mvMyR4GrrejXqFpi1BEB93upzTJ5M4C4JGPruZ+EbUjp+vWeh7at7BsnFk9pUUPs
 fX26AQCbYB0eRWa4nn6gZ5L99Tsngu59bfeKveS1bEOQqgUBWd+Ft2525P5Zi0uVjfGu
 4lpewhsS6w8FgxvvfUtKozcSt/Xo5mzE6vQTVu/VdlpuY79ZWXSFfgPwTKF7MUXUnRO+
 PJTA==
X-Gm-Message-State: AOAM533lUh3nYcOb4LUQ628i0RUJZygdNFL+SWkXgA5ZnPQfpjMDfQzI
 t/9J0ZQ6OtNGAVE1GkKk54A=
X-Google-Smtp-Source: ABdhPJx7Fa/qDN3qyOdO0QPaUPtwX+pk9Uzy1ivVjam/CKWrJ+m4kN3YIdTdkOkLBa39I3kofrPxrQ==
X-Received: by 2002:a17:90a:1d06:: with SMTP id
 c6mr9005046pjd.194.1594795282729; 
 Tue, 14 Jul 2020 23:41:22 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id bx18sm958690pjb.49.2020.07.14.23.41.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Jul 2020 23:41:22 -0700 (PDT)
Date: Tue, 14 Jul 2020 23:40:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl-asoc-card: Support Headphone and
 Microphone Jack detection
Message-ID: <20200715064057.GA14081@Asurada-Nvidia>
References: <1594717536-5188-1-git-send-email-shengjiu.wang@nxp.com>
 <1594717536-5188-4-git-send-email-shengjiu.wang@nxp.com>
 <20200714211432.GA10818@Asurada-Nvidia>
 <CAA+D8ANQ_B9jJUhLYQnKxKJcVrmvakxPo58h433QqFhdu2nRPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANQ_B9jJUhLYQnKxKJcVrmvakxPo58h433QqFhdu2nRPA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 kuninori.morimoto.gx@renesas.com, Timur Tabi <timur@kernel.org>,
 samuel@sholland.org, katsuhiro@katsuster.net,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org
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

On Wed, Jul 15, 2020 at 12:14:01PM +0800, Shengjiu Wang wrote:
> On Wed, Jul 15, 2020 at 5:16 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > Hi Shengjiu,
> >
> > The whole series looks good to me. Just a couple of small
> > questions inline:
> >
> > On Tue, Jul 14, 2020 at 05:05:36PM +0800, Shengjiu Wang wrote:
> > > Use asoc_simple_init_jack function from simple card to implement
> > > the Headphone and Microphone detection.
> > > Register notifier to disable Speaker when Headphone is plugged in
> > > and enable Speaker when Headphone is unplugged.
> > > Register notifier to disable Digital Microphone when Analog Microphone
> > > is plugged in and enable DMIC when Analog Microphone is unplugged.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/Kconfig         |  1 +
> > >  sound/soc/fsl/fsl-asoc-card.c | 69 ++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 68 insertions(+), 2 deletions(-)
> >
> > >  static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
> > >  {
> > >       struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
> > > @@ -745,8 +789,29 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> > >       snd_soc_card_set_drvdata(&priv->card, priv);
> > >
> > >       ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
> > > -     if (ret && ret != -EPROBE_DEFER)
> > > -             dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> > > +     if (ret) {
> > > +             if (ret != -EPROBE_DEFER)
> > > +                     dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> >
> > I think we may move this EPROBE_DEFER to the asrc_fail label.
> 
> If we move this to asrc_fail label, then it will be hard to define the
> error message.
> There are many places that goto asrc_fail.

Oh...good point...

> > > +             goto asrc_fail;
> > > +     }
> > > +
> > > +     if (of_property_read_bool(np, "hp-det-gpio")) {
> >
> > Could we move this check inside asoc_simple_init_jack? There's no
> > problem with doing it here though, yet I got a bit confused by it
> > as I thought it's a boolean type property, which would be against
> > the DT bindings until I saw asoc_simple_init_jack() uses the same
> > string to get the GPIO. Just it probably would be a bit tricky as
> > we need it to be optional here.
> >
> > Otherwise, I think we may add a line of comments to indicate that
> > the API would use the same string to get the GPIO.
> 
> In asoc_simple_init_jack, gpio_is_valid() will be invalid when there is
> no "hp-det-gpio" property, and asoc_simple_init_jack will return 0.
> 
> The reason why I add a check here is mostly for
> snd_soc_jack_notifier_register().
> when there is no jack created, there will be a kernel dump.
> 
> or I can use this code:
> 
> -       if (of_property_read_bool(np, "hp-det-gpio")) {
> -               ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
> -                                           1, NULL, "Headphone Jack");
> -               if (ret)
> -                       goto asrc_fail;
> +       ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
> +                                   1, NULL, "Headphone Jack");
> +       if (ret)
> +               goto asrc_fail;
> 
> +       if (priv->hp_jack.jack.jack)
>                 snd_soc_jack_notifier_register(&priv->hp_jack.jack,

It's pretty clean but not very obvious for the "optional" part.
So I think that it'd be slightly better to go for your previous
solution, but with a line of comments to show: these properties
are optional and asoc_simple_init_jack() uses the same strings.

Please add to all three changes once the comments being added:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks
