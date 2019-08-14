Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A668CE71
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 10:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D871F1662;
	Wed, 14 Aug 2019 10:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D871F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565771405;
	bh=DEQtts/gsHCfBLuNIxPDZGpRN3W5w5pZn7Oq0SBfddI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwKklexrmdRqrsocXMSCNJODEqm1F+QnvHi5Ovh426Cwm9VayV+9VqcRwzOg9eC3D
	 DjCDqzLPxbwuMcb2GrfIp/CpgOd6WkaJ5iU8lmmmQQjq0i6sXXHldounRwq60SKV3k
	 bInjE9z6vTMv1OaqFFrT8RJQwOI2lz70H5wwXgxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6962F803F4;
	Wed, 14 Aug 2019 10:28:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB751F803F4; Wed, 14 Aug 2019 10:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLY,FROM_EXCESS_BASE64,PRX_BODY_26,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0713AF801DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 10:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0713AF801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R/8QS2C6"
Received: by mail-wr1-x442.google.com with SMTP id p17so110224737wrf.11
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 01:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rV0Mz1LNQzvwfE9rFCVwbU0EStrdYW7TBpsWP1IW94k=;
 b=R/8QS2C6ntQ7Vw97hDgxsv6vJAns05MqnUI4UFuGPSRmCoJ05TqEABqcMIfkWG1exU
 cp9plLXm78nimHu8lF0h3doDNzdGaPT60sfj5GtdtvHFBq539TXYdQUPj/pL4FsaPMIQ
 Jdlg8ctiByw/dcXuxZYE0eaiBVWPn4SdzlKczGPUmgANztrd9Ny+LuBnPeWZDVNbEHJj
 P2vw65H576GGAGZFgjJT1UyCudVW9XyINkzdviJy1ORXt0ZfRBG/86HVLYd5pvtEj+Us
 jmwZ69XopX27pRjlCz6c4BBw1P4V5pHQsJ0crfa+LLUKn1x7+jLuYZjlMwO3I7kB2HiE
 5CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rV0Mz1LNQzvwfE9rFCVwbU0EStrdYW7TBpsWP1IW94k=;
 b=Pa4zVaaj9hP2OsvzIppLALx3BgsNsyXEfwoNRt8yKZE58BbmgTJuPksZrW66ShKN68
 v1bgJ0WCJvkmcYBi53eQ1gLxUmY6R/GCvinOt7GQuCxE3hn40pLMmFU5sa3aRNWYPAbz
 /tyGr2hL4+UyRwktKD8DTi5ty1/WuAFqX5lZTE6Uq8J+U2/8R0ks+GO0W1i/++ofBbo7
 LONbRs2mKXqlbjhmWlgKHZn/ogJAEQvc3BRV2ut5a8hBY8Y1JxWu2gPSSOSZHvIPt5Y3
 aIHLnxBC+EhromQEgnwo8npyqPMHWE8BjWl16boHCdpw5ZlWaDmBzTGClIRV9zTPLllI
 xErA==
X-Gm-Message-State: APjAAAUmurj72JIYNdEAhjE+p9MQS20zEWdvVrfnYIj7iiig285XsULh
 oC8juTg/K/kGXZdP9KDhXKY=
X-Google-Smtp-Source: APXvYqzGZTVcpusGFYgd50gndARlz4pVBXWu3ACZK/HgjK/hWUAFe/i91auTmLJNsZQhT/YeqHrPGQ==
X-Received: by 2002:a05:6000:1041:: with SMTP id
 c1mr18582439wrx.99.1565771321208; 
 Wed, 14 Aug 2019 01:28:41 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net.
 [89.212.178.211])
 by smtp.gmail.com with ESMTPSA id b26sm4034990wmj.14.2019.08.14.01.28.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 01:28:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com, codekipper@gmail.com
Date: Wed, 14 Aug 2019 10:28:39 +0200
Message-ID: <4297791.2mJM636zur@jernej-laptop>
In-Reply-To: <20190814060854.26345-15-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-15-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, be17068@iperbole.bo.it, wens@csie.org, broonie@kernel.org,
 maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v5 14/15] ASoc: sun4i-i2s:
	Add 20, 24 and 32 bit support
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

Dne sreda, 14. avgust 2019 ob 08:08:53 CEST je codekipper@gmail.com 
napisal(a):
> From: Marcus Cooper <codekipper@gmail.com>
> 
> Extend the functionality of the driver to include support of 20 and
> 24 bits per sample for the earlier SoCs.
> 
> Newer SoCs can also handle 32bit samples.
> 
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index a71969167053..d3c8789f70bb 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -690,6 +690,11 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream
> *substream, case 16:
>  		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
>  		break;
> +	case 20:
> +	case 24:
> +	case 32:

params_physical_width() returns 32 also for 20 and 24-bit formats, so drop 20 
and 24.

Best regards,
Jernej

> +		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		break;
>  	default:
>  		dev_err(dai->dev, "Unsupported physical sample width: 
%d\n",
>  			params_physical_width(params));
> @@ -1015,6 +1020,13 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai
> *dai) return 0;
>  }
> 
> +#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
> +			 SNDRV_PCM_FMTBIT_S20_LE | \
> +			 SNDRV_PCM_FMTBIT_S24_LE)
> +
> +#define SUN8I_FORMATS	(SUN4I_FORMATS | \
> +			 SNDRV_PCM_FMTBIT_S32_LE)
> +
>  static struct snd_soc_dai_driver sun4i_i2s_dai = {
>  	.probe = sun4i_i2s_dai_probe,
>  	.capture = {
> @@ -1022,14 +1034,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
>  		.channels_min = 2,
>  		.channels_max = 2,
>  		.rates = SNDRV_PCM_RATE_8000_192000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SUN4I_FORMATS,
>  	},
>  	.playback = {
>  		.stream_name = "Playback",
>  		.channels_min = 2,
>  		.channels_max = 2,
>  		.rates = SNDRV_PCM_RATE_8000_192000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SUN4I_FORMATS,
>  	},
>  	.ops = &sun4i_i2s_dai_ops,
>  	.symmetric_rates = 1,
> @@ -1505,6 +1517,11 @@ static int sun4i_i2s_probe(struct platform_device
> *pdev) goto err_pm_disable;
>  	}
> 
> +	if (i2s->variant->has_fmt_set_lrck_period) {
> +		soc_dai->playback.formats = SUN8I_FORMATS;
> +		soc_dai->capture.formats = SUN8I_FORMATS;
> +	}
> +
>  	if (!of_property_read_u32(pdev->dev.of_node,
>  				  "allwinner,playback-channels", 
&val)) {
>  		if (val >= 2 && val <= 8)




_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
