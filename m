Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44CE21BD92
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 21:24:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D9315E0;
	Fri, 10 Jul 2020 21:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D9315E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594409069;
	bh=93zM+cKBgg2llhfX0pUHtu5K2QfXktbNtWQR85ZlMF4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ehaZ9hMbNpMByu5eRaWhdmoJf7toaaQR4D97t9ATl578tdYMQxcNLHg3Fb252dKj+
	 7ctbemLvirsgpDF6oY6TvDH4vLe4MU07wlOYRJE9t8U6PnPKLi7wryl6IDyAlmSInB
	 lzaGh4cKyXlAW+N4obhHxK15CNFV9E0vPaKJEv60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F256F8011C;
	Fri, 10 Jul 2020 21:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C2B6F8015A; Fri, 10 Jul 2020 21:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.siol.net (mailoutvs38.siol.net [185.57.226.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FE5AF8011C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 21:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FE5AF8011C
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 9A60B522763;
 Fri, 10 Jul 2020 21:22:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id gejh6xTW37uc; Fri, 10 Jul 2020 21:22:37 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 1D556522762;
 Fri, 10 Jul 2020 21:22:37 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 0D90A522763;
 Fri, 10 Jul 2020 21:22:35 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: peron.clem@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [linux-sunxi] [PATCH 01/16] ASoC: sun4i-i2s: Add support for H6
 I2S
Date: Fri, 10 Jul 2020 21:22:34 +0200
Message-ID: <3787973.dVgI16VYFl@jernej-laptop>
In-Reply-To: <72a6fddf-5e84-f050-2eee-74178d457789@sholland.org>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-2-peron.clem@gmail.com>
 <72a6fddf-5e84-f050-2eee-74178d457789@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
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

Hi Samuel!

Dne petek, 10. julij 2020 ob 07:44:33 CEST je Samuel Holland napisal(a):
> On 7/4/20 6:38 AM, Cl=E9ment P=E9ron wrote:
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >=20
> > H6 I2S is very similar to that in H3, except it supports up to 16
> > channels.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > ---
> >=20
> >  sound/soc/sunxi/sun4i-i2s.c | 227 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 227 insertions(+)
> >=20
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index d0a8d5810c0a..9690389cb68e 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -124,6 +124,21 @@
> >=20
> >  #define SUN8I_I2S_RX_CHAN_SEL_REG	0x54
> >  #define SUN8I_I2S_RX_CHAN_MAP_REG	0x58
> >=20
> > +/* Defines required for sun50i-h6 support */
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK	GENMASK(21, 20)
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset)	((offset) << 20)
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL_MASK		GENMASK(19, 16)
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL(chan)		((chan - 1) << 16)
> > +#define SUN50I_H6_I2S_TX_CHAN_EN_MASK		GENMASK(15, 0)
> > +#define SUN50I_H6_I2S_TX_CHAN_EN(num_chan)	(((1 << num_chan) - 1))
> > +
> > +#define SUN50I_H6_I2S_TX_CHAN_MAP0_REG	0x44
> > +#define SUN50I_H6_I2S_TX_CHAN_MAP1_REG	0x48
> > +
> > +#define SUN50I_H6_I2S_RX_CHAN_SEL_REG	0x64
> > +#define SUN50I_H6_I2S_RX_CHAN_MAP0_REG	0x68
> > +#define SUN50I_H6_I2S_RX_CHAN_MAP1_REG	0x6C
> > +
> >=20
> >  struct sun4i_i2s;
> > =20
> >  /**
> >=20
> > @@ -466,6 +481,65 @@ static int sun8i_i2s_set_chan_cfg(const struct
> > sun4i_i2s *i2s,>=20
> >  	return 0;
> > =20
> >  }
> >=20
> > +static int sun50i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > +				   const struct snd_pcm_hw_params=20
*params)
> > +{
> > +	unsigned int channels =3D params_channels(params);
> > +	unsigned int slots =3D channels;
> > +	unsigned int lrck_period;
> > +
> > +	if (i2s->slots)
> > +		slots =3D i2s->slots;
> > +
> > +	/* Map the channels for playback and capture */
> > +	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG,=20
0x76543210);
> > +	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG,=20
0x76543210);
> > +
> > +	/* Configure the channels */
> > +	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> > +			   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
> > +			   SUN50I_H6_I2S_TX_CHAN_SEL(channels));
> > +	regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_SEL_REG,
> > +			   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
> > +			   SUN50I_H6_I2S_TX_CHAN_SEL(channels));
> > +
> > +	regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
> > +			   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
> > +			  =20
SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM(channels));
> > +	regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
> > +			   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM_MASK,
> > +			  =20
SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM(channels));
> > +
> > +	switch (i2s->format & SND_SOC_DAIFMT_FORMAT_MASK) {
> > +	case SND_SOC_DAIFMT_DSP_A:
> > +	case SND_SOC_DAIFMT_DSP_B:
> > +	case SND_SOC_DAIFMT_LEFT_J:
>=20
> > +	case SND_SOC_DAIFMT_RIGHT_J:
> According to the manual, LEFT_J and RIGHT_J should use the same calculati=
on
> as I2S, not the one for PCM/DSP.
>=20
> > +		lrck_period =3D params_physical_width(params) * slots;
> > +		break;
> > +
> > +	case SND_SOC_DAIFMT_I2S:
> > +		lrck_period =3D params_physical_width(params);
> > +		break;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (i2s->slot_width)
> > +		lrck_period =3D i2s->slot_width;
> > +
> > +	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
> > +			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
> > +			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
>=20
> From the description in the manual, this looks off by one. The number of
> BCLKs per LRCK is LRCK_PERIOD + 1.

Are you sure? Macro SUN8I_I2S_FMT0_LRCK_PERIOD() is defined as follows:

#define SUN8I_I2S_FMT0_LRCK_PERIOD(period)	((period - 1) << 8)

which already lowers value by 1.

Best regards,
Jernej

>=20
> > +
> > +	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> > +			   SUN50I_H6_I2S_TX_CHAN_EN_MASK,
> > +			   SUN50I_H6_I2S_TX_CHAN_EN(channels));
> > +
> > +	return 0;
> > +}
> > +
> >=20
> >  static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
> > =20
> >  			       struct snd_pcm_hw_params *params,
> >  			       struct snd_soc_dai *dai)
> >=20
> > @@ -691,6 +765,108 @@ static int sun8i_i2s_set_soc_fmt(const struct
> > sun4i_i2s *i2s,>=20
> >  	return 0;
> > =20
> >  }
> >=20
> > +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> > +				  unsigned int fmt)
> > +{
> > +	u32 mode, val;
> > +	u8 offset;
> > +
> > +	/*
> > +	 * DAI clock polarity
> > +	 *
> > +	 * The setup for LRCK contradicts the datasheet, but under a
> > +	 * scope it's clear that the LRCK polarity is reversed
> > +	 * compared to the expected polarity on the bus.
> > +	 */
>=20
> This comment makes us sound a lot more confident than I think we actually
> are.
>=20
> Regards,
> Samuel




