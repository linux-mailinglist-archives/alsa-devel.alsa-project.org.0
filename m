Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6156C28355C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 14:06:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF9017DA;
	Mon,  5 Oct 2020 14:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF9017DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601899612;
	bh=WSjnjvHhyQvTOzXpKSSQnniMFDn7lKyL6apQYFOqyRU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d42LRIY67PZ98MPD+pE3LFLLtKuj/dK78JbXNnlvzogUIUQihIiQxsWT08OasCvkp
	 MO7DWopQNsSFFSuQiADzA9d+DUSRedkvdvSBYs74d5aStJDS+bsn55v13J7vxmz2FU
	 UAxSsRMXkEUd2r8xcC4mXpKaYrCkVjv3MPX6r5s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91ABAF800EF;
	Mon,  5 Oct 2020 14:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE940F8025A; Mon,  5 Oct 2020 14:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB9CF80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 14:05:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB9CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="RL88DFuY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="m/byJFVm"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 736D15C0047;
 Mon,  5 Oct 2020 08:05:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 08:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ceqX2QpXI5OJuZPMqJLEXKTNKi2
 PVA6JiKGqpDE5BKQ=; b=RL88DFuYqDEjqbPNwdf2xj4LL90cjlUHTvrgNYnAJJY
 695BucPtG3smkOaFgWfmGzzHTFfF7llISwKjYC2ZoThuyWoflqu6/HhP550v+PlE
 AFukexl/h9sGq0ue9S2psDRXu1NrZhnCMp/Ig+iQJrEAeCMc1T+eVpGfBY8vpNUh
 Ad9axjSOuHNy6DoDHhGhB9iTcicaxaX15JZst5wXgzdWZpNo+ZeZq+Xo9psFAKan
 U+JN3B0B71XFDXykrF5M+D6ldDrqTuCk7NMuOJECEvp+XvNJqZ+cI6mF9ejVXNLP
 r9/vAQd8WlVhVi5T/D9AfBjNNjdDFaGy5GnievBdCfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ceqX2Q
 pXI5OJuZPMqJLEXKTNKi2PVA6JiKGqpDE5BKQ=; b=m/byJFVmz3FIpYzWHkQlD1
 UXuNWwLbdXN3atiLFd2h/Xgjpbwtr9y8LxfKDPgG33AKsSaokXXs4ospHtd34RZQ
 a3J84kOSZqRhqyVCspxAdZFVB/glkhhhEDL6okaziOIxHnfhOU7MdMcBq2l42wLT
 YOj9rj9mYtDUyEOUTrACBtYVMWBP6+dWQpgBhrrXHe8h3gE87uP1eSIxWF1uW4+F
 NNK2QVKqBTJPHENDZqErxMjJgjCxSfhJqdTi32p4CT680ZK5FAG4jatt4NKQzqCJ
 R5sOkNqxki76LpOUlnIKAsaSGR5O+zUiEYajLixHCYVpiIwppvyaKWMCd+TDMGVA
 ==
X-ME-Sender: <xms:7Qt7X7GZ0aYvVmBdGYaMBwOhFBg8qycgU4FvGUKhu63fP6mONZBuTg>
 <xme:7Qt7X4WSdcyk6ZNE8pgb-EIkuuJT-Gy7zOm9YmjrsKw9VXEBIW_Z4qeMNMMg__bUS
 DbrN7Za8qDM3vsHvdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7Qt7X9I4rw_6u3wR-LdZJdqOz8SeuI2q3Un0nA6lB6M36eGLs9GAUg>
 <xmx:7Qt7X5FJI92M-4dlHTj5Z6khCJtTy-HGp9cuauUw5KD6XwIAhu8UvQ>
 <xmx:7Qt7XxVdDqjA5CcLobf60xVe8_pioDunPQ47roPNZKU1jWz1i3K4lg>
 <xmx:7wt7XwHIrAtZy6kXRh8YfSxP3OwkzzTNTB0L2vC1ewD2qvFsBw4Osw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4FDB13280064;
 Mon,  5 Oct 2020 08:05:01 -0400 (EDT)
Date: Mon, 5 Oct 2020 14:04:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 23/25] ASoC: sun8i-codec: Generalize AIF clock control
Message-ID: <20201005120459.5w5ligbconuwnzdv@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-24-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oqqsmll44wyrlom6"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-24-samuel@sholland.org>
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


