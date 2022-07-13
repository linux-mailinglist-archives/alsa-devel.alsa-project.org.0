Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CCE5752F3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22541185C;
	Thu, 14 Jul 2022 18:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22541185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816710;
	bh=b2AqN2bNhUV4q9XPwt0D9NVjjGotxg0kBA8sOcuQQmM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CxdWsSUB/EvGYsoYwQiINo0fcIZ1V2us7+DN7HK86QVp9ZDFg5pCkHecdjqn7cVGD
	 yhZBV0yx7M0LDHPLtZWqrrZeXKBZsxrB/44b8SCpvi97SSLvJD7EnxGRbbX41NToN1
	 r2ReDInRn/1aSwnldaTyXvbIiYPh2r/fEk0dMLfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA36F8059F;
	Thu, 14 Jul 2022 18:34:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A42AF80134; Wed, 13 Jul 2022 16:25:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 436E1F800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 436E1F800AA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC0A41424;
 Wed, 13 Jul 2022 07:24:57 -0700 (PDT)
Received: from monolith.localdoman (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 867113F73D;
 Wed, 13 Jul 2022 07:24:56 -0700 (PDT)
Date: Wed, 13 Jul 2022 15:25:27 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rockchip-i2s: Undo BCLK pinctrl changes
Message-ID: <Ys7SS/ueE66CBpZK@monolith.localdoman>
References: <20220713130451.31481-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713130451.31481-1-broonie@kernel.org>
X-Mailman-Approved-At: Thu, 14 Jul 2022 18:34:36 +0200
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
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

On Wed, Jul 13, 2022 at 02:04:51PM +0100, Mark Brown wrote:
> The version of the BCLK pinctrl management changes that made it into
> v5.19 has caused problems on some systems due to overly strict DT
> requirements but attempts to fix it have caused further breakage on
> other platforms.  Just drop the changes for this release, we already
> have a better version queued for -next.

For what it's worth, I am now able to boot my rockpro64-v2 with this patch.

Thanks,
Alex

> 
> Fixes: 26b9f2fa7b1c ("ASoC: rockchip: i2s: Fix NULL pointer dereference when pinctrl is not found")
> Fixes: a5450aba737d ("ASoC: rockchip: i2s: switch BCLK to GPIO")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/rockchip/rockchip_i2s.c | 163 ++++++------------------------
>  1 file changed, 31 insertions(+), 132 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index c9fedf6eb2e6..4ce5d2579387 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -13,7 +13,6 @@
>  #include <linux/of_gpio.h>
>  #include <linux/of_device.h>
>  #include <linux/clk.h>
> -#include <linux/pinctrl/consumer.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/spinlock.h>
> @@ -55,40 +54,8 @@ struct rk_i2s_dev {
>  	const struct rk_i2s_pins *pins;
>  	unsigned int bclk_ratio;
>  	spinlock_t lock; /* tx/rx lock */
> -	struct pinctrl *pinctrl;
> -	struct pinctrl_state *bclk_on;
> -	struct pinctrl_state *bclk_off;
>  };
>  
> -static int i2s_pinctrl_select_bclk_on(struct rk_i2s_dev *i2s)
> -{
> -	int ret = 0;
> -
> -	if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_on))
> -		ret = pinctrl_select_state(i2s->pinctrl,
> -				     i2s->bclk_on);
> -
> -	if (ret)
> -		dev_err(i2s->dev, "bclk enable failed %d\n", ret);
> -
> -	return ret;
> -}
> -
> -static int i2s_pinctrl_select_bclk_off(struct rk_i2s_dev *i2s)
> -{
> -
> -	int ret = 0;
> -
> -	if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_off))
> -		ret = pinctrl_select_state(i2s->pinctrl,
> -				     i2s->bclk_off);
> -
> -	if (ret)
> -		dev_err(i2s->dev, "bclk disable failed %d\n", ret);
> -
> -	return ret;
> -}
> -
>  static int i2s_runtime_suspend(struct device *dev)
>  {
>  	struct rk_i2s_dev *i2s = dev_get_drvdata(dev);
> @@ -125,49 +92,38 @@ static inline struct rk_i2s_dev *to_info(struct snd_soc_dai *dai)
>  	return snd_soc_dai_get_drvdata(dai);
>  }
>  
> -static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
> +static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
>  {
>  	unsigned int val = 0;
>  	int retry = 10;
> -	int ret = 0;
>  
>  	spin_lock(&i2s->lock);
>  	if (on) {
> -		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
> -				I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
> -		if (ret < 0)
> -			goto end;
> +		regmap_update_bits(i2s->regmap, I2S_DMACR,
> +				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
>  
> -		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
> -				I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> -				I2S_XFER_TXS_START | I2S_XFER_RXS_START);
> -		if (ret < 0)
> -			goto end;
> +		regmap_update_bits(i2s->regmap, I2S_XFER,
> +				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> +				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
>  
>  		i2s->tx_start = true;
>  	} else {
>  		i2s->tx_start = false;
>  
> -		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
> -				I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
> -		if (ret < 0)
> -			goto end;
> +		regmap_update_bits(i2s->regmap, I2S_DMACR,
> +				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
>  
>  		if (!i2s->rx_start) {
> -			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
> -					I2S_XFER_TXS_START |
> -					I2S_XFER_RXS_START,
> -					I2S_XFER_TXS_STOP |
> -					I2S_XFER_RXS_STOP);
> -			if (ret < 0)
> -				goto end;
> +			regmap_update_bits(i2s->regmap, I2S_XFER,
> +					   I2S_XFER_TXS_START |
> +					   I2S_XFER_RXS_START,
> +					   I2S_XFER_TXS_STOP |
> +					   I2S_XFER_RXS_STOP);
>  
>  			udelay(150);
> -			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
> -					I2S_CLR_TXC | I2S_CLR_RXC,
> -					I2S_CLR_TXC | I2S_CLR_RXC);
> -			if (ret < 0)
> -				goto end;
> +			regmap_update_bits(i2s->regmap, I2S_CLR,
> +					   I2S_CLR_TXC | I2S_CLR_RXC,
> +					   I2S_CLR_TXC | I2S_CLR_RXC);
>  
>  			regmap_read(i2s->regmap, I2S_CLR, &val);
>  
> @@ -182,57 +138,44 @@ static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
>  			}
>  		}
>  	}
> -end:
>  	spin_unlock(&i2s->lock);
> -	if (ret < 0)
> -		dev_err(i2s->dev, "lrclk update failed\n");
> -
> -	return ret;
>  }
>  
> -static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
> +static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
>  {
>  	unsigned int val = 0;
>  	int retry = 10;
> -	int ret = 0;
>  
>  	spin_lock(&i2s->lock);
>  	if (on) {
> -		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
> +		regmap_update_bits(i2s->regmap, I2S_DMACR,
>  				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_ENABLE);
> -		if (ret < 0)
> -			goto end;
>  
> -		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
> +		regmap_update_bits(i2s->regmap, I2S_XFER,
>  				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
>  				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
> -		if (ret < 0)
> -			goto end;
>  
>  		i2s->rx_start = true;
>  	} else {
>  		i2s->rx_start = false;
>  
> -		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
> +		regmap_update_bits(i2s->regmap, I2S_DMACR,
>  				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_DISABLE);
> -		if (ret < 0)
> -			goto end;
>  
>  		if (!i2s->tx_start) {
> -			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
> +			regmap_update_bits(i2s->regmap, I2S_XFER,
>  					   I2S_XFER_TXS_START |
>  					   I2S_XFER_RXS_START,
>  					   I2S_XFER_TXS_STOP |
>  					   I2S_XFER_RXS_STOP);
> -			if (ret < 0)
> -				goto end;
> +
>  			udelay(150);
> -			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
> +			regmap_update_bits(i2s->regmap, I2S_CLR,
>  					   I2S_CLR_TXC | I2S_CLR_RXC,
>  					   I2S_CLR_TXC | I2S_CLR_RXC);
> -			if (ret < 0)
> -				goto end;
> +
>  			regmap_read(i2s->regmap, I2S_CLR, &val);
> +
>  			/* Should wait for clear operation to finish */
>  			while (val) {
>  				regmap_read(i2s->regmap, I2S_CLR, &val);
> @@ -244,12 +187,7 @@ static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
>  			}
>  		}
>  	}
> -end:
>  	spin_unlock(&i2s->lock);
> -	if (ret < 0)
> -		dev_err(i2s->dev, "lrclk update failed\n");
> -
> -	return ret;
>  }
>  
>  static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
> @@ -487,26 +425,17 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>  		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> -			ret = rockchip_snd_rxctrl(i2s, 1);
> +			rockchip_snd_rxctrl(i2s, 1);
>  		else
> -			ret = rockchip_snd_txctrl(i2s, 1);
> -		/* Do not turn on bclk if lrclk open fails. */
> -		if (ret < 0)
> -			return ret;
> -		i2s_pinctrl_select_bclk_on(i2s);
> +			rockchip_snd_txctrl(i2s, 1);
>  		break;
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> -			if (!i2s->tx_start)
> -				i2s_pinctrl_select_bclk_off(i2s);
> -			ret = rockchip_snd_rxctrl(i2s, 0);
> -		} else {
> -			if (!i2s->rx_start)
> -				i2s_pinctrl_select_bclk_off(i2s);
> -			ret = rockchip_snd_txctrl(i2s, 0);
> -		}
> +		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> +			rockchip_snd_rxctrl(i2s, 0);
> +		else
> +			rockchip_snd_txctrl(i2s, 0);
>  		break;
>  	default:
>  		ret = -EINVAL;
> @@ -807,36 +736,6 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
>  	}
>  
>  	i2s->bclk_ratio = 64;
> -	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
> -	if (IS_ERR(i2s->pinctrl)) {
> -		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
> -		ret = PTR_ERR(i2s->pinctrl);
> -		goto err_clk;
> -	}
> -
> -	i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl,
> -				   "bclk_on");
> -	if (IS_ERR_OR_NULL(i2s->bclk_on))
> -		dev_err(&pdev->dev, "failed to find i2s default state\n");
> -	else
> -		dev_dbg(&pdev->dev, "find i2s bclk state\n");
> -
> -	i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl,
> -				  "bclk_off");
> -	if (IS_ERR_OR_NULL(i2s->bclk_off))
> -		dev_err(&pdev->dev, "failed to find i2s gpio state\n");
> -	else
> -		dev_dbg(&pdev->dev, "find i2s bclk_off state\n");
> -
> -	i2s_pinctrl_select_bclk_off(i2s);
> -
> -	i2s->playback_dma_data.addr = res->start + I2S_TXDR;
> -	i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> -	i2s->playback_dma_data.maxburst = 4;
> -
> -	i2s->capture_dma_data.addr = res->start + I2S_RXDR;
> -	i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> -	i2s->capture_dma_data.maxburst = 4;
>  
>  	dev_set_drvdata(&pdev->dev, i2s);
>  
> -- 
> 2.30.2
> 
