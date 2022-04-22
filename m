Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E663D50E1AD
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ABC31760;
	Mon, 25 Apr 2022 15:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ABC31760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650893401;
	bh=zuNw6j1TShfoNbLYYIZxrZxreBGq9IdbmgqrCDzwCoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fxBpPPcrL/eIDDVxoVJIyNUBVD3RESGNXbfGLEzuKSbp4iii2Iqx+m1HiXIAW24e/
	 2NW0RJNd4PR8IOmSkRfjtGa4c0W/qSKSkR0yq7DS5aSlP75kltasIolX4Fdp6dd2z5
	 0cmW/EyzFR3hHRZSqDsZltCHKVMzSN5u0QfhidDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1AAEF80511;
	Mon, 25 Apr 2022 15:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10B50F80134; Sat, 23 Apr 2022 00:05:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9950F80134
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 00:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9950F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GJHnYGm7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E4C8B82A42
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 22:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9C7C385B0
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 22:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650665089;
 bh=zuNw6j1TShfoNbLYYIZxrZxreBGq9IdbmgqrCDzwCoE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GJHnYGm7kS7OYKfkAu61QcQIzQsPpKgiX8ZwFOEZB2cc8bdXfKuICeePb/LdLDWns
 VNg0u6qUYqau/LeOFrayBulaQJxkihHPe/A2FqLymKPNdePaoUDSIGdGevpo7L/zJM
 aFPhStRd09KzzfNR1joe6PwVDpjMzpbeziX7fgPmvokEvCi/0oFrjnwBTaaGfP/BOU
 IUNNTQDtVNPw7mpJSpA99kiRdBDjanYdKye5l82yB0eqq3zLotqrujW7fvCIf2Ejkd
 dAqJEF/tV2gwSfcpwtPVTrB+Lh9rnVah9UvWO9BhrH9MflpU1vh20qiOa/U8KRRaYH
 giaZNTf1zCHIw==
Received: by mail-wm1-f46.google.com with SMTP id y21so5842954wmi.2
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 15:04:49 -0700 (PDT)
X-Gm-Message-State: AOAM532womoUAlvBK6XPva+QA0s8L0haket09BP16kO0+xeWEgG8n2jI
 pRxfaeWq8732OPl1KJFh8F3XfPZfnYTRYP4Y2Ag=
X-Google-Smtp-Source: ABdhPJxxyzPCyBaxXq4e/OKv6ds/3UgnpcR0jFo6uX7QoEAMCxGf0GP6zkRcnylbgWRsSBmj2Bdv9puvN/pDeVMDIcQ=
X-Received: by 2002:a05:600c:4ed4:b0:392:90a5:b7e6 with SMTP id
 g20-20020a05600c4ed400b0039290a5b7e6mr15508304wmq.33.1650665087477; Fri, 22
 Apr 2022 15:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
In-Reply-To: <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 23 Apr 2022 00:04:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
Message-ID: <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
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

On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/22/22 12:16, Arnd Bergmann wrote:
> > On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Which machine did you hit this on? Is this on hardware or in qemu?
> >
> qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
> Also, I just noticed that the failure is not always the same.
> z2 fails to boot from initrd, and sx1 fails to boot completely.

That's a lot of machines failing, I hope at least we got the same bugs more
than once here.

For the I/O space, I found now that PXA was not using the standard
virtual I/O address yet, but instead used a NULL-based offset.

I'm not entirely happy with this patch, but this is an outline of what
I think we need to fix that: https://pastebin.com/3nVgQsEw
This one is probably incomplete, at least it breaks sa1100 for now,
and it adds a bogus CONFIG_PCI dependency. I'm also not sure
in what way the last patch in the series triggers it, rather than the
one that removed mach/io.h.

I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
If you have a custom config for this one, make sure you get the right
DEBUG_LL address.

> I'll do another round of bisects.

Thanks!

       Arnd
