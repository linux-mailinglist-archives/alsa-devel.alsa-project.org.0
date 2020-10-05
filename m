Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B39283501
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB1DC17DA;
	Mon,  5 Oct 2020 13:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB1DC17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601897530;
	bh=cH0Ub2ETqdFU53TxN1PCGSx9dSqj3tTQ4UmW5h+wMME=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YWkGtWd8Gq/q/hhSpHtP2vjtovBlmU3GbFD++98jIboYooHKVA23E2IoW1oi2nEao
	 6T54m90T1z3yAUxUCLmtl/U/JAT2XpZpAwgl7POSThPwleT04XGdgj8Gg17OptTlag
	 oeBB/PIy9hJ2TwUL7q7Ldg7FEDV0aZgRz0ejTW9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C12F80245;
	Mon,  5 Oct 2020 13:30:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 419CCF8025A; Mon,  5 Oct 2020 13:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7C6CF80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C6CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="ZJyXdZLI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Sd2ARmSw"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 657BE5C015C;
 Mon,  5 Oct 2020 07:30:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 07:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+gM8h1EPRM9w5brEzvSadAYQmI5
 193Q6og+/lOyBk5Y=; b=ZJyXdZLIwGwhHXoNGh1GIZzsQPSH1+BGwhxjy1WtIb9
 1Q3xUq7QbtmdB3C2/qzyBpwTvsTPHaoEBx5s4XAAMOVK4BXW6bfklR0rBZdgWN4i
 cWHiDwLGR+jYkGTUtVDXurFl4xPjbekBVrV8+bEQaGPbbu5ESOiD1NJ+4fpqchf/
 sefEMBCbwvybfsOTfjfr/Vi4OyUo3MV0QjVQik5vf2rsc43LzifEyJKYjHWhASdr
 KUedmCK1oWvS56kSwo+dQzuSFD82Rgp95B255W7yMK5o8CgKTZak6rMPzJpDUzqn
 ggytK753IsQ+Ncm6qmVUng2m6hDlm00ld2jDV4bD00g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+gM8h1
 EPRM9w5brEzvSadAYQmI5193Q6og+/lOyBk5Y=; b=Sd2ARmSw/tXl5MepHwBOjO
 EaZ6qPMhmEel4s/dt8Y+ewV4UkiI/6pIzhaTQJaEqTzWtuGiTPGxBnI/paJ+vj0j
 ZIdwjaruUg8YocXhyxtQil0yPo1KKvEqTphGU7PdDzAroSCJkq6fzWkMwhsCa+Bv
 7Y1Pu6Tc9/dnNwpj+qokWBQMPtxZH/IvqgY4F0HQIHNQfuZI1KuPMoTxUx6Y5ICo
 yMmItHBgJIooezYzRnqp5uzF8F/tvb1l62N6t5m53K6/CsUZH9hdKZy1pfdLa1NI
 t1cwB9Uixnd/JiY5fS///7k8H7F43HZR7RDFJri6B8z47hwjiv+jMd9PEo7fcyOw
 ==
X-ME-Sender: <xms:yAN7XzF9cZzB9AeOoV8NToVSAjTbiXHC0D7fyaSmpjpVCW-c2Oe-Kg>
 <xme:yAN7XwVw7sED8IPq70hHr9LXo3v5wL-ZaxjucrIHsjMNrXRIPBeDYUuqW5vp1bnMb
 I_3_q9bZ4tQ2vgmc0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yAN7X1KIJl0WlVMnF1f7qARzcE_GHMF4ujCCIYbikzzXTBGGgSXivg>
 <xmx:yAN7XxEjXVQ5Hx7w7sgXWTSLMzh1CcacLIaJnbrXcxJzZnmyDLgpOw>
 <xmx:yAN7X5X4GOfRlUKlLWLE_syGn-TpB1DblJQ2QgaFnN9n7epknpB_WQ>
 <xmx:ygN7X4EFGK--5q0xJSdTDq7hzk0ygNHNTX3sX0i9h1RfzPIcSiiGjA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 698603280059;
 Mon,  5 Oct 2020 07:30:16 -0400 (EDT)
Date: Mon, 5 Oct 2020 13:30:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 11/25] ASoC: sun8i-codec: Enable all supported clock
 inversions
