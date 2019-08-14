Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2AA8D214
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 13:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD1E21666;
	Wed, 14 Aug 2019 13:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD1E21666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565781963;
	bh=kLq0Q6+UmTse9uZAy/bxQVKwFetu9a+UPGZLWc9icd4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oW/cwFYia88WBvnlcEH5rzDzfWcihy+Ti0Gyp/C+FPa/fxLFZBSKAATXH+/wqOycd
	 DMu1gyjx5ZgvXW3IpGBgzx57vYfqUGopLMKx5hb5mOiphjrXJrMkfFCOvmjsPTtw3t
	 jD5LlUtkYoF4ASrG5D5euQUVx9Ny+s4i5ZTSUC2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C4BDF8015A;
	Wed, 14 Aug 2019 13:24:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 685C9F803F4; Wed, 14 Aug 2019 13:24:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6DE6F8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 13:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6DE6F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PkjU82I1"
Received: by mail-lj1-x241.google.com with SMTP id u15so9478451ljl.3
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 04:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HUGbXBrBjsmS+Ai2+iPeBZiJZJaEtCScpBr1KbEOROc=;
 b=PkjU82I1Mi3dtcdhxyT5h+6hb39AQ7Nnc5myOYqUYUr53jt48ZbCascD3VQOPe2Smj
 I/9PI6CJfvkk2WhoN0gcrFQoW/LQM79KlXTQH+E+F1QCeDUggRHsl7nX2i9l3S/4MB2k
 OOw7gEQJZVJbWzTrNTaXGt31ef7zKCW5v9CUgEGFask9fTpgdMR0zEbCNF1BIFifTA7U
 xsaHsj8IHNtg+3SfpY/6bYIBAlgFWC1ovm+4vKdPYZ5NQp0OeK5kuO/cIzgqB7W3rFA9
 bFALrkGAmT8rc70l4IPUENm/VIr9YHIIldmT8r4ZTST4D8oF/DzX0+fU6TLOY6Cm3wZ5
 9yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HUGbXBrBjsmS+Ai2+iPeBZiJZJaEtCScpBr1KbEOROc=;
 b=D3giH04VDPs5jWoz4H0e8163dd4L4ybrIjtp8Z78lcsarV+0r8616LIlKKx4DQ0XB6
 ceSKYgXbkgnQPeYfJlXL6RS324zGEqZ47iBlritbD+F9EiMcPVke+v2B75Vg1BAFVPx2
 JXN4P1dx/97W7J3bp9ZHwBQr1jR/6SgGYWnvqhi6tRVKVuECZ6cUcOlgntsL4oeJi3hv
 Ix1Z09jMuHLWxYubP/A0eQODvHrhJGTTCFV6SN32ROMzFOo2uO98SseoKl2Q+EhDFoRx
 p1YCWmwcz1qe291EB1WJGjm+vN9CQwt0ATTFNUwmqerE6TvqhRtBK3GZ0PLofQaWoo2q
 i2nw==
X-Gm-Message-State: APjAAAUrmuw3xo0kIPH7jWBX6AO2sSahQTOytJqnLADDnEroq7AjGiYw
 xELTR+f/fPAJOck3OWQFFcSILBYMUx0DP5Eq76o=
X-Google-Smtp-Source: APXvYqxgpEOi0jWRp6ACiKPS+q5uwzg9P1kAtJ9h5fBMJgydx1ovY5LAQpvUapPlQtRQlyypTZYcDEFB68Ahw1aBhyo=
X-Received: by 2002:a2e:720c:: with SMTP id n12mr997564ljc.53.1565781877676;
 Wed, 14 Aug 2019 04:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-2-codekipper@gmail.com>
 <20190814064339.lgfngdkiaalygolk@flea>
In-Reply-To: <20190814064339.lgfngdkiaalygolk@flea>
From: Code Kipper <codekipper@gmail.com>
Date: Wed, 14 Aug 2019 13:24:26 +0200
Message-ID: <CAEKpxBkDGFUQTZXKUda71P02n2f4eDHJS0D4DdgbQN_JJE10cQ@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v5 01/15] ASoC: sun4i-i2s: Add regmap field
	to sign extend sample
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

