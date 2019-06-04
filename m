Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AECEE340D1
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 09:55:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4265A16C8;
	Tue,  4 Jun 2019 09:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4265A16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559634948;
	bh=W/IHd52gkGmtAMiS7xschCEC3m6AayZ24jWnTeeE5Dk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FDXH7dADJJXeHpNdvfQ/4dpgUKQGdQtZVm74R4cRvwXUO8wH4B25IjR1ssrWz+CAA
	 bZlOPYBisyJNYo3atSOhmUeyWWmunh2qDguGK3MxlkC2sTYoVFbSe1Kzx+rDcN5C60
	 oi9cnj/8aNRKA2XrarCNXRBVe0WWE1WbEhLtl9IM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9423F896FE;
	Tue,  4 Jun 2019 09:54:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF502F896F7; Tue,  4 Jun 2019 09:54:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C21EF80054
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 09:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C21EF80054
Received: by mail-ed1-f68.google.com with SMTP id w33so30624393edb.10
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 00:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aB9PHKPiyzkndYybRF10NmFg3rVLDNHgbfKcERc7zQk=;
 b=VEu9lbgmr5QkCYkuEJcvSWGIiycAi4YvlgHDpaIbPiJtAOWI3CAETnUgzQm9jwkjS1
 34YWHBsOewNzN2ixBjGi4fz55SI3dfrZf+8l02RQ5nW2PGnd9QF614xKCzBESoAsVAGG
 Z0SRJrV5hjw1cbNugPggBFGpHIsm21CJS5ucszAU+QGgouqsiaAtuvYyUxvi7ngW2Zqk
 j2bUUklkmAxJJr9egIE4y7hHglc9lS81ZRpJHst1PPL0G62W2HmpP7beSYM/xdjzS2if
 lDcE9FJwn/gPhfFxiMAgcUlsNIIrR3B7oxoEqMjW2dojPNhbDU53aAh3KY/9B6oNJkrs
 GbpQ==
X-Gm-Message-State: APjAAAX8d2Q6JukYkVbQ3+k+Y2GHiLE4aghTcF3RFb3jQLi89r97DLlH
 G9pJyMW2QFsLuSk4dow8bgo4XrR/dRM=
X-Google-Smtp-Source: APXvYqyXly70v9MsGkZwymPagi3EnheXR61BUVmwxFdO2RNSrGSC24fNTNnR/ieUplNKbDPWjifDyA==
X-Received: by 2002:a17:906:4755:: with SMTP id
 j21mr28340535ejs.3.1559634837247; 
 Tue, 04 Jun 2019 00:53:57 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id c26sm1022274edw.92.2019.06.04.00.53.56
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 00:53:56 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id w9so1641899wmd.1
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 00:53:56 -0700 (PDT)
X-Received: by 2002:a1c:3942:: with SMTP id g63mr15671103wma.61.1559634836417; 
 Tue, 04 Jun 2019 00:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-4-codekipper@gmail.com>
In-Reply-To: <20190603174735.21002-4-codekipper@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 4 Jun 2019 15:53:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v65vfQEiXYN6rvdfP6rAvXRVTAnCzxEgpjsJAkDJ16Y+rg@mail.gmail.com>
Message-ID: <CAGb2v65vfQEiXYN6rvdfP6rAvXRVTAnCzxEgpjsJAkDJ16Y+rg@mail.gmail.com>
To: Code Kipper <codekipper@gmail.com>
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

On Tue, Jun 4, 2019 at 1:47 AM <codekipper@gmail.com> wrote:
>
> From: Marcus Cooper <codekipper@gmail.com>
>
> On the newer SoCs this is set by default to transfer a 0 after
> each sample in each slot. However the platform that this driver
> was developed on had the default setting where it padded the
> audio gain with zeros. This isn't a problem whilst we have only
> support for 16bit audio but with larger sample resolution rates
> in the pipeline then it should be fixed to also pad. Without this
> the audio gets distorted.

Curious, both the A10 and A20 manuals say the default value for this
field is 0, which means 0 padding.

