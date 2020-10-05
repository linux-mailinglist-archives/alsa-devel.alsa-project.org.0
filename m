Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1038C2836B0
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 15:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C22AB178A;
	Mon,  5 Oct 2020 15:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C22AB178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601905049;
	bh=mwIul+N387ddU/yrT7q96UPJ/loWE3EK07ZuwkF7LX8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+6rzhkODN4ddA+PUXalahaLLVfhL05X7EqWvekw5r2UjPJd4TRnZWbrvR0t5Emny
	 dGtLSLbnb9nVVwjfOFhZMXaB6eSmJXZPuKjp3CWyjpfQGBrKh7uzUOr7LmVs1Q5iPJ
	 jqAh6Py9Ivz6z2vtxK9yYSFXq0BDh1DNQoeS+mOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF999F80260;
	Mon,  5 Oct 2020 15:35:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE9DDF8025A; Mon,  5 Oct 2020 15:35:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DAEBF800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 15:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DAEBF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DBJ43NN7"
Received: by mail-il1-x143.google.com with SMTP id o18so7811168ilg.0
 for <alsa-devel@alsa-project.org>; Mon, 05 Oct 2020 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+ScH7spBRgEvoHiLBoomy6Y6xgrMwXDw74+hbCCfUCk=;
 b=DBJ43NN77a5Y46IUwb3kq/Qp3uJWgIzuawxQtEG6nwGa7uq2aIQmR6UpW23L0ekyuY
 doSQHQs6lf/+dHuw6A1tHvwaH1Yu/l+DaeniZwh4whDk2jt0wVcfQv4Quck/AvsT9jU9
 9cJfb9X4vRG9HkoUww8dwwknFdjWFZVXsJvaqoX2htzh/0h1cqgLwk9hgO7ljHdFjJeI
 1tOzJdb9z5oWu0fljA1FGxOpa5+D8VW2wgweIiXnl1RpkaP8IrNu0+WBXX5I8Wd3BTYn
 calvO5Bko05dm4ayeF4UpEj/YODvSw2Qb2ny8X1U3DhMUcRILhMjNKQHNTAIIzW5aE53
 WSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+ScH7spBRgEvoHiLBoomy6Y6xgrMwXDw74+hbCCfUCk=;
 b=FeA0OLUILBz3fpotJVqx2UgLMKmyBUwjv+7JRUO5MLKtNWLuA1+dQEjDxfy5zfJDjt
 SDS7wHdrMMNska57cirpfp09LXjB+I2P5o0Bs6rdQwBGACtOYn8U8sp/HUU20pB2rEbn
 CB/hzFJeQQKIcbdX0wleEjhBQ675cRlBZYwc5bGqWuN61htMA3nW9XJ3eEa2pZ3/+sSP
 z/eesW1V1pc5UHo1AkeNkwMzQSu8CB+vuJf0QNDDQbOOMf4SKS9hQZYBlrMMfGqEfT0w
 CSjMG/yUjUwko/r1Kl6R6MZ9aZxUsDBq9bDfnIIe1U9dgK5EtKnaqAXTc/Bw3NI5eP7G
 4wwg==
X-Gm-Message-State: AOAM533vGmmd7PERJaFLIUSOx9W1s4pCvfl3rePKdphfqyk/Djn6tR+c
 lhTmm8S7ZrNA2fBzpNwXvQSDjqBB3PEAjPhS5AI=
X-Google-Smtp-Source: ABdhPJySP0U5feN77FoosI4tYSbueu7xIwjyAToSotvdCVmiSn/MELKnPNsUll1WeogQTnwwCceaixNNSKw34nbMnDw=
X-Received: by 2002:a92:b30c:: with SMTP id p12mr5278394ilh.35.1601904929683; 
 Mon, 05 Oct 2020 06:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201003141950.455829-1-peron.clem@gmail.com>
 <20201003141950.455829-4-peron.clem@gmail.com>
 <20201005121419.mum4g5utdesvyg7a@gilmour.lan>
In-Reply-To: <20201005121419.mum4g5utdesvyg7a@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 5 Oct 2020 15:35:18 +0200
Message-ID: <CAJiuCcds_H-M6Y9Cb8eMmTgpsaC_ZQee97u260WvDe23yBVc7A@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] ASoC: sun4i-i2s: Change get_sr() and get_wss()
 to be more explicit
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
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

Hi Maxime,

On Mon, 5 Oct 2020 at 14:14, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Sat, Oct 03, 2020 at 04:19:39PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > We are actually using a complex formula to just return a bunch of
> > simple values. Also this formula is wrong for sun4i when calling
> > get_wss() the function return 4 instead of 3.
> >
> > Replace this with a simpler switch case.
> >
> > Also drop the i2s params which is unused and return a simple int as
> > returning an error code could be out of range for an s8 and there is
> > no optim to return a s8 here.
> >
> > Fixes: 619c15f7fac9 ("ASoC: sun4i-i2s: Change SR and WSS computation")
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 69 +++++++++++++++++++++++--------------
> >  1 file changed, 44 insertions(+), 25 deletions(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index 1f577dbc20a6..8e497fb3de09 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -175,8 +175,8 @@ struct sun4i_i2s_quirks {
> >       unsigned int                    num_mclk_dividers;
> >
> >       unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
> > -     s8      (*get_sr)(const struct sun4i_i2s *, int);
> > -     s8      (*get_wss)(const struct sun4i_i2s *, int);
> > +     int     (*get_sr)(unsigned int width);
> > +     int     (*get_wss)(unsigned int width);
> >       int     (*set_chan_cfg)(const struct sun4i_i2s *i2s,
> >                               unsigned int channels,  unsigned int slot=
s,
> >                               unsigned int slot_width);
> > @@ -381,37 +381,56 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_=
dai *dai,
> >       return 0;
> >  }
> >
> > -static s8 sun4i_i2s_get_sr(const struct sun4i_i2s *i2s, int width)
> > +static int sun4i_i2s_get_sr(unsigned int width)
> >  {
> > -     if (width < 16 || width > 24)
> > -             return -EINVAL;
> > -
> > -     if (width % 4)
> > -             return -EINVAL;
> > +     switch (width) {
> > +     case 16:
> > +             return 0x0;
> > +     case 20:
> > +             return 0x1;
> > +     case 24:
> > +             return 0x2;
> > +     }
> >
> > -     return (width - 16) / 4;
> > +     return -EINVAL;
> >  }
> >
> > -static s8 sun4i_i2s_get_wss(const struct sun4i_i2s *i2s, int width)
> > +static int sun4i_i2s_get_wss(unsigned int width)
> >  {
> > -     if (width < 16 || width > 32)
> > -             return -EINVAL;
> > -
> > -     if (width % 4)
> > -             return -EINVAL;
> > +     switch (width) {
> > +     case 16:
> > +             return 0x0;
> > +     case 20:
> > +             return 0x1;
> > +     case 24:
> > +             return 0x2;
> > +     case 32:
> > +             return 0x3;
> > +     }
>
> Like I said in the previous version, I'm not really sure why we need to
> use the hexadecimal representation here?

I'm not sure if there is a convention when to use hexa or when not to use i=
t.

But these figures are taken from the User Manual where register
descriptions are written in Base 2 and default values are written in
Base 16.

It's easier to read them and check that the code follows the documentation,=
 no ?

Indeed with 2 bits this doesn't change anything.
Do you want me to change them in decimal ?

Clement

>
> Maxime
