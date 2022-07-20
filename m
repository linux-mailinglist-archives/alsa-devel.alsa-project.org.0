Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27357B618
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 14:05:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F9A9175D;
	Wed, 20 Jul 2022 14:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F9A9175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658318727;
	bh=jbpPX9pe3sNDRFxGrxj0J1L2vf+HANmN5lv+XK7ze18=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXRxwk5sgsk0Fp8EMgA52jGqOCdTHkUTLCotnElL+1TJ8TMFBuqz4jteMv+bUlLMU
	 63lu73Fb2IpnDZBfzMAuNiuogAiLU01zlLpSV9wfsNpti8XHGUjmN7ftOzsY9fO696
	 bHH04naqoGS98om+9rQ6g18EfCg4MOkstAWcijsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA40F800BA;
	Wed, 20 Jul 2022 14:04:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D347F800BA; Wed, 20 Jul 2022 14:04:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27091F80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 14:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27091F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="BfHJXcPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1658318652; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnfcxwjD5VEqdAApN8ZMGAAkgvJHjWCm9p0n29wZyrM=;
 b=BfHJXcPl0gTqQpDrY09cVTdgChK8nlMPusOWuVwRkxOdgl3gPDJiEk39+/L/vctWhsB/9g
 aCx/QmdduNUuDfR6YmIXqok2/foWS6RpP88WwvPja6pTjk/qeP4blL2pCLloi6H9ucXxpt
 9oBSxvVdZRNcM+pCfFT2pnJbNPrS3/o=
Date: Wed, 20 Jul 2022 13:04:00 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 11/11] ASoC: jz4740-i2s: Refactor DAI probe/remove ops
 as component ops
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <OUIBFR.VWH85QRTE1NF3@crapouillou.net>
In-Reply-To: <20220708160244.21933-12-aidanmacdonald.0x0@gmail.com>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-12-aidanmacdonald.0x0@gmail.com>
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

Le ven., juil. 8 2022 at 17:02:44 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> Move most of the DAI probe/remove logic into component ops.
> This makes things more consistent because the AIC clock is
> now managed solely from the component side. And it makes it
> easier to add codec switching support later on.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 54=20
> +++++++++++++++++++----------------
>  1 file changed, 30 insertions(+), 24 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 5db73f12efcf..d99a19bc5166 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -306,32 +306,10 @@ static int jz4740_i2s_set_sysclk(struct=20
> snd_soc_dai *dai, int clk_id,
>  static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> -	int ret;
> -
> -	ret =3D clk_prepare_enable(i2s->clk_aic);
> -	if (ret)
> -		return ret;
>=20
>  	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
>  		&i2s->capture_dma_data);
>=20
> -	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
> -
> -	regmap_write(i2s->regmap, JZ_REG_AIC_CONF,
> -		     JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
> -		     JZ_AIC_CONF_I2S | JZ_AIC_CONF_INTERNAL_CODEC);
> -
> -	regmap_field_write(i2s->field_rx_fifo_thresh, 7);
> -	regmap_field_write(i2s->field_tx_fifo_thresh, 8);
> -
> -	return 0;
> -}
> -
> -static int jz4740_i2s_dai_remove(struct snd_soc_dai *dai)
> -{
> -	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> -
> -	clk_disable_unprepare(i2s->clk_aic);
>  	return 0;
>  }
>=20
> @@ -351,7 +329,6 @@ static const struct snd_soc_dai_ops=20
> jz4740_i2s_dai_ops =3D {
>=20
>  static struct snd_soc_dai_driver jz4740_i2s_dai =3D {
>  	.probe =3D jz4740_i2s_dai_probe,
> -	.remove =3D jz4740_i2s_dai_remove,
>  	.playback =3D {
>  		.channels_min =3D 1,
>  		.channels_max =3D 2,
> @@ -389,7 +366,6 @@ static const struct i2s_soc_info=20
> jz4760_i2s_soc_info =3D {
>=20
>  static struct snd_soc_dai_driver jz4770_i2s_dai =3D {
>  	.probe =3D jz4740_i2s_dai_probe,
> -	.remove =3D jz4740_i2s_dai_remove,
>  	.playback =3D {
>  		.channels_min =3D 1,
>  		.channels_max =3D 2,
> @@ -459,8 +435,38 @@ static int jz4740_i2s_resume(struct=20
> snd_soc_component *component)
>  	return 0;
>  }
>=20
> +static int jz4740_i2s_probe(struct snd_soc_component *component)
> +{
> +	struct jz4740_i2s *i2s =3D snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(i2s->clk_aic);
> +	if (ret)
> +		return ret;
> +
> +	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
> +
> +	regmap_write(i2s->regmap, JZ_REG_AIC_CONF,
> +		     JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
> +		     JZ_AIC_CONF_I2S | JZ_AIC_CONF_INTERNAL_CODEC);
> +
> +	regmap_field_write(i2s->field_rx_fifo_thresh, 7);
> +	regmap_field_write(i2s->field_tx_fifo_thresh, 8);
> +
> +	return 0;
> +}
> +
> +static void jz4740_i2s_remove(struct snd_soc_component *component)
> +{
> +	struct jz4740_i2s *i2s =3D snd_soc_component_get_drvdata(component);
> +
> +	clk_disable_unprepare(i2s->clk_aic);
> +}
> +
>  static const struct snd_soc_component_driver jz4740_i2s_component =3D {
>  	.name			=3D "jz4740-i2s",
> +	.probe			=3D jz4740_i2s_probe,
> +	.remove			=3D jz4740_i2s_remove,
>  	.suspend		=3D jz4740_i2s_suspend,
>  	.resume			=3D jz4740_i2s_resume,
>  	.legacy_dai_naming	=3D 1,
> --
> 2.35.1
>=20


