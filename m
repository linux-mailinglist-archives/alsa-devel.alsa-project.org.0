Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68B9E2D5
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 10:37:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3612086F;
	Tue, 27 Aug 2019 10:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3612086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566895076;
	bh=6UGfU65JSarJfcaQCtOnUvnSFDqS2WwtCuh7nTp3twk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrFUQekW7y/VWGAFPPuj2upoosunrJjx2rBU3nV1JrldJ1cNsh3+QyAinYFg6nS83
	 qqWGcp6OBvZ0VebJo2PU4Nui4ZklWRycUgZmXjhqXPJb7O/8UXN580ormoL325CEvU
	 ZydzarDGnVFlFBdGgJRMMsDusXxX1yYSaedx/3Uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DB21F802A1;
	Tue, 27 Aug 2019 10:36:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0127CF802A1; Tue, 27 Aug 2019 10:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03424F80273
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 10:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03424F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ct0UXygt"
Received: by mail-lf1-x142.google.com with SMTP id c12so3128343lfh.5
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bYGEJ93XPP3XlNiRaHwzesAlOb+UBzf8KsHsim6XvxI=;
 b=Ct0UXygt1kSUuk3nnThiTMEqPxe32CYU1MxV5dvmU5LU6bCGsqWFpyukGY4y2po86m
 h5GqJrtoo+mT42PhpQrodQCupYzjzJwXUQQ6FyPlU2V5CK8mgqEOO/JBffmlF+dJ0yS9
 H1xndqUIwIck3VB+GRR0VJrpMESLRLHoBt1j599nZtN3D1CS27J4b167bKFZ20Jo+BsK
 mdm6nWTfW/GiAfCOzGE9ryKCng4leRfnCynTw5tjn/21ykX+sprrBb7gOF+xMHUDdtDF
 25Du/NxyikkhkPbgQe0o22mwYfxt/ZIn/7KUOwtqXwKXOAhyQ85N+Kx8MMmff5KfYu0h
 mDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bYGEJ93XPP3XlNiRaHwzesAlOb+UBzf8KsHsim6XvxI=;
 b=cBXA8Few7opA54wGAW17YvYYZytPd5Q38d7gdQQVKtOQrJbuujbpu1MWHw2vOmjxbC
 d+EJXjwIp1l4lLG+VrPxpCcHf2WxdpNOy0E+l/XfOIzhhwKnANkqOtvpkJX3IxxyGxDo
 QszhQlLXMrR7FNll4EtGpJ5O4LJyvnjbreI7QYDxN5YEZYbBTnJw0ouP9DYiEg/umxCi
 f17zVNCxK5l//nwvth8GYDGWgq5OU463YhZBvMzVlEG5m75R2HZYvXIMayvGByF2abrK
 AolFF1Vmk2/eceMfP1fPjED9C6aB+VlzLV8nGm/sq+IZQuZ4lmVSYsB/rdASWF/RPQX7
 JdBg==
X-Gm-Message-State: APjAAAUuh8RvIMtNFPlvKtuFmv/ijDb1wDasTranUgQC/Xw5bmwbngNW
 7Urrlly/bPkaiZNlMmQMIAJQM2Aa/2xOHrK8Vow=
X-Google-Smtp-Source: APXvYqzMRlXMP/h79lMj8x7VcxyCeKa4vaXpALmTduH57IprgLhHb0OOOFWSwRLPh/SWv0zfOViVEeAbKR/rNE7qeP4=
X-Received: by 2002:ac2:5297:: with SMTP id q23mr13197208lfm.78.1566894997978; 
 Tue, 27 Aug 2019 01:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190826180734.15801-1-codekipper@gmail.com>
 <20190826180734.15801-4-codekipper@gmail.com>
 <20190827070101.tastgcqvzrgv3kc5@flea>
In-Reply-To: <20190827070101.tastgcqvzrgv3kc5@flea>
From: Code Kipper <codekipper@gmail.com>
Date: Tue, 27 Aug 2019 10:36:26 +0200
Message-ID: <CAEKpxBnCzC5hX+b4UMPpKLzKyABZ0e07RwZvULfauphzC4x7=A@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v6 3/3] ASoC: sun4i-i2s: Adjust LRCLK width
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

On Tue, 27 Aug 2019 at 09:01, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Aug 26, 2019 at 08:07:34PM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > Some codecs such as i2s based HDMI audio and the Pine64 DAC require
> > a different amount of bit clocks per frame than what is calculated
> > by the sample width. Use the values obtained by the tdm slot bindings
> > to adjust the LRCLK width accordingly.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index 056a299c03fb..0965a97c96e5 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -455,7 +455,10 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >               break;
> >
> >       case SND_SOC_DAIFMT_I2S:
> > -             lrck_period = params_physical_width(params);
> > +             if (i2s->slot_width)
> > +                     lrck_period = i2s->slot_width;
> > +             else
> > +                     lrck_period = params_physical_width(params);
> >               break;
>
> That would be the case with the DSP formats too, right?

Maybe....but I need a TDM test volunteer!,
CK
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
