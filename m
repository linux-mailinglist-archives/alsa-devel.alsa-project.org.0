Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76507283679
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 15:25:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90BC417E2;
	Mon,  5 Oct 2020 15:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90BC417E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601904320;
	bh=XO1+d3K1mLxdOLtYnxPZxaMetAIYWyVs21jnUoYwchc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=htEh0Cz3/iK1WKjUjTqRqFG3J+6HquqY/8ATRNYx9NDWwdydmeuAaCYNJ7zxBr6M0
	 P+hTcnmHBiVI9QE7qiLnINKHIpcqoj+begcsV8d+3QdvreCwMOY3bwYsVuo2/R9djP
	 GMJ/SzekNDV7+w8mOxG+sZ0ujpIa+RaG/j+Ls/rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5BD1F800C9;
	Mon,  5 Oct 2020 15:23:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBE6BF8025A; Mon,  5 Oct 2020 15:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E053F800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 15:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E053F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gbr3xWDv"
Received: by mail-io1-xd41.google.com with SMTP id m17so9097610ioo.1
 for <alsa-devel@alsa-project.org>; Mon, 05 Oct 2020 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=weoxlCL4s68iLYumYf/JNpJEA/fRjS1GFyVHxrT3h78=;
 b=Gbr3xWDvbVqxUML79XLnV/AUmP/ErPLZoHbMZ7f0nGxyEBzHSpYYq4zpcU/awEGQ+w
 /mo76U6ltG3G9MhSVSuhSghO6J4kuPoXF+gNIrsI8ugoQCx0wyHPEk0ZBVaRlToS5mUW
 QZLxg51j9mlubjHWEJFlTvAmhCsae4AKO4/CeWSpv5l20h09PRlcnQDWQLTR3hMzJONF
 9VOlF5pWJx+mwbrYkncigo3MGAbXWkHPR7kL/uc3H8l6pQjfrtmNSfmKP7+sYtWpT3bX
 QiGD96Qpw34aPE2eV0ad+h5U5cnv35lOUUWiz0cR+0Kt9NbqWrQXCuGjHJmpsmMfMZmO
 9CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=weoxlCL4s68iLYumYf/JNpJEA/fRjS1GFyVHxrT3h78=;
 b=AxnB4lDvu13ZISsMHvpZP8LLS1Smd/OAE1YxbDGuaF4LjLqhtsZ8TzZkuUxMCeuv6I
 ob87Y65ZriTm1gCoilgIOhiVt2W4pOavOSh+PM2gHB1wcN7/StAq0HizlBJX5NIjlfFB
 Hf17kBaEh24FrvWtHoTqECLaQ6EMbTxCUGlRsEIplTXM4D6vm/i8VHuKbXLf1RjmEtM9
 WyLZPtUNr2ed89fQ6xdzEJM45Y12WOkQ2uCvqigEWYHJwvlN+Tt+0bvSyCpK79IH4C3d
 33liuo7PipuZm/PhRxhJ0GaVeUWfSne4yB3hLLzw0e6NnAOYk00R4CtRwA5lPlVetQca
 cAQQ==
X-Gm-Message-State: AOAM530BBqYlcNoVoYG+gVpNOAIsdbbKLXxEE8FWDxEG1ai2RqTCNoA2
 d1AbgUnUXLGcAvLGqNfDjIJpUHBOdzYoBaC6VyM=
X-Google-Smtp-Source: ABdhPJxZh95BTj0yf592D4+DfAkmrPfpqjg+t/pG5W4Z8g+/qjc469AxGm523yI3fUgNrf6hbzOVvshXIvNKx3AHCIk=
X-Received: by 2002:a5d:8ace:: with SMTP id e14mr10756345iot.124.1601904203837; 
 Mon, 05 Oct 2020 06:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201003141950.455829-1-peron.clem@gmail.com>
 <20201003141950.455829-3-peron.clem@gmail.com>
 <20201005121307.v6jpyeyfi4kxc2cl@gilmour.lan>
In-Reply-To: <20201005121307.v6jpyeyfi4kxc2cl@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 5 Oct 2020 15:23:12 +0200
Message-ID: <CAJiuCcdd6_kzsxEERZbj2Budjmuyv6gV_sPG8LjLY=fk+MO8zQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
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

