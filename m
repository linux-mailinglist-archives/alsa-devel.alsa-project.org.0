Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB1605DA0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80CAD54AA;
	Thu, 20 Oct 2022 12:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80CAD54AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666262435;
	bh=kubHLafIrz0RpDb3CGgNiLVyMIsY49HSnQVqbHWTqCM=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HXytGZF6CyyogLHZT6AfOIJn3eUBDew+unmj6mwAkBkgR+wAKIM841EMVelVlrZ1R
	 4t7dpRZHgKTAU3ny3Gq1+gBbLEpUxt5DFrBdoW6Xs5CVcJnuQspWh4j1XglpWDArEr
	 zx86Z1+8tvPBNXOEeM3ELMJSUm1SqnMebp9cBSGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77144F805E8;
	Thu, 20 Oct 2022 12:33:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ED5BF80166; Wed, 19 Oct 2022 23:13:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FROM, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr
 [80.12.242.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F0CBF80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 23:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F0CBF80137
Received: from sopl295.home ([109.220.248.156]) by smtp.orange.fr with ESMTPA
 id lGNoo1NB2g7y2lGNpocFOd; Wed, 19 Oct 2022 23:13:51 +0200
X-ME-Helo: sopl295.home
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 19 Oct 2022 23:13:51 +0200
X-ME-IP: 109.220.248.156
From: Robert Jarzmik <jarzmik.robert@orange.fr>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
In-Reply-To: <20221019161831.3864786-1-arnd@kernel.org> (Arnd Bergmann's
 message of "Wed, 19 Oct 2022 18:17:53 +0200")
References: <20221019161831.3864786-1-arnd@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (darwin)
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 19 Oct 2022 23:13:48 +0200
Message-ID: <m2r0z3h5yr.fsf@sopl295.home>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:33:16 +0200
Cc: alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org, vigneshr@ti.com,
 lgirdwood@gmail.com, viresh.kumar@linaro.org, linus.walleij@linaro.org,
 ulf.hansson@linaro.org, linux@dominikbrodowski.net,
 wsa+renesas@sang-engineering.com, patches@opensource.cirrus.com,
 linux-mtd@lists.infradead.org, philipp.zabel@gmail.com,
 miquel.raynal@bootlin.com, damien.lemoal@opensource.wdc.com,
 kernel@wantstofly.org, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 brgl@bgdev.pl, lee@kernel.org, linux@armlinux.org.uk, marek.vasut@gmail.com,
 stern@rowland.harvard.edu, lost.distance@yahoo.com, slapin@ossfans.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-gpio@vger.kernel.org, broonie@kernel.org, sre@kernel.org,
 linux-fbdev@vger.kernel.org, tiwai@suse.com,
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org,
 mkpetch@internode.on.net, s.shtylyov@omp.ru, linux-ide@vger.kernel.org,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 dmitry.torokhov@gmail.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, sudipm.mukherjee@gmail.com,
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
...zip...

> A good number of drivers become impossible to select after this, so
> each of these also get dropped. I'm including the driver patches in the
> series here and can either merge them through the soc tree, or they
> can get picked up by the individual subsystem maintainers. Since both
> the platform and the drivers get removed, the order should not matter.
This part is a bit ... bothering.
I at least identified these :
>  delete mode 100644 drivers/input/touchscreen/wm9705.c
>  delete mode 100644 drivers/input/touchscreen/wm9712.c
>  delete mode 100644 drivers/input/touchscreen/wm9713.c
>  delete mode 100644 drivers/input/touchscreen/wm97xx-core.c
>  delete mode 100644 drivers/mfd/wm97xx-core.c
>  delete mode 100644 sound/ac97/bus.c
>  delete mode 100644 sound/ac97/codec.c
>  delete mode 100644 sound/ac97/snd_ac97_compat.c

For the existing platforms working with devicetree support (mioa701 for
example), the wm9713 was properly used, providing both sound support and input
touchscreen.
So was the a97 part, providing a framework to make the wm9713 work.

So I'm wondering how the choice to chop these drivers was done, and it is
necessary to remove them. If so, maybe pxa support in the kernel should be
removed all together, as people playing with it loose part of the working DT
platforms they had.

As for the removal of defconfigs and arch-pxa, sure, this was PXA's destiny.

Cheers.

--
Robert

PS: If this mail is sent twice, sorry in advance, my mailer is a bad mood
lately.
