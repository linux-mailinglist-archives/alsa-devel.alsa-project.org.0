Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5932550E1C9
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8D4417C8;
	Mon, 25 Apr 2022 15:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8D4417C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650893500;
	bh=f+gN5VFSk9TvNUY6oLSGkqRdwS9xhEyKvVqBzBXLs0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gRaNGrKLzqhx7FxA7H65z4YuM2OkNzyXpwTGW6cBgVHPA9Hp1QI6+bZ9XtWn6CEQd
	 zi5fsK4ttMwUlJeTV5nHgNSxlzr0yMmA7JwNicKI/gxg4RKk53f8Dgv13dLXkvZr+x
	 B6t7jqW+/C9cTT1CagYl/cF/Bwr69bb/LIHU+aoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0BDBF80543;
	Mon, 25 Apr 2022 15:27:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29191F800B6; Sat, 23 Apr 2022 21:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD9C4F800B6
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 21:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD9C4F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PzAHzR20"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1773FCE07EB
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 19:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F189C385A8
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650743721;
 bh=f+gN5VFSk9TvNUY6oLSGkqRdwS9xhEyKvVqBzBXLs0k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PzAHzR20lzvPfCTqt/UUzx12IPhOfz+TRjqNJ8NxEoRI/bWqgErqlZjk7cfTM259a
 ES9ZLzK7AQ5x5SMPoX4fGuEBvk10IF/bYoYOZNrIybBirPtSW18FdAPqWZza8MudXV
 vG23F9GYtnFHpHrf84m9ZBvRrLCT6HR3YBoZ5rIdgNbcdWJ4WulW+Ag5txr/fArK/K
 8hzENh6M4DW/B6aRii4K02sQiyHAgWdV6wTeninHDFb9FTGsk1kC60BC8Ty7Z9oRiu
 uezNy/Q8OZSv9U2rlimKsK6lo1l+EW6dZRWZhxxZjuCiGNgZmaJtyoN+hSdEOEgF8G
 ZbIfS2Abjyb2Q==
Received: by mail-wm1-f51.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso10091501wml.1
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 12:55:21 -0700 (PDT)
X-Gm-Message-State: AOAM532nZRvgutQhZG9WCLgI4lB58hBTszCn7vrEM57KZT9NgYKcfjx+
 toiFT5nV1fzyC1H1y56E+4iweGprYMRRktyPYDg=
X-Google-Smtp-Source: ABdhPJwI9oPHj0hjS6Y5T/XpNunPLjXzfhDb/y4TSIxWhFvis5ICGMzIa2Kp6ZajGKm/dLFayXeKiCmoNnJ4Fu7pVP8=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr18417513wmc.94.1650743719480; Sat, 23
 Apr 2022 12:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
In-Reply-To: <20220422234150.GA3442771@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 23 Apr 2022 21:55:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
Message-ID: <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
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

On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> > On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 4/22/22 12:16, Arnd Bergmann wrote:
> > > > On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > Which machine did you hit this on? Is this on hardware or in qemu?
> > > >
> > > qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
> > > Also, I just noticed that the failure is not always the same.
> > > z2 fails to boot from initrd, and sx1 fails to boot completely.
> >
> > That's a lot of machines failing, I hope at least we got the same bugs more
> > than once here.
> >
> > For the I/O space, I found now that PXA was not using the standard
> > virtual I/O address yet, but instead used a NULL-based offset.
> >
> > I'm not entirely happy with this patch, but this is an outline of what
> > I think we need to fix that: https://pastebin.com/3nVgQsEw
> > This one is probably incomplete, at least it breaks sa1100 for now,
> > and it adds a bogus CONFIG_PCI dependency. I'm also not sure
> > in what way the last patch in the series triggers it, rather than the
> > one that removed mach/io.h.
> >
> > I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
> > If you have a custom config for this one, make sure you get the right
> > DEBUG_LL address.
> >
> > > I'll do another round of bisects.
> >
>
> Here is the bisect for the sx1 boot failure.

Odd, I can't reproduce this at all. Do you get any console output at
all for this?

Is this the plain omap1_defconfig, or something else?

One thing I keep having to apply myself is this snippet:

diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 0bfad62ea858..87c695703580 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -441,7 +441,6 @@ __arm925_setup:

 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
        mov     r0, #4                          @ disable write-back
on caches explicitly
-       mcr     p15, 7, r0, c15, c0, 0
 #endif

        adr     r5, arm925_crval

I don't remember what the story is behind this, but I can't actually manage
to boot omap1_defconfig on qemu with the instruction intact.

       Arnd
