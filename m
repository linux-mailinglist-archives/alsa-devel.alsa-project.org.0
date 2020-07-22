Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FA1229426
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:58:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A6B165E;
	Wed, 22 Jul 2020 10:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A6B165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595408287;
	bh=oUOpa+t0wzV4PftbVekvJytxsOoT6p7xFC3YZTEtSA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fk7uZO8sXZ2G2FMYQYF9UaynnRA1HeB7OAcDJKCod9qmgsxJpd5Y102M8xzVzwp5X
	 bov6FlcIlQ2AlIXrVHa/v726qN7J5uahsyr6H+EsGuDRFetdk1pESvR8V94W80Dhd3
	 QJXkA6ES6DUweehkosqxkczQO534vn4Dk5nhYXNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57FCAF8014C;
	Wed, 22 Jul 2020 10:56:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D400BF8014C; Wed, 22 Jul 2020 10:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7462FF80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7462FF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C21JPhyO"
Received: by mail-io1-xd41.google.com with SMTP id p205so1737735iod.8
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ln57g9kGaw+MdOcgZwEqa5A1Z1hG/VwmmjB0ZBbadOM=;
 b=C21JPhyOHrIydO6NKi2q8Pphvs5J6wYTWsjI/WilYhnPzBRUEUfbi3sZvNyRqe31sV
 fgkeFWZBGgS9jnNWkNnjcMWavgqiICtwVoD7e1HaBn6rV1E5ZAJXfVf+PB+5TOt8av9G
 kOGFqXG5tHd2MT64x2UE0la5J9oRsm2cKm0DDw5yOiEpM9SHQgMGa1ZOSIwOQvwP4bll
 HS8dQfM9mlpIzy3H9cGIcb21dhsDiYruiQ2Zkgy58Y1bS/0Oz+zcXQU1CfdPToqMKCOT
 ME2/FGgge3o5FdgljJmUPBe8WzJ8M21UjM2IWJrvpE6GLkYt64B6M8uUAsdFlsm2dB2t
 pkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ln57g9kGaw+MdOcgZwEqa5A1Z1hG/VwmmjB0ZBbadOM=;
 b=UHaQ9RgRuw9EPTbHTN2e+xJC4xMN98W8qaS+HTPvLX0BvI18bYusdywsyqcxoC3akj
 TFJz0pLdPYGWF+U3FFQ4HK+uXgiLONAYA77BYt1AsdJ2lcoSvFGhhhWai4yF51MZ3P14
 THZAB2ZRNTPpaKTiDAIPMUDdPblzu4SbPRD3NtKgBj4k91cUDisIvMUyPDab0yNZ7L9t
 wd4EV1a4vRSCF6jJNdnX5vPM33CRFCCPKtGeqihZlPixFty0CSMRq867xwXj8trBUos3
 4wql5UxnNq19+7Sb+EsAeUwTmizvVVTZmMdiSta4KQUDB2R96DJHbNHKdyFfakBGaO2Z
 0Aqg==
X-Gm-Message-State: AOAM530xmOrNtsBranJn4hXLW56q2SmPB9v2NHBTCvSlW//wanzRckMj
 t4qd6ieTYxUQfJEiSLB1B9j8l2dHHMCM04J15dE=
X-Google-Smtp-Source: ABdhPJzBn3F4eF5x3FCOg62em2mFuXAaZLS2uGn9dAJTbouuZ36/w0i6SG+5OMOsXp3zAFeZBBv2MzyHd/bLklA870c=
X-Received: by 2002:a5e:8805:: with SMTP id l5mr652782ioj.124.1595408173330;
 Wed, 22 Jul 2020 01:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-2-peron.clem@gmail.com>
 <72a6fddf-5e84-f050-2eee-74178d457789@sholland.org>
In-Reply-To: <72a6fddf-5e84-f050-2eee-74178d457789@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 22 Jul 2020 10:56:02 +0200
Message-ID: <CAJiuCcej5Drwz_jfF=uHNRG+w_c_SfbyJt7jyck5d_phVh-oLw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 01/16] ASoC: sun4i-i2s: Add support for H6
 I2S
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Samuel,