On Mon, 5 Oct 2020 at 14:13, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Sat, Oct 03, 2020 at 04:19:38PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > As slots and slot_width can be set manually using set_tdm().
> > These values are then kept in sun4i_i2s struct.
> > So we need to check if these values are setted or not
> > in the struct.
> >
> > Avoid to check for this logic in set_chan_cfg(). This will
> > duplicate the same check instead pass the required values
> > as params to set_chan_cfg().
> >
> > This will also avoid a bug when we will enable 20/24bits support,
> > i2s->slot_width is not actually used in the lrck_period computation.
> >
> > Suggested-by: Samuel Holland <samuel@sholland.org>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 36 ++++++++++++++----------------------
> >  1 file changed, 14 insertions(+), 22 deletions(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index c5ccd423e6d3..1f577dbc20a6 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
> >       unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
> >       s8      (*get_sr)(const struct sun4i_i2s *, int);
> >       s8      (*get_wss)(const struct sun4i_i2s *, int);
> > -     int     (*set_chan_cfg)(const struct sun4i_i2s *,
> > -                             const struct snd_pcm_hw_params *);
> > +     int     (*set_chan_cfg)(const struct sun4i_i2s *i2s,
> > +                             unsigned int channels,  unsigned int slot=
s,
> > +                             unsigned int slot_width);
> >       int     (*set_fmt)(const struct sun4i_i2s *, unsigned int);
> >  };
> >
> > @@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_=
i2s *i2s, int width)
> >  }
> >
> >  static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > -                               const struct snd_pcm_hw_params *params)
> > +                               unsigned int channels, unsigned int slo=
ts,
> > +                               unsigned int slot_width)
> >  {
> > -     unsigned int channels =3D params_channels(params);
> > -
> >       /* Map the channels for playback and capture */
> >       regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210);
> >       regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210);
> > @@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct su=
n4i_i2s *i2s,
> >  }
> >
> >  static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > -                               const struct snd_pcm_hw_params *params)
> > +                               unsigned int channels, unsigned int slo=
ts,
> > +                               unsigned int slot_width)
> >  {
> > -     unsigned int channels =3D params_channels(params);
> > -     unsigned int slots =3D channels;
> >       unsigned int lrck_period;
> >
> > -     if (i2s->slots)
> > -             slots =3D i2s->slots;
> > -
> >       /* Map the channels for playback and capture */
> >       regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
> >       regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210);
> > @@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct su=
n4i_i2s *i2s,
> >       case SND_SOC_DAIFMT_DSP_B:
> >       case SND_SOC_DAIFMT_LEFT_J:
> >       case SND_SOC_DAIFMT_RIGHT_J:
> > -             lrck_period =3D params_physical_width(params) * slots;
> > +             lrck_period =3D slot_width * slots;
> >               break;
> >
> >       case SND_SOC_DAIFMT_I2S:
> > -             lrck_period =3D params_physical_width(params);
> > +             lrck_period =3D slot_width;
> >               break;
> >
> >       default:
> > @@ -490,15 +486,11 @@ static int sun8i_i2s_set_chan_cfg(const struct su=
n4i_i2s *i2s,
> >  }
> >
> >  static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > -                                   const struct snd_pcm_hw_params *par=
ams)
> > +                                   unsigned int channels, unsigned int=
 slots,
> > +                                   unsigned int slot_width)
> >  {
> > -     unsigned int channels =3D params_channels(params);
> > -     unsigned int slots =3D channels;
> >       unsigned int lrck_period;
> >
> > -     if (i2s->slots)
> > -             slots =3D i2s->slots;
> > -
> >       /* Map the channels for playback and capture */
> >       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFEDCB=
A98);
> >       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543=
210);
> > @@ -525,11 +517,11 @@ static int sun50i_h6_i2s_set_chan_cfg(const struc=
t sun4i_i2s *i2s,
> >       case SND_SOC_DAIFMT_DSP_B:
> >       case SND_SOC_DAIFMT_LEFT_J:
> >       case SND_SOC_DAIFMT_RIGHT_J:
> > -             lrck_period =3D params_physical_width(params) * slots;
> > +             lrck_period =3D slot_width * slots;
> >               break;
> >
> >       case SND_SOC_DAIFMT_I2S:
> > -             lrck_period =3D params_physical_width(params);
> > +             lrck_period =3D slot_width;
> >               break;
> >
> >       default:
> > @@ -565,7 +557,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_subst=
ream *substream,
> >       if (i2s->slot_width)
> >               slot_width =3D i2s->slot_width;
> >
> > -     ret =3D i2s->variant->set_chan_cfg(i2s, params);
> > +     ret =3D i2s->variant->set_chan_cfg(i2s, channels, slots, slot_wid=
th);
>
> Isn't slots and slot_width set to 0 here ?

No, there is still a check before calling the set_cfg function.

  unsigned int slot_width =3D params_physical_width(params);
  unsigned int channels =3D params_channels(params);
  unsigned int slots =3D channels;

  if (i2s->slots)
  slots =3D i2s->slots;

  if (i2s->slot_width)
  slot_width =3D i2s->slot_width;

ret =3D i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);

So slot_width will be equal to params_physical_width(params);
like before

Clement

>
> And therefore, wouldn't we set lrck_period to 0 if we're using any
> format but I2S?
>
> More importantly, I'm not really convinced this needs to be done, and it
> introduces some side effects that are not explained.
>
> Maxime
