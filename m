Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622DD28B39D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 13:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECA2B168D;
	Mon, 12 Oct 2020 13:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECA2B168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602501562;
	bh=Pf8MZoDWIOm6TeQDVa2zkUb1CVNcinVdV3CvaxjkDhQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2Yket99RlkKh3N1fTvvNTRN69l0rxLUGx6Yx3XxXM7ITi1ffwZJJ9NQI4+GH0SJB
	 3FPiakRQfFVeYQDjnU3iF5wrdFnAVofagKHMqhPthnJm9IvV5NQDyYFDFVxysBK6Om
	 x0rp2lmOxiCLQe7088KJqd7UcgfhdFQFHYaNUKcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C2C7F8020D;
	Mon, 12 Oct 2020 13:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C646F80217; Mon, 12 Oct 2020 13:17:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D2CCF80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 13:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D2CCF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="gYk5m5Ij"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UfL0bVbD"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3BA7CC76;
 Mon, 12 Oct 2020 07:17:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 12 Oct 2020 07:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Ah++SVU8ND/3ULsC1qA41XC2pUq
 I2hQgJQFbtB+dPAs=; b=gYk5m5Ijo1liIlk0LwDL8F4u9eL87LjBCEBn9Fat69P
 inbo81T7duPvBHXCHTn4shOEgslsEqAVYaxjmXMneiUG/az/V8ePIMXTAqHQjEYp
 rEj+svvicuLcqh3XFSg0+qqfcb0QIzufSyOC/5xp1RCJKi9zGBTWGURjvfXpdwLc
 7YEyWLmdLYo5krBt0PnimdC3psrSlMnP6VconX+0Ni5bBaeZYkyaOCSajxLRYlHH
 /E2QmE7frOk3merh7gNNpLlGXV45RxRU9llZNe6KE8af2lXs6+5oNeeriekuuzmV
 Z73A8kP3jqAcCXEeUFj/2Dai9YyV1IavauEWUhPMTmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ah++SV
 U8ND/3ULsC1qA41XC2pUqI2hQgJQFbtB+dPAs=; b=UfL0bVbDvTl9qMQyErz+1R
 u9GG6vOHfBewWxUffW7j+QyXBDZMeBhMIBGbhf/WWEd1awtrj14miZTERnSugfhy
 UpXtQflYmvpkuNNwDIUETUcj810HcEy/G3UzlHqc/yk4+J2bTKKtCcjLR7qqVCPG
 8LV5EiqQqBRBDzgXpwTzQBNOCroVAwvApfJcqxz0p5b9HHTVItdXQyB7IShTokXX
 Ip6x+jF4gcF2v1p0lXJffVrtPxnHquJU1J2atZYZ/Dfm0LOzwio/Y4/yOeeFtRBl
 DAaaAO6aS1n0JKd1cu9hgXjweerY/CVlpHOeP1CmKHN8pqcd4UobeOivCkjJrvow
 ==
X-ME-Sender: <xms:RDuEXzuPvXGkMEwXKa5YdOVJ-ZlGnKQXkxCPgbEdzVCL7r4f7Fw4Bg>
 <xme:RDuEX0cavzgTFQWPzg_Ju-2Ry1qWWjoNekS5x4_iDkn9uzzjI0JzQkmYokzmqcKqa
 CEEzO5YUIL9gE2Z9Pk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheejgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RDuEX2xSzp3tiU9ubQLO4jNiYik9PSN5zOetoCGS3HLCUAfMe0J-VA>
 <xmx:RDuEXyOMWXf4lB-5tha5SDdZ6OjClbF2GNx6S9pVtPK8bWSaDXbFQw>
 <xmx:RDuEXz_hjwtT9FRNOGW1Tv78YMGs86rq1hsfgWjqru_rklXpuBuwZQ>
 <xmx:RjuEX0PET2H2juJUuXM_WXTQAF6FZUPF7rbLjiy4SJYcJwIccm3m8Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 844D8328005A;
 Mon, 12 Oct 2020 07:17:24 -0400 (EDT)
Date: Mon, 12 Oct 2020 13:17:22 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 23/25] ASoC: sun8i-codec: Generalize AIF clock control
Message-ID: <20201012111722.vhrzbkxuf5suxges@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-24-samuel@sholland.org>
 <20201005120459.5w5ligbconuwnzdv@gilmour.lan>
 <583f297c-86f9-2e0a-c525-1d7f951e2cd2@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="quu63mir7tjeldwt"
Content-Disposition: inline
In-Reply-To: <583f297c-86f9-2e0a-c525-1d7f951e2cd2@sholland.org>
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


