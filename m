Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6650669183
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 09:46:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 773CEA4FE;
	Fri, 13 Jan 2023 09:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 773CEA4FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673599604;
	bh=nzEpF1FDU6wN9OHhmo7nQiBcpeENfEzXLRMXSl6MIIE=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UEKl51W5gkdUW0nRo37JsAkJnHxLMJW+W5DOuK43ASSRjMLPWPnjpUmeqHJDdXEtm
	 gfCyDouC/1su2/GiuuAFQcWQzkxHqlSkzNXloPtPgLSsZbOEB5+MO0xj2lsPr/vxZL
	 iaFRoV0uO3olO0LJ8cb9DeeW4Y4j1NzSIVJ1E1pQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF89F803DC;
	Fri, 13 Jan 2023 09:45:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E094BF803DC; Fri, 13 Jan 2023 09:45:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA1D6F8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA1D6F8019B
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id 88lL2900C4C55Sk018lL8t; Fri, 13 Jan 2023 09:45:40 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1pGFgd-003qP4-W0;
 Fri, 13 Jan 2023 09:45:19 +0100
Date: Fri, 13 Jan 2023 09:45:19 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/22] pinctrl: remove renesas sh controllers
In-Reply-To: <20230113062339.1909087-14-hch@lst.de>
Message-ID: <c480ecd6-166c-18b4-2230-418836ce3fb2@linux-m68k.org>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-14-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 	Hi Christoph,

On Fri, 13 Jan 2023, Christoph Hellwig wrote:
> Now that arch/sh is removed these drivers are dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/Kconfig
> +++ b/drivers/pinctrl/renesas/Kconfig
> @@ -255,57 +243,10 @@ config PINCTRL_RZV2M
> 	  This selects GPIO and pinctrl driver for Renesas RZ/V2M
> 	  platforms.
>
> -config PINCTRL_PFC_SH7203
> -	bool "pin control support for SH7203" if COMPILE_TEST
> -	select PINCTRL_SH_FUNC_GPIO

(If this is to be continued) the PINCTRL_SH_FUNC_GPIO symbol itself, and
all its users, can be removed, too.

> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -753,562 +753,6 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
> #define DEV_PM_OPS	NULL
> #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
>
> -#ifdef DEBUG
> -#define SH_PFC_MAX_REGS		300
> -#define SH_PFC_MAX_ENUMS	5000
> -

This whole hunk should stay (except for the part protected by #ifdef
CONFIG_PINCTRL_SH_FUNC_GPIO), as it is used for validating pin control
tables on ARM SoCs, too.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
