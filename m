Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4F8CE9F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 10:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B44A61675;
	Wed, 14 Aug 2019 10:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B44A61675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565772005;
	bh=//7F04q5Ueewtj74bqHCHPwsj76gGMPuwSRmAnrF28c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbthn2aqhSBIpHyE2jGSa9sqF2xQeRA6ubk8gafVmPrRalQ3YdRFGH5ewXyGEx11t
	 /A1o2eMlZkMqkDuNhKBz4+R9z3BQzHfAvrlxsfeOOnDRe1Gdd2IPRAhIg1tleFT+16
	 lRdkg6FIh5k0l/THmcqdw8V3Yl2YO2NNSA+y58E8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 216BAF80268;
	Wed, 14 Aug 2019 10:38:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B28CF80214; Wed, 14 Aug 2019 10:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLY,FROM_EXCESS_BASE64,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7989F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 10:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7989F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ltlAGtUz"
Received: by mail-wm1-x341.google.com with SMTP id m125so3684815wmm.3
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ss3ykB/e733BEBWwIVPUSJTuhl3UWTyezbyVNGjf0SI=;
 b=ltlAGtUzyH1E/WYoIuA6t1M2IYW9GB6+wHg+pt3UbEcSyIMm9pb3pGRW1Ae3yqG4oS
 S4triQ/F5H3FxXdqdmb0vJH9CknjXq85n5nyHbEtoLpo3Ua0dAA6jegPSpx+yDRp0lKy
 qe8G+KWp4kv9XYXxiZNFwLuH2WxKSF9NNExeYJjKzXvSEfDSFNl0VyHQ9SEehpTqJrIa
 7qP2eVA1kQUX3d4uopEnXlj67HQceSPs3oLiE5i2IZWaMGD165T9w5JG/fFwIEqtiJGY
 tYDL9LzCm9CmWYzmFyk68qYLBmRc995t/wAEOmRfyUARzDaZJ6PcZFQOq+XpL4h5q1to
 V7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ss3ykB/e733BEBWwIVPUSJTuhl3UWTyezbyVNGjf0SI=;
 b=PlmVVLpGKeaecQHBn8YX8P8aiU+6+8gR1uwlUSypKKOVwGSr/QCpu2slF29ZSPaJDp
 6xEEpaol5ze7tz9l9mKCE4vWy3yb3ogKw5S/wuSrevwqmNzH+1LvBeBZwUuM8MaWtfpY
 LbHc4QWhBhUldvsy5ijzqJbh4QmzRagpUPWBqQ2JC/G5lDfYmdXp/kgJyO7BAYS76OCP
 rj0zcxgJ8hzXZy6j75f0flOWPFk4jyh9ySn+Q6lKsL9/Sr0199hnLNTlBurx420+kMix
 hFaR65UT8Qx7Gc4y8ex6E/POeT/n5a+rmgtm1RGxQqb0NzcwOU05zIbE1tWF5Dt9fIjQ
 dOMA==
X-Gm-Message-State: APjAAAVzsLRyRMpPJwPhi9BBXlXnyDjO5hT+oDvQuoEKT6t3m2xiM8Oe
 DGPWWsRgIDO+u4CR7RoRWreCxEvP2K8=
X-Google-Smtp-Source: APXvYqxfBzQeFDvyuR2DGLqjv3kSBQPokkChEo3r8QnrPwWXcv7zOtPSRRB3fWQpU3jEfo1e6gz0QQ==
X-Received: by 2002:a7b:c651:: with SMTP id q17mr6661342wmk.136.1565771874804; 
 Wed, 14 Aug 2019 01:37:54 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net.
 [89.212.178.211])
 by smtp.gmail.com with ESMTPSA id u130sm6528950wmg.28.2019.08.14.01.37.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 01:37:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com, codekipper@gmail.com
Date: Wed, 14 Aug 2019 10:37:52 +0200
Message-ID: <3741744.8c7tOhJ1tT@jernej-laptop>
In-Reply-To: <20190814060854.26345-16-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-16-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, be17068@iperbole.bo.it, wens@csie.org, broonie@kernel.org,
 maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v5 15/15] ASoC: sun4i-i2s:
	Adjust regmap settings
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

Hi!

Dne sreda, 14. avgust 2019 ob 08:08:54 CEST je codekipper@gmail.com 
napisal(a):
> From: Marcus Cooper <codekipper@gmail.com>
> 
> Bypass the regmap cache when flushing the i2s FIFOs and modify the tables
> to reflect this.
> 
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 31 ++++++++++---------------------
>  1 file changed, 10 insertions(+), 21 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index d3c8789f70bb..ecfc1ed79379 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -876,9 +876,11 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai,
> unsigned int fmt) static void sun4i_i2s_start_capture(struct sun4i_i2s
> *i2s)
>  {
>  	/* Flush RX FIFO */
> +	regcache_cache_bypass(i2s->regmap, true);
>  	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
>  			   SUN4I_I2S_FIFO_CTRL_FLUSH_RX,
>  			   SUN4I_I2S_FIFO_CTRL_FLUSH_RX);
> +	regcache_cache_bypass(i2s->regmap, false);

