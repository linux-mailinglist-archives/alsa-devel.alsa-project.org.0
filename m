Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39B3421D
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 10:45:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E3441694;
	Tue,  4 Jun 2019 10:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E3441694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559637926;
	bh=3g0Bq+Kwl5iTW4P1PZIQFFbUrHFVNtGJ0MrDJtxfDzg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ib1d3o+JLeF/yI5epk4bGBi73PkaojjjJZ7GGeqgBLTYaoKYDvgKZHx8C8SI7PR3/
	 ifpCSddwDIfZdlgKCd0waJlgKdTyMtUwX/7TCW0ZvrL/K97+IYUfqdseW/1DStQklF
	 16G7B215dnn6FtXzG22RTh5c52Xeajb+P2z6TtoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A31CF896F8;
	Tue,  4 Jun 2019 10:43:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D77FF896F7; Tue,  4 Jun 2019 10:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 437C3F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 10:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 437C3F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="S6pXn63E"
Received: by mail-lf1-x141.google.com with SMTP id j29so1881954lfk.10
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3iIoR7ecHbwbLKkrHojSVrXiJSw5SdOH0Dq8rQHC8Mk=;
 b=S6pXn63Eo7+QLP9l1WNNi4a8Ef2nCB9MzFNA2/EbSWxRUxk5vXc+CD+TXOXUR+1fUN
 tYXlXWegl1/4UgPwbhMmKA2ea/sr8VQBKCT76z7pwVO60S0O/yu0zrEv2iEqIQXKn33D
 OQfiigWK5GBtHORWGX05508TkaYZ3fZE0HeFCU1/nlJRD+LuBqodq1NqqwMuB/KC/9FR
 SpDW2hV3bnTspqZr9wSbRfT2RQvRK8cZpo8yJvhS9o4m8ZbYJIyJ5bLy0UVmDa7CSkd0
 LLmdO0vnXccDDdrnNeLmEU96jCCwpY0nO87++faeKzYwsrCL5fI12k96zhYwGNE+Rn99
 nKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3iIoR7ecHbwbLKkrHojSVrXiJSw5SdOH0Dq8rQHC8Mk=;
 b=pZdj/Ws1YOCsOf3VgkZfX0hcIlXQyCCiSCPqoiV7WgKzKnpYhj6B51EatSrmGf4giS
 frH3hgmqCVDe6bCyOUSOYpsFl//kEuZtivaEY/xl2YF/FKGK9DvGHXCp8LGpxxF6Ke78
 nAAeSWifpw2e1qcJMG4tc006Jk51UW1u07NGiKLWrsleensy9BtUzWEG1kC6U0y3JAlk
 Kxi1EprR6UJhPLUKKLPQOlGGrGiCT699CJOt6Yw4C+Q5IF9rUGHfSebsaz5MvFUOtrtb
 S6NNqR56SJrC3GwwBZcmbRmxpvVy9c2q5k/JVCPXQXmYwIS76upHnHg2OFsua3dcV3mz
 V8RQ==
X-Gm-Message-State: APjAAAX+y6KkfdOAE5Z9tss+sb5UZ6/AAdj5O5J0PvsTLQDub0HzSjjq
 SRxj8y4Uoj+AZ/PShtyVnIGNP3A0CG6QIsocxQk=
X-Google-Smtp-Source: APXvYqxN6rzPwV6SgfLSq8WHDWc4aZp5GMyO3yIxI1MBqS7Sr88RA36IqA/PkPc463Ab9kmhKCLEsD4VG1vNd3bp8vA=
X-Received: by 2002:a19:ab01:: with SMTP id u1mr12946902lfe.78.1559637815239; 
 Tue, 04 Jun 2019 01:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-7-codekipper@gmail.com>
 <20190604075840.kquy3zcuckuzmvzr@flea>
In-Reply-To: <20190604075840.kquy3zcuckuzmvzr@flea>
From: Code Kipper <codekipper@gmail.com>
Date: Tue, 4 Jun 2019 10:43:23 +0200
Message-ID: <CAEKpxB=RdYF9eEvAJ+R7sT6OtdtBWjhMM1am+EhaN=9ZO9Gd2A@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v4 6/9] ASoC: sun4i-i2s: Add multi-lane
	functionality
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 4 Jun 2019 at 09:58, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Mon, Jun 03, 2019 at 07:47:32PM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > The i2s block supports multi-lane i2s output however this functionality
> > is only possible in earlier SoCs where the pins are exposed and for
> > the i2s block used for HDMI audio on the later SoCs.
> >
> > To enable this functionality, an optional property has been added to
> > the bindings.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
>
> I'd like to have Mark's input on this, but I'm really worried about
> the interaction with the proper TDM support.
>
> Our fundamental issue is that the controller can have up to 8
> channels, but either on 4 lines (instead of 1), or 8 channels on 1
> (like proper TDM) (or any combination between the two, but that should
> be pretty rare).

