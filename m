Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A338027B041
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 16:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B377E1905;
	Mon, 28 Sep 2020 16:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B377E1905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601304492;
	bh=YDtB62KKAPLNWPJe9G7QreeUvXy5hQumx2vuiamNjzg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJb7rlKQMJD94dq4U+K0fkkOSB2Ho+5JEBbmuSA5RmkRHdmRTA7sm4OSoLE95A5+R
	 bUHSc1cuXkqbBL6qRB+/qXIYXqAVAF5heGyxy1xzRf4js5/A+4rhCTofQKYcwjH/4E
	 P4eC11HJ0t5upmQyr6i2fgO4X3i4FhxVLimBMluA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80F11F800DF;
	Mon, 28 Sep 2020 16:46:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4376F801ED; Mon, 28 Sep 2020 16:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B17AF800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 16:46:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B17AF800DF
Received: by mail-lf1-f67.google.com with SMTP id q8so1590139lfb.6
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KCww78yTvjpE9tUq6aOXD0YyyC+MPNJogO8+ZVoVaG0=;
 b=BYhfNOLz25eyGIfAfCfRIQPQkDkkIzii3IizYcjC9k/ACWyR2YO184x8/COHsawCXd
 mwO9ByiESGIwSKE0gD3wntYAdUHBMb3teFVTscvD6qmLlspC2XpQPRXa/m7eXx7ZJgF8
 R/wPHCTQmsMqlBpuAghN2yQk8PEZQyBJf5jvegS+vlK5XPwlW0iJAjIbHdMMkHHS4y+z
 hKcBaOIsvn5b8kB3MwJ5JR7lhfJoP9PNT9WhMHSCxWZ4FFBatHFCbQ36+A+XubzHcdMT
 6EiS7u/xuxrG175WZkBKE61f+pF6RZgU2Ymh0lGjxrcpkKNf+BjH+4oeA1PnNpC5iQAV
 ofNA==
X-Gm-Message-State: AOAM533/jVBGKvfLCHiiOorJQghvYGo1ZkjX+3yK5Fe18C3Y0CQ43Ntx
 2s+gJ7RGj+x3oXUIuCVMZdlDcatbaTM3MA==
X-Google-Smtp-Source: ABdhPJzts7PXdKvvYT5BaIwi7k4qdkBIJplyw/8A22+n0gQBx9fP6LzQAe8aqz1fG1ftWEJEZlgcjA==
X-Received: by 2002:a19:dc19:: with SMTP id t25mr559261lfg.114.1601304377299; 
 Mon, 28 Sep 2020 07:46:17 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id 145sm2847007lfk.270.2020.09.28.07.46.16
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 07:46:16 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id s205so1257452lja.7
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:46:16 -0700 (PDT)
X-Received: by 2002:a2e:760e:: with SMTP id r14mr509853ljc.331.1601304376547; 
 Mon, 28 Sep 2020 07:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-2-peron.clem@gmail.com>
 <CAGb2v65AhnqD6ec20h9vtd2GjqVsf_yz5+7VSa8giJuFJnd5ag@mail.gmail.com>
 <CAJiuCcevtzX_+02r54q6tH0+bOF=BM=knnaxN+G3QW035F8gZQ@mail.gmail.com>
In-Reply-To: <CAJiuCcevtzX_+02r54q6tH0+bOF=BM=knnaxN+G3QW035F8gZQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 22:46:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Ath4vm+QNky2Le6ickJJ68Q8DJs8k6kqW=xh7DxmnMg@mail.gmail.com>
Message-ID: <CAGb2v64Ath4vm+QNky2Le6ickJJ68Q8DJs8k6kqW=xh7DxmnMg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 01/20] ASoC: sun4i-i2s: Add support for
 H6 I2S
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
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

On Mon, Sep 28, 2020 at 10:37 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:
>
> Hi Chen-Yu,
>
> On Mon, 28 Sep 2020 at 06:40, Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gma=
il.com> wrote:
> > >
> > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > >
> > > H6 I2S is very similar to that in H3, except it supports up to 16
> > > channels.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > ---
> > >  sound/soc/sunxi/sun4i-i2s.c | 224 ++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 224 insertions(+)
> > >
> > > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.=
c
> > > index f23ff29e7c1d..2baf6c276280 100644
> > > --- a/sound/soc/sunxi/sun4i-i2s.c
> > > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > > @@ -124,6 +124,21 @@
> > >  #define SUN8I_I2S_RX_CHAN_SEL_REG      0x54
> > >  #define SUN8I_I2S_RX_CHAN_MAP_REG      0x58
> > >
> > > +/* Defines required for sun50i-h6 support */
> > > +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK  GENMASK(21, 20)
> > > +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset)       ((offset) << =
20)
> > > +#define SUN50I_H6_I2S_TX_CHAN_SEL_MASK         GENMASK(19, 16)
> > > +#define SUN50I_H6_I2S_TX_CHAN_SEL(chan)                ((chan - 1) <=
< 16)
> > > +#define SUN50I_H6_I2S_TX_CHAN_EN_MASK          GENMASK(15, 0)
> > > +#define SUN50I_H6_I2S_TX_CHAN_EN(num_chan)     (((1 << num_chan) - 1=
))
> > > +
> > > +#define SUN50I_H6_I2S_TX_CHAN_MAP0_REG 0x44
> > > +#define SUN50I_H6_I2S_TX_CHAN_MAP1_REG 0x48
> > > +
> > > +#define SUN50I_H6_I2S_RX_CHAN_SEL_REG  0x64
> > > +#define SUN50I_H6_I2S_RX_CHAN_MAP0_REG 0x68
> > > +#define SUN50I_H6_I2S_RX_CHAN_MAP1_REG 0x6C
> > > +
> > >  struct sun4i_i2s;
> > >
> > >  /**
> > > @@ -474,6 +489,62 @@ static int sun8i_i2s_set_chan_cfg(const struct s=
un4i_i2s *i2s,
> > >         return 0;
> > >  }
> > >
> > > +static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > > +                                     const struct snd_pcm_hw_params =
*params)
> > > +{
> > > +       unsigned int channels =3D params_channels(params);
> > > +       unsigned int slots =3D channels;
> > > +       unsigned int lrck_period;
> > > +
> > > +       if (i2s->slots)
> > > +               slots =3D i2s->slots;
> > > +
> > > +       /* Map the channels for playback and capture */
> > > +       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x7=
6543210);
> > > +       regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x7=
6543210);
> >
> > Nit, since it supports up to 16 channels, you might want to map all 16 =
of them
> > now, instead of having to come back and fix it later.
>
> Thanks for the review. Do you mean there is missing MAP0 for RX/TX ?
>
> + regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFEDCBA98);
>   regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210);
> + regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP0_REG, 0xFEDCBA98);
>   regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);

Correct.

ChenYu

> Regards,
> Clement
>
> >
> > Code wise, this patch is
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> >
> > I don't have a scope nor logic analyzer, so I wasn't able to participat=
e in the
> > LRCK discussion.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msg=
id/linux-sunxi/CAJiuCcevtzX_%2B02r54q6tH0%2BbOF%3DBM%3DknnaxN%2BG3QW035F8gZ=
Q%40mail.gmail.com.