--quu63mir7tjeldwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 11:51:08PM -0500, Samuel Holland wrote:
> On 10/5/20 7:04 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Sep 30, 2020 at 09:11:46PM -0500, Samuel Holland wrote:
> >> The AIF clock control register has the same layout for all three AIFs.
> >> The only difference between them is that AIF3 is missing some fields. =
We
> >> can reuse the same register field definitions for all three registers,
> >> and use the DAI ID to select the correct register address.
> >>
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>  sound/soc/sunxi/sun8i-codec.c | 64 +++++++++++++++++++----------------
> >>  1 file changed, 34 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-cod=
ec.c
> >> index 032a3f714dbb..1c34502ac47a 100644
> >> --- a/sound/soc/sunxi/sun8i-codec.c
> >> +++ b/sound/soc/sunxi/sun8i-codec.c
> >> @@ -37,23 +37,23 @@
> >>  #define SUN8I_MOD_CLK_ENA_DAC				2
> >>  #define SUN8I_MOD_RST_CTL				0x014
> >>  #define SUN8I_MOD_RST_CTL_AIF1				15
> >>  #define SUN8I_MOD_RST_CTL_ADC				3
> >>  #define SUN8I_MOD_RST_CTL_DAC				2
> >>  #define SUN8I_SYS_SR_CTRL				0x018
> >>  #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
> >>  #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
> >> -#define SUN8I_AIF1CLK_CTRL				0x040
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
> >> +#define SUN8I_AIF_CLK_CTRL(n)				(0x040 * (1 + (n)))
> >> +#define SUN8I_AIF_CLK_CTRL_MSTR_MOD			15
> >> +#define SUN8I_AIF_CLK_CTRL_CLK_INV			13
> >> +#define SUN8I_AIF_CLK_CTRL_BCLK_DIV			9
> >> +#define SUN8I_AIF_CLK_CTRL_LRCK_DIV			6
> >> +#define SUN8I_AIF_CLK_CTRL_WORD_SIZ			4
> >> +#define SUN8I_AIF_CLK_CTRL_DATA_FMT			2
> >>  #define SUN8I_AIF1_ADCDAT_CTRL				0x044
> >>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
> >>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
> >>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC		10
> >>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC		8
> >>  #define SUN8I_AIF1_DACDAT_CTRL				0x048
> >>  #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA		15
> >>  #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA		14
> >> @@ -83,21 +83,21 @@
> >>  #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R		10
> >>  #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR		9
> >>  #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
> >> =20
> >>  #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
> >>  #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
> >>  #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
> >>  #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
> >> -#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
> >> +#define SUN8I_AIF_CLK_CTRL_CLK_INV_MASK		GENMASK(14, 13)
> >> +#define SUN8I_AIF_CLK_CTRL_BCLK_DIV_MASK	GENMASK(12, 9)
> >> +#define SUN8I_AIF_CLK_CTRL_LRCK_DIV_MASK	GENMASK(8, 6)
> >> +#define SUN8I_AIF_CLK_CTRL_WORD_SIZ_MASK	GENMASK(5, 4)
> >> +#define SUN8I_AIF_CLK_CTRL_DATA_FMT_MASK	GENMASK(3, 2)
> >> =20
> >>  #define SUN8I_CODEC_PASSTHROUGH_SAMPLE_RATE 48000
> >> =20
> >>  #define SUN8I_CODEC_PCM_FORMATS	(SNDRV_PCM_FMTBIT_S8     |\
> >>  				 SNDRV_PCM_FMTBIT_S16_LE |\
> >>  				 SNDRV_PCM_FMTBIT_S20_LE |\
> >>  				 SNDRV_PCM_FMTBIT_S24_LE |\
> >>  				 SNDRV_PCM_FMTBIT_S20_3LE|\
> >> @@ -223,32 +223,34 @@ static int sun8i_codec_update_sample_rate(struct=
 sun8i_codec *scodec)
> >>  			   hw_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
> >> =20
> >>  	return 0;
> >>  }
> >> =20
> >>  static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int =
fmt)
> >>  {
> >>  	struct sun8i_codec *scodec =3D snd_soc_dai_get_drvdata(dai);
> >> +	u32 reg =3D SUN8I_AIF_CLK_CTRL(dai->id);
> >>  	u32 format, invert, value;
> >> =20
> >>  	/* clock masters */
> >>  	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> >>  	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
> >>  		value =3D 0x1;
> >>  		break;
> >>  	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
> >>  		value =3D 0x0;
> >>  		break;
> >>  	default:
> >>  		return -EINVAL;
> >>  	}
> >> -	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
> >> -			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD),
> >> -			   value << SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD);
> >> +
> >> +	regmap_update_bits(scodec->regmap, reg,
> >> +			   BIT(SUN8I_AIF_CLK_CTRL_MSTR_MOD),
> >> +			   value << SUN8I_AIF_CLK_CTRL_MSTR_MOD);
> >=20
> > I guess it would be more readable without the intermediate variable to
> > store the register.
>=20
> You mean you want me to call `SUN8I_AIF_CLK_CTRL(dai->id)` in each
> regmap_update_bits call?

Yep

> I don't know that the compiler could optimize that due to the pointer
> read. And how would you suggest handling patch 25, where sometimes
> AIF3 needs to write to AIF2's clock register?

I'm not sure the compiler optimisation really matters anyway. It's not
really a fast path, and assuming it does the multiplication every time,
it will still be completely negligible compared to other operations done
in that function (starting with regmap_update_bits).

Maxime

--quu63mir7tjeldwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX4Q7QgAKCRDj7w1vZxhR
xbG6AQDv6OfqRWSYDQhPZ5l/nTNmvQw2zmGhxYLXky/kAb3ynQEAgLcShU1ukeOB
d/eisrgJLWYOOmAmnYbJnrijEO95kgY=
=8p+a
-----END PGP SIGNATURE-----

--quu63mir7tjeldwt--
