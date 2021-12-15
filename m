Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0774347542E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 09:21:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F11F1F1B;
	Wed, 15 Dec 2021 09:21:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F11F1F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639556513;
	bh=yqoZCUTgjW9q/LKUilVYReXVgfi/LCgJLk5IVKXqdbw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9v/r06ZF6cdQ1yuJKq6GB+bqN23qhzb5t/oN05ZhthihkMOL8i/Ht3mNdTtdNqfc
	 cPKGJzgxaayDUBDPFlig9domD/kiqNLY43nMUPqdo3njZwPwLPF+Ky7qqqdPe9at34
	 E++9OMp2ldcqdcQxAEroyT6UD0/OVy5S3uWIqQ7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C025CF8025F;
	Wed, 15 Dec 2021 09:20:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ED58F800FE; Wed, 15 Dec 2021 09:20:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17979F800FE
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 09:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17979F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="G/3L4rDd"
Received: by mail-pf1-x42e.google.com with SMTP id x5so20119249pfr.0
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 00:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dVW69TmCJnTv5pUkbvRYzOl3hIL8o0Ev8E5MCNMu3v4=;
 b=G/3L4rDd1Goqt0d0b2dj/cMhsDvkaMD7Z1+8qFaNab+J/SE+VpMr8z5qIjIgg31BP3
 6Rgv6T1J2UpaqpYj4Ko/HrsvNIinACGkY9Lq5IoHJmoAfHdOCZaVIS8KCXKSYD+RXgZa
 /tkVzDLzR++mtz40WJdnBEWAHCVJHeYyEp/qf6PSLI0VfhlzOWEmckna48+po0it3yNf
 LAXJXzd9ucGOc72u1drmRWGY/oxGZGNbXHlqHYO3Q1Mbr9iGZI5uUeGNv079dUH+i/uQ
 cRClz28G6WpGzT/Iu1lkboFSdf/KTwa+NTw7eq9XCNDI29f50wCdZFXoICXU1S0PMGXY
 mLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dVW69TmCJnTv5pUkbvRYzOl3hIL8o0Ev8E5MCNMu3v4=;
 b=R58grPOVsb/eNN4isHw6FtmgMpIPojLc5FlXQaJ0suXOaAQZDjy+kkQve4t0g7U+42
 PwbnTX8WfLBqcNE6X1m9uuJFHR1vpFWOStuX25nFjRITZeWqWd7GLIOPIPkRdagYYjKy
 wxiyhlKrAyWPUNZPyNHXxVGBm4h2lNk9SIe/j+8EOMxmJ01fQYgQzGVFr37w1ndYwfNx
 SUxpTR5yd+ZKJOFb72zF1Ry+s8GUcLKanHB42USbNAOp4oC7+GKVVxbjaxYeBIs1NS5Z
 FNBPoVyoD8geAgy9huWdrfx4/mzcwHc3D5yRIbg7d9cqIG2GBZGxCJjklXBYr5P45t3G
 uieg==
X-Gm-Message-State: AOAM530FEeGemTJkTTb4Eyygw6u6enIfMDxC2URfwSYlAYQeanG6+1rv
 VdBPLjDvI7ezgnrFRU4ecEqwIg==
X-Google-Smtp-Source: ABdhPJzqmCCROdTAh4mINIHDWtKReeWzZihdPEwTeamzuw2CuCOAX2lKwuAQZGGVSBG5s+y4UQgjig==
X-Received: by 2002:a63:5350:: with SMTP id t16mr6987808pgl.321.1639556435096; 
 Wed, 15 Dec 2021 00:20:35 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:754d:1c44:62a9:6d30])
 by smtp.gmail.com with ESMTPSA id j127sm1679143pfg.14.2021.12.15.00.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 00:20:34 -0800 (PST)
Date: Wed, 15 Dec 2021 16:20:31 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: update control for RT5682
 series
