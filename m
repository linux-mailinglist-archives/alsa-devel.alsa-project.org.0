Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA3D54EB9B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 22:49:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ECC61AEF;
	Thu, 16 Jun 2022 22:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ECC61AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655412573;
	bh=LFDox7Kp2mfWd5orHwgK+rckE7MAHDYJPFPjOlbb4u0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GP10Vz3vN2c1IeaePglCpq7PRZZCwW2j8uhdeCrubTtxu6ZraQgeXDqtlvFCvPxwC
	 LGhBN+DU37db2iKDzs8zctvGaLEIoOTlgA2RYYwqRO1FdodK4w/MJU6aW5iLQhup+6
	 RuIGlgNlTUexYGpSiWBjZoXxGIPFIpX8hfcverW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9014DF80310;
	Thu, 16 Jun 2022 22:48:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FF39F800B9; Thu, 16 Jun 2022 22:48:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E0B9F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 22:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E0B9F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="i/kH0v1d"
Received: by mail-pj1-x102f.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso2477349pjh.4
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7AJn08pW02tF965v0Zsvg646CXfRm82BuAMcsSiDxYo=;
 b=i/kH0v1dne6Zn8uPbB1ueElswUjgT/yTFXTNnBQmQqVWocWZxvGDRFwBQPCgEjZcwt
 DHW+izRBKx0cz2xBlUq2RrN9DJ22qLSQ47bRF9P/mGJLryASSGePSxfmcFgmUCas2i23
 asnkOlYviO3+ExgPo+5i6i0gV6JqUhM2S/znM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7AJn08pW02tF965v0Zsvg646CXfRm82BuAMcsSiDxYo=;
 b=pwadgP268sopw0iKleWYGQ30gBU+BbF85Stuum/Yx3/otX7EYnRfe2IKszNBo+XwRG
 eDZGqgjQ9sNGWvrTd/eac7O89bBSMVVeWz+W52cNYGjn4nTHqaV8E6O5KzaN9RBPbsih
 CGkvGZBW9ZyhlybP0AeKc/Xl6Pb6TJPUjVFxZBDS1kkQHLu3jCxARJmC42Tz48OyCah4
 4wU3BAPs6a7v9XKyx9kMCOuhkz0DKtGpFgdaKlXo2NP0/x8jXFIvqxTMXzbtngns8RG8
 +PKArPLc+QPhKhB44O2kbLvcCsdPyzMd8t7UPW3i4//J+nmbPLjL2bQQlM4TfqslXzvF
 r+Fw==
X-Gm-Message-State: AJIora/U90QdLPQ/w2J628ebCCXtB+2jXVhSoyzZSYCOKjv7ES3TrgzW
 YXbG2+GAJ54RJYZuZyPx43BnPg==
X-Google-Smtp-Source: AGRyM1sXlJmDftLj2gIeCg+QvZItPdfFXrzD22pR9q6/q1KwqJH22TcK4LdHMUYCPdy8v2eU0G7bwA==
X-Received: by 2002:a17:90b:2310:b0:1e8:8379:6098 with SMTP id
 mt16-20020a17090b231000b001e883796098mr6832173pjb.112.1655412500987; 
 Thu, 16 Jun 2022 13:48:20 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4709:a407:1ca6:24ea])
 by smtp.gmail.com with ESMTPSA id
 fs20-20020a17090af29400b001ea75a02805sm4221264pjb.52.2022.06.16.13.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 13:48:20 -0700 (PDT)
Date: Thu, 16 Jun 2022 13:48:18 -0700
From: Brian Norris <briannorris@chromium.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH v2 1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Message-ID: <YquXEgHkw08TkNuG@google.com>
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
 <20220616155836.3401420-2-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616155836.3401420-2-judyhsiao@chromium.org>
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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

Hi,

On Thu, Jun 16, 2022 at 03:58:34PM +0000, Judy Hsiao wrote:
> We discoverd that the state of BCLK on, LRCLK off and SD_MODE on
> may cause the speaker melting issue. Removing LRCLK while BCLK
> is present can cause unexpected output behavior including a large
> DC output voltage as described in the Max98357a datasheet.
> 
> In order to:
>   1. prevent BCLK from turning on by other component.
>   2. keep BCLK and LRCLK being present at the same time
> 
> This patch switches BCLK to GPIO func before LRCLK output, and
> configures BCLK func back during LRCLK is output.
> 
> Without this fix, BCLK is turned on 11 ms earlier than LRCK by the
> da7219.
> With this fix, BCLK is turned on only 0.4 ms earlier than LRCK by
> the rockchip codec.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

