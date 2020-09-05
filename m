Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA525E6D1
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Sep 2020 11:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A9701764;
	Sat,  5 Sep 2020 11:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A9701764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599299195;
	bh=8M1/LxvmSPjNKTKIG2ErIZp04qAZCMMd4JWHB15MV4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EF9zh+gdsS8F/Rq30/srbS0j7bpaixfY2y20LRe7rcqgHiHYbiJvIk79fQWnHewFH
	 F8VruA4KnOgb2nuhTW5kU8kP+GKAl/8Nd57t97k7LZ+PuUfqd3KKi6CZ582qATrZvW
	 ZofYDBfsiCKq2JpvmTo9Sg1xg01/nsM+Js5aykRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B6AF801DA;
	Sat,  5 Sep 2020 11:44:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B42A6F80217; Sat,  5 Sep 2020 11:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29654F801DA
 for <alsa-devel@alsa-project.org>; Sat,  5 Sep 2020 11:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29654F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P7SZq3di"
Received: by mail-io1-xd43.google.com with SMTP id u126so9451188iod.12
 for <alsa-devel@alsa-project.org>; Sat, 05 Sep 2020 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MRAOg+eYaa2rEsb3DX+nTvExN1Y8ZloMTYBxu2WO+Og=;
 b=P7SZq3diaIqpOcHQNTbt285fzLsPKCXGaGACEZpnnaDtyRNjG7brmP+FENF8JvhrQh
 K4VgQs8XIqs2AyysPXUUVASiC9DV8Bs2StFORdMsYxe96+bOL/nd0Dx8h6o5tODfc18T
 CCWlvEgZFp/lgB8lGeAV41IucRWGlJyPDBlc0tpxTfMfcimJJNjTK1qI1K222nfE2Zcg
 fm9sUFsCplDn3sSMwuFTYgKecfqBxTCDFJUq7r/DHqx0ZjSGg82n/o9T1+bBRS1BuE06
 W6GIYrnA+9f8uLqBuRliozk12JNtRc+f9R5+Hk2Bh0EX83qW8F/OhI1YcScDzC7bVjHs
 uZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MRAOg+eYaa2rEsb3DX+nTvExN1Y8ZloMTYBxu2WO+Og=;
 b=D9OmZVnKuAQRmXErs5nIPetfpUCKCfeqKUjFOj8DN9O2EdFE/Kn1y/OY1DOYUYKH69
 seH1ZWVnkrwLhcLAHya/RDrVfGxZn9YBY7doA3prxvwoNSfvGU/bCVdg2mMZ2BpslKDh
 0GXSXfntIhFphgjASJxQcEuvx17dUgTZtTdAMuny10dsPTAwgW1Mq9xSHW9vB6Jd3dRk
 Km8JeIKffXOAE3GC0vu9EjycstLrBuutDYro0SQ6IlHz9sHh2rWgYLJXsUmFnQfeULOX
 j8VHhGdZ9A6KQ9vXeW+IEk4Tm5Q9iGyhkUpagX7K1AgxBEzSSWm6QELRW6nb5FzYL15Q
 9Ksw==
X-Gm-Message-State: AOAM530yhSFi7f3fMnmSX1AP6xbNzA9vJ5eQhmkL8js2msWd5f/dmyRN
 AQBSfuhX322ITPD60miqzG91ak9iNL2Kt3uKFSo=
X-Google-Smtp-Source: ABdhPJyXfvK1S863k7/77Ze1ILkQ4pn0uoDYrNx4ieLIKuFYPgjXVZsg68a5vnb//UDFJVFIlHWJ43gpZjQFmNJGfcE=
X-Received: by 2002:a6b:e017:: with SMTP id z23mr10805226iog.101.1599299081475; 
 Sat, 05 Sep 2020 02:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200903203034.1057334-1-peron.clem@gmail.com>
 <20200903203034.1057334-3-peron.clem@gmail.com>
 <7259829d-142e-b518-52a7-6fef388b27d2@sholland.org>
In-Reply-To: <7259829d-142e-b518-52a7-6fef388b27d2@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 5 Sep 2020 11:44:30 +0200
Message-ID: <CAJiuCcew35XzvA0gW=rq57RE3Oqxsa6y1UyeBJ+1HPoK4fyWgQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/20] ASoC: sun4i-i2s: Add support for H6 I2S
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
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

On Fri, 4 Sep 2020 at 05:16, Samuel Holland <samuel@sholland.org> wrote:
>
> Cl=C3=A9ment,
>
> On 9/3/20 3:30 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > H6 I2S is very similar to that in H3, except it supports up to 16
> > channels.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 221 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 221 insertions(+)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index fabff7bcccbc..acf24f512f2c 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
>
> [snip]
>
> > @@ -474,6 +489,65 @@ static int sun8i_i2s_set_chan_cfg(const struct sun=
4i_i2s *i2s,
> >       return 0;
> >  }
> >
> > +static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > +                                   const struct snd_pcm_hw_params *par=
ams)
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
> These cases don't match the documentation: LEFT_J and RIGHT_J are documen=
ted to
> behave like I2S (lrck_period =3D=3D slot_width), not like DSP_A/B (lrck_p=
eriod =3D=3D
> slot_width * slots).
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
>
> Here, i2s->slot_width is the number of bits for each slot, but in PCM mod=
e, you
you mean TDM here right?

> need to multiply by the number of slots, like above.
>
> Also, there is already logic in sun4i_i2s_hw_params to use i2s->slot_widt=
h and
> i2s->slots. You could avoid the duplication by passing slot_width/slots a=
s
> parameters to set_chan_cfg.

Thanks for the catch, I will fix this.

Regards,
Clement

>
> Regards,
> Samuel
>
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
>
> [snip]