On Fri, 10 Jul 2020 at 07:44, Samuel Holland <samuel@sholland.org> wrote:
>
> On 7/4/20 6:38 AM, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > H6 I2S is very similar to that in H3, except it supports up to 16
> > channels.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 227 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 227 insertions(+)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index d0a8d5810c0a..9690389cb68e 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -124,6 +124,21 @@
> >  #define SUN8I_I2S_RX_CHAN_SEL_REG    0x54
> >  #define SUN8I_I2S_RX_CHAN_MAP_REG    0x58
> >
> > +/* Defines required for sun50i-h6 support */
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK        GENMASK(21, 20)
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset)     ((offset) << 20)
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL_MASK               GENMASK(19, 16)
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL(chan)              ((chan - 1) << 16=
)
> > +#define SUN50I_H6_I2S_TX_CHAN_EN_MASK                GENMASK(15, 0)
> > +#define SUN50I_H6_I2S_TX_CHAN_EN(num_chan)   (((1 << num_chan) - 1))
> > +
> > +#define SUN50I_H6_I2S_TX_CHAN_MAP0_REG       0x44
> > +#define SUN50I_H6_I2S_TX_CHAN_MAP1_REG       0x48
> > +
> > +#define SUN50I_H6_I2S_RX_CHAN_SEL_REG        0x64
> > +#define SUN50I_H6_I2S_RX_CHAN_MAP0_REG       0x68
> > +#define SUN50I_H6_I2S_RX_CHAN_MAP1_REG       0x6C
> > +
> >  struct sun4i_i2s;
> >
> >  /**
> > @@ -466,6 +481,65 @@ static int sun8i_i2s_set_chan_cfg(const struct sun=
4i_i2s *i2s,
> >       return 0;
> >  }
> >
> > +static int sun50i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > +                                const struct snd_pcm_hw_params *params=
)
> > +{
> > +     unsigned int channels =3D params_channels(params);
> > +     unsigned int slots =3D channels;
> > +     unsigned int lrck_period;
> > +
> > +     if (i2s->slots)
> > +             slots =3D i2s->slots;
> > +
> > +     /* Map the channels for playback and capture */
> > +     regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543=
210);
> > +     regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543=
210);
> > +
> > +     /* Configure the channels */
> > +     regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> > +                        SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
> > +                        SUN50I_H6_I2S_TX_CHAN_SEL(channels));
> > +     regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_SEL_REG,
> > +                        SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
> > +                        SUN50I_H6_I2S_TX_CHAN_SEL(channels));
> > +
> > +     regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
> > +                        SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
> > +                        SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM(channels));
> > +     regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
> > +                        SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM_MASK,
> > +                        SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM(channels));
> > +
> > +     switch (i2s->format & SND_SOC_DAIFMT_FORMAT_MASK) {
> > +     case SND_SOC_DAIFMT_DSP_A:
> > +     case SND_SOC_DAIFMT_DSP_B:
> > +     case SND_SOC_DAIFMT_LEFT_J:
> > +     case SND_SOC_DAIFMT_RIGHT_J:
>
> According to the manual, LEFT_J and RIGHT_J should use the same calculati=
on as
> I2S, not the one for PCM/DSP.
>
> > +             lrck_period =3D params_physical_width(params) * slots;
> > +             break;
> > +
> > +     case SND_SOC_DAIFMT_I2S:
> > +             lrck_period =3D params_physical_width(params);
> > +             break;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (i2s->slot_width)
> > +             lrck_period =3D i2s->slot_width;
> > +
> > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
> > +                        SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
> > +                        SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
>
> From the description in the manual, this looks off by one. The number of =
BCLKs
> per LRCK is LRCK_PERIOD + 1.
>
> > +
> > +     regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> > +                        SUN50I_H6_I2S_TX_CHAN_EN_MASK,
> > +                        SUN50I_H6_I2S_TX_CHAN_EN(channels));
> > +
> > +     return 0;
> > +}
> > +
> >  static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
> >                              struct snd_pcm_hw_params *params,
> >                              struct snd_soc_dai *dai)
> > @@ -691,6 +765,108 @@ static int sun8i_i2s_set_soc_fmt(const struct sun=
4i_i2s *i2s,
> >       return 0;
> >  }
> >
> > +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> > +                               unsigned int fmt)
> > +{
> > +     u32 mode, val;
> > +     u8 offset;
> > +
> > +     /*
> > +      * DAI clock polarity
> > +      *
> > +      * The setup for LRCK contradicts the datasheet, but under a
> > +      * scope it's clear that the LRCK polarity is reversed
> > +      * compared to the expected polarity on the bus.
> > +      */
>
> This comment makes us sound a lot more confident than I think we actually=
 are.

That's a comment that needs to be checked using a Logic analyzer (that
I don't have).
It's a copy paste from the previous generation.
But this seems wrong as we need to specify
"simple-audio-card,frame-inversion;" in the device-tree.

Regards,
Clement

>
> Regards,
> Samuel
