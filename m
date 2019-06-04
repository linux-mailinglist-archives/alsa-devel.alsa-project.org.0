Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B9345DD
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 13:48:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE879168B;
	Tue,  4 Jun 2019 13:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE879168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559648901;
	bh=TOyqlNW6F+x0wOmj0Nfm4v0TvBVmskuTLUCML5scv1g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dGOkN4G5zGCF+Jc4bKwVvvNtixDckp5pGzb7jNcnqMfVQD/zPZc2ewMho9BY8frOy
	 nKX9eknGeCRzp9UMfgSg2yG17ltIUmT/HgeSCpQXvFa3ydeIub9TJ7M352N9TM8Maf
	 QvCqwA1uZe81z0yykiJAtaLCztDLoMdVfHUv7W0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EB02F896F7;
	Tue,  4 Jun 2019 13:46:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5FCF896F8; Tue,  4 Jun 2019 13:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 147D8F896EF
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 13:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 147D8F896EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MxfJmMNa"
Received: by mail-lj1-x244.google.com with SMTP id 16so5768654ljv.10
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tAJHzdtoUHBGcl/ayUBAfIA8bNQX6pMqdoZW2RgjLw8=;
 b=MxfJmMNaRkzihyUPNF6atM911sUNuCUizSvuv0oNDUFV9WWwPX5jZbwllidOdbgwqn
 hOHRyselYkHjWCb/JyFMvF7EqwgpFXr8lIgi7xJfZHfoe9YWACUt8sGeE0puDLvSMKlE
 WHFUVnSDjfz0ftC5hCi/mA61LuFFITvuBoe2Zc4BZx/w1zGQ4+bgjyVhdYTnHjYnEY6o
 Ef0w1M+5NW7rWY/ziXa2+JlNNUhOMnozExj0lTimQGQPkMV7qKREFbl1+P0LUO8JwiVl
 WuOWgEOGza80fOa0AATy0POyWYX/pbm9CPz1gBqjz6r9bKAZYMBUte/5EKE3SM3cResT
 riBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tAJHzdtoUHBGcl/ayUBAfIA8bNQX6pMqdoZW2RgjLw8=;
 b=mdbhEYKQDBPJQLFTHErpQKEJDfzzdSsgZIbnEuohzZPYKwYu0sFu3EoFadE6s9t9eK
 TxWsYlqOoV9DHd8OeSvymA7jRDHBbrS4O9ZwqQGWzIwWWHXf2zHZqvaM8jHsaSPgezYQ
 m554mug1u1xThEaJQH8H/0dr6VaugIGbAOzeJbqdyP3pEAP8+AjaMyypGpFDxFeJTO/F
 FB3oJZRaJPdclF38fsQaC1YzdsLCjWstR2G/vSovEZG/GSwEyE0n1wAAJSqMsaXEoOYK
 pkvMmGABKUqxxZ9wLkYSw3Q8uVhkNiI52IKHytrXiIVPBJHkmcQwEfgHldQMcJ9OSjM1
 notg==
X-Gm-Message-State: APjAAAUcaD+henNoDLhywVkzeI+y9p44IzZFulzCJKNetDqk0trwUdkY
 IBwSwZJES9oBcWPz3IQ3orboC6ub2F8lpGmhYQQ=
X-Google-Smtp-Source: APXvYqxETLRosCoZ7Yw7GzrbRjReXddCRP3sa4I467L9SGwoKgWaLtcI36oqbAY+jJUssD7dP9zolGJjPLweS4I39JM=
X-Received: by 2002:a2e:5b1b:: with SMTP id p27mr7121973ljb.97.1559648789873; 
 Tue, 04 Jun 2019 04:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-4-codekipper@gmail.com>
 <CAGb2v65vfQEiXYN6rvdfP6rAvXRVTAnCzxEgpjsJAkDJ16Y+rg@mail.gmail.com>
In-Reply-To: <CAGb2v65vfQEiXYN6rvdfP6rAvXRVTAnCzxEgpjsJAkDJ16Y+rg@mail.gmail.com>
From: Code Kipper <codekipper@gmail.com>
Date: Tue, 4 Jun 2019 13:46:17 +0200
Message-ID: <CAEKpxBme2KTNrtb3GpB+UPF5LHbj=iqngu5jrYpFecCZ9d8Whw@mail.gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v4 3/9] ASoC: sun4i-i2s: Add
 regmap field to sign extend sample
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

