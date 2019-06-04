Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D5A340FA
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 10:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D384916CE;
	Tue,  4 Jun 2019 09:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D384916CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559635232;
	bh=uLwwwTTH2ZsJYDc3HpG0RyLosIn6W5HuvzZ/n27kNTQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kxr2aFfmXOiNATYyiejGrnU2c9umwpkARqmligNT6yPHP5tz7Pog859qhnhufJDAo
	 FcZpa/36actOvMrWrUyw9XZc9Tddk0NTj4o0zxrcJcIWHWpyB6pDwBNfqj4ja1e8D7
	 F9PZfvUZJESEjs39QL2wnkh1sBm0b+OaoSN/iHRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A6D4F896EF;
	Tue,  4 Jun 2019 09:58:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38547F896F7; Tue,  4 Jun 2019 09:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5F9EF89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 09:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5F9EF89673
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr
 [90.88.144.139]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C485B1BF209;
 Tue,  4 Jun 2019 07:58:40 +0000 (UTC)
Date: Tue, 4 Jun 2019 09:58:40 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: codekipper@gmail.com
Message-ID: <20190604075840.kquy3zcuckuzmvzr@flea>
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-7-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190603174735.21002-7-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4 6/9] ASoC: sun4i-i2s: Add multi-lane
	functionality
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
Content-Type: multipart/mixed; boundary="===============8952491030108563530=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8952491030108563530==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nyo2exzeeeog6q2h"
Content-Disposition: inline


--nyo2exzeeeog6q2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2019 at 07:47:32PM +0200, codekipper@gmail.com wrote:
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

I'd like to have Mark's input on this, but I'm really worried about
the interaction with the proper TDM support.

Our fundamental issue is that the controller can have up to 8
channels, but either on 4 lines (instead of 1), or 8 channels on 1
(like proper TDM) (or any combination between the two, but that should
be pretty rare).

You're trying to do the first one, and I'm trying to do the second one.

There's a number of assumptions later on that will break the TDM case,
see below for examples

> ---
>  sound/soc/sunxi/sun4i-i2s.c | 44 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index bca73b3c0d74..75217fb52bfa 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -23,7 +23,7 @@
>
>  #define SUN4I_I2S_CTRL_REG		0x00
>  #define SUN4I_I2S_CTRL_SDO_EN_MASK		GENMASK(11, 8)
> -#define SUN4I_I2S_CTRL_SDO_EN(sdo)			BIT(8 + (sdo))
> +#define SUN4I_I2S_CTRL_SDO_EN(lines)		(((1 << lines) - 1) << 8)
>  #define SUN4I_I2S_CTRL_MODE_MASK		BIT(5)
>  #define SUN4I_I2S_CTRL_MODE_SLAVE			(1 << 5)
>  #define SUN4I_I2S_CTRL_MODE_MASTER			(0 << 5)
> @@ -355,14 +355,23 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>  	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	int sr, wss, channels;
>  	u32 width;
> +	int lines;
>
>  	channels = params_channels(params);
> -	if (channels != 2) {
> +	if ((channels > dai->driver->playback.channels_max) ||
> +		(channels < dai->driver->playback.channels_min)) {
>  		dev_err(dai->dev, "Unsupported number of channels: %d\n",
>  			channels);
>  		return -EINVAL;
>  	}
>
> +	lines = (channels + 1) / 2;
> +
> +	/* Enable the required output lines */
> +	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> +			   SUN4I_I2S_CTRL_SDO_EN_MASK,
> +			   SUN4I_I2S_CTRL_SDO_EN(lines));
> +

This has the assumption that each line will have 2 channels, which is wrong.

>  	if (i2s->variant->is_h3_i2s_based) {
>  		regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
>  				   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
> @@ -373,8 +382,19 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>  	}
>
>  	/* Map the channels for playback and capture */
> -	regmap_field_write(i2s->field_txchanmap, 0x76543210);
>  	regmap_field_write(i2s->field_rxchanmap, 0x00003210);
> +	regmap_field_write(i2s->field_txchanmap, 0x10);
> +	if (i2s->variant->is_h3_i2s_based) {
> +		if (channels > 2)
> +			regmap_write(i2s->regmap,
> +				     SUN8I_I2S_TX_CHAN_MAP_REG+4, 0x32);
> +		if (channels > 4)
> +			regmap_write(i2s->regmap,
> +				     SUN8I_I2S_TX_CHAN_MAP_REG+8, 0x54);
> +		if (channels > 6)
> +			regmap_write(i2s->regmap,
> +				     SUN8I_I2S_TX_CHAN_MAP_REG+12, 0x76);
> +	}

And this creates a mapping matching that.

>  	/* Configure the channels */
>  	regmap_field_write(i2s->field_txchansel,
> @@ -1057,9 +1077,10 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
>  static int sun4i_i2s_probe(struct platform_device *pdev)
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
> @@ -1126,6 +1147,19 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
>  	i2s->capture_dma_data.addr = res->start + SUN4I_I2S_FIFO_RX_REG;
>  	i2s->capture_dma_data.maxburst = 8;
>
> +	soc_dai = devm_kmemdup(&pdev->dev, &sun4i_i2s_dai,
> +			       sizeof(*soc_dai), GFP_KERNEL);
> +	if (!soc_dai) {
> +		ret = -ENOMEM;
> +		goto err_pm_disable;
> +	}
> +
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "allwinner,playback-channels", &val)) {
> +		if (val >= 2 && val <= 8)
> +			soc_dai->playback.channels_max = val;
> +	}
> +

I'm not quite sure how this works.

of_property_read_u32 will return 0, so you will enter in the
condition. But what happens if the property is missing?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nyo2exzeeeog6q2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPYksAAKCRDj7w1vZxhR
xYBQAQCYX/Uu2lP7J+mcD5tFPBbgLuQ9PtE3e9B6ovbn9juZOQEA3+ZUzorIBacX
S9cvpP0cRQzxe6STHA66H3PfQRHFDA0=
=qzcv
-----END PGP SIGNATURE-----

--nyo2exzeeeog6q2h--

--===============8952491030108563530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8952491030108563530==--