On Wed, 14 Aug 2019 at 13:08, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> On Wed, Aug 14, 2019 at 08:08:40AM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > On the newer SoCs such as the H3 and A64 this is set by default
> > to transfer a 0 after each sample in each slot. However the A10
> > and A20 SoCs that this driver was developed on had a default
> > setting where it padded the audio gain with zeros.
> >
> > This isn't a problem whilst we have only support for 16bit audio
> > but with larger sample resolution rates in the pipeline then SEXT
> > bits should be cleared so that they also pad at the LSB. Without
> > this the audio gets distorted.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index 793457394efe..8201334a059b 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -135,6 +135,7 @@ struct sun4i_i2s;
> >   * @field_fmt_bclk: regmap field to set clk polarity.
> >   * @field_fmt_lrclk: regmap field to set frame polarity.
> >   * @field_fmt_mode: regmap field to set the operational mode.
> > + * @field_fmt_sext: regmap field to set the sign extension.
> >   * @field_txchanmap: location of the tx channel mapping register.
> >   * @field_rxchanmap: location of the rx channel mapping register.
> >   * @field_txchansel: location of the tx channel select bit fields.
> > @@ -159,6 +160,7 @@ struct sun4i_i2s_quirks {
> >       struct reg_field                field_fmt_bclk;
> >       struct reg_field                field_fmt_lrclk;
> >       struct reg_field                field_fmt_mode;
> > +     struct reg_field                field_fmt_sext;
> >       struct reg_field                field_txchanmap;
> >       struct reg_field                field_rxchanmap;
> >       struct reg_field                field_txchansel;
> > @@ -186,6 +188,7 @@ struct sun4i_i2s {
> >       struct regmap_field     *field_fmt_bclk;
> >       struct regmap_field     *field_fmt_lrclk;
> >       struct regmap_field     *field_fmt_mode;
> > +     struct regmap_field     *field_fmt_sext;
> >       struct regmap_field     *field_txchanmap;
> >       struct regmap_field     *field_rxchanmap;
> >       struct regmap_field     *field_txchansel;
> > @@ -345,6 +348,9 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
> >                                  SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
> >                                  SUN8I_I2S_FMT0_LRCK_PERIOD(32));
> >
> > +     /* Set sign extension to pad out LSB with 0 */
> > +     regmap_field_write(i2s->field_fmt_sext, 0);
> > +
> >       return 0;
> >  }
> >
> > @@ -917,6 +923,7 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
> >       .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
> >       .has_slave_select_bit   = true,
> >       .field_fmt_mode         = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
> > +     .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
> >       .field_txchanmap        = REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
> >       .field_rxchanmap        = REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
> >       .field_txchansel        = REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
> > @@ -936,6 +943,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
> >       .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
> >       .has_slave_select_bit   = true,
> >       .field_fmt_mode         = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
> > +     .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
> >       .field_txchanmap        = REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
> >       .field_rxchanmap        = REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
> >       .field_txchansel        = REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
> > @@ -979,6 +987,7 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
> >       .field_fmt_bclk         = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
> >       .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 19, 19),
> >       .field_fmt_mode         = REG_FIELD(SUN4I_I2S_CTRL_REG, 4, 5),
> > +     .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 4, 5),
> >       .field_txchanmap        = REG_FIELD(SUN8I_I2S_TX_CHAN_MAP_REG, 0, 31),
> >       .field_rxchanmap        = REG_FIELD(SUN8I_I2S_RX_CHAN_MAP_REG, 0, 31),
> >       .field_txchansel        = REG_FIELD(SUN8I_I2S_TX_CHAN_SEL_REG, 0, 2),
> > @@ -998,6 +1007,7 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
> >       .field_fmt_bclk         = REG_FIELD(SUN4I_I2S_FMT0_REG, 6, 6),
> >       .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
> >       .field_fmt_mode         = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
> > +     .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
> >       .field_txchanmap        = REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
> >       .field_rxchanmap        = REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
> >       .field_txchansel        = REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
>
> You're missing the A83t here

ARRGGGHHHHH...ACK...thanks,
CK
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
