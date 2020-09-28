Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCC27B049
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 16:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DB741902;
	Mon, 28 Sep 2020 16:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DB741902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601304624;
	bh=lJpJGN/+62Nxv4FMKxF+98rPL2ohEYXv1OIIOFoRHcE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6uQh1EazF20/UUuiKvdPvGiz6BD3Jw/uI76YX7znpo/vIhlWTf4XmfEvBfbC3fqX
	 bs7QqXIaxzPAf0r1+ESyQkPm43tfYoVFziNN+8TH5Ol0UPIxk+0zQBnES2Rhrtv0h5
	 Ob6fyPQJxK+jf/fyDcagFzVH9SdgLYdUAbW9K39k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B44DEF801F9;
	Mon, 28 Sep 2020 16:48:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94ADBF801ED; Mon, 28 Sep 2020 16:48:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4877AF800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 16:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4877AF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OZaF2CtE"
Received: by mail-il1-x143.google.com with SMTP id y2so1523089ila.0
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vQtXU3enAOb8a0F7LbFZw7wLpO431aR2A2CY3HJMkgQ=;
 b=OZaF2CtEYFnNkMyOeRvFckPCRRkEvcgqI67p4VJ2nRQ+vdrZBAapya5VQMhVGqa0Pc
 xM1jN+mltbWDKKk8popL015Sl6sfWqKh+D66ChLMhLuVJu8V5hAQbzLrwIwlkOHBrsAU
 hCeIuDm/Baedvbmnv5KQQfsTPj+vjenjt6PX1yPbszShovNQ8uAPEDS5tGTRhk6A5GXA
 dGsUTLxW9XdXjuLFzEnYTHoCDKph1NapO6746XVw6TL/NCQDzntdVyRLLYVZRdbyf3JA
 QbYIb0ekb+W3b7D/H1r1wCOfVvs2HAQiNWqq1npY7QSVhPe8ILYg21nWzt7uf+PO2zMs
 q1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vQtXU3enAOb8a0F7LbFZw7wLpO431aR2A2CY3HJMkgQ=;
 b=hUnqIYFQNjYqh0Reo7He+KC2dK7SUQLygN6RiwCj5b+brQKiF90192aHA9wkirRMDm
 eLTknEnDhYAKr1CZg9Rttl8yv3sOe+wUOqYlwFWR7F/FrwEQXaBafHVvveWzUupFSMHh
 neCWwu3ibPmTcvzLSLCH7/3w7p3jjmFSz9gh6HFqt+WlaP7h7cVBZKr9oZL8DEoFWxT6
 f1GdDrFuMVrHb6pusLFWLCV1YNIrqJmPxD6ETix0bdozv3+OZB2BqbNK93iI2443l4C/
 sZjKQs31xPt4TLYX6niiCz4sDdQwE5eV6cV39e/HRDGTxZ+wdwe73Yhmtze5PSeXdzXI
 vc/Q==
X-Gm-Message-State: AOAM532Uh57nNPOTKmG1mHEyVmIN1YMbRWV9Uq2lhIccxVUCUSagU9jD
 DgVmAMAY2dMfxiBnnFpxazpdiBl9yHY0crFdUSc=
X-Google-Smtp-Source: ABdhPJyzQtJ4Wq6iMS79WrUFhP9745qmyzAStclm/SXxrx+gsno8hRzUha9nYwTBHlnwHYeP91NhtWzAzwbYb+tVqNc=
X-Received: by 2002:a92:217:: with SMTP id 23mr1544245ilc.118.1601304512241;
 Mon, 28 Sep 2020 07:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-3-peron.clem@gmail.com>
 <CAGb2v669XXerfrgK9WzAoMHwArn765yS9Db4_xwwQSXpnm2zqQ@mail.gmail.com>
In-Reply-To: <CAGb2v669XXerfrgK9WzAoMHwArn765yS9Db4_xwwQSXpnm2zqQ@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 28 Sep 2020 16:48:21 +0200
Message-ID: <CAJiuCcfWCSqfq6-DP_SKBgLm63U7oKWJOSLUme1Wf0yXoR=8_g@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 02/20] ASoC: sun4i-i2s: Change
 set_chan_cfg() params
