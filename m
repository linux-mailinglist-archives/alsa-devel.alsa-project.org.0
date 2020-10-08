Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AFC2874BD
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 15:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62224168A;
	Thu,  8 Oct 2020 15:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62224168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602162107;
	bh=jJWSe0qn/dstV4zhXnaZkouFB1IbJfHlqj/2Ffoqh2Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nx9dZVfotvrJJDghB7AZFGuYb/dA7Ey47pMx4yCs9W8ZQuwBBzqYRCF9dbTF4RDYC
	 09NtfBHlv4aq90KFxL7bTWq/IKeXs5Ovy2Hhj5aCN5RO6lnN6J+RnI9Lp+9aWu3Vrq
	 Hkmv0gGEQlTXRGKIBrG6qQoLvr+PBmilyVqvC6AI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCFCAF80163;
	Thu,  8 Oct 2020 15:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1EFEF80164; Thu,  8 Oct 2020 15:00:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7A4EF8015B
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 14:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7A4EF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Fqk1S9k2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pSmspXEC"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6FD17C6B;
 Thu,  8 Oct 2020 08:59:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Oct 2020 08:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3SsMPKFcJD/Vgq1ZIeICUGAqHY3
 QhttTAnqlfP7RyEo=; b=Fqk1S9k2s/l/sajXunRqgPJIKUvzM0+fKl4azWAOeB9
 8n/4FA3T8/kNQlhLVVMFqhSXkyn0keR3OM9wGTOHukNRg5Equ6M/lp7UsvzRRPmW
 Hx+NhM+uy4CXQ/7GkjRdDswZLoSaLRHsYP2nAnRUGyJ4Qk6zeAZIZapyzzwcyQar
 lWYb28TRmpN5qxa6aCoPhcqe0eXs4PVfDrzzmA1gh94/gYak9W2gYf/0FsKaWJRW
 ytEbpLyBurxebTJjivP3crTFqO32bGYjiDMrT+dh0On7Is5qwgwbHu+blw1bSRwI
 CBhdr1/iasPbh5IArLhqcqNwrrFkxkcvFOlDOu35E/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3SsMPK
 FcJD/Vgq1ZIeICUGAqHY3QhttTAnqlfP7RyEo=; b=pSmspXECnR05lOEEzdcgiE
 XOWReweTlSOz2/mwzrnPtV4YY8BzDmvPfINh5weULgChuMjPt/EusfXRwmzqqBag
 mrBq+PDU/w5WCNbc9+YsQ7SkZqjSAEBXLlNky+5YB+a7A3PJDrqAtSan6mdWz6bI
 tQx7ZhyUKGTPssf8djnleqULbv/WxWnRUJWD1aaejmxudl0BItFKGe5ef/wBYZhw
 XAujH3m9n7Sa1ioL1rC+OTh1VwXEA6Y9t6mm8mNqbgwZW0f2vibTiX0jUjOTQ572
 N+ohHoBuS1jEXWXKgCTbHZ3z8FdUHuNkXXgqq7et3R8lCnroVD3RkugzXZ/G9f2Q
 ==
X-ME-Sender: <xms:RA1_X5UN9F9NINypwLU2fI6IVQjnBMSbjgIQH_tVj-bJXh385OlRWg>
 <xme:RA1_X5nCbyJ4mypA7BI24QjXvqnUlH5abfjQ1DHENk_k2ZxL9STQ3ohw9RafuXsTi
 bpxHj-z4TbGMTkOv-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RA1_X1ap1xxZZRLMwy2rAfQg2oA9iIxNZAYa1-KOUxPsyOPvDvihMw>
 <xmx:RA1_X8XJIf6VdgDcoGzfcGpRVFvLJZcuovXPqmUDxauUehf8tIo2WQ>
 <xmx:RA1_XzmriaM7Kpltd5UFtoS7GabQA7Qa3PUmzLPLmTxKUGmsXnHyag>
 <xmx:Rw1_XxUlox0RfTnV69e26ifxKeib_VQpg2egs4HNUC4iqJ5NTKgLuA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B7BE63280060;
 Thu,  8 Oct 2020 08:59:47 -0400 (EDT)
