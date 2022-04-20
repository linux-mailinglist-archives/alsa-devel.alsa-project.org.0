Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE550B931
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5257517E7;
	Fri, 22 Apr 2022 15:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5257517E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635600;
	bh=+PgOfT87QXZRKpM2v9ZNowWskAsreLZEe6RAZERVuxs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G818PSl6j2eJBbNLWZ87AHbippN0/lIgyI0nkEcs/VbbfBBT2DiGCo/bnzyHNtp8t
	 816W6NT9aigYRAVIbTsOvsWz4nwCM1sj1X6+4nCKbyarWQJsQtnfKGZ6OHbco2KOm3
	 DBUO9H0IoSLp9CfoAxFuLWUGBNeK5NsPB/t3bl5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A881F80855;
	Fri, 22 Apr 2022 15:32:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FCD7F80125; Wed, 20 Apr 2022 21:21:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6BDFF800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 21:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6BDFF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LWkg8+P3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19B04B8215C
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 19:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A41C385A9
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650482464;
 bh=+PgOfT87QXZRKpM2v9ZNowWskAsreLZEe6RAZERVuxs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LWkg8+P3Xly8sjIxoqjEgUnQ8BqoLngtqGiQEPZggl4dkK1DiOpgHHwSwn56ifoYf
 0jYMBC2y9oudEQNk98zILpE9CQilgE7tkJqFfirwGiPaSzGz60rXyG7LagSrWPhQem
 gbXXIArHrbaEUbVwFKFsMGfZw+kiVhQTkNWJBmFatyWcBtF+i4qgINtXXuldo7Vx0G
 RpToCuYAP6mrwt+aiH/IjOOBsTv71f5Oi3+i5AJ3tiOTaMEh/815Em+H9EnYveGtMX
 wgIyjIS3nQS3pxspnrQ1f27FpB7+Y6rOGSmBE7zDDiBd809M2ZhAxpsXP8A+8SQw2R
 w9+fnlrAhUS+g==
Received: by mail-wr1-f52.google.com with SMTP id s29so516939wrb.8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 12:21:04 -0700 (PDT)
X-Gm-Message-State: AOAM531Z1RsAeiudB7KmLdvc3doWUNeYLzetxuNcKQAhmBiEYfHw/hQR
 1LswgHesguKxSYkFFCQ52EBTVaTPQUPTqqiIJh4=
X-Google-Smtp-Source: ABdhPJznf39uJYDI3N62QzlkS6buptTPqwk86KhjNzbLbHyB/jaRCmYyra2UZ9f1wUtI0joZyTmyxGE4xOIYt2PeYqA=
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b84 with SMTP id
 m3-20020a5d64a3000000b0020a79315b84mr17397786wrp.407.1650482462896; Wed, 20
 Apr 2022 12:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-27-arnd@kernel.org>
 <20220420134615.GA1947@darkstar.musicnaut.iki.fi>
In-Reply-To: <20220420134615.GA1947@darkstar.musicnaut.iki.fi>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Apr 2022 21:20:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a00DgKYdzTZFiBfKDF_zwaJjL6Duw8aOOJ-gVkz4L1ZwQ@mail.gmail.com>
Message-ID: <CAK8P3a00DgKYdzTZFiBfKDF_zwaJjL6Duw8aOOJ-gVkz4L1ZwQ@mail.gmail.com>
Subject: Re: [PATCH 26/41] ARM: omap1: relocate static I/O mapping
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
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

On Wed, Apr 20, 2022 at 3:46 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>
> Hi,
>
> On Tue, Apr 19, 2022 at 03:37:08PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The address range 0xfee00000-0xfeffffff is used for PCI and
> > PCMCIA I/O port mappings, but OMAP1 has its static mappings
> > there as well.
> >
> > Move the OMAP1 addresses a little higher to avoid crashing
> > at boot.
>
> This has the same problem I reported in 2019, with earlyprintk the
> system no longer boots:
>
>         https://marc.info/?t=156530014200005&r=1&w=2
>
> Tested on OSK and SX1/qemu.

Thanks a lot for testing!

I managed to get to the bottom of this after just a few hours, and
it turned out to be a simple math error on my end, as I got
the alignment wrong, the offset has to be 0x00f00000
instead of 0x00fb0000 be section aligned. I made sure the
kernel boots up (to the point of missing a rootfs) and uploaded
the fixed branch.

      Arnd
