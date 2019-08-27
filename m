Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DFC9E4F4
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 11:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B16D21667;
	Tue, 27 Aug 2019 11:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B16D21667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566899643;
	bh=4vypWZQMCw7Ema55bn3h4OQ4sid7RwFfBc4Wmr/fdFc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J0ao5t8LmVCLrQ6X5HannZK27ePj62tUjAJSQ9vypAanZONIkVsbtjcHZqEM2CIkh
	 SPuqpeetU+8TdNsqqR7HrRQn/gy4Cjjg8neb8GFtE3S5AIUKQflc4O/s7brUMl+N45
	 N+BD85V9N5beOpv4ayDDMWolCxnTBS0V2EHoZ5Lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BFDCF802A0;
	Tue, 27 Aug 2019 11:52:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70769F80274; Tue, 27 Aug 2019 11:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5599DF80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 11:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5599DF80142
Received: by mail-ed1-f67.google.com with SMTP id h13so30511374edq.10
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 02:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rc+av+2pK1nD1xvCN1Qm/YJr4PtOyial+kNBUV8i24U=;
 b=ozic864iH63Cska9iC5YvhhICuotIE7AdBgYpHQ+amPgaAfDUv/vVzXq1u4WoUWesg
 GpluA9TZUD8Ef5JujtpBUFaFHtPHT5VSsR6oCudrS4ppMsDgCsgSjCle35S3ONM5r9Pm
 /TJYAQ2IPnkO0cpOtvl3OhhaX5l8YJM84mMwQB05rWhvbnsxeDxD4G6qdq/goSocCKRy
 EkzPnEJmrBbWLtvqwo7UjduzgPAVblFcl7Whjm+rOTkWbHOM+V5yv7erNzNSBJuYS+zM
 gqLrQoI6nZ7kZjhEjxzWTqarx193YE0q3Y+mGeKCH535hztBuFFmahUx02/eP0YWffgU
 0JPg==
X-Gm-Message-State: APjAAAW59Mc+Jnsh03UDoQssDVULrPW1QjhBBjw+6okcOwvAc/DTWcSw
 llagrw+Rjcq3zYu+tTF2ovGm/vG1JCo=
X-Google-Smtp-Source: APXvYqy6uhFuJzbEbiH+1vrVL6QGNHTZsT0tXtjOCEXXXb7Cqn4KMO73V/cQ6oMzYMi16eSdCwJ12g==
X-Received: by 2002:a17:906:7f8a:: with SMTP id
 f10mr20199583ejr.301.1566899531198; 
 Tue, 27 Aug 2019 02:52:11 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43])
 by smtp.gmail.com with ESMTPSA id k12sm1823839edr.84.2019.08.27.02.52.10
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2019 02:52:10 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id g67so2331307wme.1
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 02:52:10 -0700 (PDT)
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr26674457wmf.47.1566899530466; 
 Tue, 27 Aug 2019 02:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190827093206.17919-1-mripard@kernel.org>
 <20190827093206.17919-2-mripard@kernel.org>
In-Reply-To: <20190827093206.17919-2-mripard@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 27 Aug 2019 17:51:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v64u+Q87woZpVbRLfwn=ocbx9QJeANYiALZ7x7rdDFXc=w@mail.gmail.com>
Message-ID: <CAGb2v64u+Q87woZpVbRLfwn=ocbx9QJeANYiALZ7x7rdDFXc=w@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Code Kipper <codekipper@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: sun4i: Revert A83t description
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

On Tue, Aug 27, 2019 at 5:32 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The last set of reworks included some fixes to change the A83t behaviour
> and "fix" it.
>
> It turns out that the controller described in the datasheet and the one
> supported here are not the same, yet the A83t has the two of them, and the
> one supported in the driver wasn't the one described in the datasheet.
>
> Fix this by reintroducing the proper quirks.
>
> Fixes: 69e450e50ca6 ("ASoC: sun4i-i2s: Fix the LRCK period on A83t")
> Fixes: bf943d527987 ("ASoC: sun4i-i2s: Fix MCLK Enable bit offset on A83t")
> Fixes: 2e04fc4dbf50 ("ASoC: sun4i-i2s: Fix WSS and SR fields for the A83t")
> Fixes: 515fcfbc7736 ("ASoC: sun4i-i2s: Fix LRCK and BCLK polarity offsets on newer SoCs")
> Fixes: c1d3a921d72b ("ASoC: sun4i-i2s: Fix the MCLK and BCLK dividers on newer SoCs")
> Fixes: fb19739d7f68 ("ASoC: sun4i-i2s: Use module clock as BCLK parent on newer SoCs")
> Fixes: 71137bcd0a9a ("ASoC: sun4i-i2s: Move the format configuration to a callback")
> Fixes: d70be625f25a ("ASoC: sun4i-i2s: Move the channel configuration to a callback")
> Reported-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index a6a3f772fdf0..498ceebd9135 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -1106,18 +1106,18 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
>         .has_reset              = true,
>         .reg_offset_txdata      = SUN8I_I2S_FIFO_TX_REG,
>         .sun4i_i2s_regmap       = &sun4i_i2s_regmap_config,
> -       .field_clkdiv_mclk_en   = REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
> -       .field_fmt_wss          = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
> -       .field_fmt_sr           = REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
> -       .bclk_dividers          = sun8i_i2s_clk_div,
> -       .num_bclk_dividers      = ARRAY_SIZE(sun8i_i2s_clk_div),
> -       .mclk_dividers          = sun8i_i2s_clk_div,
> -       .num_mclk_dividers      = ARRAY_SIZE(sun8i_i2s_clk_div),
> -       .get_bclk_parent_rate   = sun8i_i2s_get_bclk_parent_rate,
> -       .get_sr                 = sun8i_i2s_get_sr_wss,
> -       .get_wss                = sun8i_i2s_get_sr_wss,
> -       .set_chan_cfg           = sun8i_i2s_set_chan_cfg,
> -       .set_fmt                = sun8i_i2s_set_soc_fmt,
> +       .field_clkdiv_mclk_en   = REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 7, 7),
> +       .field_fmt_wss          = REG_FIELD(SUN4I_I2S_FMT0_REG, 2, 3),
> +       .field_fmt_sr           = REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
> +       .bclk_dividers          = sun4i_i2s_bclk_div,
> +       .num_bclk_dividers      = ARRAY_SIZE(sun4i_i2s_bclk_div),
> +       .mclk_dividers          = sun4i_i2s_mclk_div,
> +       .num_mclk_dividers      = ARRAY_SIZE(sun4i_i2s_mclk_div),
> +       .get_bclk_parent_rate   = sun4i_i2s_get_bclk_parent_rate,
> +       .get_sr                 = sun4i_i2s_get_sr_wss,
> +       .get_wss                = sun4i_i2s_get_sr_wss,

You want sun4i_i2s_get_sr and sun4i_i2s_get_wss here.

Otherwise, with both patches applied, I2S on the A83T returns to normal.

Tested-by: Chen-Yu Tsai <wens@csie.org>

on the Bananapi-M3 with a PiFi DAC v2.0 (has PCM5122) connected.
16bit stereo 44.1kHz, 48kHz, and 96kHz samples tested.

> +       .set_chan_cfg           = sun4i_i2s_set_chan_cfg,
> +       .set_fmt                = sun4i_i2s_set_soc_fmt,
>  };
>
>  static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
> --
> 2.21.0
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