--oqqsmll44wyrlom6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 30, 2020 at 09:11:46PM -0500, Samuel Holland wrote:
> The AIF clock control register has the same layout for all three AIFs.
> The only difference between them is that AIF3 is missing some fields. We
> can reuse the same register field definitions for all three registers,
> and use the DAI ID to select the correct register address.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/sunxi/sun8i-codec.c | 64 +++++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 30 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 032a3f714dbb..1c34502ac47a 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -37,23 +37,23 @@
>  #define SUN8I_MOD_CLK_ENA_DAC				2
>  #define SUN8I_MOD_RST_CTL				0x014
>  #define SUN8I_MOD_RST_CTL_AIF1				15
>  #define SUN8I_MOD_RST_CTL_ADC				3
>  #define SUN8I_MOD_RST_CTL_DAC				2
>  #define SUN8I_SYS_SR_CTRL				0x018
>  #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
>  #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
> -#define SUN8I_AIF1CLK_CTRL				0x040
> -#define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
> -#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
> -#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
> -#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
> -#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
> -#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
> +#define SUN8I_AIF_CLK_CTRL(n)				(0x040 * (1 + (n)))
> +#define SUN8I_AIF_CLK_CTRL_MSTR_MOD			15
> +#define SUN8I_AIF_CLK_CTRL_CLK_INV			13
> +#define SUN8I_AIF_CLK_CTRL_BCLK_DIV			9
> +#define SUN8I_AIF_CLK_CTRL_LRCK_DIV			6
> +#define SUN8I_AIF_CLK_CTRL_WORD_SIZ			4
> +#define SUN8I_AIF_CLK_CTRL_DATA_FMT			2
>  #define SUN8I_AIF1_ADCDAT_CTRL				0x044
>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_SRC		10
>  #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_SRC		8
>  #define SUN8I_AIF1_DACDAT_CTRL				0x048
>  #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA		15
>  #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA		14
> @@ -83,21 +83,21 @@
>  #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R		10
>  #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR		9
>  #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
> =20
>  #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
>  #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
>  #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
>  #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
> -#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
> -#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
> -#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
> -#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
> -#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
> +#define SUN8I_AIF_CLK_CTRL_CLK_INV_MASK		GENMASK(14, 13)
> +#define SUN8I_AIF_CLK_CTRL_BCLK_DIV_MASK	GENMASK(12, 9)
> +#define SUN8I_AIF_CLK_CTRL_LRCK_DIV_MASK	GENMASK(8, 6)
> +#define SUN8I_AIF_CLK_CTRL_WORD_SIZ_MASK	GENMASK(5, 4)
> +#define SUN8I_AIF_CLK_CTRL_DATA_FMT_MASK	GENMASK(3, 2)
> =20
>  #define SUN8I_CODEC_PASSTHROUGH_SAMPLE_RATE 48000
> =20
>  #define SUN8I_CODEC_PCM_FORMATS	(SNDRV_PCM_FMTBIT_S8     |\
>  				 SNDRV_PCM_FMTBIT_S16_LE |\
>  				 SNDRV_PCM_FMTBIT_S20_LE |\
>  				 SNDRV_PCM_FMTBIT_S24_LE |\
>  				 SNDRV_PCM_FMTBIT_S20_3LE|\
> @@ -223,32 +223,34 @@ static int sun8i_codec_update_sample_rate(struct su=
n8i_codec *scodec)
>  			   hw_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
> =20
>  	return 0;
>  }
> =20
>  static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  {
>  	struct sun8i_codec *scodec =3D snd_soc_dai_get_drvdata(dai);
> +	u32 reg =3D SUN8I_AIF_CLK_CTRL(dai->id);
>  	u32 format, invert, value;
> =20
>  	/* clock masters */
>  	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>  	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
>  		value =3D 0x1;
>  		break;
>  	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
>  		value =3D 0x0;
>  		break;
>  	default:
>  		return -EINVAL;
>  	}
> -	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
> -			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD),
> -			   value << SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD);
> +
> +	regmap_update_bits(scodec->regmap, reg,
> +			   BIT(SUN8I_AIF_CLK_CTRL_MSTR_MOD),
> +			   value << SUN8I_AIF_CLK_CTRL_MSTR_MOD);

I guess it would be more readable without the intermediate variable to
store the register.

With that fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--oqqsmll44wyrlom6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sL6wAKCRDj7w1vZxhR
xc13AQDILHpg1NNhu17lZIh3sEVfmLue87aC4dlRyGqbLXw9lQEAmBDTxQHers8E
fadhxI3JTG2VxfNl+xXhnN7rqM9WcwI=
=jDR3
-----END PGP SIGNATURE-----

--oqqsmll44wyrlom6--
