Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 154811B0BB8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:58:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 929821690;
	Mon, 20 Apr 2020 14:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 929821690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587387504;
	bh=Zkk6496tave0L2PCGZ7kuY/Vpow0alO8OT8Urjo3GB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2exMWN9PYG27NX0pKVFa/KH2qRKAFCkPsvcqGfP9dMEZsIu2HJcoZg/dsnKmSfyO
	 xQ5r9geGYEFMFmCIBUg9bgKJZx9fLiloCbxN3wjRF1Afxu3qSrv4TpoI6oiGBY8Eoi
	 xB+uewKgy9kzq9z+azldQc5AJdtg7n3D3W2eNR1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13F9AF8025E;
	Mon, 20 Apr 2020 14:56:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC9E9F8023F; Mon, 20 Apr 2020 14:56:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6361DF8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6361DF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cJ4W1US+"
Received: by mail-io1-xd43.google.com with SMTP id i19so10754333ioh.12
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 05:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pcI0qWNc1N4Zlqa5f3AfBQvRhwW8Vt/U+TEuOLUSgd0=;
 b=cJ4W1US+K62mAFMlX3vEoTunFkNtMdkgjMA9cd/b+CXfHHy+KLOwqk2tlEbEwPbuRH
 xSXmkoHN++WSy+dCUUzGCY9SP3HjreMrDx4yidSHof12jzx8gg1S3xdgSKdfPYb+FdIV
 e58IZzVYnDquHfGCiK/uyNtevWXNWmZG79zBz7IhlF5/0YRxcwiucINo/h7GiOA+LjbD
 LngMieEa3T/tmA3/889Ic5nwImTg272p+BuXfPa7v3y+2FG5H44LloARO7mVe6vUzyGj
 kpzB3udH8cimAN/yo/GqL27F79VRBj98oNpDXitS54sCr29fXiiMvwx1b6a0S0Lq8rQz
 pH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pcI0qWNc1N4Zlqa5f3AfBQvRhwW8Vt/U+TEuOLUSgd0=;
 b=hmADbUybImwtxvnHhvRuuQLkJ8Qx8ZxFfXlQ9nbxAI8uJchleSgyXxqnCmvk+KA58b
 5J/sRqNjwKqWqczvwYp/XPrgzvWxr8WnWuRJvjjtbEmnIBmOYuvuo9mXDTy4F/0xCUJy
 z+y8AOGurHWk9xUhuwdliCyJc/1Eobdu+Q4Jk8rFrStQ0I80l7+992yBFt+w0EpkmCfc
 qEhAg8J9QqbDWwl+gZLxdDdsWkJQ/daV2CefhrMrIBShF5t02Oy00LUaq7E9ZCxwvV22
 9d3ihX5zZ7WsXNsnbqx2VzH5F+IBBq/7g0Rz3kYJZXRobNIFiegxqf+GzC11QSPm8WJt
 etVw==
X-Gm-Message-State: AGi0PuaAOR8JFVx3Kz2XE1NtVqrWtFT/tbvGntF0IalkXbrK8zGjqoOn
 enSqKXQ8UuJ+jOmKVedpKJ5WIXlZA7IXEcQkOAo=
X-Google-Smtp-Source: APiQypJ157MeGNo8bgnTMRGL69DR4CbiKXoMr5w1w97C8gzFpIW/y2Ja9T72EhZhF6SM+EgLpNS1I3CzKErckee77Lc=
X-Received: by 2002:a05:6602:2fcd:: with SMTP id
 v13mr15163961iow.124.1587387402154; 
 Mon, 20 Apr 2020 05:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200418224435.23672-1-peron.clem@gmail.com>
 <20200418224435.23672-5-peron.clem@gmail.com>
 <20200420124452.5vaoyw73n76jwmey@gilmour.lan>
In-Reply-To: <20200420124452.5vaoyw73n76jwmey@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 20 Apr 2020 14:56:31 +0200
Message-ID: <CAJiuCccAFk3X03OV2MhGuqY7YW0HtM_1gJO9cW0=6OoTkSB6gg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] ASoC: sun4i-i2s: Set sign extend sample
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
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

On Mon, 20 Apr 2020 at 14:44, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Sun, Apr 19, 2020 at 12:44:32AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > On the newer SoCs such as the H3 and A64 this is set by default
> > to transfer a 0 after each sample in each slot. However the A10
> > and A20 SoCs that this driver was developed on had a default
> > setting where it padded the audio gain with zeros.
> >
> > This isn't a problem whilst we have only support for 16bit audio
> > but with larger sample resolution rates in the pipeline then SEXT
> > bits should be cleared so that they also pad at the LSB. Without
> > this the audio gets distorted.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index a23c9f2a3f8c..618bbc5156f1 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -48,6 +48,9 @@
> >  #define SUN4I_I2S_FMT0_FMT_I2S                               (0 << 0)
> >
> >  #define SUN4I_I2S_FMT1_REG           0x08
> > +#define SUN4I_I2S_FMT1_REG_SEXT_MASK         BIT(8)
> > +#define SUN4I_I2S_FMT1_REG_SEXT(sext)                        ((sext) <=
< 8)
> > +
> >  #define SUN4I_I2S_FIFO_TX_REG                0x0c
> >  #define SUN4I_I2S_FIFO_RX_REG                0x10
> >
> > @@ -105,6 +108,9 @@
> >  #define SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED                (1 << 7)
> >  #define SUN8I_I2S_FMT0_BCLK_POLARITY_NORMAL          (0 << 7)
> >
> > +#define SUN8I_I2S_FMT1_REG_SEXT_MASK         GENMASK(5,4)
> > +#define SUN8I_I2S_FMT1_REG_SEXT(sext)                        ((sext) <=
< 4)
> > +
> >  #define SUN8I_I2S_INT_STA_REG                0x0c
> >  #define SUN8I_I2S_FIFO_TX_REG                0x20
> >
> > @@ -663,6 +669,12 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4=
i_i2s *i2s,
> >       }
> >       regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> >                          SUN4I_I2S_CTRL_MODE_MASK, val);
> > +
> > +     /* Set sign extension to pad out LSB with 0 */
> > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
> > +                        SUN4I_I2S_FMT1_REG_SEXT_MASK,
> > +                        SUN4I_I2S_FMT1_REG_SEXT(0));
> > +
> >       return 0;
> >  }
> >
> > @@ -765,6 +777,11 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4=
i_i2s *i2s,
> >                          SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_=
OUT,
> >                          val);
> >
> > +     /* Set sign extension to pad out LSB with 0 */
> > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
> > +                        SUN8I_I2S_FMT1_REG_SEXT_MASK,
> > +                        SUN8I_I2S_FMT1_REG_SEXT(0));
> > +
> >       return 0;
> >  }
> >
> > @@ -867,6 +884,11 @@ static int sun50i_i2s_set_soc_fmt(const struct sun=
4i_i2s *i2s,
> >                          SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_=
OUT,
> >                          val);
> >
> > +     /* Set sign extension to pad out LSB with 0 */
> > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
> > +                        SUN8I_I2S_FMT1_REG_SEXT_MASK,
> > +                        SUN8I_I2S_FMT1_REG_SEXT(0));
> > +
>
> If this is an issue only on the A10 / A20, why are you setting it up on t=
he
> other generations too?

To keep coherency between all set_soc_format(), and also avoid this
kind of issue for future generation.
As this doesn't cost much after all, and it avoid to rely on default,
but what do you think ?

Clement

>
> Maxime
