Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE3C50B914
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 410B516BF;
	Fri, 22 Apr 2022 15:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 410B516BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635421;
	bh=KKbVILJHDOZ2N6m0wCdUFAHCkLkQrMH0aZI7ADXChcU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XO6tppZXvyMG+e0xAi4TPuXYYkNrBFjNgfGH1ZB30M8Lq82xjUL24OjfehdAWIV68
	 SBNZZkyza4fZhlf5BWSgBWPTr3KSDPY6VK9SKlVZXcjgnmy51wE0RZfMqTAXfCmp4n
	 hgUQHJXARRFBuopUYux5q8vOZMD6cZrviEjD0mH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 439D4F80805;
	Fri, 22 Apr 2022 15:32:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 904D5F8025D; Wed, 20 Apr 2022 01:55:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B7DEF800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 01:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B7DEF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.b="eOMVQ+cw"; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.b="nblcqlKO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650412551; x=1681948551;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KKbVILJHDOZ2N6m0wCdUFAHCkLkQrMH0aZI7ADXChcU=;
 b=eOMVQ+cwwE9HVMUlo81oXXO+V1nQybzYC1RFCZc6mBeUffMXJ8OlvKTl
 nrA+YfPvnnhByF4WnE76sfstBwtTR9dlT3ZbNxAMDkwhjrqdYajUtnzkC
 Tt8Kh6bo2y3zBHPx13m5dVniC8h1uX2LpAVR+d3R8znKwUYsorhDTM+pR
 5hindj1ewvWFGpHAkluWJhwhD3o6kAYLsL+edOvdKsdPNZY4Sf/TW1XPQ
 WlxpsMrxgA5anvgSF25/LGa4dezSV0Wuc+Hj6wWzhGnEros5ha/gvg4ou
 RYzsWu/MjXqj/YAE6pXTNKOquupZIfV/MOwduBMf0E2WPxMuVs/OIgfpf Q==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="203172679"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 07:55:46 +0800
IronPort-SDR: CRKsPpWO1KMcpIDlEp3ybxn0eINP2wyHcgLeMq2fZ2gHhmdjpb3EcbdWolSXys0DUQuYy/g+Fv
 PS0ByAdvp9jwcw4JqRRgI5igELTRW4YjGisxJkKmtYTr65pDt31d5NQDJ2lSzZh/RkRKdjm0Gc
 F9KWym6pUWdJLX+YGCumyUifjJx/ENRbpbAjs9W/srH8MByVWJ89xKpdcO9vl0Oey+rHjezTQm
 oEkYjDgAY26C/AVD/4uCwyQTvJet+p7kGNigleGO0bPkx0jpHdf/GWiObrq9pnhYyP+xwugGu6
 3gVEJ1AkF1bVCGWOORNhPKei
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 16:26:51 -0700
IronPort-SDR: wHbFnT8BqxoH51NFqQiAjwWfniqliuANOWnPBT8i6QiPfQcbNnSEPEmtBYLglpCNl8ahVjLP4k
 PjD6tF0pu6CDAJIbNaqpLa+rqwT4w7Mbj7oNE2f3Foe2vRf1Rq1uI3VmuLakCzNfhcyxybfrgL
 nNU6ZN/AnbesbW+CmFMi20ktHdUx+2QfjPGwWXLklqmPs06llSRXaXUwxIGoKOidT5rGJtH1o7
 qcgw3JJF1PI1FA2itKemFwm8Fx6DkztyZAfP2m6xT+gXeJw+8vBQA5Ynifmw1hDhelDU1Mys5V
 MrM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 16:55:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kjgfn4cRKz1Rwrw
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 16:55:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1650412544; x=1653004545; bh=KKbVILJHDOZ2N6m0wCdUFAHCkLkQrMH0aZI
 7ADXChcU=; b=nblcqlKOmUB0qKCRf+Y7ExFS8tU5pu91ghv6T/1gWDqRbLaf42j
 Nsz1XmPlU/TXyOPOeTaOtzefrHHX24uvIISUzkQoWqfKdSenWQ3fCV50hBLnE6Ne
 JbJS7gQHG1DsYyIBXpQqZItnSVC+tl95ovAphhPBRIYqrIYDjL8glWm4tmrYDgMF
 h0XG3wmiE1ZWskFqTtMZReJahvWPp38V9Y9AFgYrUQHGoDoPftATuWqtvxPTxJ+d
 SGqaF/b7GFT3NU1+AWk+ZS9ff28EWUr91AkNyJv3eh4duVo8YcfOwtAlmkXmbpDa
 uHXkBf6lCpt/JPj2u0te17PgHUZGADAE/Rw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id MXMgSegGmmbF for <alsa-devel@alsa-project.org>;
 Tue, 19 Apr 2022 16:55:44 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kjgff0k5zz1Rvlx;
 Tue, 19 Apr 2022 16:55:37 -0700 (PDT)