To: Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Samuel Holland <samuel@sholland.org>,
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

Hi Chen-Yu,

On Mon, 28 Sep 2020 at 07:00, Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >
> > As slots and slot_width can be overwritter in case set_tdm() is
> > called. Avoid to have this logic in set_chan_cfg().
>
> It doesn't seem that set_tdm_slot() would get called concurrently
> with hw_params(), at least not for the simple-card family. If so
> then we'd have more problems like mismatched slots/slot-width
> due to no serialization when interacting with those values.

Sorry maybe the commit log is not clear.
I was not talking about a concurrent effect but more if the slot_width is s=
etted
then we don't properly use it later.

>
> > Instead pass the required values as params to set_chan_cfg().
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
> > index 2baf6c276280..0633b9fba3d7 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
> >         unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *)=
;
> >         s8      (*get_sr)(const struct sun4i_i2s *, int);
> >         s8      (*get_wss)(const struct sun4i_i2s *, int);
> > -       int     (*set_chan_cfg)(const struct sun4i_i2s *,
> > -                               const struct snd_pcm_hw_params *);
> > +       int     (*set_chan_cfg)(const struct sun4i_i2s *i2s,
> > +                               unsigned int channels,  unsigned int sl=
ots,
> > +                               unsigned int slot_width);
> >         int     (*set_fmt)(const struct sun4i_i2s *, unsigned int);
> >  };
> >
> > @@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_=
i2s *i2s, int width)
> >  }
> >
> >  static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > -                                 const struct snd_pcm_hw_params *param=
s)
> > +                                 unsigned int channels, unsigned int s=
lots,
> > +                                 unsigned int slot_width)
> >  {
> > -       unsigned int channels =3D params_channels(params);
> > -
> >         /* Map the channels for playback and capture */
> >         regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210=
);
> >         regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210=
);
> > @@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct su=
n4i_i2s *i2s,
> >  }
> >
> >  static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > -                                 const struct snd_pcm_hw_params *param=
s)
> > +                                 unsigned int channels, unsigned int s=
lots,
> > +                                 unsigned int slot_width)
> >  {
> > -       unsigned int channels =3D params_channels(params);
> > -       unsigned int slots =3D channels;
> >         unsigned int lrck_period;
> >
> > -       if (i2s->slots)
> > -               slots =3D i2s->slots;
> > -
>
> Based on the bug you highlighted in your expanded commit log, the simpler=
 fix
> would be to look at i2s->slot_width in addition to i2s->slots, and replac=
e
> params_physical_width(params) accordingly.

That's what I did in the first version but was pointed out by Samuel
that the same logic
was done several times. As I can avoid it by passing the correct
params it's simpler.

>
> Also, I would put fixes (even preparatory ones) before patches that intro=
duce
> support for new features and hardware. That makes them easier to backport=
 if
> needed.

I will wait for Maxime to comment on this. Regarding the doc fixes tag
should only be used
to fix a previous commit. This will make the fixes commit a bit more
complicated for stable kernel team.

Thanks for your review :)

Regards
Clement


>
>
> ChenYu
>
>
> >         /* Map the channels for playback and capture */
> >         regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210=
);
> >         regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210=
);
> > @@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct su=
n4i_i2s *i2s,
> >         case SND_SOC_DAIFMT_DSP_B:
> >         case SND_SOC_DAIFMT_LEFT_J:
> >         case SND_SOC_DAIFMT_RIGHT_J:
> > -               lrck_period =3D params_physical_width(params) * slots;
> > +               lrck_period =3D slot_width * slots;
> >                 break;
> >
> >         case SND_SOC_DAIFMT_I2S:
> > -               lrck_period =3D params_physical_width(params);
> > +               lrck_period =3D slot_width;
> >                 break;
> >
> >         default:
