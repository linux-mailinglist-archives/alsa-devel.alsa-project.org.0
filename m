Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25979D38F0
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 07:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734D21654;
	Fri, 11 Oct 2019 07:53:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734D21654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570773279;
	bh=AcxECySIgMiLw0J6MH1xh2Gl7SH8T1hwR/dfKQQv18k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pd3iicq4NRB8Umxv9802JR4rqCsGQHGHNmKoHiejAZWn+/+oQtaxK4Hyh3t9yXZOy
	 N4w2RuNhYsokU9kcdXSgAfYL8DFAerTqX+69/vzsHnWiutCk4aX4fH3pMO4aLZxQnh
	 9zF0YTM5HTOuFHm98cbyt/hUl46fwgPrI3tylLMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91677F802BD;
	Fri, 11 Oct 2019 07:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D53C9F802BE; Fri, 11 Oct 2019 07:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 696D2F80113
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 07:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 696D2F80113
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iInqC-0008KX-1r; Fri, 11 Oct 2019 07:51:52 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iInq9-0001Vy-3U; Fri, 11 Oct 2019 07:51:49 +0200
Date: Fri, 11 Oct 2019 07:51:49 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191011055149.4dudr4tk2znpt65u@pengutronix.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-11-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010203043.1241612-11-arnd@arndb.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linus.walleij@linaro.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-pwm@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-spi@vger.kernel.org,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Oct 10, 2019 at 10:29:55PM +0200, Arnd Bergmann wrote:
> These can be build completely independently, so split
> the two Kconfig symbols.
> =

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I'd mention the two symbols' names you're working on in the commit log.
I guess it's about PLAT_SAMSUNG and ARCH_S5PV210. And I wouldn't call it
"split" which IMHO suggests there was only one symbol before.

Maybe:

	Don't imply PLAT_SAMSUNG if ARCH_S5PV210 is enabled

would be a better subject line?

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
> =

> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 9c4f2d6deb06..4c4e97ae4fcb 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -998,7 +998,7 @@ choice
>  		  via SCIFA4 on Renesas SH-Mobile AG5 (SH73A0).
>  =

>  	config DEBUG_S3C_UART0
> -		depends on PLAT_SAMSUNG || ARCH_EXYNOS
> +		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
>  		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>  		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
>  		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
> @@ -1010,7 +1010,7 @@ choice
>  		  by the boot-loader before use.
>  =

>  	config DEBUG_S3C_UART1
> -		depends on PLAT_SAMSUNG || ARCH_EXYNOS
> +		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
>  		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>  		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
>  		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
> @@ -1022,7 +1022,7 @@ choice
>  		  by the boot-loader before use.
>  =

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
> @@ -235,7 +235,6 @@ machine-$(CONFIG_PLAT_SPEAR)		+=3D spear
>  # by CONFIG_* macro name.
>  plat-$(CONFIG_ARCH_OMAP)	+=3D omap
>  plat-$(CONFIG_ARCH_S3C64XX)	+=3D samsung
> -plat-$(CONFIG_ARCH_S5PV210)	+=3D samsung

Would it make more sense to make this

	plat-$(PLAT_SAMSUNG) +=3D samsung

(in a separate patch)? Hmm, it seems there is no plat-y for
PLAT_S3C24XX=3Dy builds. Is this intended? If yes, the directory name
containing "samsung" suggests something that seems untrue.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
