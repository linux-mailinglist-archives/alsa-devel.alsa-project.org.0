Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6248CE69
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 10:29:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2886386E;
	Wed, 14 Aug 2019 10:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2886386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565771359;
	bh=Qc5J1aAZotloSP/dw28GTGEUKY8V9GGiaBkzC100h44=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IZLnHWX1cmV6gZ+d4EnDiwYuXZs2Rz969o/OpgWoWQh844Y/1+ubwzWRGNZs7IdcI
	 WOZ9F7R/n028WHJyngwNRPhpJu9RYb5P7juqyaISTDH33ieMW1c6JpF9XsFJWXQfKC
	 t23unQ3Fy2//HVoA2Y9eVy2OfNtAWqZTpi/wpuuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D9DF80214;
	Wed, 14 Aug 2019 10:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C960DF80214; Wed, 14 Aug 2019 10:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLY,FROM_EXCESS_BASE64,PRX_BODY_26,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72DCCF801DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 10:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72DCCF801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XFpfp1W3"
Received: by mail-wm1-x342.google.com with SMTP id p77so2787862wme.0
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 01:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3gE5kEXYFGYp1NL5CVXFOoRMz6qJmDaHUxtSZp9tvPo=;
 b=XFpfp1W3puWa/3htoMflxHKUuAj7OYdt2KBmq8Qvkhz1yRx5mUcc9kKoRC7hcl+kw2
 Swg5Ybcs6f153Zr3/5NCmVnCmeMvhgvJBZj9+M6S0jK95Ci5q6VSCqHBe8hwkKvHTwOk
 ZEWIOWEN/+ENTAwjEPMmLLYvJv5tcpaVFqzMunbAImN5LndqSbQfw82Q91TqeOsYqPMo
 GaSraPnht5Tk6e8yoWUPi1sOVbSw6DeNqgnQMe/sPZlqY60bbE8qf37lciaeNuPZM7ju
 3AmLP+MxhPVpsrhnLA7eqrrNanxkqQeEMYJn6e/8Fh/QujCfmNy8deCvfNV/JzRR1AHv
 8SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gE5kEXYFGYp1NL5CVXFOoRMz6qJmDaHUxtSZp9tvPo=;
 b=oMuxwiHhuidfPGZKvO+5eb+Q0AKo9JrfAgTZpYevbARgIaHZoCKnlFAA7Cup70tQrr
 0T52SYZj9+UxcgrAgdqGaXibAV5ou9Lnm28ps8r1bCbvhCzp163fdDZGrS7nGZNfil/W
 +jsGCjF4S9h6TIkQnz+auTiosHNXTVfzdZnhdRrWV+uJK72E3ovg2pXPNkXkqVJs7u3v
 IkH5sP/rVxo8VFH+MhaJjIMzXq8Pi1oTZs23VkoE8Wo9yHKgnn12Ck8Hp1jEc3XVfRk+
 mpV+q8pEIcPb1lDTaCu2MO3xAbVVY3dgAksFs8L1yBReLSeSo9vPX1NsCicwewUIHMpr
 nFzw==
X-Gm-Message-State: APjAAAXLqG5tfBIfEhALjAoTVAKRLtKIX0zuSF7z4qVFP4N21i+VxX8w
 mi3Mx/lShpASWeVQgjy9obw=
X-Google-Smtp-Source: APXvYqzo4/ZRcpl9c0AcPvftjkr/MqHRgV4IMgbx+0AnvyTG/HDGl5/VL+ijBc9MbaW5tr8xILbI0A==
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr7274205wmh.58.1565771249331;
 Wed, 14 Aug 2019 01:27:29 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net.
 [89.212.178.211])
 by smtp.gmail.com with ESMTPSA id c15sm65833981wrb.80.2019.08.14.01.27.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 01:27:27 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com, codekipper@gmail.com
Date: Wed, 14 Aug 2019 10:27:26 +0200
Message-ID: <3526410.lk6A0UfGIS@jernej-laptop>
In-Reply-To: <20190814060854.26345-13-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-13-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, be17068@iperbole.bo.it, wens@csie.org, broonie@kernel.org,
 maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v5 12/15] ASoC: sun4i-i2s:
	Add multi-lane functionality
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