Message-ID: <YbmlT+OSwpGuylsx@google.com>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215065835.3074-1-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, shumingf@realtek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Wed, Dec 15, 2021 at 02:58:34PM +0800, Trevor Wu wrote:
> --- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
[...]
> +static int mt8195_set_bias_level_post(struct snd_soc_card *card,
> +	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
> +{
> +	struct snd_soc_component *component = dapm->component;
> +	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
> +		snd_soc_card_get_drvdata(card);
> +	int ret = 0;

ret doesn't need to be initialized.

> +	/*
> +	 * It's required to control mclk directly in the set_bias_level_post
> +	 * function for rt5682 and rt5682s codec, or the unexpected pop happens
> +	 * at the end of playback.
> +	 */
> +	if (!component ||
> +	    (strcmp(component->name, RT5682_DEV0_NAME) &&
> +	    strcmp(component->name, RT5682S_DEV0_NAME)))
> +		return 0;
> +
> +	if (IS_ERR(priv->i2so1_mclk))
> +		return 0;

I doubt if it needs to check priv->i2so1_mclk.  In other words, if IS_ERR(priv->i2so1_mclk) is true in _probe, does mt8195_set_bias_level_post() get called?

> +	switch (level) {
> +	case SND_SOC_BIAS_OFF:
> +		if (!__clk_is_enabled(priv->i2so1_mclk))
> +			return 0;
> +
> +		dev_dbg(card->dev, "Disable i2so1");
> +		clk_disable_unprepare(priv->i2so1_mclk);

I would suggest move dev_dbg() later than clk_disable_unprepare() which means "Disable i2so1" is done.

> +		break;
> +	case SND_SOC_BIAS_ON:
> +		dev_dbg(card->dev, "Enable i2so1");
> +		ret = clk_prepare_enable(priv->i2so1_mclk);
> +		if (ret) {
> +			dev_err(card->dev, "Can't enable mclk, err: %d\n", ret);

The error message can be more specific.  "Cannot enable i2so1" for example.

> +			return ret;
> +		}

Also, I would suggest move dev_dbg() later than clk_prepare_enable().  Otherwise, it could fail to prepare or enable but still can see "Enable i2so1" message.

> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;

The function doesn't use any gotos.  To be concise, "return 0;".

> @@ -1072,6 +1119,19 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	priv->i2so1_mclk = devm_clk_get(&pdev->dev, "i2so1_mclk");
> +	if (IS_ERR(priv->i2so1_mclk)) {
> +		ret = PTR_ERR(priv->i2so1_mclk);
> +		if (ret == -ENOENT) {
> +			dev_dbg(&pdev->dev,
> +				"Failed to get i2so1_mclk, defer probe\n");
> +			return -EPROBE_DEFER;
> +		}

Does devm_clk_get_optional() could make the block more concise?

> +
> +		dev_err(&pdev->dev, "Failed to get i2so1_mclk, err:%d\n", ret);

If devm_clk_get() is possible to return -EPROBE_DEFER too, use dev_err_probe().

> --- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
[...]
> +static int mt8195_set_bias_level_post(struct snd_soc_card *card,
> +	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
> +{
> +	struct snd_soc_component *component = dapm->component;
> +	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
> +		snd_soc_card_get_drvdata(card);
> +	int ret = 0;

Ditto, see comments above.

> +
> +	/*
> +	 * It's required to control mclk directly in the set_bias_level_post
> +	 * function for rt5682 and rt5682s codec, or the unexpected pop happens
> +	 * at the end of playback.
> +	 */
> +	if (!component ||
> +	    (strcmp(component->name, RT5682_DEV0_NAME) &&
> +	    strcmp(component->name, RT5682S_DEV0_NAME)))
> +		return 0;
> +
> +	if (IS_ERR(priv->i2so1_mclk))
> +		return 0;

Ditto, see comments above.

> +
> +	switch (level) {
> +	case SND_SOC_BIAS_OFF:
> +		if (!__clk_is_enabled(priv->i2so1_mclk))
> +			return 0;
> +
> +		dev_dbg(card->dev, "Disable i2so1");
> +		clk_disable_unprepare(priv->i2so1_mclk);
> +		break;
> +	case SND_SOC_BIAS_ON:
> +		dev_dbg(card->dev, "Enable i2so1");
> +		ret = clk_prepare_enable(priv->i2so1_mclk);
> +		if (ret) {
> +			dev_err(card->dev, "Can't enable mclk, err: %d\n", ret);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		break;
> +	}

Ditto, see comments above for the block.

> +
> +	return ret;

Ditto, see comments above.

> @@ -1285,6 +1326,19 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	priv->i2so1_mclk = devm_clk_get(&pdev->dev, "i2so1_mclk");
> +	if (IS_ERR(priv->i2so1_mclk)) {
> +		ret = PTR_ERR(priv->i2so1_mclk);
> +		if (ret == -ENOENT) {
> +			dev_dbg(&pdev->dev,
> +				"Failed to get i2so1_mclk, defer probe\n");
> +			return -EPROBE_DEFER;
> +		}
> +
> +		dev_err(&pdev->dev, "Failed to get i2so1_mclk, err:%d\n", ret);
> +		return ret;
> +	}

Ditto, see comments above for the block.