Message-ID: <56f889d7-2305-ba7a-42af-9580d8f7df93@opensource.wdc.com>
Date: Wed, 20 Apr 2022 08:55:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 13/48] ARM: pxa: use pdev resource for palmld mmio
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, robert.jarzmik@free.fr,
 linux-arm-kernel@lists.infradead.org
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-14-arnd@kernel.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220419163810.2118169-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
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

On 4/20/22 01:37, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The palmld header is almost unused in drivers, the only
> remaining thing now is the PATA device address, which should
> really be passed as a resource.
> 
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: linux-ide@vger.kernel.org
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-pxa/palmld-pcmcia.c             |  3 ++-
>  arch/arm/mach-pxa/palmld.c                    | 12 +++++++++---
>  arch/arm/mach-pxa/{include/mach => }/palmld.h |  2 +-
>  drivers/ata/pata_palmld.c                     |  3 +--
>  4 files changed, 13 insertions(+), 7 deletions(-)
>  rename arch/arm/mach-pxa/{include/mach => }/palmld.h (98%)
> 
> diff --git a/arch/arm/mach-pxa/palmld-pcmcia.c b/arch/arm/mach-pxa/palmld-pcmcia.c
> index 07e0f7438db1..720294a50864 100644
> --- a/arch/arm/mach-pxa/palmld-pcmcia.c
> +++ b/arch/arm/mach-pxa/palmld-pcmcia.c
> @@ -13,9 +13,10 @@
>  #include <linux/gpio.h>
>  
>  #include <asm/mach-types.h>
> -#include <mach/palmld.h>
>  #include <pcmcia/soc_common.h>
>  
> +#include "palmld.h"
> +
>  static struct gpio palmld_pcmcia_gpios[] = {
>  	{ GPIO_NR_PALMLD_PCMCIA_POWER,	GPIOF_INIT_LOW,	"PCMCIA Power" },
>  	{ GPIO_NR_PALMLD_PCMCIA_RESET,	GPIOF_INIT_HIGH,"PCMCIA Reset" },
> diff --git a/arch/arm/mach-pxa/palmld.c b/arch/arm/mach-pxa/palmld.c
> index d85146957004..d821606ce0b5 100644
> --- a/arch/arm/mach-pxa/palmld.c
> +++ b/arch/arm/mach-pxa/palmld.c
> @@ -29,8 +29,8 @@
>  #include <asm/mach/map.h>
>  
>  #include "pxa27x.h"
> +#include "palmld.h"
>  #include <linux/platform_data/asoc-pxa.h>
> -#include <mach/palmld.h>
>  #include <linux/platform_data/mmc-pxamci.h>
>  #include <linux/platform_data/video-pxafb.h>
>  #include <linux/platform_data/irda-pxaficp.h>
> @@ -279,9 +279,15 @@ static inline void palmld_leds_init(void) {}
>   * HDD
>   ******************************************************************************/
>  #if defined(CONFIG_PATA_PALMLD) || defined(CONFIG_PATA_PALMLD_MODULE)
> +static struct resource palmld_ide_resources[] = {
> +	DEFINE_RES_MEM(PALMLD_IDE_PHYS, 0x1000),
> +};
> +
>  static struct platform_device palmld_ide_device = {
> -	.name	= "pata_palmld",
> -	.id	= -1,
> +	.name		= "pata_palmld",
> +	.id		= -1,
> +	.resource	= palmld_ide_resources,
> +	.num_resources	= ARRAY_SIZE(palmld_ide_resources),
>  };
>  
>  static struct gpiod_lookup_table palmld_ide_gpio_table = {
> diff --git a/arch/arm/mach-pxa/include/mach/palmld.h b/arch/arm/mach-pxa/palmld.h
> similarity index 98%
> rename from arch/arm/mach-pxa/include/mach/palmld.h
> rename to arch/arm/mach-pxa/palmld.h
> index 99a6d8b3a1e3..ee3bc15b71a2 100644
> --- a/arch/arm/mach-pxa/include/mach/palmld.h
> +++ b/arch/arm/mach-pxa/palmld.h
> @@ -9,7 +9,7 @@
>  #ifndef _INCLUDE_PALMLD_H_
>  #define _INCLUDE_PALMLD_H_
>  
> -#include "irqs.h" /* PXA_GPIO_TO_IRQ */
> +#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
>  
>  /** HERE ARE GPIOs **/
>  
> diff --git a/drivers/ata/pata_palmld.c b/drivers/ata/pata_palmld.c
> index 2448441571ed..400e65190904 100644
> --- a/drivers/ata/pata_palmld.c
> +++ b/drivers/ata/pata_palmld.c
> @@ -25,7 +25,6 @@
>  #include <linux/gpio/consumer.h>
>  
>  #include <scsi/scsi_host.h>
> -#include <mach/palmld.h>
>  
>  #define DRV_NAME "pata_palmld"
>  
> @@ -63,7 +62,7 @@ static int palmld_pata_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	/* remap drive's physical memory address */
> -	mem = devm_ioremap(dev, PALMLD_IDE_PHYS, 0x1000);
> +	mem = devm_platform_ioremap_resource(pdev, 0);
>  	if (!mem)
>  		return -ENOMEM;
>  

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
