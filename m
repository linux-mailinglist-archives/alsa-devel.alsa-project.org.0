Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA057B5E5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 13:52:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1C09172A;
	Wed, 20 Jul 2022 13:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1C09172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658317921;
	bh=4ORBQ0SZNpITs+pBb59FyUcPp6GcqU0b+3LazenUlJg=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U222vklG0oVzAC+4uaXgxrAwTq1X6AFZFqGtAyg1+u4FFt8HSNiR03wcxB+0kjlG7
	 oGpS4TTj9XlHyDMl6bIQrE4AKx1QoTpAAM00+pA1v+WwhhE23hfFBEKb1xtbrj7Iw/
	 DAVyiHb0kFyX2ZUO2TK+Kgi3KyYhx+XeyXRMI5gQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E3BDF800BA;
	Wed, 20 Jul 2022 13:51:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33F1FF80169; Wed, 20 Jul 2022 13:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC143F80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 13:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC143F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="KI+62Yqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1658317852; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6oTdFFYPimLCbdqufOoW+DcYvOkIE4zqpsz7adWv/0=;
 b=KI+62Yqxq33j/DUTOF1bT1924OSG4kKzEQQ5mLlNIFJ5Jnma3bJBCvyN2UuVfZDrYFcmYN
 V8mjE4m0GilO9P6Bl+43hIEq45dcBFf7uLkJIY44lbVp2flwx/44ggaIigqu84/fRpaogo
 tQZpAoqjqHPTQcYmDVmFSc2xhGjMWr4=
Date: Wed, 20 Jul 2022 12:50:42 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 04/11] ASoC: jz4740-i2s: Simplify using regmap fields
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <I8IBFR.IRTZANT1TBO53@crapouillou.net>
In-Reply-To: <20220708160244.21933-5-aidanmacdonald.0x0@gmail.com>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-5-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
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

