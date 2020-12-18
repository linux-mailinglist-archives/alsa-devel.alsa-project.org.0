Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A20B2DE2FA
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 13:59:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D13161769;
	Fri, 18 Dec 2020 13:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D13161769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608296369;
	bh=bay7/EuZESGjN5S9B3SXkU1wanaRd+tyOjaZxPc67co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nX9JDkzlCEzIEQZvwBg0no6QmxXLvSKcsc9R85zjgWjqk2EOJ6uVFCtxSXPKHa1Z1
	 dE3kmjv6kiOXqhsM7Vxd+RmRvRTtuPZWKKysZ3gGI6ZXEFJdAsEEBBXHybyxz9Qh1j
	 47kBYRLBvha/sxOlK3IXw9cSxV/2FX5a6O6TeCHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7306FF80168;
	Fri, 18 Dec 2020 13:57:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9EFAF801F7; Fri, 18 Dec 2020 13:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 508CBF80168
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 13:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 508CBF80168
Received: by mail-ot1-f53.google.com with SMTP id j20so1793796otq.5
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 04:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nw9EMgBnuebmSA/eYty+YbhjJO9tx7n6Ij1TQfze3Sk=;
 b=J555JHRG0M2UOt3BpIJhzneDoHnMGfPFliZTdGfYYgYWnkOIknxr4Xwirqy9unOQK1
 A9PHijWfgkAuYBRWnHkpAC5dM9uRGbh0/GunnEby9zNQEm6OlpH7NGV/9AG2XVBCnkpr
 vQbSc/pvqmniKvesp6d0J0ylePaeRt2Ay8+r7U10qhdC7AqB1rMQXj58Livg7iUTbPrV
 j/pZza//Ty64dfOSDS4OrrLj4nG4ZAAh7QKzVEjtMubMVRBNTRC8T1I5IHRPyw0yOXLc
 vhczduO+i18Ee5A8H42OM2GOLdvBSkWdP7nTBVmMzJI/BnPCiZrHQuSEFNMcOy6i5ciJ
 dZog==
X-Gm-Message-State: AOAM532EJMwOaoEV8k+ko+joZ8d3waqkkiFSQara7J7Hb/Bu87IdVRFe
 zz9HVqaE8fcJvTLE6iDuU85JjNkyWahZnYTdAnQ=
X-Google-Smtp-Source: ABdhPJzF0RSOZYgTecBqyxPakGWb84W0hkuZ/n9XaI2yj+auV3WrPoUbWwHUSLvzrySPPyJvlIjyekYSBmOkSuZLCgc=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr2657442otc.145.1608296263283; 
 Fri, 18 Dec 2020 04:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com>
 <20201213183759.223246-7-aford173@gmail.com>
 <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com>
 <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com>
In-Reply-To: <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Dec 2020 13:57:32 +0100
Message-ID: <CAMuHMdU5kBHV9-kBnJbtLp6zGcYRjyTxhmGsstKFnh=Qe4jcYg@mail.gmail.com>
Subject: Re: [PATCH 06/18] arm64: dts: renesas: beacon: Configure Audio CODEC
 clocks
To: Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Magnus Damm <magnus.damm@gmail.com>, Adam Ford-BE <aford@beaconembedded.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
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

Hi Adam,

On Thu, Dec 17, 2020 at 2:33 PM Adam Ford <aford173@gmail.com> wrote:
> On Thu, Dec 17, 2020 at 5:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > CC alsa-devel
> >
> > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > With the newly added configurable clock options, the audio CODEC can
> > > configure the mclk automatically.  Add the reference to the versaclock.
> > > Since the devices on I2C5 can communicate at 400KHz, let's also increase
> > > that too
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > @@ -424,13 +424,15 @@ &i2c0 {
> > >
> > >  &i2c5 {
> > >         status = "okay";
> > > -       clock-frequency = <100000>;
> > > +       clock-frequency = <400000>;
> > >         pinctrl-0 = <&i2c5_pins>;
> > >         pinctrl-names = "default";
> > >
> > >         codec: wm8962@1a {
> > >                 compatible = "wlf,wm8962";
> > >                 reg = <0x1a>;
> > > +               clocks = <&versaclock6_bb 3>;
> > > +               clock-names = "mclk";
> >
> > While the driver does get the (nameless) clock, the DT bindings lack any
> > mention of a clocks property.  It would be good to update the bindings.
>
> Agreed.  I'll push an update to add the clocks property.

Thanks!

> > Note that arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi and
> > arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi (both by your
> > hand) use "xclk" instead of "mclk"?
>
> On the schematics for the two imx boards, it's labeled as xclk, so it
> was named as such.  For this board, the schematic names it mclk. The
> driver doesn't care about the clock-names property, so I'll just
> remove them.

If there's a single clock, not using clock-names is fine.
If you do use clock-names, the names should be clock-centric, not
board-centric.

BTW, looking at the WM8962 datasheet, it's called "MCLK".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