On Tue, 4 Jun 2019 at 09:53, Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Tue, Jun 4, 2019 at 1:47 AM <codekipper@gmail.com> wrote:
> >
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > On the newer SoCs this is set by default to transfer a 0 after
> > each sample in each slot. However the platform that this driver
> > was developed on had the default setting where it padded the
> > audio gain with zeros. This isn't a problem whilst we have only
> > support for 16bit audio but with larger sample resolution rates
> > in the pipeline then it should be fixed to also pad. Without this
> > the audio gets distorted.
>
> Curious, both the A10 and A20 manuals say the default value for this
> field is 0, which means 0 padding.
>
> sun4i_i2s_reg_defaults[] also has that field set to 0.
>
> You're saying you are seeing the field set to 1?

On the newer SoCs (H3 onwards) this setting defaults to 3 which is
"Transfer 0 after each sample in each slot" which resulted in distortion.
Setting SEXT to 0 "Zeros or audio gain padding at LSB" alligns the
setup with that of the earlier block and fixed the issue we were hearing.
It's really noticeable with HDMI audio.
BR,
CK
>
> ChenYu
>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index fd7c37596f21..e2961d8f6e8c 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -134,6 +134,7 @@
> >   * @field_fmt_bclk: regmap field to set clk polarity.
> >   * @field_fmt_lrclk: regmap field to set frame polarity.
> >   * @field_fmt_mode: regmap field to set the operational mode.
> > + * @field_fmt_sext: regmap field to set the sign extension.
> >   * @field_txchanmap: location of the tx channel mapping register.
> >   * @field_rxchanmap: location of the rx channel mapping register.
> >   * @field_txchansel: location of the tx channel select bit fields.
> > @@ -159,6 +160,7 @@ struct sun4i_i2s_quirks {
> >         struct reg_field                field_fmt_bclk;
> >         struct reg_field                field_fmt_lrclk;
> >         struct reg_field                field_fmt_mode;
> > +       struct reg_field                field_fmt_sext;
> >         struct reg_field                field_txchanmap;
> >         struct reg_field                field_rxchanmap;
> >         struct reg_field                field_txchansel;
> > @@ -183,6 +185,7 @@ struct sun4i_i2s {
> >         struct regmap_field     *field_fmt_bclk;
> >         struct regmap_field     *field_fmt_lrclk;
> >         struct regmap_field     *field_fmt_mode;
> > +       struct regmap_field     *field_fmt_sext;
> >         struct regmap_field     *field_txchanmap;
> >         struct regmap_field     *field_rxchanmap;
> >         struct regmap_field     *field_txchansel;
> > @@ -342,6 +345,9 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
> >                                    SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
> >                                    SUN8I_I2S_FMT0_LRCK_PERIOD(32));
> >
> > +       /* Set sign extension to pad out LSB with 0 */
> > +       regmap_field_write(i2s->field_fmt_sext, 0);
> > +
> >         return 0;
> >  }
> >
> > @@ -887,6 +893,7 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
> >         .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
> >         .has_slave_select_bit   = true,
> >         .field_fmt_mode         = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
> > +       .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
> >         .field_txchanmap        = REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
> >         .field_rxchanmap        = REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
> >         .field_txchansel        = REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
> > @@ -904,6 +911,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
> >         .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
> >         .has_slave_select_bit   = true,
> >         .field_fmt_mode         = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
> > +       .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
> >         .field_txchanmap        = REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
> >         .field_rxchanmap        = REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
> >         .field_txchansel        = REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
> > @@ -944,6 +952,7 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
> >         .field_fmt_bclk         = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
> >         .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 19, 19),
> >         .field_fmt_mode         = REG_FIELD(SUN4I_I2S_CTRL_REG, 4, 5),
> > +       .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 4, 5),
> >         .field_txchanmap        = REG_FIELD(SUN8I_I2S_TX_CHAN_MAP_REG, 0, 31),
> >         .field_rxchanmap        = REG_FIELD(SUN8I_I2S_RX_CHAN_MAP_REG, 0, 31),
> >         .field_txchansel        = REG_FIELD(SUN8I_I2S_TX_CHAN_SEL_REG, 0, 2),
> > @@ -1006,6 +1015,12 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
> >         if (IS_ERR(i2s->field_fmt_mode))
> >                 return PTR_ERR(i2s->field_fmt_mode);
> >
> > +       i2s->field_fmt_sext =
> > +                       devm_regmap_field_alloc(dev, i2s->regmap,
> > +                                               i2s->variant->field_fmt_sext);
> > +       if (IS_ERR(i2s->field_fmt_sext))
> > +               return PTR_ERR(i2s->field_fmt_sext);
> > +
> >         i2s->field_txchanmap =
> >                         devm_regmap_field_alloc(dev, i2s->regmap,
> >                                                 i2s->variant->field_txchanmap);
> > --
> > 2.21.0
> >
> > --
> > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20190603174735.21002-4-codekipper%40gmail.com.
> > For more options, visit https://groups.google.com/d/optout.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
