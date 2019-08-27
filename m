Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C15B09E04B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 10:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5794B1672;
	Tue, 27 Aug 2019 10:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5794B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566892987;
	bh=u517eakS7jQEFUMD8yjSWiyIYE6pzOWC2F4ALnST0po=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F2rBrltQ1h3b6eJOm66ectEhHIzbf3gcE/kMXzoC5RzeGAEuXZS7AhhOor890dT/B
	 jfMExgxWTL6wWfbwZ8XgYKRqoECYRJYiZqYHdvSPuD3S8TMcYUH0NuOxKFXbq+B7dA
	 iTFOHYIzEuMvQ0KNwtP4+b9E/d7u7mt22VXeE0/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C951FF80274;
	Tue, 27 Aug 2019 10:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A31FCF800E7; Tue, 27 Aug 2019 10:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC155F800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 10:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC155F800E7
Received: by mail-ed1-f66.google.com with SMTP id s49so30181846edb.1
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 01:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aj/M9A/pRvOgZCbXpj3T4Q2/WP9XPh0HT/hjIq8gM3E=;
 b=SrBidf0VsN3stQBhbHaLyFJy17yi3h17wHuhrN46E78ssXmtIMYqTYBApsciry8NFb
 DfgQoPpWYqB7L8jRU1bjqo9dXRV0a5qOx85EcfoWDytQnVFRnWQh7tBGSToPCozBFADS
 FhFSdtpbNgf8QLeZLLGEFAG/1bevRGEzCxFU6TaOqrZeHora4CEFYz0lCOWQWZtSm1E8
 tbCwXlHOchPZMZ/97ciVe00EGtJ/VTt9XfA0o7xZYD2oO5PS4IK44ZWm/H7KA1oU/qce
 ERcgKDiJiZQw4KgRRoNQYkCwD9nHkbQpu3n5zBGGSQXaBl0AJ6UwhajT99OMHF7vILCF
 ErdQ==
X-Gm-Message-State: APjAAAU0wVr0Op2+7qmwY+2SA+Gr22d/iS9aoGCymiLk6gRQBvwHKPOF
 yZPG0E9JGzKVmlKAx6oLZ8EqSDZD2NE=
X-Google-Smtp-Source: APXvYqy3QahPDjZGhK3lN2SWUFNWW4Nkr+/8U/qPStoGzrQXV6pGsByMvU7PsaJffuVNXzEof2egAQ==
X-Received: by 2002:a50:f19a:: with SMTP id x26mr22434614edl.144.1566892884581; 
 Tue, 27 Aug 2019 01:01:24 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id w10sm3369540ejv.88.2019.08.27.01.01.23
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2019 01:01:24 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id q12so17737107wrj.12
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 01:01:23 -0700 (PDT)
X-Received: by 2002:adf:e941:: with SMTP id m1mr2132834wrn.279.1566892883607; 
 Tue, 27 Aug 2019 01:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190826180734.15801-1-codekipper@gmail.com>
 <20190826180734.15801-2-codekipper@gmail.com>
 <CAGb2v651jVp+J2eyWh7vw-yHmFTVy4eaMjHV0FvOF17C5_Hswg@mail.gmail.com>
 <CAEKpxBmCg4AkqKM-O3C76gto+mPWyEdDbviAmRJ8PxLOOMTJ7w@mail.gmail.com>
In-Reply-To: <CAEKpxBmCg4AkqKM-O3C76gto+mPWyEdDbviAmRJ8PxLOOMTJ7w@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 27 Aug 2019 16:01:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v64VNZ0oyD_760uNccwJb7MKngSooWB72M+d1DfT4-djog@mail.gmail.com>
Message-ID: <CAGb2v64VNZ0oyD_760uNccwJb7MKngSooWB72M+d1DfT4-djog@mail.gmail.com>
To: Code Kipper <codekipper@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v6 1/3] ASoC: sun4i-i2s:
 incorrect regmap for A83T
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Aug 27, 2019 at 1:55 PM Code Kipper <codekipper@gmail.com> wrote:
>
> On Tue, 27 Aug 2019 at 06:13, Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Tue, Aug 27, 2019 at 2:07 AM <codekipper@gmail.com> wrote:
> > >
> > > From: Marcus Cooper <codekipper@gmail.com>
> > >
> > > The regmap configuration is set up for the legacy block on the
> > > A83T whereas it uses the new block with a larger register map.
> >
> > Looking at the code Allwinner previously released [1], that doesn't seem to be
> > the case. Keep in mind that the register map shown in the user manual is for
> > the TDM interface, which we don't actually support right now.
>
> Should it matter what we support right now?, the block according to the user
> manual shows the bigger range. I don't have a A83T device and from what I

