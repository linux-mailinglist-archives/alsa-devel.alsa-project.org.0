Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AB127B022
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 16:39:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA7E18D3;
	Mon, 28 Sep 2020 16:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA7E18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601303974;
	bh=BDqRFb92aQqGntEIT70fEwhgguoehyUgmkElleLlB7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZbWSG19vfeWBo9PNO+Fu5GCDaB66+l1vmWRKAKdI+LroGjCQQ/iK+MFOWSJEMGwT9
	 5rfVqSQIA/wN4U5CiD0UyB6+H8ZAvCj0Dr/RGQtjFVc5vRzWrFJwM3qI1by7iQFSOO
	 9IhKWnmcdVvlAhTayu6KZZA17wY6O+UpXQ4OGLX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A303BF80115;
	Mon, 28 Sep 2020 16:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E933BF801ED; Mon, 28 Sep 2020 16:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 276B7F800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 16:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 276B7F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RKnX7n81"
Received: by mail-io1-xd41.google.com with SMTP id u6so1332104iow.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t4AbdMx+cx7XDkAMRw5fwKPY3/PE3Njw9O2Txe+X7KQ=;
 b=RKnX7n81fRNP7SzOx3e5G8EXU7UK8R6fQQS/GeZPWcPNO0fHznMAlSHnQkm9nvnLrl
 ksK9e3gFSf/5HE6q+1+k4xGuglAUG8x97sx3OWUWZKZkB0+8VC3y+pz8aziKAxRYj0p2
 DX3eEtEQPINky7M7wVu08YpNr86aBIJoIw8Qbdg5q6UCveVdStTyLkrqhJb3ZSgzz6Bw
 mkn7/xxOKikbGxwvlcP82/Eelx8GDoo1TZ+QrTHCpejFZtbB1SX+GfKVDGW3T/i4LHGm
 3jnwLLdiq78cQmGX4gRiJlxjxXVB9GdoOocjRhBSbK4ZzkMrkOdicqNLaXfmwjr1oKI3
 FwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t4AbdMx+cx7XDkAMRw5fwKPY3/PE3Njw9O2Txe+X7KQ=;
 b=S1Tw61jD6JF75tmUfq44yN5qqGbQjP8f1n9KGLLDt2W1AcgWGZnn3oFoGr9xAXUcDw
 zPd/36PTk0W1bW9pOOOWVqR4tQKSjhiObO/FyIKBurJUw3YObSfW1hKau9ue9hKLT3EW
 MxRJkW6ANvKk5sBmmP9FBKC4k0sN1UDJA073rRHzW2wNX31KnOrBKgEqNtdS1Ip2+yhT
 CBBCND9vQEsCn3vEOsFubBtm2UT9/9Lo2j0iwhEUboTawJ/6ShotT79msUyVEjtG6J18
 OBmgHbgsq/Z+aJI3MynamgN7CbtmPNJLnsH7AsOL7SBKRMdsLWtu+lt+NgRMfHNofKsp
 aGVQ==
X-Gm-Message-State: AOAM532rVKIoOaSMHVA8gZvN3tEVBsrkxC7g2Gi2Q/XxjQYcFqhkdYjP
 /G/DihKsinJF89hALrTU03AO9WA6Oleb64ZRZ3Q=
X-Google-Smtp-Source: ABdhPJxOHv47DZJ/ZpY0xtNS8oWIQF4j+pHf/JhqayP0YQAVGa58IT3sFvvEifb5VWXPoiyhxnoRD09w6fFBNOXifxA=
X-Received: by 2002:a6b:908:: with SMTP id t8mr7098983ioi.124.1601303857337;
 Mon, 28 Sep 2020 07:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-2-peron.clem@gmail.com>
 <CAGb2v65AhnqD6ec20h9vtd2GjqVsf_yz5+7VSa8giJuFJnd5ag@mail.gmail.com>
In-Reply-To: <CAGb2v65AhnqD6ec20h9vtd2GjqVsf_yz5+7VSa8giJuFJnd5ag@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 28 Sep 2020 16:37:26 +0200
Message-ID: <CAJiuCcevtzX_+02r54q6tH0+bOF=BM=knnaxN+G3QW035F8gZQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 01/20] ASoC: sun4i-i2s: Add support for
 H6 I2S
To: Chen-Yu Tsai <wens@csie.org>
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

Hi Chen-Yu,

On Mon, 28 Sep 2020 at 06:40, Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > H6 I2S is very similar to that in H3, except it supports up to 16
> > channels.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 224 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 224 insertions(+)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index f23ff29e7c1d..2baf6c276280 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -124,6 +124,21 @@
> >  #define SUN8I_I2S_RX_CHAN_SEL_REG      0x54
> >  #define SUN8I_I2S_RX_CHAN_MAP_REG      0x58
> >
> > +/* Defines required for sun50i-h6 support */
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK  GENMASK(21, 20)
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset)       ((offset) << 20=
)
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL_MASK         GENMASK(19, 16)
> > +#define SUN50I_H6_I2S_TX_CHAN_SEL(chan)                ((chan - 1) << =
16)
> > +#define SUN50I_H6_I2S_TX_CHAN_EN_MASK          GENMASK(15, 0)
> > +#define SUN50I_H6_I2S_TX_CHAN_EN(num_chan)     (((1 << num_chan) - 1))
> > +
> > +#define SUN50I_H6_I2S_TX_CHAN_MAP0_REG 0x44
> > +#define SUN50I_H6_I2S_TX_CHAN_MAP1_REG 0x48
> > +
> > +#define SUN50I_H6_I2S_RX_CHAN_SEL_REG  0x64
> > +#define SUN50I_H6_I2S_RX_CHAN_MAP0_REG 0x68
> > +#define SUN50I_H6_I2S_RX_CHAN_MAP1_REG 0x6C
> > +
> >  struct sun4i_i2s;
> >
> >  /**
> > @@ -474,6 +489,62 @@ static int sun8i_i2s_set_chan_cfg(const struct sun=
4i_i2s *i2s,
> >         return 0;
> >  }
> >
> > +static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > +                                     const struct snd_pcm_hw_params *p=
arams)
> > +{
> > +       unsigned int channels =3D params_channels(params);
> > +       unsigned int slots =3D channels;
> > +       unsigned int lrck_period;
> > +
> > +       if (i2s->slots)
> > +               slots =3D i2s->slots;
> > +
> > +       /* Map the channels for playback and capture */
> > +       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x765=
43210);
> > +       regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x765=
43210);
>
> Nit, since it supports up to 16 channels, you might want to map all 16 of=
 them
> now, instead of having to come back and fix it later.

Thanks for the review. Do you mean there is missing MAP0 for RX/TX ?

+ regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFEDCBA98);
  regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210);
+ regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP0_REG, 0xFEDCBA98);
  regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);

Regards,
Clement

>
> Code wise, this patch is
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>
> I don't have a scope nor logic analyzer, so I wasn't able to participate =
in the
> LRCK discussion.