Did you try with regmap_write_bits() instead? This function will 
unconditionally write bits so it's nicer solution, because you don't have to 
use regcache_cache_bypass().

> 
>  	/* Clear RX counter */
>  	regmap_write(i2s->regmap, SUN4I_I2S_RX_CNT_REG, 0);
> @@ -897,9 +899,11 @@ static void sun4i_i2s_start_capture(struct sun4i_i2s
> *i2s) static void sun4i_i2s_start_playback(struct sun4i_i2s *i2s)
>  {
>  	/* Flush TX FIFO */
> +	regcache_cache_bypass(i2s->regmap, true);
>  	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
>  			   SUN4I_I2S_FIFO_CTRL_FLUSH_TX,
>  			   SUN4I_I2S_FIFO_CTRL_FLUSH_TX);
> +	regcache_cache_bypass(i2s->regmap, false);

Ditto.

> 
>  	/* Clear TX counter */
>  	regmap_write(i2s->regmap, SUN4I_I2S_TX_CNT_REG, 0);
> @@ -1053,13 +1057,7 @@ static const struct snd_soc_component_driver
> sun4i_i2s_component = {
> 
>  static bool sun4i_i2s_rd_reg(struct device *dev, unsigned int reg)
>  {
> -	switch (reg) {
> -	case SUN4I_I2S_FIFO_TX_REG:
> -		return false;
> -
> -	default:
> -		return true;
> -	}
> +	return true;

Why did you change this? Manual mentions that SUN4I_I2S_FIFO_TX_REG is write-
only register. Even if it can be read, then it's better to remove whole 
function, which will automatically mean that all registers can be read.


>  }
> 
>  static bool sun4i_i2s_wr_reg(struct device *dev, unsigned int reg)
> @@ -1078,6 +1076,8 @@ static bool sun4i_i2s_volatile_reg(struct device *dev,
> unsigned int reg) {
>  	switch (reg) {
>  	case SUN4I_I2S_FIFO_RX_REG:
> +	case SUN4I_I2S_FIFO_TX_REG:
> +	case SUN4I_I2S_FIFO_STA_REG:
>  	case SUN4I_I2S_INT_STA_REG:
>  	case SUN4I_I2S_RX_CNT_REG:
>  	case SUN4I_I2S_TX_CNT_REG:

SUN4I_I2S_FIFO_CTRL_REG should be put here, because it has two bits which 
returns to 0 immediately after they are set to 1.

Best regards,
Jernej

> @@ -1088,23 +1088,12 @@ static bool sun4i_i2s_volatile_reg(struct device
> *dev, unsigned int reg) }
>  }
> 
> -static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
> -{
> -	switch (reg) {
> -	case SUN8I_I2S_FIFO_TX_REG:
> -		return false;
> -
> -	default:
> -		return true;
> -	}
> -}
> -
>  static bool sun8i_i2s_volatile_reg(struct device *dev, unsigned int reg)
>  {
>  	if (reg == SUN8I_I2S_INT_STA_REG)
>  		return true;
>  	if (reg == SUN8I_I2S_FIFO_TX_REG)
> -		return false;
> +		return true;
> 
>  	return sun4i_i2s_volatile_reg(dev, reg);
>  }
> @@ -1175,7 +1164,7 @@ static const struct regmap_config
> sun8i_i2s_regmap_config = { .reg_defaults	= sun8i_i2s_reg_defaults,
>  	.num_reg_defaults	= ARRAY_SIZE(sun8i_i2s_reg_defaults),
>  	.writeable_reg	= sun4i_i2s_wr_reg,
> -	.readable_reg	= sun8i_i2s_rd_reg,
> +	.readable_reg	= sun4i_i2s_rd_reg,
>  	.volatile_reg	= sun8i_i2s_volatile_reg,
>  };
> 
> @@ -1188,7 +1177,7 @@ static const struct regmap_config
> sun50i_i2s_regmap_config = { .reg_defaults	= sun50i_i2s_reg_defaults,
>  	.num_reg_defaults	= ARRAY_SIZE(sun50i_i2s_reg_defaults),
>  	.writeable_reg	= sun4i_i2s_wr_reg,
> -	.readable_reg	= sun8i_i2s_rd_reg,
> +	.readable_reg	= sun4i_i2s_rd_reg,
>  	.volatile_reg	= sun8i_i2s_volatile_reg,
>  };




_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
