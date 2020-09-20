Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73F2717C7
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 22:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8B94167F;
	Sun, 20 Sep 2020 22:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8B94167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600632472;
	bh=hCwVHbukvDaf8SGiVbk6ZXPv0A/iqqQHVOAJ7mjOuHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFPNmB2BGkTBs2j2ymGp+WLY2jjLxB/yd3RUcXnC2bLLc4BqX7jU70WjcEcvqE9KJ
	 zv2QYvvtr8pmXqbFXHI67W2CF3cQs7cZzBNzFk6G1e3/B+dgIHVK9+fwb6i+cema+K
	 iP4oswiZNYFpGErN2jPjxABjFy8Mcr87bco/GpYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5CE9F801EC;
	Sun, 20 Sep 2020 22:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8C8BF80232; Sun, 20 Sep 2020 22:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3191EF801EC
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 22:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3191EF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Bd8j3+i2"
Received: by mail-il1-x143.google.com with SMTP id t13so11699416ile.9
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 13:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wP4gZRkOAWgiW0xnyA5/8lMVxtrC05P+MT5wMJXn4Ks=;
 b=Bd8j3+i27Pi1JS6swpqa39XxIyg0FnZZehxsQB73iY8qx/SIdpXwyAUGFpNpx96Gso
 dd9ZVKY8Nme0wkY9hzNyw5MO8P5F6knorU7JkKKpSE/Vx8N/CRiRqsO0YRP535/8UJet
 SFJfTzgprcgbI/OODHFMJYR7yJ5gx04jPohWq9haKdZA6VrpVQz6z4/N4RSVroJoYv0X
 z+HkA+WgVdpDWBusI2arko6gwI9AVmhiuRToSvB8KMCWFxpHXbcbpzvWJI0YYCJuX9bJ
 4MkTJZJdirUOJbP71WkN0dIY0xNzvXwdDmXtw7l4ssBeVBNFy9VRD2vioJj25AFeT6Oh
 P9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wP4gZRkOAWgiW0xnyA5/8lMVxtrC05P+MT5wMJXn4Ks=;
 b=pKLqmyADFzyxqTtDSWkzseIn4Mm5ICfDCnG33drT0mjOm1mVAQTRuBY4RkaUQw/nLc
 OMLPfOncCyuZmVmJeOlnrAzsSr8mXoCnxSEQWTwbxShYRkwzCz5VcwxMQfhG9hnNv/zy
 FlUKuA240yizFJ49f8bSBxCB5qhQKw8y4e0zT1DZ6JTU8VTxlJMDX7qYJtfIIeyG9o1s
 VrnoR6ju5q6ADbssUfIP/PA775bSpIb/aExKcnrHHsiGuHf2rbLLjeUcpp38LcKHSyE6
 tOvDWHZMCsFYDy7Ylko+0G6JXb9r6PRKZmXczTiVc5ZWHI4Y27TErCMvl6UuS0JPovKv
 Epkw==
X-Gm-Message-State: AOAM531PDIiqDXldh1GFatAfzTxkMfTAacC6DGnQq1rGArStYSTxll3o
 u1sFNSH5paSODdfyiKtPb+UTz11AGm6i1ineBrE=
X-Google-Smtp-Source: ABdhPJxuV8GsyADygtnzpUmWSuBmmFfyYdRFN3/asdGXDpCMeaS/zYguGIj04QJ5JTCpS6h53VBfbQWyhYeFuOPh728=
X-Received: by 2002:a92:217:: with SMTP id 23mr38815570ilc.118.1600632359330; 
 Sun, 20 Sep 2020 13:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200920180758.592217-1-peron.clem@gmail.com>
 <20200920180758.592217-7-peron.clem@gmail.com>
 <497a7062-4acf-d928-c2ee-ec595ed6799b@sholland.org>
In-Reply-To: <497a7062-4acf-d928-c2ee-ec595ed6799b@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 20 Sep 2020 22:05:48 +0200
Message-ID: <CAJiuCccEVOcD38DZLru2PirGhRBaeJqFAug_aZjW+QY0xHTb1g@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] ASoC: sun4i-i2s: Fix sun8i volatile regs
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

On Sun, 20 Sep 2020 at 20:52, Samuel Holland <samuel@sholland.org> wrote:
>
> On 9/20/20 1:07 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > The FIFO TX reg is volatile and sun8i i2s register
> > mapping is different from sun4i.
> >
> > Even if in this case it's doesn't create an issue,
> > Avoid setting some regs that are undefined in sun8i.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index ce4913f0ffe4..a35be0e2baf5 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -1126,12 +1126,19 @@ static bool sun8i_i2s_rd_reg(struct device *dev=
, unsigned int reg)
> >
> >  static bool sun8i_i2s_volatile_reg(struct device *dev, unsigned int re=
g)
> >  {
> > -     if (reg =3D=3D SUN8I_I2S_INT_STA_REG)
> > +     switch (reg) {
> > +     case SUN4I_I2S_FIFO_CTRL_REG:
>
> Please check if this breaks audio recording with runtime PM enabled. I no=
ticed
> this with an older revision of the series that also changed
> sun4i_i2s_volatile_reg. Marking SUN4I_I2S_FIFO_CTRL_REG as volatile broke
> setting of SUN4I_I2S_FIFO_CTRL_TX_MODE/RX_MODE, because the set_fmt() cal=
lback
> is not run with a runtime PM reference held, and volatile registers are n=
ot
> written by regcache_sync() during sun4i_i2s_runtime_resume().
>
> As a workaround, I moved the TX_MODE/RX_MODE initialization to hw_params(=
), but
> I am not sure it is the right thing to do:

Thanks for the catch,
I never tried to suspend/resume my board actually.
But your explanation and the fix seems legit to me.

I don't think it's a workaround as settings the fifo size is not
related to set_fmt and could also be set in hw_params.

I will add your fix in the next version.

Regards,
Clement

>
> https://github.com/smaeul/linux/commit/5e40ac610986.patch
>
> Cheers,
> Samuel
>
> > +     case SUN4I_I2S_FIFO_RX_REG:
> > +     case SUN4I_I2S_FIFO_STA_REG:
> > +     case SUN4I_I2S_RX_CNT_REG:
> > +     case SUN4I_I2S_TX_CNT_REG:
> > +     case SUN8I_I2S_FIFO_TX_REG:
> > +     case SUN8I_I2S_INT_STA_REG:
> >               return true;
> > -     if (reg =3D=3D SUN8I_I2S_FIFO_TX_REG)
> > -             return false;
> >
> > -     return sun4i_i2s_volatile_reg(dev, reg);
> > +     default:
> > +             return false;
> > +     }
> >  }
> >
> >  static const struct reg_default sun4i_i2s_reg_defaults[] =3D {
> >
>
