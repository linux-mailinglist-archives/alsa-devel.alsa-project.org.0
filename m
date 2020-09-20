Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F47A2717A2
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 21:40:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77B501680;
	Sun, 20 Sep 2020 21:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77B501680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600630822;
	bh=vkSO2yAokGc8Uf9gx4+QxKDUZLiBWWMI5U3LZaoRN6o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n9Sr4tjlMZqHHzlfORNA9sudTeH0i37X+23czSaAvzO6nCJyPofaz2qWP+llzKnHD
	 YvsaYjOkqReNEEZqUjT+d/4vzsJspLJR+bQRIj46wGnQkYpXu5zfw7uSBSxUuND7+U
	 FyiBfDzS/E7tvRfrBRMsrPaQDhxclMTeV6bMP/ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E722F80234;
	Sun, 20 Sep 2020 21:38:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64CD8F80232; Sun, 20 Sep 2020 21:38:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC479F8010F
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 21:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC479F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lVFox2j6"
Received: by mail-il1-x141.google.com with SMTP id q4so11677383ils.4
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7dHmlm15L5muln7P5gMny8ZyKU2l3Q2uBGbFxPZzDB4=;
 b=lVFox2j6QnZDD7C2ONG3APLQz8HzTN8Hms0gWrPbxfh9V8jGk+2KfupLvFzMkmLgww
 5pNoYdtWj4b9mGW4CqbJ1AM4DLYW7tZq3uQC4UNkjlkkKQcyyxkKF2c+Fi7iiibmGA5B
 ZjW5oAmZAETlVmVsVFZD0dhxwayVpqI6+ut8Tt8QgVVU8emPjhznNwJ8r3lAcZaDyD0v
 lSPr/01CzAVuZUuoURjsqerBb47YOZ1n3Eup2RZfgvkRf9JJ0C7yucug2VYBaQjUTASX
 2pyUNxI8MJu33r5Bdd8JMlvgzIq7S0j7voIYWOftqXT6ztwTLaK+u6iJrwzBlvZ9pj8G
 pW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7dHmlm15L5muln7P5gMny8ZyKU2l3Q2uBGbFxPZzDB4=;
 b=SLTW0TBSsZYW8bSBWMN08pK7UFjYXDgQw4hCjk4gY01lweuHvijrSfQpNZ4tD7XTmZ
 MVIL27EwAY3UkFOVgPmxTAd7ai28Aih7jXaRmmlpBoSviGLh8ezwh/7CaqXnTG32C9hR
 pxYXuuntRWVPoQDaQ0PgiiLK9fpvRDM0LfXOrMRXghreab0TC0kCoOQkLat6AycX0ZpD
 cj2716YO+D9QvAsp4ijgJ2MNOEOb2OgPPqWyXTaSGbP3bRTIyoLWSwMMm4FPIGhZ1/t2
 WnhLVdnSzsErR51fb0B7EXUEQ0aST3XFEGmDLvZ38r8EOgCX0BVqimsPFLVGEKVULuKr
 4CQg==
X-Gm-Message-State: AOAM532N4/VALSISCaAZ5rQx3OsdbhOZeY2RtJligCUeG1CgukE/WEWH
 lLzX71ka9/ZzZuZkE8STwcw+bElHuD+cUGC+qbs=
X-Google-Smtp-Source: ABdhPJxqQ4WQOR6w77n6t0YKh1ksHhXAMWdDCFuTkiQ8DZOfS9rz6gqURn759P7yp/tqGDFGiQjAeZg4Tk80F04zEbI=
X-Received: by 2002:a92:a1c8:: with SMTP id b69mr19779859ill.293.1600630708670; 
 Sun, 20 Sep 2020 12:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200920180758.592217-1-peron.clem@gmail.com>
 <20200920180758.592217-2-peron.clem@gmail.com>
 <e0eb7e94-e736-4ec0-b838-884a4857bb97@sholland.org>
