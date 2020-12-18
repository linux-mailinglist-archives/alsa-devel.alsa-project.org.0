Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882B2DE3F6
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 15:25:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D986E1728;
	Fri, 18 Dec 2020 15:24:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D986E1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608301537;
	bh=0stZFDdeIA6zh/g4iz1ErQRqmVGKp2Ae7Q3fsTTtMXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EfNsu880crBW/00iZROKZ3KDbrbWPchp/PJtXVb6PZEVtpfgINmbhMEtMSDsExGDZ
	 aMdA2kagM20KRzmXa1KrtcSfyGQh8NV9u5zrDoczZNNCtJs3VetZCC9z0eP4ut7bWY
	 kouF66pcQFiVvveGngScl7bsiTvg4AWcqPMguHG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EEB9F8014B;
	Fri, 18 Dec 2020 15:24:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1033F801F7; Fri, 18 Dec 2020 15:23:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_135,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9789EF8014B
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 15:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9789EF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a41lRihD"
Received: by mail-io1-xd31.google.com with SMTP id o6so2160226iob.10
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 06:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kg+yAMgYFLTlHGrbICoaSFL1GosZ12/l4+s47nG2NxE=;
 b=a41lRihDMJA4TP/nBOdw2eh8pG7oiVgvKaQQCFZk8Pzo1AuVl/osP+iqI2fp2+koGU
 P9Lpy/mTk6V7mbOSA2rtpaXxdCobDJn1YRzFS83JnGcpvWz8rKy9d9NHcL3FlEEzUcf8
 Mfeut7Y+n72ZZLdjqNZMns/c1BBr8pLnmn/R06ry9OOMh25KPd5znLBKguPh5wPbY3ZC
 0BCWqiqC6ZN7wXdFiHpTN7A9bjTAFo4xQXaK8JMZdh6QPfbgCsMo33HH5C2L0g6waLo/
 DfYyfzwNUHIfED0Ml9Jzk45/DifES6cyMHqF6xkpe6GjqpLETBsFf3ahBP6tQtEaWFS4
 Hl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kg+yAMgYFLTlHGrbICoaSFL1GosZ12/l4+s47nG2NxE=;
 b=JOAEsPxAgLPwjw5QyUusLR8MXb0XeW3DP8GLWLOwH/jXDA8C2c02XJddCuWyVwDtv8
 x53OW1AxditDQksM054UnGymarlpF+HbVoTb2PdQLmnxlQDHdcz+DtI3H+rS2MIoxU8Q
 V2nfbjaIB8cLKtAws0A1Q+z3ogDD/LBVGKxvhUGAcFooMY+Uas0S86N3pki2bh+HL17F
 wdb72xZ76D3QQHQbcvsgf7hCuhn+v3RpW5qL/o7PKbvf0XeGm6PuoyX8XQEIfC/c1swZ
 /kjXwVJWZaTDszhOMPp0kKdCvy4u411ktz5yjM/L5+mcMtbQ7nalp928r064Iz9c3otj
 eS1w==
X-Gm-Message-State: AOAM531zYR3jWCk57Y3nKHiwitSDxyvQEsZDAoeuX7bF4G6qiMGinu5P
 MiP+YPLSwcxe+mP4AZJf4EcpH4WFSL3hpLQBQPs=
X-Google-Smtp-Source: ABdhPJypnNeIYn+W4o/Ji0n2E5B65wD4Kl9KP5xwOzucGSlZMNeu9e3eh+wZiO8tVDq4izdDW6Kkt1ZUGsqfN4R7140=
X-Received: by 2002:a02:ca09:: with SMTP id i9mr3829996jak.135.1608301426863; 
 Fri, 18 Dec 2020 06:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com>
 <20201213183759.223246-7-aford173@gmail.com>
 <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com>
 <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com>
 <CAMuHMdU5kBHV9-kBnJbtLp6zGcYRjyTxhmGsstKFnh=Qe4jcYg@mail.gmail.com>
In-Reply-To: <CAMuHMdU5kBHV9-kBnJbtLp6zGcYRjyTxhmGsstKFnh=Qe4jcYg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 18 Dec 2020 08:23:35 -0600
Message-ID: <CAHCN7xKyHckOvLh9U+21dsKMshwA1LyTzTexxAY0akVcJHJD0Q@mail.gmail.com>
Subject: Re: [PATCH 06/18] arm64: dts: renesas: beacon: Configure Audio CODEC
 clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Fri, Dec 18, 2020 at 6:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Thu, Dec 17, 2020 at 2:33 PM Adam Ford <aford173@gmail.com> wrote:
> > On Thu, Dec 17, 2020 at 5:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > CC alsa-devel
> > >
> > > On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > > > With the newly added configurable clock options, the audio CODEC can
> > > > configure the mclk automatically.  Add the reference to the versaclock.
> > > > Since the devices on I2C5 can communicate at 400KHz, let's also increase
> > > > that too
> > > >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > > > @@ -424,13 +424,15 @@ &i2c0 {
> > > >
> > > >  &i2c5 {
> > > >         status = "okay";
> > > > -       clock-frequency = <100000>;
> > > > +       clock-frequency = <400000>;
> > > >         pinctrl-0 = <&i2c5_pins>;
> > > >         pinctrl-names = "default";
> > > >
> > > >         codec: wm8962@1a {
> > > >                 compatible = "wlf,wm8962";
> > > >                 reg = <0x1a>;
> > > > +               clocks = <&versaclock6_bb 3>;
> > > > +               clock-names = "mclk";
> > >
> > > While the driver does get the (nameless) clock, the DT bindings lack any
> > > mention of a clocks property.  It would be good to update the bindings.
> >
> > Agreed.  I'll push an update to add the clocks property.
>
> Thanks!
>
> > > Note that arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi and
> > > arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi (both by your
> > > hand) use "xclk" instead of "mclk"?
> >
> > On the schematics for the two imx boards, it's labeled as xclk, so it
> > was named as such.  For this board, the schematic names it mclk. The
> > driver doesn't care about the clock-names property, so I'll just
> > remove them.
>
> If there's a single clock, not using clock-names is fine.
> If you do use clock-names, the names should be clock-centric, not
> board-centric.

I already submitted patches to remove the clock-names reference from
the other two boards you noted [1].  I agree it should match  the
driver and not the schematic.  That line was a left-over from our
internal git repo where the decision was used to follow the schematic
and not the driver.

Thanks for bringing that to my attention.

adam

[1] - https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=403739

>
> BTW, looking at the WM8962 datasheet, it's called "MCLK".
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
