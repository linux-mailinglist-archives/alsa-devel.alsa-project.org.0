Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F39DD5C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 07:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8817D1677;
	Tue, 27 Aug 2019 07:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8817D1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566885414;
	bh=7KpK9VoRecE9zfk7b6gQ0u6QmtXeEeL1/dEQWiZyWLw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHDp7TlH6gHcRqJVHK9Giv1DhXPnMuBWrrDKjX6zkAr5ALWE7YHw/xdwUj6NL6JdT
	 tD0Sa7yutPilZeNmS3sUXJJgDO8RC7qMSUOhTL2xM5NQkN6PqFi/7VM+mzEHTX5mK0
	 JzFFKvqUYMZLzCixM/dbwhuuyQG7O6JzyMgiQ6/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2999FF80273;
	Tue, 27 Aug 2019 07:55:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41926F80274; Tue, 27 Aug 2019 07:55:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33E65F800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 07:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33E65F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tBPtAp0W"
Received: by mail-lf1-x141.google.com with SMTP id g9so386184lfb.0
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 22:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N+vpsDloTUdy5MvFdUSFeHVMIbrM4Okd8BXV+IVwifM=;
 b=tBPtAp0WoXthyCDuxt0/UFLRqezDiJevoRKm/SOQIUlGRldn152fQioRxeB7al5xxT
 sVoOIxaT/VuG5XuiKbuOW9+y1OHW9NHrC/uPtx+grRsTws3Vq7QqhSTz6j+4C26nCUqr
 LDMbBJz9Sa7OUTHFnJspqelzZyXBxk3eFAElrk3MWHmSUzcbICTCuExINBxSK/XylvvR
 ohpvOvP1+OoJDBUHQJQWotFSoTwt7NYPl+x0e1RajCT2jLQU3sCCkvBLETeYiSi3H541
 rDNr7/WbU2NPl9VrKwbfQ/oxycmkvFye7tObGO23O2OCVf9LLaBGOow+JWnc2DkFAg20
 8Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N+vpsDloTUdy5MvFdUSFeHVMIbrM4Okd8BXV+IVwifM=;
 b=tJdagYgzAJHt7uJAlKtobPCOioDqst0yfcMXzUOSn0L9hsbGPlTP5bLaNxPZt+QL3T
 q2/cO+Ap9CK5TubtEK2Ty5pZRgB0DMp92bvJQklP1stj5xnj3+39+wZq71prRkgdzXQN
 XmBU/nxxL2+kt3FyFsHGc0gklbhyGjuKHwNlCeXRRxH7s7FF3Gj8fIeW3bksP6pave5G
 ULfwDSQmCWefO5oe+O8xsT16Kzi8a5hQ/vFR/sxSGc8mF1rvyx52vfYAMXwvX6t2oij5
 iuBhtoUr8Ln3VpS9f1AZfDP4f/60oZfDey3uyqrgW6ZoWNmIV9Hu0ExTdzEPea/zDfWA
 6jQw==
X-Gm-Message-State: APjAAAWbW/gBIzVGRcwsjT9vSH/2u+dW+/i7Y1NJvEh46yv/Qv8WuvMA
 xT7oVgTLK626EwYcTfzeYGyNJxETpexlHMnHB0I=
X-Google-Smtp-Source: APXvYqzidw7it9RFvQO3QHpIyQRWnqyn2HDPGgcq72wbtDx3y1RWj/BFazwXFiWSboCAudwrFQw+mF1nebwphQAgI5I=
X-Received: by 2002:ac2:563c:: with SMTP id b28mr12969143lff.93.1566885297683; 
 Mon, 26 Aug 2019 22:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190826180734.15801-1-codekipper@gmail.com>
 <20190826180734.15801-2-codekipper@gmail.com>
 <CAGb2v651jVp+J2eyWh7vw-yHmFTVy4eaMjHV0FvOF17C5_Hswg@mail.gmail.com>
In-Reply-To: <CAGb2v651jVp+J2eyWh7vw-yHmFTVy4eaMjHV0FvOF17C5_Hswg@mail.gmail.com>
From: Code Kipper <codekipper@gmail.com>
Date: Tue, 27 Aug 2019 07:54:45 +0200
Message-ID: <CAEKpxBmCg4AkqKM-O3C76gto+mPWyEdDbviAmRJ8PxLOOMTJ7w@mail.gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
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

On Tue, 27 Aug 2019 at 06:13, Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Tue, Aug 27, 2019 at 2:07 AM <codekipper@gmail.com> wrote:
> >
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > The regmap configuration is set up for the legacy block on the
> > A83T whereas it uses the new block with a larger register map.
>
> Looking at the code Allwinner previously released [1], that doesn't seem to be
> the case. Keep in mind that the register map shown in the user manual is for
> the TDM interface, which we don't actually support right now.

Should it matter what we support right now?, the block according to the user
manual shows the bigger range. I don't have a A83T device and from what I
gather not many users do. But the compatible for the H3 has been removed
and replaced with the settings for the A83T which also has default settings in
registers further up than SUNXI_RXCHMAP.

>
> The file shows the base address as 0x01c22800, and the last defined register
> is SUNXI_RXCHMAP at 0x3c.
>
> The I2S driver [2] also shows that it is the old register map size, but with
> TX_FIFO and INT_STA swapped around. This might mean that it would need a
> separate regmap_config, as the read/write callbacks need to be changed to
> fit the swapped registers.
>
> Finally, the TDM driver [3], which matches the TDM section in the manual, shows
> a larger register map.
>
> A83T is SUN8IW6, while SUN8IW7 refers to the H3.

Since when have we trusted Allwinner code?, the TDM labelled block
clearly supports
I2S. The biggest use case for this block is getting HDMI audio working
on the newer
devices(LibreELEC nightlies has a user base of over 300) and I've tested this on
numerous set ups over the last couple of years.

Failing that reverting (3e9acd7ac693: "ASoC: sun4i-i2s: Remove
duplicated quirks structure")
would help.

BR,
CK
>
> ChenYu
>
> [1] https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/sound/soc/sunxi/hdmiaudio/sunxi-hdmipcm.h
> [2] https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/sound/soc/sunxi/i2s0/sunxi-i2s0.h
> [3] https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/sound/soc/sunxi/daudio0/sunxi-daudio0.h
>
> > Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index 57bf2a33753e..34575a8aa9f6 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -1100,7 +1100,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
> >  static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
> >         .has_reset              = true,
> >         .reg_offset_txdata      = SUN8I_I2S_FIFO_TX_REG,
> > -       .sun4i_i2s_regmap       = &sun4i_i2s_regmap_config,
> > +       .sun4i_i2s_regmap       = &sun8i_i2s_regmap_config,
> >         .field_clkdiv_mclk_en   = REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
> >         .field_fmt_wss          = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
> >         .field_fmt_sr           = REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
> > --
> > 2.23.0
> >
> > --
> > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20190826180734.15801-2-codekipper%40gmail.com.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
