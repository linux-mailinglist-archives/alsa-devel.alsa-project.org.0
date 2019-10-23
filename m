Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628BBE19C7
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 14:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8F8F1658;
	Wed, 23 Oct 2019 14:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8F8F1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571833013;
	bh=Vgh4Q5YrZl3eYQRqZ6R6xVPABRyBKjTsBMBl3WeysZ8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rL66GtEEcfEEH7jfK//h7hpEjhhqf4h6w68QZktPHPP6thFUDm7nVGKzb6LKoC5o8
	 lRlxF50G/KmktZxFnmkoQlZ+tNz/ZFruA3Q7Itp7gT/s0BlO8D9ql6psLIbH+Ya4hh
	 oS2yN7ZwTih3+VplfN7/ZXPzgfUfmSOs+gRECqNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AEEFF80368;
	Wed, 23 Oct 2019 14:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38EDDF80368; Wed, 23 Oct 2019 14:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9383F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 14:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9383F80112
Received: by mail-ed1-f65.google.com with SMTP id c4so15583362edl.0
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 05:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EM2bqpofr7QfnOYg3+B2AOXvOUUZQ5S8Y8TJAmAFfq0=;
 b=C+ZkP7y+G2E1I3d4L569X0qTvwMbo2+aJHnOMLZAYKk4BunkolsUQdWxxQ0O6gLmbv
 aX10kM1DmLXNr2lygtU8CCBzKWTl4npjLdj3REFFmEUdzS/iK9SbRq8Skf6ge+nKyAwE
 hcGFioMGkkm+0axu5H2Td2CwpeUm+QaFj8pdDeA0XyD+71jAGmwd8wl3RaTkwvfU21y1
 n6EsYHpWHPCOfB/9jpDZoCQPfbFQYefxJkAs8EtLCWqBR4/6eMFttEV6eHy/ibo5b2y2
 msHNJB0jmudCHraBRV4c7QYaXTVe5ddtaGKJZj9DcIGA7dSgmhBp1qAHEx7Ukj49jFR0
 KOlw==
X-Gm-Message-State: APjAAAUCO2d0oTreYjp6ykZPScoEH4ZaCdVIrttm53kd+KL4JRE3GDUx
 JAkaaSq2L7f1hvP3e1g3atM=
X-Google-Smtp-Source: APXvYqzMHg39Wi2a6r4kf+i1HiG2eaoZDJ9aezTMqReWB2uYi5hp2/274lnrfoQNk4EHNQ+xelbuwA==
X-Received: by 2002:a17:906:a0f:: with SMTP id
 w15mr12009761ejf.321.1571832902425; 
 Wed, 23 Oct 2019 05:15:02 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
 by smtp.googlemail.com with ESMTPSA id r16sm760759eds.72.2019.10.23.05.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 05:15:01 -0700 (PDT)
Date: Wed, 23 Oct 2019 14:14:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191023121458.GB11048@pi3>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-11-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010203043.1241612-11-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linus.walleij@linaro.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Kukjin Kim <kgene@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 linux-serial@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jiri Slaby <jslaby@suse.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Faiz Abbas <faiz_abbas@ti.com>, Olof Johansson <olof@lixom.net>
Subject: Re: [alsa-devel] [PATCH 11/36] ARM: s5pv210: split from plat-samsung
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Oct 10, 2019 at 10:29:55PM +0200, Arnd Bergmann wrote:
> These can be build completely independently, so split
> the two Kconfig symbols.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig.debug        | 6 +++---
>  arch/arm/Makefile             | 1 -
>  arch/arm/plat-samsung/Kconfig | 2 +-
>  drivers/mmc/host/Kconfig      | 2 +-
>  drivers/pwm/Kconfig           | 2 +-
>  drivers/spi/Kconfig           | 2 +-
>  drivers/tty/serial/Kconfig    | 2 +-
>  sound/soc/samsung/Kconfig     | 2 +-
>  8 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 9c4f2d6deb06..4c4e97ae4fcb 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -998,7 +998,7 @@ choice
>  		  via SCIFA4 on Renesas SH-Mobile AG5 (SH73A0).
>  
>  	config DEBUG_S3C_UART0
> -		depends on PLAT_SAMSUNG || ARCH_EXYNOS
> +		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS

How are you going to select DEBUG_S5PV210_UART now?

Best regards,
Krzysztof


>  		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>  		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
>  		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
> @@ -1010,7 +1010,7 @@ choice
>  		  by the boot-loader before use.
>  
>  	config DEBUG_S3C_UART1
> -		depends on PLAT_SAMSUNG || ARCH_EXYNOS
> +		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
>  		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>  		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
>  		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
> @@ -1022,7 +1022,7 @@ choice
>  		  by the boot-loader before use.
>  
>  	config DEBUG_S3C_UART2
> -		depends on PLAT_SAMSUNG || ARCH_EXYNOS
> +		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
>  		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>  		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
>  		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index f492d7c338fe..a1bc15cda751 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -235,7 +235,6 @@ machine-$(CONFIG_PLAT_SPEAR)		+= spear
>  # by CONFIG_* macro name.
>  plat-$(CONFIG_ARCH_OMAP)	+= omap
>  plat-$(CONFIG_ARCH_S3C64XX)	+= samsung
> -plat-$(CONFIG_ARCH_S5PV210)	+= samsung
>  plat-$(CONFIG_PLAT_ORION)	+= orion
>  plat-$(CONFIG_PLAT_PXA)		+= pxa
>  plat-$(CONFIG_PLAT_S3C24XX)	+= samsung
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 740bdb23f38a..1530946cc672 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -4,7 +4,7 @@
>  
>  config PLAT_SAMSUNG
>  	bool
> -	depends on PLAT_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
> +	depends on PLAT_S3C24XX || ARCH_S3C64XX
>  	default y
>  	select GENERIC_IRQ_CHIP
>  	select NO_IOPORT_MAP
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 400a581c918c..16a0e5430b44 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -275,7 +275,7 @@ config MMC_SDHCI_TEGRA
>  
>  config MMC_SDHCI_S3C
>  	tristate "SDHCI support on Samsung S3C SoC"
> -	depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_EXYNOS)
> +	depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS)
>  	help
>  	  This selects the Secure Digital Host Controller Interface (SDHCI)
>  	  often referrered to as the HSMMC block in some of the Samsung S3C
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index e3a2518503ed..8eb738cac0c7 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -394,7 +394,7 @@ config PWM_ROCKCHIP
>  
>  config PWM_SAMSUNG
>  	tristate "Samsung PWM support"
> -	depends on PLAT_SAMSUNG || ARCH_EXYNOS
> +	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
>  	help
>  	  Generic PWM framework driver for Samsung.
>  
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 6f7fdcbb9151..355391ee643d 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -625,7 +625,7 @@ config SPI_S3C24XX_FIQ
>  
>  config SPI_S3C64XX
>  	tristate "Samsung S3C64XX series type SPI"
> -	depends on (PLAT_SAMSUNG || ARCH_EXYNOS || COMPILE_TEST)
> +	depends on (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST)
>  	help
>  	  SPI driver for Samsung S3C64XX and newer SoCs.
>  
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 4789b5d62f63..17f01cf3009c 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -237,7 +237,7 @@ config SERIAL_CLPS711X_CONSOLE
>  
>  config SERIAL_SAMSUNG
>  	tristate "Samsung SoC serial support"
> -	depends on PLAT_SAMSUNG || ARCH_EXYNOS
> +	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
>  	select SERIAL_CORE
>  	help
>  	  Support for the on-chip UARTs on the Samsung S3C24XX series CPUs,
> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> index 638983123d8f..7a0035dd9995 100644
> --- a/sound/soc/samsung/Kconfig
> +++ b/sound/soc/samsung/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig SND_SOC_SAMSUNG
>  	tristate "ASoC support for Samsung"
> -	depends on PLAT_SAMSUNG || ARCH_EXYNOS || COMPILE_TEST
> +	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>  	depends on COMMON_CLK
>  	select SND_SOC_GENERIC_DMAENGINE_PCM
>  	---help---
> -- 
> 2.20.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
