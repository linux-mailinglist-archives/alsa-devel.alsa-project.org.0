Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F581BB958
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 10:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADA4C1685;
	Tue, 28 Apr 2020 10:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADA4C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588064268;
	bh=uN+tFY5M9sh4l0pD69fdn5J+SCCJalhYqbKYS/KpMuk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BVw5SqVGTWmR2L6t09w4bDfztluAeyhz+lhNjedEb3B1aPS5QB2ISUzAQwv6dW+gn
	 R03wp93p5t56AdEjWJjuXa3z68NH61snafYcZO9C9q38FzMOOm7efVeK8LLYBT0/Y9
	 DBsV4eSHNHCg+XNeeCcUseZouL22eLoxRjqd3AX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0761F801DB;
	Tue, 28 Apr 2020 10:56:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17622F801DB; Tue, 28 Apr 2020 10:56:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20A19F800D2
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 10:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20A19F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X0C8oWWC"
Received: by mail-il1-x141.google.com with SMTP id w6so19548706ilg.1
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 01:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TD/lnuFC44QRgJpTGVlf3YDYyxHlyiyz2n23ed9C6mM=;
 b=X0C8oWWC7HBDefztnjqwVNF6CUzQX/XKsvz0/P0Gpxoi0RAKyYdc6pLqlm3Sv5rTOc
 36wrzvNTFC0VZMEIMnFqljO0jppeodCMx+v4ENiTI6GsS3IAOG/gkYK3ur+tQu9hpI0H
 Llm1dng014acptPeaRWLEthJwG5SKroInUG102Tsw37ySBPxiywhJGk6ajpZEz6IvS+l
 qaTqCJu93AB0A2gA2juzpeIyyFVvQ1RyVc9+2IaBbzDpF2G4ZO4oUWfGYp4V+wPkcO7V
 B/JD9Gds7XvfEJZ/qqi9XGjaYOhC8gtnZffMIwTGX2G01fGDH5pEjf/OXAs0tUjTo2eT
 yKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TD/lnuFC44QRgJpTGVlf3YDYyxHlyiyz2n23ed9C6mM=;
 b=nxspZBfK/imVtn7Vd3/ChQP0b/aY2Hl+7TrerbNMglA2VvItaSmGf5eqFLS0bkQwPg
 O6Gi+bO9VVtUjqAc8Cnz0xdB4tlxO+vrBLjOZu1uyYf7Xcu1w2hdnAk4aVgi7oOK/iWV
 QcawEe080jzYeTleABhZ7335J94QRNDCAAVx/Q8cFJGekKDdWjAZKk7c6HlpLGvO6m+E
 Y8cYDd3WzkQYXqsytF1T+7VMsLvugBIdfBtK9RbQ54aXEhXTmUDU8m+TFutcN5C6SehU
 J2Guk4ZGxyjRfAMi2TpMDNymWO4Ua5QOzpNFc6Qs1ZXeN26d+dAA+eoFZqA5yb9ASxIs
 qGpQ==
X-Gm-Message-State: AGi0PubLXO1qpQaOyHlFO43NTrd2EDUunTx01f1hk9S6TZWXOSM48W5n
 ZocAE+jWNzt8J7R1LLr1N15aD1xdW+TPfDg2MWY=
X-Google-Smtp-Source: APiQypI1+9N3ua5Z1bos34+qF798abCjulu/oQUQazj2tzQmHK/vdQIdGibMX1aIFSQg6JHmO/7h5kDmFG/UmZPLrC0=
X-Received: by 2002:a05:6e02:111:: with SMTP id
 t17mr23768711ilm.59.1588064158991; 
 Tue, 28 Apr 2020 01:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-4-peron.clem@gmail.com>
 <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
In-Reply-To: <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 28 Apr 2020 10:55:47 +0200
Message-ID: <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>,
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

Hi Maxime,

On Tue, 28 Apr 2020 at 10:13, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Sun, Apr 26, 2020 at 12:41:11PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
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
> > index 4198a5410bf9..a23c9f2a3f8c 100644
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
> > @@ -469,6 +484,65 @@ static int sun8i_i2s_set_chan_cfg(const struct sun=
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
> > @@ -694,6 +768,108 @@ static int sun8i_i2s_set_soc_fmt(const struct sun=
4i_i2s *i2s,
> >       return 0;
> >  }
> >
> > +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> > +                              unsigned int fmt)
>
> The alignment is off here
>
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
> Did you check this or has it been copy-pasted?

copy-pasted, I will check this.

Thanks,
Clement

>
> Thanks!
> Maxime