It feels like a lot of the noise in this patch is due to adding
additional error handling, unrelated to the real change you're making.
Maybe that deserves a separate patch?

> ---
>  sound/soc/rockchip/rockchip_i2s.c | 134 ++++++++++++++++++++++++------
>  1 file changed, 108 insertions(+), 26 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index 47a3971a9ce1..574d3d0900c4 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -54,8 +54,40 @@ struct rk_i2s_dev {
>  	const struct rk_i2s_pins *pins;
>  	unsigned int bclk_ratio;
>  	spinlock_t lock; /* tx/rx lock */
> +	struct pinctrl *pinctrl;
> +	struct pinctrl_state *bclk_on;
> +	struct pinctrl_state *bclk_off;
>  };
>  
> +static int i2s_pinctrl_select_bclk_on(struct rk_i2s_dev *i2s)
> +{
> +	int ret = 0;
> +
> +	if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_on))
> +		ret = pinctrl_select_state(i2s->pinctrl,
> +				     i2s->bclk_on);
> +
> +	if (ret)
> +		dev_err(i2s->dev, "bclk enable failed %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int i2s_pinctrl_select_bclk_off(struct rk_i2s_dev *i2s)
> +{
> +
> +	int ret = 0;
> +
> +	if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_off))
> +		ret = pinctrl_select_state(i2s->pinctrl,
> +				     i2s->bclk_off);
> +
> +	if (ret)
> +		dev_err(i2s->dev, "bclk disable failed %d\n", ret);
> +
> +	return ret;
> +}
> +
>  static int i2s_runtime_suspend(struct device *dev)
>  {
>  	struct rk_i2s_dev *i2s = dev_get_drvdata(dev);
> @@ -92,39 +124,46 @@ static inline struct rk_i2s_dev *to_info(struct snd_soc_dai *dai)
>  	return snd_soc_dai_get_drvdata(dai);
>  }
>  
> -static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
> +static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
>  {
>  	unsigned int val = 0;
>  	int retry = 10;
> -
> +	int ret = 0;
> +
>  	spin_lock(&i2s->lock);
>  	if (on) {
> -		regmap_update_bits(i2s->regmap, I2S_DMACR,
> +		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
>  				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);

I mentioned this off-list, but the 2nd-line indentation alignment *used*
to be in a very particular style, and you've moved that around a lot. To
match the previous style, it should be:

		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
					 I2S_DMACR_TDE_ENABLE,
					 I2S_DMACR_TDE_ENABLE);

(BTW, if you're using Gmail to view this, you're going to have no idea
what I'm talking about, since it doesn't do whitespace or monospace font
correctly...)

The same applies throughout; most of the 2nd-line, 3rd-line, ...
indentation is a little weird.

> -
> -		regmap_update_bits(i2s->regmap, I2S_XFER,
> +		if (ret < 0)
> +			goto end;
> +		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
>  				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
>  				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
> -
> +		if (ret < 0)
> +			goto end;
>  		i2s->tx_start = true;
>  	} else {
>  		i2s->tx_start = false;
>  
> -		regmap_update_bits(i2s->regmap, I2S_DMACR,
> +		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
>  				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
> +		if (ret < 0)
> +			goto end;
>  
>  		if (!i2s->rx_start) {
> -			regmap_update_bits(i2s->regmap, I2S_XFER,
> +			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
>  					   I2S_XFER_TXS_START |
>  					   I2S_XFER_RXS_START,
>  					   I2S_XFER_TXS_STOP |
>  					   I2S_XFER_RXS_STOP);
> -
> +			if (ret < 0)
> +				goto end;
>  			udelay(150);
> -			regmap_update_bits(i2s->regmap, I2S_CLR,
> +			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
>  					   I2S_CLR_TXC | I2S_CLR_RXC,
>  					   I2S_CLR_TXC | I2S_CLR_RXC);
> -
> +			if (ret < 0)
> +				goto end;
>  			regmap_read(i2s->regmap, I2S_CLR, &val);
>  
>  			/* Should wait for clear operation to finish */
> @@ -138,42 +177,55 @@ static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
>  			}
>  		}
>  	}
> +end:
>  	spin_unlock(&i2s->lock);
> +	if (ret < 0)
> +		dev_err(i2s->dev, "lrclk update failed\n");
> +
> +	return ret;
>  }
>  
>  static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
>  {
>  	unsigned int val = 0;
>  	int retry = 10;
> +	int ret = 0;
>  
>  	spin_lock(&i2s->lock);
>  	if (on) {
> -		regmap_update_bits(i2s->regmap, I2S_DMACR,
> +		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
>  				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_ENABLE);
> +		if (ret < 0)
> +			goto end;
>  
> -		regmap_update_bits(i2s->regmap, I2S_XFER,
> +		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
>  				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
>  				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
> -
> +		if (ret < 0)
> +			goto end;
>  		i2s->rx_start = true;
>  	} else {
>  		i2s->rx_start = false;
>  
> -		regmap_update_bits(i2s->regmap, I2S_DMACR,
> +		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
>  				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_DISABLE);
> +		if (ret < 0)
> +			goto end;
>  
>  		if (!i2s->tx_start) {
> -			regmap_update_bits(i2s->regmap, I2S_XFER,
> +			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
>  					   I2S_XFER_TXS_START |
> -					   I2S_XFER_RXS_START,
> +						   I2S_XFER_RXS_START,
>  					   I2S_XFER_TXS_STOP |
>  					   I2S_XFER_RXS_STOP);
> -
> +			if (ret < 0)
> +				goto end;
>  			udelay(150);
> -			regmap_update_bits(i2s->regmap, I2S_CLR,
> +			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
>  					   I2S_CLR_TXC | I2S_CLR_RXC,
>  					   I2S_CLR_TXC | I2S_CLR_RXC);
> -
> +			if (ret < 0)
> +				goto end;
>  			regmap_read(i2s->regmap, I2S_CLR, &val);
>  
>  			/* Should wait for clear operation to finish */
> @@ -187,7 +239,12 @@ static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
>  			}
>  		}
>  	}
> +end:
>  	spin_unlock(&i2s->lock);
> +	if (ret < 0)
> +		dev_err(i2s->dev, "lrclk update failed\n");
> +
> +	return ret;
>  }
>  
>  static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
> @@ -425,17 +482,25 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>  		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> -			rockchip_snd_rxctrl(i2s, 1);
> +			ret = rockchip_snd_rxctrl(i2s, 1);
>  		else
> -			rockchip_snd_txctrl(i2s, 1);
> +			ret = rockchip_snd_txctrl(i2s, 1);
> +		if (ret < 0)
> +			return ret;
> +		i2s_pinctrl_select_bclk_on(i2s);
>  		break;
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> -			rockchip_snd_rxctrl(i2s, 0);
> -		else
> -			rockchip_snd_txctrl(i2s, 0);
> +		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +			if (!i2s->tx_start)
> +				i2s_pinctrl_select_bclk_off(i2s);
> +			ret = rockchip_snd_rxctrl(i2s, 0);
> +		} else {
> +			if (!i2s->rx_start)
> +				i2s_pinctrl_select_bclk_off(i2s);
> +			ret = rockchip_snd_txctrl(i2s, 0);
> +		}
>  		break;
>  	default:
>  		ret = -EINVAL;
> @@ -736,6 +801,23 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
>  	}
>  
>  	i2s->bclk_ratio = 64;
> +	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (IS_ERR(i2s->pinctrl))
> +		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
> +
> +	i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl,
> +				   "bclk_on");
> +	if (!IS_ERR_OR_NULL(i2s->bclk_on)) {
> +		dev_info(&pdev->dev, "switch bclk to GPIO func\n");

I don't think we need this printed at the KERN_INFO level. Either drop
it, or maybe dev_dbg().

Brian

> +		i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl,
> +				  "bclk_off");
> +		if (IS_ERR_OR_NULL(i2s->bclk_off)) {
> +			dev_err(&pdev->dev, "failed to find i2s bclk_off\n");
> +			goto err_clk;
> +		}
> +	}
> +
> +	i2s_pinctrl_select_bclk_off(i2s);
>  
>  	dev_set_drvdata(&pdev->dev, i2s);
>  
> -- 
> 2.36.1.476.g0c4daa206d-goog
> 
