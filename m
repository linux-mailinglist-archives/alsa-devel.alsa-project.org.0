Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0AF608F77
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 21:53:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 632B64BBE;
	Sat, 22 Oct 2022 21:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 632B64BBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666468410;
	bh=tCZ00YCFO+E5Puu3iG0L82J5VVeQMJdjNs8l0se9u8w=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tLehBy9GbiaWwx4iux9JleIfSI/Ko3hNl1osrvLw9k1Xbw+NAYfIsBxIXbS3ww7z6
	 xr7Y4lZUHoGDQSXdxy4lZtEcGCIdgBkT12uHEQHk2nPeKc75domnz8tGLQl7JhPW3Y
	 3o+3YfnLttsDHMMMhz8CdEEnQGHf4SCnRSimEzhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDF53F802DB;
	Sat, 22 Oct 2022 21:52:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87497F80290; Sat, 22 Oct 2022 21:52:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76C4EF80130
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 21:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76C4EF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="er+MHR5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1666468346; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZ3hBQEVzaFq6/u6tHCgkfOoM2IBjzNfvv1F//7P+WM=;
 b=er+MHR5Wx0UaYGEzgy2xBgOtO551HUtmAq8J30ycc1e9uUjHgRAxkMGbYZOTsTymvCJYxd
 vuPhEaMDIgrprK63N9pHieHKrxlqFokdZEnkWmxYeDGKfOzwa4p4jpf+9okqS+jqo3KjRo
 KV65vZ2wIwhfHMBnlUn2gKjMq1EAozM=
Date: Sat, 22 Oct 2022 20:52:16 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/9] ASoC: jz4740-i2s: Convert to regmap API
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <4776KR.CIYUGCEKBEYA@crapouillou.net>
In-Reply-To: <20221022191308.82348-3-aidanmacdonald.0x0@gmail.com>
References: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
 <20221022191308.82348-3-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, zhouyu@wanyeetech.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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

Hi Aidan,

