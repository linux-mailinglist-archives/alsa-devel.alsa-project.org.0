Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD833FAEDC
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 00:15:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFEE416C6;
	Mon, 30 Aug 2021 00:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFEE416C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630275311;
	bh=aw1SvFqyWFMuJYWbD3SZOO+rClzP6Lw/Acya+RIY0Z4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+fMwrujpLpOmf1CQG7ktKr+TSywbLIwxRsvzQsRETNdS1uin7p3W4HPW2s7OB0ks
	 f1JEi6TsFk4/jHDuXdR0pNkJiLwpd8TT1n+uI2iC+cU3pk2flONtkT573OLkcxGTno
	 1IBX548tK0IJCbxLC5GlvCVf1DjwzfRaPG4zHtIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44B5CF80246;
	Mon, 30 Aug 2021 00:13:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDD9EF8025B; Mon, 30 Aug 2021 00:13:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EC17F80246
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 00:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC17F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="0Rm6SJJk"
Received: from dnyon.com (45.74.222.87.dynamic.jazztel.es [87.222.74.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id B9FFC40442;
 Sun, 29 Aug 2021 22:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630275223; bh=aw1SvFqyWFMuJYWbD3SZOO+rClzP6Lw/Acya+RIY0Z4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0Rm6SJJkrMKPuF+qpFkge2kUEP2OnceG6Oj82j5mVk5rpJ5ifwekPM3xIcBdpVKax
 guOds/fzBIIN3+sEkB4s1Fp9HtUlr1/h4Uv08V2rinlaUaTJc8lL29/5Ha4F+dYDgx
 B4E7w15wun17uk/RXfxooBui4QdPCc60SOfzBdHIo1KCXqPLLFMbpQ+2y7hAMTWFLB
 iOTzEORaqZO9+ueEg+7vyGzdApzmR6Bk6ybW2A3J1ZTkk3eGxfslMVDbb0kY3y4g9w
 yOlJCrN23bjtoj0b8zE40rkjOmMtmAq5HPN7d7TbuLOyS3D+aQvDURkklfNeMu5IZu
 +xhjR9EBwcRbA==
Date: Mon, 30 Aug 2021 00:13:41 +0200
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH RESEND 1/2] ASoC: max98927: Handle reset gpio when
 probing i2c
Message-ID: <YSwGlXEFRuUvNGZ7@dnyon.com>
References: <20210829170019.384632-1-atafalla@dnyon.com>
 <20210829170019.384632-2-atafalla@dnyon.com>
 <CAHp75VdY9uoTWeJEroi3iChnToUSxe+Henmg7Yux+UWkK59jQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=mensaje
In-Reply-To: <CAHp75VdY9uoTWeJEroi3iChnToUSxe+Henmg7Yux+UWkK59jQg@mail.gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

Hello Andy,

On Sun, Aug 29, 2021 at 11:22:35PM +0300, Andy Shevchenko wrote:
> > +       max98927->reset_gpio
> > +               = devm_gpiod_get_optional(&i2c->dev, "reset",
> > GPIOD_OUT_HIGH);
> > +       if (IS_ERR(max98927->reset_gpio)) {
> > +               ret = PTR_ERR(max98927->reset_gpio);
> > +               dev_err(&i2c->dev,
> > +                       "Failed to request GPIO reset pin, error %d\n",
> > ret);
> > +               return ret;
> 
> 
> 
> Spamming logs is not good. Use
> 
> return dev_err_probe(...);
Okay.
 
> > +       }
> > +
> > +       if (max98927->reset_gpio) {
> > +               gpiod_set_value_cansleep(max98927->reset_gpio, 0);
> 
> 
> 
> You may request the pin in a proper state, also with current code you seems
> mishandle the conception of the logical pin level vs. physical one.
Right, i made the mistake of basing off an old driver that use legacy
functions.
 
> > diff --git a/sound/soc/codecs/max98927.h b/sound/soc/codecs/max98927.h
> > index 05f495db914d..5c04bf38e24a 100644
> > --- a/sound/soc/codecs/max98927.h
> > +++ b/sound/soc/codecs/max98927.h
> > @@ -255,6 +255,7 @@ struct max98927_priv {
> >         struct regmap *regmap;
> >         struct snd_soc_component *component;
> >         struct max98927_pdata *pdata;
> 
> 
> 
> > +       struct gpio_desc *reset_gpio;
> 
> 
> Why? Are you using it outside of ->probe()?
No, I'll delete it and use a local variable.

> With Best Regards,
> Andy Shevchenko
Thank you for the feedback, I'll address all the issues in a V2.

Alejandro Tafalla