sun4i_i2s_reg_defaults[] also has that field set to 0.

You're saying you are seeing the field set to 1?

ChenYu

> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index fd7c37596f21..e2961d8f6e8c 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -134,6 +134,7 @@
>   * @field_fmt_bclk: regmap field to set clk polarity.
>   * @field_fmt_lrclk: regmap field to set frame polarity.
>   * @field_fmt_mode: regmap field to set the operational mode.
> + * @field_fmt_sext: regmap field to set the sign extension.
>   * @field_txchanmap: location of the tx channel mapping register.
>   * @field_rxchanmap: location of the rx channel mapping register.
>   * @field_txchansel: location of the tx channel select bit fields.
> @@ -159,6 +160,7 @@ struct sun4i_i2s_quirks {
>         struct reg_field                field_fmt_bclk;
>         struct reg_field                field_fmt_lrclk;
>         struct reg_field                field_fmt_mode;
> +       struct reg_field                field_fmt_sext;
>         struct reg_field                field_txchanmap;
>         struct reg_field                field_rxchanmap;
>         struct reg_field                field_txchansel;
> @@ -183,6 +185,7 @@ struct sun4i_i2s {
>         struct regmap_field     *field_fmt_bclk;
>         struct regmap_field     *field_fmt_lrclk;
>         struct regmap_field     *field_fmt_mode;
> +       struct regmap_field     *field_fmt_sext;
>         struct regmap_field     *field_txchanmap;
>         struct regmap_field     *field_rxchanmap;
>         struct regmap_field     *field_txchansel;
> @@ -342,6 +345,9 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
>                                    SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
>                                    SUN8I_I2S_FMT0_LRCK_PERIOD(32));
>
> +       /* Set sign extension to pad out LSB with 0 */
> +       regmap_field_write(i2s->field_fmt_sext, 0);
> +
>         return 0;
>  }
>
> @@ -887,6 +893,7 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
>         .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
>         .has_slave_select_bit   = true,
>         .field_fmt_mode         = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
> +       .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
>         .field_txchanmap        = REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
>         .field_rxchanmap        = REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
>         .field_txchansel        = REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
> @@ -904,6 +911,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
>         .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
>         .has_slave_select_bit   = true,
>         .field_fmt_mode         = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
> +       .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
>         .field_txchanmap        = REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
>         .field_rxchanmap        = REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
>         .field_txchansel        = REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
> @@ -944,6 +952,7 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
>         .field_fmt_bclk         = REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
>         .field_fmt_lrclk        = REG_FIELD(SUN4I_I2S_FMT0_REG, 19, 19),
>         .field_fmt_mode         = REG_FIELD(SUN4I_I2S_CTRL_REG, 4, 5),
> +       .field_fmt_sext         = REG_FIELD(SUN4I_I2S_FMT1_REG, 4, 5),
>         .field_txchanmap        = REG_FIELD(SUN8I_I2S_TX_CHAN_MAP_REG, 0, 31),
>         .field_rxchanmap        = REG_FIELD(SUN8I_I2S_RX_CHAN_MAP_REG, 0, 31),
>         .field_txchansel        = REG_FIELD(SUN8I_I2S_TX_CHAN_SEL_REG, 0, 2),
> @@ -1006,6 +1015,12 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
>         if (IS_ERR(i2s->field_fmt_mode))
>                 return PTR_ERR(i2s->field_fmt_mode);
>
> +       i2s->field_fmt_sext =
> +                       devm_regmap_field_alloc(dev, i2s->regmap,
> +                                               i2s->variant->field_fmt_sext);
> +       if (IS_ERR(i2s->field_fmt_sext))
> +               return PTR_ERR(i2s->field_fmt_sext);
> +
>         i2s->field_txchanmap =
>                         devm_regmap_field_alloc(dev, i2s->regmap,
>                                                 i2s->variant->field_txchanmap);
> --
> 2.21.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20190603174735.21002-4-codekipper%40gmail.com.
> For more options, visit https://groups.google.com/d/optout.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
