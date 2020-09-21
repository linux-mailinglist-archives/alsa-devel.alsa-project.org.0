Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 797342730C8
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 19:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0445816C7;
	Mon, 21 Sep 2020 19:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0445816C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600709076;
	bh=77OvGM1eal81l4KMJIq0HdduanhwDL1d5CvUQ25GxvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=glr4iNaSnByI5ox+Wc8uoozxESiPb0TNs1zhczGrD1x1dXC1OruP32mXqiya3NU18
	 TPWCkrEjLsq7Vx1QMC/+agPUzTth5xMK38V6fUUrzMy+xdENs/z8vxgDlY2lzqkTPV
	 905KKUP6QkMhcG5eTlDa/5rgBZ6ZNT1mgUydGtoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 105EFF80171;
	Mon, 21 Sep 2020 19:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A290F80162; Mon, 21 Sep 2020 19:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDD42F8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 19:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDD42F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Dez6+QkH"
Received: by mail-io1-xd44.google.com with SMTP id d190so16279318iof.3
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5eEdVeBjREunXQ/esIC8A/92F1rU6OvwLOe193k+NyY=;
 b=Dez6+QkHxZPpqfsN5aPsPbBdNSLRM/Ok6lm7nbUpv4YEnKEv9fx90K0qvKt1w/fiOz
 agseOobdbg5hYqnDq1dFb9je+XEtyecu8jTUo4zOQKBo7jjy13/BUglJocLEyGp9vHL5
 zZRN+oDAy14TmmzBlIRKeGu12JkIiVyrcK8S8ZdC7hw/IZSFMEY8BZVcSTpTs/Bcb85u
 3TX/DnysCV7hxm3xjoJSxUj6CP9G2QH74Y4xs5KuQE6cMdfK3aX12wX4nPWDt50P7sG2
 FRKgZ1KB5hHFqb0ZNSRTXQ3xnjFiuYKcrPxrMJT30ds1K2B/QscDS7MdOiu/v08FL99A
 Lopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5eEdVeBjREunXQ/esIC8A/92F1rU6OvwLOe193k+NyY=;
 b=Xz7UUcovEqSw2XtdZ+1GBvFTIPmpEyPrsvOuiLbChSTYB7ZvuN7h3C5jyLvu7aCxQo
 U+/kE8G7817OuFVRK2h8C11VX1X8Fews2pMaY9bNanzVFNpLOmZShS0cGjBBeYf9ej+S
 Zdz6iSYHRh8f4Rgik0FHbmz9DbIk44uW4Id6kiWM08BlREpungHvXCcsb2hGzB9nmIwG
 wAVEo/zed10A/rkfO66vR+omFZnkazqp6X+lQb45Clo6eY51w6VjWEzwDVR8AFu9L1e1
 fa7z1zaGp4AkCilThKuX2kmJnowB4JsvLEwdzCebWT87rjRmxAZJZIfmU8HTMszNuwJ1
 6ENg==
X-Gm-Message-State: AOAM533csO8pbFxk2gSczBTGhO5czOl8y01jd1lr36wuxL4dY6y/1aEM
 PHRiH9Acv5KWJ+Ej7a12jAPLHd08D2mP+p6US5u/6JZ15iohsA==
X-Google-Smtp-Source: ABdhPJyXwpi+qhgzEb2L7INB1xopRJEhE5l25ooD6gDDBzh9eq9jqQIZ31DSqfm4nvdMtzms0O7kB/zg1O4P/MgCG+U=
X-Received: by 2002:a5e:a613:: with SMTP id q19mr392021ioi.36.1600708958749;
 Mon, 21 Sep 2020 10:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921102731.747736-4-peron.clem@gmail.com>
 <20200921135530.q36i4l5m4p7u7zyy@gilmour.lan>
In-Reply-To: <20200921135530.q36i4l5m4p7u7zyy@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 21 Sep 2020 19:22:27 +0200
Message-ID: <CAJiuCcdV7aO79wrcbwjCNJ4uLL0knLFm4kYBvCErxQRnYALByg@mail.gmail.com>
Subject: Re: [PATCH v4 03/22] ASoC: sun4i-i2s: Change get_sr() and get_wss()
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

On Mon, 21 Sep 2020 at 15:55, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Sep 21, 2020 at 12:27:12PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > We are actually using a complex formula to just return a bunch of
> > simple values. Also this formula is wrong for sun4i.
>
> Just like the previous patch, this could use a bit more explanation,
> like why it's a good thing, or how it's wrong on sun4i

Okay I will comment a bit more.

>
> > Replace this with a simpler switch case.
> >
> > Also drop the i2s params not used.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 69 +++++++++++++++++++++++--------------
> >  1 file changed, 44 insertions(+), 25 deletions(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index 0633b9fba3d7..11bbcbe24d6b 100644
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
>
> Why do we need an hex number here?

This is a register value, so I thought it's usually written using
hexadecimal representation.

>
> Also, why is the return type change needed?

This function returns a ERROR defined in errno.h which actually could
be -133 but S8 only supports -128..127.

There is no real reason to have a S8 here and doesn't give any optimisation=
.

Clement

>
> Maxime
