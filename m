Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EB62294A3
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 11:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF44A1615;
	Wed, 22 Jul 2020 11:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF44A1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595409299;
	bh=H1biJkEeafN48aK/COwqrG4KWLMF6mKGujYyhiV6qwA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=koXPO91OdU5zLcRnSBvYZVluw3tCir29ptec/C25O2A1/ejSx6RMoUeuEoFahHTrO
	 2secYHNy99YE9FJQv89KCSRQ894PpiL9k4501aorAm8R+5voIAsM8/dhF5ug0ZU7qm
	 LLS8CVHf14Jy/0yufiVYRFEyJBQv15qdOd0YqBsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F9FF80139;
	Wed, 22 Jul 2020 11:13:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 674E0F8014C; Wed, 22 Jul 2020 11:13:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0536F80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 11:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0536F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mx2/1kIG"
Received: by mail-io1-xd43.google.com with SMTP id a12so1757541ion.13
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GyRxF7Nof4yvmm5C8pDQESbIZ2Mb/0gJOYuusdB+OgQ=;
 b=Mx2/1kIGiCwUiHFEbOMhkQg4CliDGUiVAllGZzv0Oif92RcttjgR05avimrQxoXIJ0
 0gaCFik8zJerDazAUHv0vUUQqxKWXGMwe/Otbmurne5Nm7ruHSAApJOKV+r0hjwE7TLz
 VOv+yRs4EekMAs7UGvNpLANa/y1UAMIYnPTETwJ278KxbwK0fqFrDDcUYk1xj3Datxc7
 vF7GeckAAERSiGBaY2iCdJeeneAw8jJ3IWxS8+Hep2ZZ++ybL7iugEP9AW/rlQUJh8Eu
 YcwM6XOyQMSMfZ3WZ0LvYR01xa57ntIqnqwGYq2JxI3K53IrYBMoY4ZpkOMbrEyCp19Y
 vKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GyRxF7Nof4yvmm5C8pDQESbIZ2Mb/0gJOYuusdB+OgQ=;
 b=Piu04pqRvjH8e1Cq95CPvhthGrabg85DXF9mqn3QgWNmWLA4Ev3OnZXpYH+emxxJo7
 p/zyd+ufjUqpqkZK+VJjxDab2ePPGCRcwD8NRpyvWO4cwYv1Kbu/s5CO2O9TiWfirJv7
 rivmsJoWM+dHVmkZfNWIjC0EdA5MasAmTCQbdSqF3ewvwiGo9kD6nNb2UCW3+2aqfJGL
 FnlIalDmAFwbTQb/QAXGV+xcEqQVUCRgEzSwT+VwjtEuHucIGFZhgVaAxFatbAzzpEG8
 Cm3mTiMTTfAUjCSzoTXBMS/eSgu90w1M0M8X5G9StvE1zHVuinLOyDGWKF7/+44dO13W
 SDFA==
X-Gm-Message-State: AOAM530z53hWI3M0BaoWhWpHIuz/hOfyMd7Tg6u6jNHI+fvm4VUYSwBb
 q0iuDEoPT2dKc7nceVrpoNKVy0iqVHHOwHjtuf8=
X-Google-Smtp-Source: ABdhPJyTId2XFONSYkCoGNyYVU88WuRW4ffDfWIXU00zBnQi1qoRUepZig8tIhJdxOfDJmY9ul/cc5Jc+caVjBW78XQ=
X-Received: by 2002:a6b:ba06:: with SMTP id k6mr3766124iof.101.1595409183349; 
 Wed, 22 Jul 2020 02:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-5-peron.clem@gmail.com>
 <2910ec3c-25f1-d617-54a8-db6d21acb742@sholland.org>
In-Reply-To: <2910ec3c-25f1-d617-54a8-db6d21acb742@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 22 Jul 2020 11:12:51 +0200
Message-ID: <CAJiuCccO1cj0_tT=Swad8+cv4Pi_Daq=__3YU+NLeU1Kc-rNNQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 04/16] ASoC: sun4i-i2s: Set sign extend
 sample
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
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > On the newer SoCs such as the H3 and A64 this is set by default
> > to transfer a 0 after each sample in each slot. However the A10
> > and A20 SoCs that this driver was developed on had a default
> > setting where it padded the audio gain with zeros.
> >
> > This isn't a problem while we have only support for 16bit audio
> > but with larger sample resolution rates in the pipeline then SEXT
> > bits should be cleared so that they also pad at the LSB. Without
> > this the audio gets distorted.
> >
> > Set sign extend sample for all the sunxi generations even if they
> > are not affected. This will keep coherency and avoid relying on
> > default.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index 8bae97efea30..f78167e152ce 100644
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
> > +#define SUN8I_I2S_FMT1_REG_SEXT_MASK         GENMASK(5, 4)
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
>
> This is just a note; I'm not suggesting a change here:
>
> This does nothing, because SUN4I_I2S_FMT1_REG only affects PCM mode, whic=
h is
> not implemented in the driver for the sun4i generation of hardware. PCM m=
ode
> requires setting bit 4 of SUN4I_I2S_CTRL_REG, and then configuring
> SUN4I_I2S_FMT1_REG instead of SUN4I_I2S_FMT0_REG.

Thanks for the catch,
So i will drop it for sun4i.

Regards,
Clement

>
> Regards,
> Samuel
