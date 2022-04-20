Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 316BC50B923
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5D4F16D6;
	Fri, 22 Apr 2022 15:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5D4F16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635518;
	bh=pG5+4DOhb77nxWdlxKIwePzqBZZNEvREIpUNdNpZjmI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5L1gyJz8grfI0LmSlpQto5jx4vjFRoPxSOPSESgMuqr4N1Xucyp/nQ70Q+na+goa
	 KK8jkL3QxXYSQ9e1KgKb6eKNDbrnCUSDrPF8kh/11bhpMwls1uEB+IGJ9AYxmuggDX
	 I1lY/mILNjwGunf6U7/iGExs/WaA1A3B325XIlAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38BBBF80852;
	Fri, 22 Apr 2022 15:32:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 742F0F800F8; Wed, 20 Apr 2022 15:46:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DAAFF800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 15:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DAAFF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="TWxI7Ho2"
Received: from darkstar.musicnaut.iki.fi (85-76-69-216-nat.elisa-mobile.fi
 [85.76.69.216])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id AD3B7205A6;
 Wed, 20 Apr 2022 16:46:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1650462379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPdeBaZ6eVr/qRTevscI2sSHgl9RZPmaXc8iV1TPOYQ=;
 b=TWxI7Ho2RtsaPS6MDuk2M+E+sq1KJYxSGS4DmJDZp6BP1taIQkAU15m6enkHBtGqJiUXvp
 lXQHG+v4JXQrypyUiMgoBHrh9vRs0uJa78N5cmw1Dkb39AobNvcLF22yj6OlonUngPVdl9
 hg/zZ4gRXP0aP/DTuM9FEXSAfDl6JAk=
Date: Wed, 20 Apr 2022 16:46:15 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 26/41] ARM: omap1: relocate static I/O mapping
Message-ID: <20220420134615.GA1947@darkstar.musicnaut.iki.fi>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-27-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-27-arnd@kernel.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1650462379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPdeBaZ6eVr/qRTevscI2sSHgl9RZPmaXc8iV1TPOYQ=;
 b=H/ymb4ClmH02P6z9wJPj5hwDvA4ML4CAqvyTrTXpyzakXMrwIF7fhncpTt2p+tyb+n415S
 rXswuQZfImMNpPXfbjLG2A2bYft152C7y10qe9zeKLi8GlOcXPiCV9y/0Eijq+J6KgXV6K
 JExPxjG2F+njcVYYdJlNrzaNBE0jppU=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1650462379; a=rsa-sha256; cv=none;
 b=CVy72ecIkI6wF0iqwa+Xy91DJU3aDMoxGNfzuIx9Vt1gzOxFw+Q04asMI9whLP3P8s501X
 P2eVWVYDpVAr6tfbV1PJEm52Z8VQMrb77N573CgDjOg+UHf97HnYPA9FH0wGgHHkmeXpu6
 wtihpIfPU1zC4kkQJy4ZZuJBXIgiXlA=
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 tony@atomide.com, Linus Walleij <linus.walleij@linaro.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
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

Hi,

On Tue, Apr 19, 2022 at 03:37:08PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The address range 0xfee00000-0xfeffffff is used for PCI and
> PCMCIA I/O port mappings, but OMAP1 has its static mappings
> there as well.
> 
> Move the OMAP1 addresses a little higher to avoid crashing
> at boot.

This has the same problem I reported in 2019, with earlyprintk the
system no longer boots:

	https://marc.info/?t=156530014200005&r=1&w=2

Tested on OSK and SX1/qemu.

A.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig.debug                      | 6 +++---
>  arch/arm/mach-omap1/include/mach/hardware.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 0c9497d549e3..f57b449000f7 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -1837,9 +1837,9 @@ config DEBUG_UART_VIRT
>  	default 0xfec00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
>  	default 0xfec00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
>  	default 0xfef36000 if DEBUG_HIGHBANK_UART
> -	default 0xfefb0000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
> -	default 0xfefb0800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
> -	default 0xfefb9800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
> +	default 0xff000000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
> +	default 0xff000800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
> +	default 0xff009800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
>  	default 0xffd01000 if DEBUG_HIP01_UART
>  	default DEBUG_UART_PHYS if !MMU
>  	depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
> diff --git a/arch/arm/mach-omap1/include/mach/hardware.h b/arch/arm/mach-omap1/include/mach/hardware.h
> index 05c5cd3e95f4..e3522e601ccd 100644
> --- a/arch/arm/mach-omap1/include/mach/hardware.h
> +++ b/arch/arm/mach-omap1/include/mach/hardware.h
> @@ -63,7 +63,7 @@ static inline u32 omap_cs3_phys(void)
>  
>  #endif	/* ifndef __ASSEMBLER__ */
>  
> -#define OMAP1_IO_OFFSET		0x01000000	/* Virtual IO = 0xfefb0000 */
> +#define OMAP1_IO_OFFSET		0x00fb0000	/* Virtual IO = 0xff000000 */
>  #define OMAP1_IO_ADDRESS(pa)	IOMEM((pa) - OMAP1_IO_OFFSET)
>  
>  #include <mach/serial.h>
> -- 
> 2.29.2
> 