Le ven., juil. 8 2022 at 17:02:37 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> The differences between register fields on different SoC versions
> can be abstracted away using the regmap field API. This is easier
> to understand and extend than comparisons based on the version ID.
> Since the version IDs are unused after this change, remove them at
> the same time, and remove unused macros.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 135=20
> +++++++++++++++++++---------------
>  1 file changed, 77 insertions(+), 58 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 1393b383a886..043f100a9cfa 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -34,8 +34,6 @@
>  #define JZ_REG_AIC_CLK_DIV	0x30
>  #define JZ_REG_AIC_FIFO		0x34
>=20
> -#define JZ_AIC_CONF_FIFO_RX_THRESHOLD_MASK (0xf << 12)
> -#define JZ_AIC_CONF_FIFO_TX_THRESHOLD_MASK (0xf <<  8)
>  #define JZ_AIC_CONF_OVERFLOW_PLAY_LAST BIT(6)
>  #define JZ_AIC_CONF_INTERNAL_CODEC BIT(5)
>  #define JZ_AIC_CONF_I2S BIT(4)
> @@ -44,11 +42,6 @@
>  #define JZ_AIC_CONF_SYNC_CLK_MASTER BIT(1)
>  #define JZ_AIC_CONF_ENABLE BIT(0)
>=20
> -#define JZ_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 12
> -#define JZ_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 8
> -#define JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 24
> -#define JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 16
> -
>  #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK (0x7 << 19)
>  #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK (0x7 << 16)
>  #define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
> @@ -78,29 +71,25 @@
>=20
>  #define JZ_AIC_I2S_STATUS_BUSY BIT(2)
>=20
> -#define JZ_AIC_CLK_DIV_MASK 0xf
> -#define I2SDIV_DV_SHIFT 0
> -#define I2SDIV_DV_MASK (0xf << I2SDIV_DV_SHIFT)
> -#define I2SDIV_IDV_SHIFT 8
> -#define I2SDIV_IDV_MASK (0xf << I2SDIV_IDV_SHIFT)
> -
> -enum jz47xx_i2s_version {
> -	JZ_I2S_JZ4740,
> -	JZ_I2S_JZ4760,
> -	JZ_I2S_JZ4770,
> -	JZ_I2S_JZ4780,
> -};
> -
>  struct i2s_soc_info {
> -	enum jz47xx_i2s_version version;
>  	struct snd_soc_dai_driver *dai;
>=20
> +	struct reg_field field_rx_fifo_thresh;
> +	struct reg_field field_tx_fifo_thresh;
> +	struct reg_field field_i2sdiv_capture;
> +	struct reg_field field_i2sdiv_playback;
> +
>  	bool shared_fifo_flush;
>  };
>=20
>  struct jz4740_i2s {
>  	struct regmap *regmap;
>=20
> +	struct regmap_field *field_rx_fifo_thresh;
> +	struct regmap_field *field_tx_fifo_thresh;
> +	struct regmap_field *field_i2sdiv_capture;
> +	struct regmap_field *field_i2sdiv_playback;
> +
>  	struct clk *clk_aic;
>  	struct clk *clk_i2s;
>=20
> @@ -238,12 +227,12 @@ static int jz4740_i2s_hw_params(struct=20
> snd_pcm_substream *substream,
>  	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> +	struct regmap_field *div_field;
>  	unsigned int sample_size;
> -	uint32_t ctrl, div_reg;
> +	uint32_t ctrl;
>  	int div;
>=20
>  	regmap_read(i2s->regmap, JZ_REG_AIC_CTRL, &ctrl);
> -	regmap_read(i2s->regmap, JZ_REG_AIC_CLK_DIV, &div_reg);
>=20
>  	div =3D clk_get_rate(i2s->clk_i2s) / (64 * params_rate(params));
>=20
> @@ -266,23 +255,16 @@ static int jz4740_i2s_hw_params(struct=20
> snd_pcm_substream *substream,
>  		else
>  			ctrl &=3D ~JZ_AIC_CTRL_MONO_TO_STEREO;
>=20
> -		div_reg &=3D ~I2SDIV_DV_MASK;
> -		div_reg |=3D (div - 1) << I2SDIV_DV_SHIFT;
> +		div_field =3D i2s->field_i2sdiv_playback;
>  	} else {
>  		ctrl &=3D ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK;
>  		ctrl |=3D sample_size << JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET;
>=20
> -		if (i2s->soc_info->version >=3D JZ_I2S_JZ4770) {
> -			div_reg &=3D ~I2SDIV_IDV_MASK;
> -			div_reg |=3D (div - 1) << I2SDIV_IDV_SHIFT;
> -		} else {
> -			div_reg &=3D ~I2SDIV_DV_MASK;
> -			div_reg |=3D (div - 1) << I2SDIV_DV_SHIFT;
> -		}
> +		div_field =3D i2s->field_i2sdiv_capture;
>  	}
>=20
>  	regmap_write(i2s->regmap, JZ_REG_AIC_CTRL, ctrl);
> -	regmap_write(i2s->regmap, JZ_REG_AIC_CLK_DIV, div_reg);
> +	regmap_field_write(div_field, div - 1);
>=20
>  	return 0;
>  }
> @@ -355,7 +337,6 @@ static int jz4740_i2s_resume(struct=20
> snd_soc_component *component)
>  static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> -	uint32_t conf;
>  	int ret;
>=20
>  	ret =3D clk_prepare_enable(i2s->clk_aic);
> @@ -365,22 +346,14 @@ static int jz4740_i2s_dai_probe(struct=20
> snd_soc_dai *dai)
>  	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
>  		&i2s->capture_dma_data);
>=20
> -	if (i2s->soc_info->version >=3D JZ_I2S_JZ4760) {
> -		conf =3D (7 << JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET) |
> -			(8 << JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET) |
> -			JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
> -			JZ_AIC_CONF_I2S |
> -			JZ_AIC_CONF_INTERNAL_CODEC;
> -	} else {
> -		conf =3D (7 << JZ_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET) |
> -			(8 << JZ_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET) |
> -			JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
> -			JZ_AIC_CONF_I2S |
> -			JZ_AIC_CONF_INTERNAL_CODEC;
> -	}
> -
>  	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
> -	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, conf);
> +
> +	regmap_write(i2s->regmap, JZ_REG_AIC_CONF,
> +		     JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
> +		     JZ_AIC_CONF_I2S | JZ_AIC_CONF_INTERNAL_CODEC);
> +
> +	regmap_field_write(i2s->field_rx_fifo_thresh, 7);
> +	regmap_field_write(i2s->field_tx_fifo_thresh, 8);
>=20
>  	return 0;
>  }
> @@ -425,14 +398,20 @@ static struct snd_soc_dai_driver jz4740_i2s_dai=20
> =3D {
>  };
>=20
>  static const struct i2s_soc_info jz4740_i2s_soc_info =3D {
> -	.version =3D JZ_I2S_JZ4740,
> -	.dai =3D &jz4740_i2s_dai,
> -	.shared_fifo_flush =3D true,
> +	.dai			=3D &jz4740_i2s_dai,
> +	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 12, 15),
> +	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
> +	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.shared_fifo_flush	=3D true,
>  };
>=20
>  static const struct i2s_soc_info jz4760_i2s_soc_info =3D {
> -	.version =3D JZ_I2S_JZ4760,
> -	.dai =3D &jz4740_i2s_dai,
> +	.dai			=3D &jz4740_i2s_dai,
> +	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
> +	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
> +	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>  };
>=20
>  static struct snd_soc_dai_driver jz4770_i2s_dai =3D {
> @@ -454,13 +433,19 @@ static struct snd_soc_dai_driver jz4770_i2s_dai=20
> =3D {
>  };
>=20
>  static const struct i2s_soc_info jz4770_i2s_soc_info =3D {
> -	.version =3D JZ_I2S_JZ4770,
> -	.dai =3D &jz4770_i2s_dai,
> +	.dai			=3D &jz4770_i2s_dai,
> +	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
> +	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
> +	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
> +	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>  };
>=20
>  static const struct i2s_soc_info jz4780_i2s_soc_info =3D {
> -	.version =3D JZ_I2S_JZ4780,
> -	.dai =3D &jz4770_i2s_dai,
> +	.dai			=3D &jz4770_i2s_dai,
> +	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
> +	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
> +	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
> +	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>  };
>=20
>  static const struct snd_soc_component_driver jz4740_i2s_component =3D {
> @@ -479,6 +464,36 @@ static const struct of_device_id=20
> jz4740_of_matches[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, jz4740_of_matches);
>=20
> +static int jz4740_i2s_init_regmap_fields(struct device *dev,
> +					 struct jz4740_i2s *i2s)
> +{
> +	i2s->field_rx_fifo_thresh =3D
> +		devm_regmap_field_alloc(dev, i2s->regmap,
> +					i2s->soc_info->field_rx_fifo_thresh);
> +	if (IS_ERR(i2s->field_rx_fifo_thresh))
> +		return PTR_ERR(i2s->field_rx_fifo_thresh);
> +
> +	i2s->field_tx_fifo_thresh =3D
> +		devm_regmap_field_alloc(dev, i2s->regmap,
> +					i2s->soc_info->field_tx_fifo_thresh);
> +	if (IS_ERR(i2s->field_tx_fifo_thresh))
> +		return PTR_ERR(i2s->field_tx_fifo_thresh);
> +
> +	i2s->field_i2sdiv_capture =3D
> +		devm_regmap_field_alloc(dev, i2s->regmap,
> +					i2s->soc_info->field_i2sdiv_capture);
> +	if (IS_ERR(i2s->field_i2sdiv_capture))
> +		return PTR_ERR(i2s->field_i2sdiv_capture);
> +
> +	i2s->field_i2sdiv_playback =3D
> +		devm_regmap_field_alloc(dev, i2s->regmap,
> +					i2s->soc_info->field_i2sdiv_playback);
> +	if (IS_ERR(i2s->field_i2sdiv_playback))
> +		return PTR_ERR(i2s->field_i2sdiv_playback);
> +
> +	return 0;
> +}
> +
>  static const struct regmap_config jz4740_i2s_regmap_config =3D {
>  	.reg_bits	=3D 32,
>  	.reg_stride	=3D 4,
> @@ -523,6 +538,10 @@ static int jz4740_i2s_dev_probe(struct=20
> platform_device *pdev)
>  	if (IS_ERR(i2s->regmap))
>  		return PTR_ERR(i2s->regmap);
>=20
> +	ret =3D jz4740_i2s_init_regmap_fields(dev, i2s);
> +	if (ret)
> +		return ret;
> +
>  	platform_set_drvdata(pdev, i2s);
>=20
>  	ret =3D devm_snd_soc_register_component(dev, &jz4740_i2s_component,
> --
> 2.35.1
>=20


