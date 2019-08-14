Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC4F8D1D3
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 13:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE1E165D;
	Wed, 14 Aug 2019 13:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE1E165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565781133;
	bh=fzq5tlfISLQ331ouyCir9Xh+X2xyCi9dNHteuK7uxg0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfDLHzFo3VJ+wt9nxxoNQAgfkVxXCgywO1W4FVhPoAVvjoUxZPEhpA+8KMnJYYIDs
	 XF+F9sBThrpdHob/YofTTml2Sd9uC+8VMOaC/ZyxOBlQh3uO3WFa7mRkPp7FVbWbMq
	 TFmNuL2MFxML5TgBzeRBJUjl+Q4Zw2vuxjAyb3RU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ED6FF805F9;
	Wed, 14 Aug 2019 13:08:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B89E2F805E1; Wed, 14 Aug 2019 13:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FAF0F803F4
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 13:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FAF0F803F4
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 64E52E000A;
 Wed, 14 Aug 2019 11:08:40 +0000 (UTC)
Date: Wed, 14 Aug 2019 09:16:45 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: codekipper@gmail.com
Message-ID: <20190814071645.33qe7bvwpbakjg2e@flea>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-5-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190814060854.26345-5-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5 04/15] ASoC: sun4i-i2s: Support more
 formats on newer SoCs
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
Content-Type: multipart/mixed; boundary="===============3214037757333831186=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3214037757333831186==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nwzjgr7m2im3tclk"
Content-Disposition: inline


--nwzjgr7m2im3tclk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2019 at 08:08:43AM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> There is a need to support more formats on the newer SoCs(H3 and later).
> Extend the formats supported to include DSP_A and DSP_B modes.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 87 +++++++++++++++++++++++++++----------
>  1 file changed, 63 insertions(+), 24 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 34f31439ae7b..3553c17318b0 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -27,6 +27,8 @@
>  #define SUN4I_I2S_CTRL_MODE_MASK		BIT(5)
>  #define SUN4I_I2S_CTRL_MODE_SLAVE			(1 << 5)
>  #define SUN4I_I2S_CTRL_MODE_MASTER			(0 << 5)
> +#define SUN4I_I2S_CTRL_PCM			BIT(4)
> +#define SUN4I_I2S_CTRL_LOOP			BIT(3)
>  #define SUN4I_I2S_CTRL_TX_EN			BIT(2)
>  #define SUN4I_I2S_CTRL_RX_EN			BIT(1)
>  #define SUN4I_I2S_CTRL_GL_EN			BIT(0)
> @@ -91,6 +93,9 @@
>  /* Defines required for sun8i-h3 support */
>  #define SUN8I_I2S_CTRL_BCLK_OUT			BIT(18)
>  #define SUN8I_I2S_CTRL_LRCK_OUT			BIT(17)
> +#define SUN8I_I2S_CTRL_MODE_RIGHT_J			(2 << 0)
> +#define SUN8I_I2S_CTRL_MODE_I2S_LEFT_J			(1 << 0)
> +#define SUN8I_I2S_CTRL_MODE_PCM				(0 << 0)
>
>  #define SUN8I_I2S_FMT0_LRCK_PERIOD_MASK		GENMASK(17, 8)
>  #define SUN8I_I2S_FMT0_LRCK_PERIOD(period)	((period - 1) << 8)
> @@ -164,6 +169,7 @@ struct sun4i_i2s_quirks {
>
>  	s8	(*get_sr)(const struct sun4i_i2s *, int);
>  	s8	(*get_wss)(const struct sun4i_i2s *, int);
> +	int	(*set_format)(struct sun4i_i2s *, unsigned int);
>  };
>
>  struct sun4i_i2s {
> @@ -194,6 +200,7 @@ struct sun4i_i2s {
>
>  	unsigned int	tdm_slots;
>  	unsigned int	slot_width;
> +	unsigned int	offset;
>  };
>
>  struct sun4i_i2s_clk_div {
> @@ -484,19 +491,14 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>  				      i2s->slot_width : params_width(params));
>  }
>
> -static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +static int sun4i_i2s_set_format(struct sun4i_i2s *i2s, unsigned int fmt)
>  {
> -	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	u32 val;
> -	u32 offset = 0;
> -	u32 bclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
> -	u32 lrclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
>
>  	/* DAI Mode */
>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>  	case SND_SOC_DAIFMT_I2S:
>  		val = SUN4I_I2S_FMT0_FMT_I2S;
> -		offset = 1;
>  		break;
>  	case SND_SOC_DAIFMT_LEFT_J:
>  		val = SUN4I_I2S_FMT0_FMT_LEFT_J;
> @@ -505,32 +507,64 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  		val = SUN4I_I2S_FMT0_FMT_RIGHT_J;
>  		break;
>  	default:
> -		dev_err(dai->dev, "Unsupported format: %d\n",
> -			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
>  		return -EINVAL;
>  	}
>
> -	if (i2s->variant->has_chsel_offset) {
> -		/*
> -		 * offset being set indicates that we're connected to an i2s
> -		 * device, however offset is only used on the sun8i block and
> -		 * i2s shares the same setting with the LJ format. Increment
> -		 * val so that the bit to value to write is correct.
> -		 */
> -		if (offset > 0)
> -			val++;
> -		/* blck offset determines whether i2s or LJ */
> -		regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> -				   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
> -				   SUN8I_I2S_TX_CHAN_OFFSET(offset));
> +	regmap_field_write(i2s->field_fmt_mode, val);
> +
> +	return 0;
> +}
> +
> +static int sun8i_i2s_set_format(struct sun4i_i2s *i2s, unsigned int fmt)
> +{
> +	u32 val;
>
> -		regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
> -				   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
> -				   SUN8I_I2S_TX_CHAN_OFFSET(offset));
> +	/* DAI Mode */
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		i2s->offset = 1;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		val = SUN8I_I2S_CTRL_MODE_I2S_LEFT_J;
> +		break;
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +		val = SUN8I_I2S_CTRL_MODE_RIGHT_J;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_A:
> +		i2s->offset = 1;
> +	case SND_SOC_DAIFMT_DSP_B:
> +		val = SUN8I_I2S_CTRL_MODE_PCM;
> +		break;
> +
> +	default:
> +		return -EINVAL;
>  	}
>
> +	/*
> +	 * bclk offset determines whether i2s or LJ if in i2s mode and
> +	 * DSP_A or DSP_B if in PCM mode.
> +	 */
> +	i2s->variant->set_txchanoffset(i2s, 0);
> +	i2s->variant->set_rxchanoffset(i2s);
> +
>  	regmap_field_write(i2s->field_fmt_mode, val);

It's a bit more complicated in the sun8i case. The LRCK period also
needs to be changed when in PCM / DSP_* mode since it changes from a
number of periods for one channel to a number of periods for all the
channels.

I have patches that still need a bit of rework and take care of all of
that, I'll try to post them by the end of the week

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nwzjgr7m2im3tclk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVO1XQAKCRDj7w1vZxhR
xabVAP93GS5a1v4cD+dAvCoPqfc3FJHdxubU8RL/0aefRkFb4AEApe5CxRoTLDTx
zz+c4TDIrWSI/BuJxoj1cSGlbXXa1AY=
=dsSC
-----END PGP SIGNATURE-----

--nwzjgr7m2im3tclk--

--===============3214037757333831186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3214037757333831186==--
