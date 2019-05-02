Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618B21155D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 10:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D92B9179C;
	Thu,  2 May 2019 10:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D92B9179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556785639;
	bh=4ZXJcV0ecyx5kjseluh6HwIv9USN92OY8oUVkW03YMw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vss6gCHz+EJA7+h74cvK/q6lXLj2XOZuMmKyi6ERAzASAR3iWydqe39cqPQuQangG
	 OHubIC3P/F+8Nr6qoC7uP+6z7hlkry+b2O4qnuGyxp0rttgvmIPl9uY3ZimBN1Bu1s
	 WDEwE8W9W+O0nbcLLAykMa40375HMcCOS0mY0cBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 362CAF896AA;
	Thu,  2 May 2019 10:25:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B533BF896C7; Thu,  2 May 2019 10:25:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10E00F8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 10:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E00F8075A
Received: from localhost (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 879AE100015;
 Thu,  2 May 2019 08:25:26 +0000 (UTC)
Date: Thu, 2 May 2019 10:25:26 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20190502082526.c5zo4uzceqzizbxo@flea>
References: <20190419191730.9437-1-peron.clem@gmail.com>
 <20190419191730.9437-3-peron.clem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190419191730.9437-3-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 2/5] ASoC: sun4i-spdif: Add support for
	H6 SoC
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
Content-Type: multipart/mixed; boundary="===============4929449080479550454=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4929449080479550454==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wid6745ec7776hfu"
Content-Disposition: inline


--wid6745ec7776hfu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2019 at 09:17:27PM +0200, Cl=E9ment P=E9ron wrote:
> Allwinner H6 has a different mapping for the fifo register controller.
>
> Actually only the fifo tx flush bit is used.
>
> Add a new quirk to know the correct fifo tx flush bit.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 42 ++++++++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index b4af4aabead1..19e4bf9caa24 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -75,6 +75,18 @@
>  	#define SUN4I_SPDIF_FCTL_RXOM(v)		((v) << 0)
>  	#define SUN4I_SPDIF_FCTL_RXOM_MASK		GENMASK(1, 0)
>
> +#define SUN50I_H6_SPDIF_FCTL (0x14)
> +	#define SUN50I_H6_SPDIF_FCTL_HUB_EN		BIT(31)
> +	#define SUN50I_H6_SPDIF_FCTL_FTX		BIT(30)
> +	#define SUN50I_H6_SPDIF_FCTL_FRX		BIT(29)
> +	#define SUN50I_H6_SPDIF_FCTL_TXTL(v)		((v) << 12)
> +	#define SUN50I_H6_SPDIF_FCTL_TXTL_MASK		GENMASK(19, 12)
> +	#define SUN50I_H6_SPDIF_FCTL_RXTL(v)		((v) << 4)
> +	#define SUN50I_H6_SPDIF_FCTL_RXTL_MASK		GENMASK(10, 4)
> +	#define SUN50I_H6_SPDIF_FCTL_TXIM		BIT(2)
> +	#define SUN50I_H6_SPDIF_FCTL_RXOM(v)		((v) << 0)
> +	#define SUN50I_H6_SPDIF_FCTL_RXOM_MASK		GENMASK(1, 0)
> +
>  #define SUN4I_SPDIF_FSTA	(0x18)
>  	#define SUN4I_SPDIF_FSTA_TXE			BIT(14)
>  	#define SUN4I_SPDIF_FSTA_TXECNTSHT		(8)
> @@ -169,16 +181,25 @@ struct sun4i_spdif_dev {
>  	struct snd_soc_dai_driver cpu_dai_drv;
>  	struct regmap *regmap;
>  	struct snd_dmaengine_dai_dma_data dma_params_tx;
> +	const struct sun4i_spdif_quirks *quirks;

I guess this will generate a warning since the structure hasn't been
defined yet?

> +};
> +
> +struct sun4i_spdif_quirks {
> +	unsigned int reg_dac_txdata;	/* TX FIFO offset for DMA config */
> +	unsigned int reg_fctl_ftx;	/* TX FIFO flush bitmask */
> +	bool has_reset;

You don't really need to move it around, you can just add the
structure prototype.

If you do want to move it around, then please do so in a separate patch

>  };
>
>  static void sun4i_spdif_configure(struct sun4i_spdif_dev *host)
>  {
> +	const struct sun4i_spdif_quirks *quirks =3D host->quirks;
> +
>  	/* soft reset SPDIF */
>  	regmap_write(host->regmap, SUN4I_SPDIF_CTL, SUN4I_SPDIF_CTL_RESET);
>
>  	/* flush TX FIFO */
>  	regmap_update_bits(host->regmap, SUN4I_SPDIF_FCTL,
> -			   SUN4I_SPDIF_FCTL_FTX, SUN4I_SPDIF_FCTL_FTX);
> +			   quirks->reg_fctl_ftx, quirks->reg_fctl_ftx);
>
>  	/* clear TX counter */
>  	regmap_write(host->regmap, SUN4I_SPDIF_TXCNT, 0);
> @@ -405,22 +426,26 @@ static struct snd_soc_dai_driver sun4i_spdif_dai =
=3D {
>  	.name =3D "spdif",
>  };
>
> -struct sun4i_spdif_quirks {
> -	unsigned int reg_dac_txdata;	/* TX FIFO offset for DMA config */
> -	bool has_reset;
> -};
> -
>  static const struct sun4i_spdif_quirks sun4i_a10_spdif_quirks =3D {
>  	.reg_dac_txdata	=3D SUN4I_SPDIF_TXFIFO,
> +	.reg_fctl_ftx   =3D SUN4I_SPDIF_FCTL_FTX,
>  };
>
>  static const struct sun4i_spdif_quirks sun6i_a31_spdif_quirks =3D {
>  	.reg_dac_txdata	=3D SUN4I_SPDIF_TXFIFO,
> +	.reg_fctl_ftx   =3D SUN4I_SPDIF_FCTL_FTX,
>  	.has_reset	=3D true,
>  };
>
>  static const struct sun4i_spdif_quirks sun8i_h3_spdif_quirks =3D {
>  	.reg_dac_txdata	=3D SUN8I_SPDIF_TXFIFO,
> +	.reg_fctl_ftx   =3D SUN4I_SPDIF_FCTL_FTX,
> +	.has_reset	=3D true,
> +};
>
> +static const struct sun4i_spdif_quirks sun50i_h6_spdif_quirks =3D {
> +	.reg_dac_txdata	=3D SUN8I_SPDIF_TXFIFO,
> +	.reg_fctl_ftx   =3D SUN50I_H6_SPDIF_FCTL_FTX,
>  	.has_reset	=3D true,

The reg_dac_txdata and reg_fctl_ftx changes here should also be part
of a separate patch.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--wid6745ec7776hfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXMqpdgAKCRDj7w1vZxhR
xWH5AP0V7WwgeoLzp2Jy/IqaN2gkHTAxsL4rN9x34ddtQ9CO2AEA9tdoCjIN+Pu8
eH0aZZcT+yIqU0dkGQCUJfpkZdUMZQE=
=bqND
-----END PGP SIGNATURE-----

--wid6745ec7776hfu--

--===============4929449080479550454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4929449080479550454==--
