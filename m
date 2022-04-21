Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656450B943
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017B617C1;
	Fri, 22 Apr 2022 15:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017B617C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635776;
	bh=i0HMWq1JRa0F0CeO2hnG9SF3TuKwCFJPlYUxv+11vSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s9OSvD/qzygu3Mu84brEorOJmkVeJuvEf+F4AdYzYMkngMi/hKj/TZQRhZeBd9y3g
	 YPpY0Ly+GqGQk6DG8bYEdPrE0yjFNbZpi66Eo2Ur9p9FpOveuPsj3zGlpTacSj/mNp
	 jCkx876qHQwf5Ia9Ap3amyJPmExVQKjPoT6zbD7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 713F2F80C5A;
	Fri, 22 Apr 2022 15:32:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E89A7F8032D; Thu, 21 Apr 2022 16:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A915DF800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 16:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A915DF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KYNnxH1/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FA1B61A7C
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 14:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38269C385B4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650552395;
 bh=i0HMWq1JRa0F0CeO2hnG9SF3TuKwCFJPlYUxv+11vSY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KYNnxH1/6h4JHSpiitspdSKkTEwWa1tJBCwmto9ZMzu31V+JKmKgI743LDv+s34bq
 QmSRKC+hHoCyn8rQMCoQYbCY9I4u1HRgIOm+Pz2OmA5gNIE7rXJyrAZQqUv9oA3TUQ
 CVuRa/VFqB7epVLHtpWWZFuEw4IysfFmBo/cCYj+4wtcdzx74jW2LjnvsN+imBPGkx
 NUHT9J1SbF8LbbqYNTV0fbd7NyddYgpQP9JQyBAmIQiZB0mHJDNoZgZMT3gNF6FO91
 4nSd3Odf/kHuZoRH+pZi1kgbPYDKmWC6TMUEyESfHfKmh/QjbWYzrE2aZ/dN2sYGsU
 NUgA5p8ikcvFQ==
Received: by mail-wr1-f51.google.com with SMTP id x18so7062532wrc.0
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 07:46:35 -0700 (PDT)
X-Gm-Message-State: AOAM5322UWbzJjL3+fnWLp5NaRueBtYY3mJPCSsrjVfaLlWfmNdTtem/
 d7yue/hfwwG39LBf75ZwSLOcTXHfuHecuzZjYYo=
X-Google-Smtp-Source: ABdhPJwYkraliZNB9aswBiexBZv/yC4YtGe2R9rvi1KW9m/P8YE/IbH0HzS9xhCUm+8mp8SN41/aSdFZNG1cTJqd71I=
X-Received: by 2002:a5d:6da5:0:b0:20a:8805:6988 with SMTP id
 u5-20020a5d6da5000000b0020a88056988mr48774wrs.317.1650552393282; Thu, 21 Apr
 2022 07:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220420170836.GB1947@darkstar.musicnaut.iki.fi>
 <CAK8P3a1+sOrn8BWPVc7f+QFZ5=7fE6=MLsMYV9t+HJcG2aRCXA@mail.gmail.com>
 <20220421133431.GE1947@darkstar.musicnaut.iki.fi>
In-Reply-To: <20220421133431.GE1947@darkstar.musicnaut.iki.fi>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Apr 2022 16:46:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0LkJ5EvJ13xtAhWzCKnnvYhYgKpPsphr1T-FGg6bzDuw@mail.gmail.com>
Message-ID: <CAK8P3a0LkJ5EvJ13xtAhWzCKnnvYhYgKpPsphr1T-FGg6bzDuw@mail.gmail.com>
Subject: Re: [PATCH 00/41] OMAP1 full multiplatform conversion
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

On Thu, Apr 21, 2022 at 3:34 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>
> Hi,
>
> On Wed, Apr 20, 2022 at 10:00:13PM +0200, Arnd Bergmann wrote:
> > On Wed, Apr 20, 2022 at 7:08 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > > On Tue, Apr 19, 2022 at 03:36:42PM +0200, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > This is the full series for converting OMAP1 to multiplatform, rebased
> > > > from my 2019 attempt to do the same thing. The soc tree contains simpler
> > > > patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> > > > means we are getting closer to completing this for all ARMv5 platforms
> > > > (I have patches for PXA, which is the last one remaining).
> > > >
> > > > Janusz already tested the branch separately and did the missing work
> > > > for the common-clk conversion after my previous approach was broken.
> > >
> > > I tested the full series on the following OMAP1 boards: ams-delta,
> > > nokia770, osk, palmte and sx1 (QEMU only).
> > >
> > > Apart from the earlyprintk breakage, everything seemed to work OK.
> >
> > Nice, thanks a lot for testing!
>
> With the updated patch 26 also earlyprintk now works, so if you still
> update the patches, feel free to add for the whole series:
>
> Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

I was just doing the merge, so I added the tag to the commit now.

There is now an "omap1/multiplatform-prep" branch that is part of
arm/multiplatform, and I hope to not have to rebase that. I also
have an arm/multiplatform-late branch with the remaining contents.

       Arnd