Date: Thu, 8 Oct 2020 14:59:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 11/25] ASoC: sun8i-codec: Enable all supported clock
 inversions
Message-ID: <20201008125946.ialsolxkdgdje3sy@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-12-samuel@sholland.org>
 <20201005113015.acp2gascxkytl7z4@gilmour.lan>
 <7b8206b6-ccd8-6d70-6210-fb7d79a330a3@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2nok6hajuhde5mnx"
Content-Disposition: inline
In-Reply-To: <7b8206b6-ccd8-6d70-6210-fb7d79a330a3@sholland.org>
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


--2nok6hajuhde5mnx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 11:29:51PM -0500, Samuel Holland wrote:
>=20
> On 10/5/20 6:30 AM, Maxime Ripard wrote:
> > On Wed, Sep 30, 2020 at 09:11:34PM -0500, Samuel Holland wrote:
> > > When using the I2S, LEFT_J, or RIGHT_J format, the hardware supports
> > > independent BCLK and LRCK inversion control. When using DSP_A or DSP_=
B,
> > > LRCK inversion is not supported. The register bit is repurposed to
> > > select between DSP_A and DSP_B. Extend the driver to support this.
> > >=20
> > > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > ---
> > >   sound/soc/sunxi/sun8i-codec.c | 57 +++++++++++++++++++++++---------=
---
> > >   1 file changed, 37 insertions(+), 20 deletions(-)
> > >=20
> > > diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-co=
dec.c
> > > index 0b713b2a2028..506420fb355c 100644
> > > --- a/sound/soc/sunxi/sun8i-codec.c
> > > +++ b/sound/soc/sunxi/sun8i-codec.c
> > > @@ -39,18 +39,17 @@
> > >   #define SUN8I_MOD_RST_CTL_AIF1				15
> > >   #define SUN8I_MOD_RST_CTL_ADC				3
> > >   #define SUN8I_MOD_RST_CTL_DAC				2
> > >   #define SUN8I_SYS_SR_CTRL				0x018
> > >   #define SUN8I_SYS_SR_CTRL_AIF1_FS			12
> > >   #define SUN8I_SYS_SR_CTRL_AIF2_FS			8
> > >   #define SUN8I_AIF1CLK_CTRL				0x040
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD		15
> > > -#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV		14
> > > -#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV		13
> > > +#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV			13
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV		9
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV		6
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ		4
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
> > >   #define SUN8I_AIF1_ADCDAT_CTRL				0x044
> > >   #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
> > >   #define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
> > > @@ -85,16 +84,17 @@
> > >   #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R		10
> > >   #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR		9
> > >   #define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR		8
> > >   #define SUN8I_SYSCLK_CTL_AIF1CLK_SRC_MASK	GENMASK(9, 8)
> > >   #define SUN8I_SYSCLK_CTL_AIF2CLK_SRC_MASK	GENMASK(5, 4)
> > >   #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
> > >   #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
> > > +#define SUN8I_AIF1CLK_CTRL_AIF1_CLK_INV_MASK	GENMASK(14, 13)
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
> > >   #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
> > >   enum {
> > >   	AIF1,
> > >   	NAIFS
> > > @@ -168,17 +168,17 @@ static int sun8i_codec_get_hw_rate(struct snd_p=
cm_hw_params *params)
> > >   	default:
> > >   		return -EINVAL;
> > >   	}
> > >   }
> > >   static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned in=
t fmt)
> > >   {
> > >   	struct sun8i_codec *scodec =3D snd_soc_dai_get_drvdata(dai);
> > > -	u32 format, value;
> > > +	u32 format, invert, value;
> > >   	/* clock masters */
> > >   	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > >   	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
> > >   		value =3D 0x1;
> > >   		break;
> > >   	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
> > >   		value =3D 0x0;
> > > @@ -197,55 +197,72 @@ static int sun8i_codec_set_fmt(struct snd_soc_d=
ai *dai, unsigned int fmt)
> > >   		break;
> > >   	case SND_SOC_DAIFMT_LEFT_J:
> > >   		format =3D 0x1;
> > >   		break;
> > >   	case SND_SOC_DAIFMT_RIGHT_J:
> > >   		format =3D 0x2;
> > >   		break;
> > >   	case SND_SOC_DAIFMT_DSP_A:
> > > +		format =3D 0x3;
> > > +		invert =3D 0x0; /* Set LRCK_INV to 0 */
> > > +		break;
> > >   	case SND_SOC_DAIFMT_DSP_B:
> > >   		format =3D 0x3;
> > > +		invert =3D 0x1; /* Set LRCK_INV to 1 */
> > >   		break;
> > >   	default:
> > >   		return -EINVAL;
> > >   	}
> > >   	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
> > >   			   SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK,
> > >   			   format << SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT);
> > >   	/* clock inversion */
> > >   	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> > >   	case SND_SOC_DAIFMT_NB_NF: /* Normal */
> > >   		value =3D 0x0;
> > >   		break;
> > > -	case SND_SOC_DAIFMT_IB_IF: /* Inversion */
> > > +	case SND_SOC_DAIFMT_NB_IF: /* Inverted LRCK */
> > >   		value =3D 0x1;
> > >   		break;
> > > +	case SND_SOC_DAIFMT_IB_NF: /* Inverted BCLK */
> > > +		value =3D 0x2;
> > > +		break;
> > > +	case SND_SOC_DAIFMT_IB_IF: /* Both inverted */
> > > +		value =3D 0x3;
> > > +		break;
> > >   	default:
> > >   		return -EINVAL;
> > >   	}
> > > -	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
> > > -			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV),
> > > -			   value << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV);
> > > -	/*
> > > -	 * It appears that the DAI and the codec in the A33 SoC don't
> > > -	 * share the same polarity for the LRCK signal when they mean
> > > -	 * 'normal' and 'inverted' in the datasheet.
> > > -	 *
> > > -	 * Since the DAI here is our regular i2s driver that have been
> > > -	 * tested with way more codecs than just this one, it means
> > > -	 * that the codec probably gets it backward, and we have to
> > > -	 * invert the value here.
> > > -	 */
> > > -	value ^=3D scodec->quirks->lrck_inversion;
> > > +	if (format =3D=3D 0x3) {
> >=20
> > Could we use a define here? That would be more readable
>=20
> Yes, I can do that.
>=20
> > > +		/* Inverted LRCK is not available in DSP mode. */
> > > +		if (value & BIT(0))
> > > +			return -EINVAL;
> >=20
> > And same thing here, explicitly testing both for DSP_A and DSP_B would
> > be more readable.
>=20
> Here, `value & BIT(0)` means SND_SOC_DAIFMT_NB_IF ||
> SND_SOC_DAIFMT_IB_IF, not selecting the DSP format.
>=20
> > (And I guess value isn't such a great variable name anymore either)
>=20
> If I rename `invert` to `dsp_format`, and replace `value` here with
> `invert`, I think that would be more clear.

Yep, definitely :)

Maxime

--2nok6hajuhde5mnx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX38NQgAKCRDj7w1vZxhR
xcW0AQDhGpbhsKRaELaFSYsyNwEgCac4EG/NPUpOB5iPA3IWWwEAwPdnukIky0b5
YlV38uib2dEXsYTVQ8yvgoYMuIKSRAk=
=ebxQ
-----END PGP SIGNATURE-----

--2nok6hajuhde5mnx--
