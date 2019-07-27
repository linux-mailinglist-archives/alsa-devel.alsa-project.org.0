Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 488BC7763F
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 05:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 831E320A2;
	Sat, 27 Jul 2019 05:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 831E320A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564197725;
	bh=epjqkFBUnSxjsABKCGhSkorPH9ROAWoe2+N6+MxBN1s=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PPhKTy7pPnxi7l3lC6uih+YXoDqZOL14mlg7XihfnJNkuLYCDEXNzndeVNnfn9ALi
	 MaqJuYC0WgBceLNmhxeBUwJKs9p8zt3zpRQHxJ6kqcrENFTH69mgBDOp8xUJt7Zl+B
	 Zw1/MJ/7pfnQVL06cXtYLXjCFYIVUe4cgkHZtxOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABEA5F80134;
	Sat, 27 Jul 2019 05:20:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1685F80394; Sat, 27 Jul 2019 05:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45CB2F80134
 for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2019 05:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45CB2F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="ORUDr6Cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564197613; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYjAC67ZYcDwtcnIBpp0BzLOMVIg3F/G58/tAsJimxs=;
 b=ORUDr6CuY7vpgmdik7Ldm16UXWRFBr6Ee4ABQbj6tTfLvxBPwmhKA6bLpfcQxX+exzomjP
 TDrZy1fzdFeQCmOXR6cIQOjxRV8Q06DX/kYE2jocswD/4JlyOxJP5kSuaV94FjAfM/JVnu
 CJlyiJfb7/kikgxqr4FsYUPCYzzFns0=
Date: Fri, 26 Jul 2019 23:19:45 -0400
From: Paul Cercueil <paul@crapouillou.net>
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <1564197585.6472.0@crapouillou.net>
In-Reply-To: <20190726184649.GC14981@ravnborg.org>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190726184649.GC14981@ravnborg.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 00/11] JZ4740 SoC cleanup
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



Le ven. 26 juil. 2019 =E0 14:46, Sam Ravnborg <sam@ravnborg.org> a =

=E9crit :
> Hi Paul.
> =

> On Thu, Jul 25, 2019 at 06:02:04PM -0400, Paul Cercueil wrote:
>>  Hi,
>> =

>>  This patchset converts the Qi LB60 MIPS board to devicetree and =

>> makes it
>>  use all the shiny new drivers that have been developed or updated
>>  recently.
>> =

>>  All the crappy old drivers and custom code can be dropped since they
>>  have been replaced by better alternatives.
> =

> The overall diffstat is missing.
> Just for curiosity it would be nice to see what was dropped with this
> patch.
> =

> 	Sam

Diffstat:

 arch/mips/boot/dts/ingenic/jz4740.dtsi         |  84 ++++++++++++
 arch/mips/boot/dts/ingenic/qi_lb60.dts         | 295 =

++++++++++++++++++++++++++++++++++++++++-
 arch/mips/configs/qi_lb60_defconfig            |  44 +++---
 arch/mips/include/asm/mach-jz4740/gpio.h       |  15 ---
 arch/mips/include/asm/mach-jz4740/jz4740_fb.h  |  58 --------
 arch/mips/include/asm/mach-jz4740/jz4740_mmc.h |  12 --
 arch/mips/include/asm/mach-jz4740/platform.h   |  26 ----
 arch/mips/jz4740/Makefile                      |   7 +-
 arch/mips/jz4740/board-qi_lb60.c               | 491 =

-------------------------------------------------------------------
 arch/mips/jz4740/platform.c                    | 250 =

-----------------------------------
 arch/mips/jz4740/prom.c                        |   5 -
 arch/mips/jz4740/setup.c                       |   3 +-
 drivers/dma/Kconfig                            |   6 -
 drivers/dma/Makefile                           |   1 -
 drivers/dma/dma-jz4740.c                       | 623 =

---------------------------------------------------------------------------=
----------
 drivers/hwmon/Kconfig                          |  10 --
 drivers/hwmon/Makefile                         |   1 -
 drivers/hwmon/jz4740-hwmon.c                   | 135 =

-------------------
 drivers/mfd/Kconfig                            |   9 --
 drivers/mfd/Makefile                           |   1 -
 drivers/mfd/jz4740-adc.c                       | 324 =

---------------------------------------------
 drivers/mtd/nand/raw/ingenic/Kconfig           |   7 -
 drivers/mtd/nand/raw/ingenic/Makefile          |   1 -
 drivers/mtd/nand/raw/ingenic/jz4740_nand.c     | 536 =

--------------------------------------------------------------------------
 drivers/power/supply/Kconfig                   |  11 --
 drivers/power/supply/Makefile                  |   1 -
 drivers/power/supply/jz4740-battery.c          | 421 =

----------------------------------------------------------
 drivers/video/fbdev/Kconfig                    |   9 --
 drivers/video/fbdev/Makefile                   |   1 -
 drivers/video/fbdev/jz4740_fb.c                | 690 =

---------------------------------------------------------------------------=
--------------------
 sound/soc/jz4740/Kconfig                       |  25 +---
 sound/soc/jz4740/Makefile                      |   5 -
 sound/soc/jz4740/qi_lb60.c                     | 106 ---------------
 33 files changed, 404 insertions(+), 3809 deletions(-)



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
