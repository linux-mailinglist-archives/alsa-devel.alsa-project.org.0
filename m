Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E332605DAB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF19D3FA1;
	Thu, 20 Oct 2022 12:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF19D3FA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666262452;
	bh=DWD/+a3tWspqd9R6eZBRIia+z4497qxbwbDyZj76oLI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DB6DnOQE6nYOzZ2UWCEn1nxpaEbYwYsAAyIcm6u2BCQlL5JpDva5EibdGmID/aw9j
	 CGcqKJp3mwcdCZYa1RGbRUFQdDj708lnTc3v6OnyWG+R7xdGmEOKyIF2LNqQg0anBn
	 XbVM7C0X9LyaTG7vaPBdweTtrBPbv0VKtQR8POqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC531F805EC;
	Thu, 20 Oct 2022 12:33:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52BE2F804D8; Thu, 20 Oct 2022 09:13:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C676F80137
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 09:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C676F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PMsAEFVD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2050461A2B;
 Thu, 20 Oct 2022 07:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6806C433D6;
 Thu, 20 Oct 2022 07:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666249983;
 bh=DWD/+a3tWspqd9R6eZBRIia+z4497qxbwbDyZj76oLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PMsAEFVD9WkedPvZ+l9oQhe6aKnlJ5QLEE/RAQL9Hdcc42aiZpvKQTxC305JfTGC7
 HIiBFiyvAsNadm37u8Hfx9NL0Nj1ovVYawfZFWjT1jHyBqLcaoEzE81tld4QRTQcRq
 1sNrMwbOaEFU4cFBzyCu2yq8+QF/+T8uUuezBvAaVCLvMo+hQZNXbbrO5Bt1qnKPOA
 g4FpFI4xvJ0seaFCmivcPDcVBVicUidY1B3W/JQo0AkYB93UbthGLj9zxp5tjjv3bX
 WHNv0zjG+ItGUccu+GqbSLjLpERRSZOjraiWPPAD9FrnYnJaB7fbLDBRWdnEJDSzbh
 r1FvJA9rT3QGg==
Date: Thu, 20 Oct 2022 08:12:50 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
Message-ID: <Y1D08tpbdE52x7hN@google.com>
References: <20221019161831.3864786-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019161831.3864786-1-arnd@kernel.org>
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:33:16 +0200
Cc: alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org, vigneshr@ti.com,
 viresh.kumar@linaro.org, linus.walleij@linaro.org, ulf.hansson@linaro.org,
 linux@dominikbrodowski.net, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, patches@opensource.cirrus.com,
 linux-mtd@lists.infradead.org, philipp.zabel@gmail.com,
 miquel.raynal@bootlin.com, damien.lemoal@opensource.wdc.com,
 Robert Jarzmik <robert.jarzmik@free.fr>, kernel@wantstofly.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, brgl@bgdev.pl,
 tiwai@suse.com, linux@armlinux.org.uk, marek.vasut@gmail.com,
 stern@rowland.harvard.edu, lost.distance@yahoo.com, slapin@ossfans.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-gpio@vger.kernel.org, broonie@kernel.org, sre@kernel.org,
 linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 balbi@kernel.org, mkpetch@internode.on.net, s.shtylyov@omp.ru,
 linux-ide@vger.kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, dmitry.torokhov@gmail.com,
 linux-mmc@vger.kernel.org, lgirdwood@gmail.com, sudipm.mukherjee@gmail.com,
 linux-renesas-soc@vger.kernel.org, gregkh@linuxfoundation.org,
 alsa-devel@alsa-project.org, deller@gmx.de, Daniel Mack <daniel@zonque.org>
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

On Wed, 19 Oct 2022, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most of the legacy PXA board files were marked as unused in linux-5.19 and
> can get removed in linux-6.2. There is support for pxa250/pxa270/pxa300
> using devicetree already, which supports a number of boards, but progress
> on converting the remaining ones has stalled over the past few years.
> 
> The two boards that are left in the tree for now are the three 'sharpsl'
> variants (spitz/akita/borzoi) and the 'gumstix' family of machines.
> Both of these are supported by qemu, which can be helpful for completing
> the DT conversion.
> 
> Only PXA25x and PXA27x are left with full boardfile support, so PXA300
> can get a lot simpler while still working with DT, and PXA310/320/93x
> can be removed entirely.
> 
> A good number of drivers become impossible to select after this, so
> each of these also get dropped. I'm including the driver patches in the
> series here and can either merge them through the soc tree, or they
> can get picked up by the individual subsystem maintainers. Since both
> the platform and the drivers get removed, the order should not matter.
> 
> Note that the patches here are generated with 'git format-patch -D'
> and don't contain the contents of removed files because of the
> significant size (the first patch is close to a megabyte).
> 
> Arnd Bergmann (30):
>   ARM: pxa: remove unused board files
>   ARM: pxa: remove irda leftover
>   ARM: pxa: remove unused pxa3xx-ulpi
>   ARM: pxa: drop pxa310/pxa320/pxa93x support
>   ARM: pxa: prune unused device support
>   power: remove z2_battery driver
>   power: remove tosa_battery driver
>   ata: remove palmld pata driver
>   backlight: remove pxa tosa support
>   input: remove pxa930_trkball driver
>   input: remove pxa930_rotary keyboard driver
>   input: remove zylonite touchscreen driver
>   pcmcia: remove unused pxa/sa1100 drivers
>   ASoC: pxa: remove unused board support
>   ALSA: remove ac97 bus support
>   mfd: remove wm97xx driver
>   input: remove wm97xx support
>   parport: remove ax88796 driver
>   power: remove pda_power supply driver
>   rtc: remove v3020 driver
>   mfd: remove toshiba tmio drivers
>   mfd: remove ucb1400 support
>   mtd: remove tmio_nand driver
>   mmc: remove tmio_mmc driver
>   fbdev: remove tmiofb driver
>   fbdev: remove w100fb driver
>   leds: remove asic3 driver
>   usb: remove ohci-tmio driver
>   w1: remove ds1wm driver
>   mfd: remove htc-pasic3 driver

Are you sure these went out?

They do not appear to be in my inbox, nor lore.

-- 
Lee Jones [李琼斯]
