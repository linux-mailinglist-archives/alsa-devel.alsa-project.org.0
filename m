Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFE32DD537
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 17:30:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E9AA193F;
	Thu, 17 Dec 2020 17:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E9AA193F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608222644;
	bh=Z5yW4jNTBja7071+X0OBwfVADqrfDIcVcnvgMBGmLL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/nXky2d8EWKdXabOji7MguvIOyNA0/2EWatQ7V+wFgrArTjl68IkfZC6+enz/a22
	 LO17FCQltnl6q7kTOGJD1CB22ZIvfsLgA6Jqk0bzecWTDHYBrb/gEw0wx6vPtuLw9M
	 4pKlcWgPGIWUtmEnFPt7aNLb7sWvA+of09Bujlig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D73B9F80259;
	Thu, 17 Dec 2020 17:29:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30211F80260; Thu, 17 Dec 2020 14:33:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_135,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2098EF80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 14:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2098EF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uGGcGK/w"
Received: by mail-il1-x133.google.com with SMTP id t9so25819926ilf.2
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 05:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+jjwZlh8+P5xdjAQxmNKObP9LCO6P25PhEfU2zCmIIo=;
 b=uGGcGK/wDVzDKdufzCc89MMDlxsTtuwvQFYZfoNjVx5DcIQn0oQa3KCpR52rZvwyjN
 qUixh4YWZXYI5/R5tOATyzRH2lwDzqLD7Gl0GY10bvSUbehLdaZsO03Q1WqwXYtPAXzb
 DgANnf+J6OKYlH7cnsqk2ASYUqUmo5G/v+83VtuFlFhTaeJwytIzfMwghOK2A/hrAj/p
 awiGQIC8VjEcda3RSSHlI8SMUlAy0PhRzn/Op0qiAre1r44OaDwxPAhQl7aebifpJiNk
 8ZanpmQ2dnPFuiuBG+ZCE1mbgdbxN9I+3n2eXMZuACyHKH8ONQIqNYqSp1gKjsnSD4IC
 m3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+jjwZlh8+P5xdjAQxmNKObP9LCO6P25PhEfU2zCmIIo=;
 b=m+wrTs2WtkuSn6luHMI+FfiQ7UpnKRBCux5/DYicXPH+GoWgEKb0pk/MlJQNENqcQJ
 xl1AiSO6X3THNk+BoXy8iHJjvWXfV+aaIf+sCFj0wSRjvoEpMTJNTK4o4vo9tFd2GqQ3
 Uh4bV3Ywr1SjqJvGdC0TURNYMeay4jrqaAT1mOhy1OHIK9pMBG7h+0qQLVhp6q5ps311
 OEqjgDdLPzNpTDr+uTFZqDRo07m6gVltPWGSQqAJXpP5c/JHKmeD0lr9bpLSSUZHR0q8
 28CFN6AXARLBzf/BmPLNriU6TGisF2SpI/CofFU3chebq0xkU4i3dn697WxRd9YLdk8v
 9uYg==
X-Gm-Message-State: AOAM531ohuugOWURUN8gIusCdHhFo4qlRdWXK/6RarCH/pWt9unI5YhT
 LG7eraRmnqDnlEw3Xs+4s7/b6w4njudCzjosgzM=
X-Google-Smtp-Source: ABdhPJzZdM+KhdXs045hzNvmUYkm/uIToQWw1BQSY/qolijdZMQZ9QVId3RID7/CaGKBcRjz8IyL4jZhw87muy1leGM=
X-Received: by 2002:a05:6e02:926:: with SMTP id
 o6mr48950963ilt.65.1608211999880; 
 Thu, 17 Dec 2020 05:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com>
 <20201213183759.223246-7-aford173@gmail.com>
 <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com>
In-Reply-To: <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 17 Dec 2020 07:33:07 -0600
Message-ID: <CAHCN7xJf2T3uFLDtJxvjFYzCksWq02+CUY51_WmnU44YDJKy9Q@mail.gmail.com>
Subject: Re: [PATCH 06/18] arm64: dts: renesas: beacon: Configure Audio CODEC
 clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Dec 2020 17:29:50 +0100
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

On Thu, Dec 17, 2020 at 5:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> CC alsa-devel
>
> On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > With the newly added configurable clock options, the audio CODEC can
> > configure the mclk automatically.  Add the reference to the versaclock.
> > Since the devices on I2C5 can communicate at 400KHz, let's also increase
> > that too
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> > @@ -424,13 +424,15 @@ &i2c0 {
> >
> >  &i2c5 {
> >         status = "okay";
> > -       clock-frequency = <100000>;
> > +       clock-frequency = <400000>;
> >         pinctrl-0 = <&i2c5_pins>;
> >         pinctrl-names = "default";
> >
> >         codec: wm8962@1a {
> >                 compatible = "wlf,wm8962";
> >                 reg = <0x1a>;
> > +               clocks = <&versaclock6_bb 3>;
> > +               clock-names = "mclk";
>
> While the driver does get the (nameless) clock, the DT bindings lack any
> mention of a clocks property.  It would be good to update the bindings.

Agreed.  I'll push an update to add the clocks property.

>
> Note that arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi and
> arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi (both by your
> hand) use "xclk" instead of "mclk"?

On the schematics for the two imx boards, it's labeled as xclk, so it
was named as such.  For this board, the schematic names it mclk. The
driver doesn't care about the clock-names property, so I'll just
remove them.

adam
>
> >                 DCVDD-supply = <&reg_audio>;
> >                 DBVDD-supply = <&reg_audio>;
> >                 AVDD-supply = <&reg_audio>;
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