In-Reply-To: <e0eb7e94-e736-4ec0-b838-884a4857bb97@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 20 Sep 2020 21:38:17 +0200
Message-ID: <CAJiuCcenXE_BZpk7smwaddsgqwq7LmhCQuH9T1pG2twM4Uu+mA@mail.gmail.com>
Subject: Re: [PATCH v3 01/19] ASoC: sun4i-i2s: Add support for H6 I2S
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

On Sun, 20 Sep 2020 at 20:39, Samuel Holland <samuel@sholland.org> wrote:
>
> On 9/20/20 1:07 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > H6 I2S is very similar to that in H3, except it supports up to 16
> > channels.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 218 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 218 insertions(+)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index f23ff29e7c1d..348057464bed 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> ...
> > @@ -699,6 +770,102 @@ static int sun8i_i2s_set_soc_fmt(const struct sun=
4i_i2s *i2s,
> >       return 0;
> >  }
> >
> > +static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> > +                                  unsigned int fmt)
> > +{
> > +     u32 mode, val;
> > +     u8 offset;
> > +
> > +     /* DAI clock polarity */
> > +     switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> > +     case SND_SOC_DAIFMT_IB_IF:
> > +             /* Invert both clocks */
> > +             val =3D SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED |
> > +                   SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
> > +             break;
> > +     case SND_SOC_DAIFMT_IB_NF:
> > +             /* Invert bit clock */
> > +             val =3D SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
> > +             break;
> > +     case SND_SOC_DAIFMT_NB_IF:
> > +             /* Invert frame clock */
> > +             val =3D SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
> > +             break;
> > +     case SND_SOC_DAIFMT_NB_NF:
> > +             val =3D 0;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
>
> Maxime's testing that showed LRCK inversion was necessary was done on the=
 H6. So
> in addition to dropping the patch that removed the LRCK inversion for oth=
er
> sun8i variants, you need to re-add it to this patch for the H6 variant.

Thanks, you're right!
Clement

>
> Cheers,
> Samuel
>
> > +
> > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
> > +                        SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK |
> > +                        SUN8I_I2S_FMT0_BCLK_POLARITY_MASK,
> > +                        val);
> > +
> > +     /* DAI Mode */
> > +     switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> > +     case SND_SOC_DAIFMT_DSP_A:
> > +             mode =3D SUN8I_I2S_CTRL_MODE_PCM;
> > +             offset =3D 1;
> > +             break;
> > +
> > +     case SND_SOC_DAIFMT_DSP_B:
> > +             mode =3D SUN8I_I2S_CTRL_MODE_PCM;
> > +             offset =3D 0;
> > +             break;
> > +
> > +     case SND_SOC_DAIFMT_I2S:
> > +             mode =3D SUN8I_I2S_CTRL_MODE_LEFT;
> > +             offset =3D 1;
> > +             break;
> > +
> > +     case SND_SOC_DAIFMT_LEFT_J:
> > +             mode =3D SUN8I_I2S_CTRL_MODE_LEFT;
> > +             offset =3D 0;
> > +             break;
> > +
> > +     case SND_SOC_DAIFMT_RIGHT_J:
> > +             mode =3D SUN8I_I2S_CTRL_MODE_RIGHT;
> > +             offset =3D 0;
> > +             break;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> > +                        SUN8I_I2S_CTRL_MODE_MASK, mode);
> > +     regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> > +                        SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
> > +                        SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset));
> > +     regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_SEL_REG,
> > +                        SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
> > +                        SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset));
> > +
> > +     /* DAI clock master masks */
> > +     switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > +     case SND_SOC_DAIFMT_CBS_CFS:
> > +             /* BCLK and LRCLK master */
> > +             val =3D SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT=
;
> > +             break;
> > +
> > +     case SND_SOC_DAIFMT_CBM_CFM:
> > +             /* BCLK and LRCLK slave */
> > +             val =3D 0;
> > +             break;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> > +                        SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_=
OUT,
> > +                        val);
> > +
> > +     return 0;
> > +}
> > +
> >  static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt=
)
> >  {
> >       struct sun4i_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> ...