Message-ID: <20201005113015.acp2gascxkytl7z4@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-12-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dqivd5nsm5yzod2h"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-12-samuel@sholland.org>
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--dqivd5nsm5yzod2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:34PM -0500, Samuel Holland wrote:
> When using the I2S, LEFT_J, or RIGHT_J format, the hardware supports
> independent BCLK and LRCK inversion control. When using DSP_A or DSP_B,
> LRCK inversion is not supported. The register bit is repurposed to
> select between DSP_A and DSP_B. Extend the driver to support this.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/sunxi/sun8i-codec.c | 57 +++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 20 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 0b713b2a2028..506420fb355c 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -39,18 +39,17 @@
>  #define SUN8I_MOD_RST_CTL_AIF1				15
>  #define SUN8I_MOD_RST_CTL_ADC				3
>  #define SUN8I_MOD_RST_CTL_DAC				2
>  #define SUN8I_SYS_SR_CTRL				0x018
>  #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
>  #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
>  #define SUN8I_AIF1CLK_CTRL				0x040
>  #define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
> -#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV		14
> -#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV		13
> +#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
>  #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
>  #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
>  #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
>  #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
>  #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
>  #define SUN8I_AIF1_ADCDAT_CTRL				0x044
>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
> @@ -85,16 +84,17 @@
>  #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R		10
>  #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR		9
>  #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
> =20
>  #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
>  #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
>  #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
>  #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
> +#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
>  #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
>  #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
>  #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
>  #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
> =20
>  enum {
>  	AIF1,
>  	NAIFS
> @@ -168,17 +168,17 @@ static int sun8i_codec_get_hw_rate(struct snd_pcm_h=
w_params *params)
>  	default:
>  		return -EINVAL;
>  	}
>  }
> =20
>  static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  {
>  	struct sun8i_codec *scodec =3D snd_soc_dai_get_drvdata(dai);
> -	u32 format, value;
> +	u32 format, invert, value;
> =20
>  	/* clock masters */
>  	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>  	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
>  		value =3D 0x1;
>  		break;
>  	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
>  		value =3D 0x0;
> @@ -197,55 +197,72 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *=
dai, unsigned int fmt)
>  		break;
>  	case SND_SOC_DAIFMT_LEFT_J:
>  		format =3D 0x1;
>  		break;
>  	case SND_SOC_DAIFMT_RIGHT_J:
>  		format =3D 0x2;
>  		break;
>  	case SND_SOC_DAIFMT_DSP_A:
> +		format =3D 0x3;
> +		invert =3D 0x0; /* Set LRCK_INV to 0 */
> +		break;
>  	case SND_SOC_DAIFMT_DSP_B:
>  		format =3D 0x3;
> +		invert =3D 0x1; /* Set LRCK_INV to 1 */
>  		break;
>  	default:
>  		return -EINVAL;
>  	}
>  	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
>  			   SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK,
>  			   format << SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT);
> =20
>  	/* clock inversion */
>  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>  	case SND_SOC_DAIFMT_NB_NF: /* Normal */
>  		value =3D 0x0;
>  		break;
> -	case SND_SOC_DAIFMT_IB_IF: /* Inversion */
> +	case SND_SOC_DAIFMT_NB_IF: /* Inverted LRCK */
>  		value =3D 0x1;
>  		break;
> +	case SND_SOC_DAIFMT_IB_NF: /* Inverted BCLK */
> +		value =3D 0x2;
> +		break;
> +	case SND_SOC_DAIFMT_IB_IF: /* Both inverted */
> +		value =3D 0x3;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> -	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
> -			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV),
> -			   value << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV);
> =20
> -	/*
> -	 * It appears that the DAI and the codec in the A33 SoC don't
> -	 * share the same polarity for the LRCK signal when they mean
> -	 * 'normal' and 'inverted' in the datasheet.
> -	 *
> -	 * Since the DAI here is our regular i2s driver that have been
> -	 * tested with way more codecs than just this one, it means
> -	 * that the codec probably gets it backward, and we have to
> -	 * invert the value here.
> -	 */
> -	value ^=3D scodec->quirks->lrck_inversion;
> +	if (format =3D=3D 0x3) {

Could we use a define here? That would be more readable

> +		/* Inverted LRCK is not available in DSP mode. */
> +		if (value & BIT(0))
> +			return -EINVAL;

And same thing here, explicitly testing both for DSP_A and DSP_B would
be more readable.

(And I guess value isn't such a great variable name anymore either)

Maxime

--dqivd5nsm5yzod2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sDxwAKCRDj7w1vZxhR
xf9oAQDsY9AsadZm3h0T1V3s8b8oHTZl9sVeGnreyDbX3nf0kwEAgF2wJXbE6P/e
cUrba9ASnhJRJwjXEqnKJEnEjvIsRwg=
=JvJJ
-----END PGP SIGNATURE-----

--dqivd5nsm5yzod2h--