Dne sreda, 14. avgust 2019 ob 08:08:51 CEST je codekipper@gmail.com 
napisal(a):
> From: Marcus Cooper <codekipper@gmail.com>
> 
> The i2s block supports multi-lane i2s output however this functionality
> is only possible in earlier SoCs where the pins are exposed and for
> the i2s block used for HDMI audio on the later SoCs.
> 
> To enable this functionality, an optional property has been added to
> the bindings.
> 
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index a8d98696fe7c..a020c3b372a8 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -23,7 +23,7 @@
> 
>  #define SUN4I_I2S_CTRL_REG		0x00
>  #define SUN4I_I2S_CTRL_SDO_EN_MASK		GENMASK(11, 8)
> -#define SUN4I_I2S_CTRL_SDO_EN(sdo)			BIT(8 + 
(sdo))
> +#define SUN4I_I2S_CTRL_SDO_EN(lines)		(((1 << lines) - 1) 
<< 8)
>  #define SUN4I_I2S_CTRL_MODE_MASK		BIT(5)
>  #define SUN4I_I2S_CTRL_MODE_SLAVE			(1 << 5)
>  #define SUN4I_I2S_CTRL_MODE_MASTER			(0 << 5)
> @@ -614,6 +614,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream
> *substream, struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	int sr, wss, channels;
>  	u32 width;
> +	int lines;
> 
>  	channels = params_channels(params);
>  	if (channels != 2) {
> @@ -622,6 +623,13 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream
> *substream, return -EINVAL;
>  	}
> 
> +	lines = (channels + 1) / 2;
> +
> +	/* Enable the required output lines */
> +	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> +			   SUN4I_I2S_CTRL_SDO_EN_MASK,
> +			   SUN4I_I2S_CTRL_SDO_EN(lines));

As Maxime said before, this doesn't work for TDM. Maybe we can skip this for 
now, until we agree on method how to describe channel allocation?

> +
>  	if (i2s->variant->has_chcfg) {
>  		regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
>  				   
SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
> @@ -1389,9 +1397,10 @@ static int sun4i_i2s_init_regmap_fields(struct device
> *dev, static int sun4i_i2s_probe(struct platform_device *pdev)
>  {
>  	struct sun4i_i2s *i2s;
> +	struct snd_soc_dai_driver *soc_dai;
>  	struct resource *res;
>  	void __iomem *regs;
> -	int irq, ret;
> +	int irq, ret, val;
> 
>  	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
>  	if (!i2s)
> @@ -1456,6 +1465,19 @@ static int sun4i_i2s_probe(struct platform_device
> *pdev) i2s->capture_dma_data.addr = res->start + SUN4I_I2S_FIFO_RX_REG;
> i2s->capture_dma_data.maxburst = 8;
> 
> +	soc_dai = devm_kmemdup(&pdev->dev, &sun4i_i2s_dai,
> +			       sizeof(*soc_dai), GFP_KERNEL);
> +	if (!soc_dai) {
> +		ret = -ENOMEM;
> +		goto err_pm_disable;
> +	}
> +
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "allwinner,playback-channels", 
&val)) {
> +		if (val >= 2 && val <= 8)
> +			soc_dai->playback.channels_max = val;
> +	}
> +

Rather than inventing new DT properties, I would rather have multiple 
snd_soc_dai_driver structures, depending on capabilities of that particular 
I2S block. That way we avoid some boilerplate code as can be seen here and 
it's IMO more transparent.

In this case, I would make another snd_soc_dai_driver struct for H3, which has 
channel_max property set to 8 and from patch 14, additional supported formats.

Best regards,
Jernej

>  	pm_runtime_enable(&pdev->dev);
>  	if (!pm_runtime_enabled(&pdev->dev)) {
>  		ret = sun4i_i2s_runtime_resume(&pdev->dev);
> @@ -1465,7 +1487,7 @@ static int sun4i_i2s_probe(struct platform_device
> *pdev)
> 
>  	ret = devm_snd_soc_register_component(&pdev->dev,
>  					      
&sun4i_i2s_component,
> -					      &sun4i_i2s_dai, 
1);
> +					      soc_dai, 1);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Could not register DAI\n");
>  		goto err_suspend;




_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