There are a total of four I2S controllers on the A83T. Currently three of them
are listed in the dtsi file, which are _not_ the one shown in the user manual.
The one shown is the fourth one, which is the TDM controller.

It's not like we haven't seen this before. IIRC the A64 also had two variants
of the I2S interface. The one coupled with the audio codec was different from
the others.

> gather not many users do. But the compatible for the H3 has been removed
> and replaced with the settings for the A83T which also has default settings in
> registers further up than SUNXI_RXCHMAP.

I'll sync up with Maxime on this.

> >
> > The file shows the base address as 0x01c22800, and the last defined register
> > is SUNXI_RXCHMAP at 0x3c.
> >
> > The I2S driver [2] also shows that it is the old register map size, but with
> > TX_FIFO and INT_STA swapped around. This might mean that it would need a
> > separate regmap_config, as the read/write callbacks need to be changed to
> > fit the swapped registers.
> >
> > Finally, the TDM driver [3], which matches the TDM section in the manual, shows
> > a larger register map.
> >
> > A83T is SUN8IW6, while SUN8IW7 refers to the H3.
>
> Since when have we trusted Allwinner code?, the TDM labelled block
> clearly supports

Since they haven't listed the I2S block in the user manual, so that is what we
have to go by.

The TDM section in the user manual only lists the block at 0x1c23000. The memory
map says DAUDIO-[012] for addresses 0x1c22000, 0x1c22400, 0x1c22800, and TDM for
address 0x1c23000. One would assume this meant these are somewhat different.

> I2S. The biggest use case for this block is getting HDMI audio working
> on the newer

I understand that.

> devices(LibreELEC nightlies has a user base of over 300) and I've tested this on
> numerous set ups over the last couple of years.

Tested on the H3, correct?

> Failing that reverting (3e9acd7ac693: "ASoC: sun4i-i2s: Remove
> duplicated quirks structure")
> would help.

I'll take a look. IIRC it worked with the old layout, with the two registers
swapped, playing standard 48 KHz / 16 bit audio when I added supported for
the A83T. Then again maybe the stars were perfectly aligned. At the very least
we could separate A83T and H3 as you suggested.

ChenYu


> BR,
> CK
> >
> > ChenYu
> >
> > [1] https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/sound/soc/sunxi/hdmiaudio/sunxi-hdmipcm.h
> > [2] https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/sound/soc/sunxi/i2s0/sunxi-i2s0.h
> > [3] https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/sound/soc/sunxi/daudio0/sunxi-daudio0.h
> >
> > > Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
> > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > ---
> > >  sound/soc/sunxi/sun4i-i2s.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > > index 57bf2a33753e..34575a8aa9f6 100644
> > > --- a/sound/soc/sunxi/sun4i-i2s.c
> > > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > > @@ -1100,7 +1100,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
> > >  static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
> > >         .has_reset              = true,
> > >         .reg_offset_txdata      = SUN8I_I2S_FIFO_TX_REG,
> > > -       .sun4i_i2s_regmap       = &sun4i_i2s_regmap_config,
> > > +       .sun4i_i2s_regmap       = &sun8i_i2s_regmap_config,
> > >         .field_clkdiv_mclk_en   = REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
> > >         .field_fmt_wss          = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
> > >         .field_fmt_sr           = REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
> > > --
> > > 2.23.0
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20190826180734.15801-2-codekipper%40gmail.com.
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/CAEKpxBmCg4AkqKM-O3C76gto%2BmPWyEdDbviAmRJ8PxLOOMTJ7w%40mail.gmail.com.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