I understand...maybe the TDM needs to be extended to support this to consider
channel mapping and multiple transfer lines. I was thinking about the later when
someone was requesting support on IIRC a while ago, I thought masking might
of been a solution. These can wait as the only consumer at the moment is
LibreELEC and we can patch it there.
Do you have any ideas Master?
CK
>
> You're trying to do the first one, and I'm trying to do the second one.
>
> There's a number of assumptions later on that will break the TDM case,
> see below for examples
>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 44 ++++++++++++++++++++++++++++++++-----
> >  1 file changed, 39 insertions(+), 5 deletions(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index bca73b3c0d74..75217fb52bfa 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -23,7 +23,7 @@
> >
> >  #define SUN4I_I2S_CTRL_REG           0x00
> >  #define SUN4I_I2S_CTRL_SDO_EN_MASK           GENMASK(11, 8)
> > -#define SUN4I_I2S_CTRL_SDO_EN(sdo)                   BIT(8 + (sdo))
> > +#define SUN4I_I2S_CTRL_SDO_EN(lines)         (((1 << lines) - 1) << 8)
> >  #define SUN4I_I2S_CTRL_MODE_MASK             BIT(5)
> >  #define SUN4I_I2S_CTRL_MODE_SLAVE                    (1 << 5)
> >  #define SUN4I_I2S_CTRL_MODE_MASTER                   (0 << 5)
> > @@ -355,14 +355,23 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
> >       struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> >       int sr, wss, channels;
> >       u32 width;
> > +     int lines;
> >
> >       channels = params_channels(params);
> > -     if (channels != 2) {
> > +     if ((channels > dai->driver->playback.channels_max) ||
> > +             (channels < dai->driver->playback.channels_min)) {
> >               dev_err(dai->dev, "Unsupported number of channels: %d\n",
> >                       channels);
> >               return -EINVAL;
> >       }
> >
> > +     lines = (channels + 1) / 2;
> > +
> > +     /* Enable the required output lines */
> > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> > +                        SUN4I_I2S_CTRL_SDO_EN_MASK,
> > +                        SUN4I_I2S_CTRL_SDO_EN(lines));
> > +
>
> This has the assumption that each line will have 2 channels, which is wrong.
>
> >       if (i2s->variant->is_h3_i2s_based) {
> >               regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
> >                                  SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
> > @@ -373,8 +382,19 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
> >       }
> >
> >       /* Map the channels for playback and capture */
> > -     regmap_field_write(i2s->field_txchanmap, 0x76543210);
> >       regmap_field_write(i2s->field_rxchanmap, 0x00003210);
> > +     regmap_field_write(i2s->field_txchanmap, 0x10);
> > +     if (i2s->variant->is_h3_i2s_based) {
> > +             if (channels > 2)
> > +                     regmap_write(i2s->regmap,
> > +                                  SUN8I_I2S_TX_CHAN_MAP_REG+4, 0x32);
> > +             if (channels > 4)
> > +                     regmap_write(i2s->regmap,
> > +                                  SUN8I_I2S_TX_CHAN_MAP_REG+8, 0x54);
> > +             if (channels > 6)
> > +                     regmap_write(i2s->regmap,
> > +                                  SUN8I_I2S_TX_CHAN_MAP_REG+12, 0x76);
> > +     }
>
> And this creates a mapping matching that.
>
> >       /* Configure the channels */
> >       regmap_field_write(i2s->field_txchansel,
> > @@ -1057,9 +1077,10 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
> >  static int sun4i_i2s_probe(struct platform_device *pdev)
> >  {
> >       struct sun4i_i2s *i2s;
> > +     struct snd_soc_dai_driver *soc_dai;
> >       struct resource *res;
> >       void __iomem *regs;
> > -     int irq, ret;
> > +     int irq, ret, val;
> >
> >       i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
> >       if (!i2s)
> > @@ -1126,6 +1147,19 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
> >       i2s->capture_dma_data.addr = res->start + SUN4I_I2S_FIFO_RX_REG;
> >       i2s->capture_dma_data.maxburst = 8;
> >
> > +     soc_dai = devm_kmemdup(&pdev->dev, &sun4i_i2s_dai,
> > +                            sizeof(*soc_dai), GFP_KERNEL);
> > +     if (!soc_dai) {
> > +             ret = -ENOMEM;
> > +             goto err_pm_disable;
> > +     }
> > +
> > +     if (!of_property_read_u32(pdev->dev.of_node,
> > +                               "allwinner,playback-channels", &val)) {
> > +             if (val >= 2 && val <= 8)
> > +                     soc_dai->playback.channels_max = val;
> > +     }
> > +
>
> I'm not quite sure how this works.
>
> of_property_read_u32 will return 0, so you will enter in the
> condition. But what happens if the property is missing?
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
