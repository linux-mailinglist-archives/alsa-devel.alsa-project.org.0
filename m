Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C85C50E1DE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:32:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C39E817EF;
	Mon, 25 Apr 2022 15:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C39E817EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650893560;
	bh=VAIS5RCD9giYhrbO5Hac6FpKh7We3My7pPHwyo54GI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUtjU8Er5BFxIvbbk1k9chAC0PedMa/DRs56GYeuPlEUuxdHtc4SJOcYVqF8kOCMg
	 vhuOfIWe0oOhUTVo8h1Fha0PRuzKVVKfOGMqbtAFzG1ukDm5JkX/QILFszd0DqBtlu
	 cPU/H4vcAZia16Hj2NmdEyTW/fMYSKY6W8ZeNSzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 750EEF8056F;
	Mon, 25 Apr 2022 15:27:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D638AF80163; Sun, 24 Apr 2022 10:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF0FCF80109
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 10:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF0FCF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IlEUmxA7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7AD17B80D5F
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 08:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E29C385BF
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650790374;
 bh=VAIS5RCD9giYhrbO5Hac6FpKh7We3My7pPHwyo54GI8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IlEUmxA7Upi/jZvwszo5tWXIcRM0EAFPHSwLNctN9Y58IvDFrOEsiQajUPCMH7Jvj
 ffMGYU3Am1eiuRxan/QEzVGZIU4/nZDiD4I9qyEihHwFs57oDBFuZkioK/aaH82E/D
 cafv1RJevyhRqAmfrOprDhzFhC5PdErVyqMypulLdZQgaDPE2OydWwwQC4+yvZmqbe
 cKfnbHuByU+9iCxgB+9sW82eJWEWf6s1YXcaaJOKEOR6FMrQj52g4nRCkxQaL9o5DE
 hRPjDgGmvEn6UrlX0oEzCHgEu1vF7VzmeRUbf/lMOXmL9MVlUAWdZQ45wrK1ipQsiq
 1YeW3uUpHXgig==
Received: by mail-wm1-f49.google.com with SMTP id
 r4-20020a05600c35c400b0039295dc1fc3so7816893wmq.3
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 01:52:54 -0700 (PDT)
X-Gm-Message-State: AOAM532jTvt2vpcdXov0K7r128GpZg700dxl7ThQmlCus1ablN64oKap
 7w/0SD9YionUwqALrAQ7sMmV0ejXcT29A54AZ6I=
X-Google-Smtp-Source: ABdhPJwWxQyFReh1xxhP87snsCB/AySgR1dxVTGy6Gpi4+Uz2ZZzeirzOgx8S2o3MdbrdLkLr/78d+DVsl9RCKwJ5Q8=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr20347843wmc.94.1650790372472; Sun, 24
 Apr 2022 01:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
In-Reply-To: <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 24 Apr 2022 10:52:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
Message-ID: <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 25 Apr 2022 15:27:43 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
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

On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/23/22 12:55, Arnd Bergmann wrote:
> > On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> >
> > Odd, I can't reproduce this at all. Do you get any console output at
> > all for this?
> >
> > Is this the plain omap1_defconfig, or something else?
> >
>
> No, it is my own sx1 specific configuration.
>
> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/qemu_sx1_defconfig
>
> I don't recall where I got it from but ...

Ok, that explains it, thanks!

I fixed all the defconfig files that come with the kernel, but for your own
ones you have to add

# CONFIG_ARCH_MULTI_V7 is not set

into the defconfig file, otherwise the multiplatform target defaults to
an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
you also need to enable CONFIG_ARCH_MULTI_V4T.

This is slightly unfortunate, but I don't see any way to avoid it, and the
modified defconfig will still work fine with older kernel trees.

> > One thing I keep having to apply myself is this snippet:
> >
> > diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
> > index 0bfad62ea858..87c695703580 100644
> > --- a/arch/arm/mm/proc-arm925.S
> > +++ b/arch/arm/mm/proc-arm925.S
> > @@ -441,7 +441,6 @@ __arm925_setup:
> >
> >   #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
> >          mov     r0, #4                          @ disable write-back
> > on caches explicitly
> > -       mcr     p15, 7, r0, c15, c0, 0
> >   #endif
>
> it does not have CONFIG_CPU_DCACHE_WRITETHROUGH enabled.

Maybe it was disabled explicitly for the sx1_defconfig because of this
bug. I would think that this is required for actual sx1 hardware because the
option is default-enabled for ARM925T, and that CPU core is exclusively
used in OMAP15xx.

        Arnd