Le sam. 22 oct. 2022 =E0 20:13:01 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> Using regmap for accessing the AIC registers makes the driver a
> little easier to read, and later refactors can take advantage of
> regmap APIs to further simplify the driver.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Looks good.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/Kconfig      |   1 +
>  sound/soc/jz4740/jz4740-i2s.c | 106=20
> ++++++++++++----------------------
>  2 files changed, 39 insertions(+), 68 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/Kconfig b/sound/soc/jz4740/Kconfig
> index e72f826062e9..dd3b4507fbe6 100644
> --- a/sound/soc/jz4740/Kconfig
> +++ b/sound/soc/jz4740/Kconfig
> @@ -3,6 +3,7 @@ config SND_JZ4740_SOC_I2S
>  	tristate "SoC Audio (I2S protocol) for Ingenic JZ4740 SoC"
>  	depends on MIPS || COMPILE_TEST
>  	depends on HAS_IOMEM
> +	select REGMAP_MMIO
>  	select SND_SOC_GENERIC_DMAENGINE_PCM
>  	help
>  	  Say Y if you want to use I2S protocol and I2S codec on Ingenic=20
> JZ4740
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 83cb81999c6f..f3c0d7c0415e 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/slab.h>
>=20
>  #include <linux/clk.h>
> @@ -96,7 +97,7 @@ struct i2s_soc_info {
>  };
>=20
>  struct jz4740_i2s {
> -	void __iomem *base;
> +	struct regmap *regmap;
>=20
>  	struct clk *clk_aic;
>  	struct clk *clk_i2s;
> @@ -107,31 +108,10 @@ struct jz4740_i2s {
>  	const struct i2s_soc_info *soc_info;
>  };
>=20
> -static inline uint32_t jz4740_i2s_read(const struct jz4740_i2s *i2s,
> -	unsigned int reg)
> -{
> -	return readl(i2s->base + reg);
> -}
> -
> -static inline void jz4740_i2s_write(const struct jz4740_i2s *i2s,
> -	unsigned int reg, uint32_t value)
> -{
> -	writel(value, i2s->base + reg);
> -}
> -
> -static inline void jz4740_i2s_set_bits(const struct jz4740_i2s *i2s,
> -	unsigned int reg, uint32_t bits)
> -{
> -	uint32_t value =3D jz4740_i2s_read(i2s, reg);
> -	value |=3D bits;
> -	jz4740_i2s_write(i2s, reg, value);
> -}
> -
>  static int jz4740_i2s_startup(struct snd_pcm_substream *substream,
>  	struct snd_soc_dai *dai)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> -	uint32_t conf;
>  	int ret;
>=20
>  	/*
> @@ -141,9 +121,9 @@ static int jz4740_i2s_startup(struct=20
> snd_pcm_substream *substream,
>  	 */
>  	if (!i2s->soc_info->shared_fifo_flush) {
>  		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> -			jz4740_i2s_set_bits(i2s, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_TFLUSH);
> +			regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_TFLUSH);
>  		else
> -			jz4740_i2s_set_bits(i2s, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_RFLUSH);
> +			regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_RFLUSH);
>  	}
>=20
>  	if (snd_soc_dai_active(dai))
> @@ -156,16 +136,13 @@ static int jz4740_i2s_startup(struct=20
> snd_pcm_substream *substream,
>  	 * guard this behind the snd_soc_dai_active() check.
>  	 */
>  	if (i2s->soc_info->shared_fifo_flush)
> -		jz4740_i2s_set_bits(i2s, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_TFLUSH);
> +		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_TFLUSH);
>=20
>  	ret =3D clk_prepare_enable(i2s->clk_i2s);
>  	if (ret)
>  		return ret;
>=20
> -	conf =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
> -	conf |=3D JZ_AIC_CONF_ENABLE;
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
> -
> +	regmap_set_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
>  	return 0;
>  }
>=20
> @@ -173,14 +150,11 @@ static void jz4740_i2s_shutdown(struct=20
> snd_pcm_substream *substream,
>  	struct snd_soc_dai *dai)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> -	uint32_t conf;
>=20
>  	if (snd_soc_dai_active(dai))
>  		return;
>=20
> -	conf =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
> -	conf &=3D ~JZ_AIC_CONF_ENABLE;
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
> +	regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
>=20
>  	clk_disable_unprepare(i2s->clk_i2s);
>  }
> @@ -189,8 +163,6 @@ static int jz4740_i2s_trigger(struct=20
> snd_pcm_substream *substream, int cmd,
>  	struct snd_soc_dai *dai)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> -
> -	uint32_t ctrl;
>  	uint32_t mask;
>=20
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> @@ -198,38 +170,30 @@ static int jz4740_i2s_trigger(struct=20
> snd_pcm_substream *substream, int cmd,
>  	else
>  		mask =3D JZ_AIC_CTRL_ENABLE_CAPTURE | JZ_AIC_CTRL_ENABLE_RX_DMA;
>=20
> -	ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
> -
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -		ctrl |=3D mask;
> +		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, mask);
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		ctrl &=3D ~mask;
> +		regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CTRL, mask);
>  		break;
>  	default:
>  		return -EINVAL;
>  	}
>=20
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
> -
>  	return 0;
>  }
>=20
>  static int jz4740_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int=20
> fmt)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> -
> -	uint32_t format =3D 0;
> -	uint32_t conf;
> -
> -	conf =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
> -
> -	conf &=3D ~(JZ_AIC_CONF_BIT_CLK_MASTER | JZ_AIC_CONF_SYNC_CLK_MASTER);
> +	const unsigned int conf_mask =3D JZ_AIC_CONF_BIT_CLK_MASTER |
> +				       JZ_AIC_CONF_SYNC_CLK_MASTER;
> +	unsigned int conf =3D 0, format =3D 0;
>=20
>  	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
>  	case SND_SOC_DAIFMT_BP_FP:
> @@ -265,8 +229,8 @@ static int jz4740_i2s_set_fmt(struct snd_soc_dai=20
> *dai, unsigned int fmt)
>  		return -EINVAL;
>  	}
>=20
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_I2S_FMT, format);
> +	regmap_update_bits(i2s->regmap, JZ_REG_AIC_CONF, conf_mask, conf);
> +	regmap_write(i2s->regmap, JZ_REG_AIC_I2S_FMT, format);
>=20
>  	return 0;
>  }
> @@ -279,9 +243,9 @@ static int jz4740_i2s_hw_params(struct=20
> snd_pcm_substream *substream,
>  	uint32_t ctrl, div_reg;
>  	int div;
>=20
> -	ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
> +	regmap_read(i2s->regmap, JZ_REG_AIC_CTRL, &ctrl);
> +	regmap_read(i2s->regmap, JZ_REG_AIC_CLK_DIV, &div_reg);
>=20
> -	div_reg =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CLK_DIV);
>  	div =3D clk_get_rate(i2s->clk_i2s) / (64 * params_rate(params));
>=20
>  	switch (params_format(params)) {
> @@ -318,8 +282,8 @@ static int jz4740_i2s_hw_params(struct=20
> snd_pcm_substream *substream,
>  		}
>  	}
>=20
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CLK_DIV, div_reg);
> +	regmap_write(i2s->regmap, JZ_REG_AIC_CTRL, ctrl);
> +	regmap_write(i2s->regmap, JZ_REG_AIC_CLK_DIV, div_reg);
>=20
>  	return 0;
>  }
> @@ -356,13 +320,9 @@ static int jz4740_i2s_set_sysclk(struct=20
> snd_soc_dai *dai, int clk_id,
>  static int jz4740_i2s_suspend(struct snd_soc_component *component)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_component_get_drvdata(component);
> -	uint32_t conf;
>=20
>  	if (snd_soc_component_active(component)) {
> -		conf =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
> -		conf &=3D ~JZ_AIC_CONF_ENABLE;
> -		jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
> -
> +		regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CONF,=20
> JZ_AIC_CONF_ENABLE);
>  		clk_disable_unprepare(i2s->clk_i2s);
>  	}
>=20
> @@ -374,7 +334,6 @@ static int jz4740_i2s_suspend(struct=20
> snd_soc_component *component)
>  static int jz4740_i2s_resume(struct snd_soc_component *component)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_component_get_drvdata(component);
> -	uint32_t conf;
>  	int ret;
>=20
>  	ret =3D clk_prepare_enable(i2s->clk_aic);
> @@ -388,9 +347,7 @@ static int jz4740_i2s_resume(struct=20
> snd_soc_component *component)
>  			return ret;
>  		}
>=20
> -		conf =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
> -		conf |=3D JZ_AIC_CONF_ENABLE;
> -		jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
> +		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
>  	}
>=20
>  	return 0;
> @@ -423,8 +380,8 @@ static int jz4740_i2s_dai_probe(struct=20
> snd_soc_dai *dai)
>  			JZ_AIC_CONF_INTERNAL_CODEC;
>  	}
>=20
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
> +	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
> +	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, conf);
>=20
>  	return 0;
>  }
> @@ -523,11 +480,19 @@ static const struct of_device_id=20
> jz4740_of_matches[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, jz4740_of_matches);
>=20
> +static const struct regmap_config jz4740_i2s_regmap_config =3D {
> +	.reg_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.val_bits	=3D 32,
> +	.max_register	=3D JZ_REG_AIC_FIFO,
> +};
> +
>  static int jz4740_i2s_dev_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct jz4740_i2s *i2s;
>  	struct resource *mem;
> +	void __iomem *regs;
>  	int ret;
>=20
>  	i2s =3D devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
> @@ -536,9 +501,9 @@ static int jz4740_i2s_dev_probe(struct=20
> platform_device *pdev)
>=20
>  	i2s->soc_info =3D device_get_match_data(dev);
>=20
> -	i2s->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
> -	if (IS_ERR(i2s->base))
> -		return PTR_ERR(i2s->base);
> +	regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
>=20
>  	i2s->playback_dma_data.maxburst =3D 16;
>  	i2s->playback_dma_data.addr =3D mem->start + JZ_REG_AIC_FIFO;
> @@ -554,6 +519,11 @@ static int jz4740_i2s_dev_probe(struct=20
> platform_device *pdev)
>  	if (IS_ERR(i2s->clk_i2s))
>  		return PTR_ERR(i2s->clk_i2s);
>=20
> +	i2s->regmap =3D devm_regmap_init_mmio(&pdev->dev, regs,
> +					    &jz4740_i2s_regmap_config);
> +	if (IS_ERR(i2s->regmap))
> +		return PTR_ERR(i2s->regmap);
> +
>  	platform_set_drvdata(pdev, i2s);
>=20
>  	ret =3D devm_snd_soc_register_component(dev, &jz4740_i2s_component,
> --
> 2.38.1
>=20


