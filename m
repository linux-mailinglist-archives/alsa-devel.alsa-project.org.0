Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D881506EF0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:50:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F01B61AE1;
	Tue, 19 Apr 2022 15:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F01B61AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376247;
	bh=++wgzzP18IgZjv9gq3IHjeFk3mw3AxMESGKM1bss8GE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jWcW1XzixGgZzvgyhq8Ww/6k3geiAG+zyWn8QnoVmDdAO799sXp0cHqgDtr37k52N
	 2xmhxU1N9qnVeqfrnJwKBeOyQsWbNyLQG3qe5RnrCndBI6exi72CCFyL3Esy9hLJRs
	 TEVhbBsWQzKcdSLepgsl7L4HjQJVFWgtAMj7wxdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E9C8F805C3;
	Tue, 19 Apr 2022 15:43:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBADDF8025D; Tue, 19 Apr 2022 15:41:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67BC1F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67BC1F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t77plAsS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A52F616A7;
 Tue, 19 Apr 2022 13:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD49CC385AA;
 Tue, 19 Apr 2022 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375652;
 bh=++wgzzP18IgZjv9gq3IHjeFk3mw3AxMESGKM1bss8GE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t77plAsS6dzi52zALntxTrIsGvlZ7TVWnBbbBL6BHh9HDB22Vsg+GSU1TUGr/L7yo
 4VED/jnUp/m/iprQbhEzkF/oCLBhn5mjye8/COB4ccOhKBk+sJixyUn/j4z5hhYvAS
 fOMPXYC1p6lswgiO83CT8qRkpbcih1isQSb5qwxzvrTQT+MaBaR+iH3FJlzRpZeFL+
 xLv4MH8XhKivg2WwM9SJ6+BOtF2fIbLSMuGDS0PC2ZNc4r0d6HSPSj40prxX3RgJXN
 wDqi6ESmFTYAF/uvoZWrHFUtV7uChc7cszyCFCMHFQ8dub8SswJUKqRzrKaa1+D2F9
 cs9GhVWEGvR5A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 26/41] ARM: omap1: relocate static I/O mapping
Date: Tue, 19 Apr 2022 15:37:08 +0200
Message-Id: <20220419133723.1394715-27-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 15:43:16 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
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

From: Arnd Bergmann <arnd@arndb.de>

The address range 0xfee00000-0xfeffffff is used for PCI and
PCMCIA I/O port mappings, but OMAP1 has its static mappings
there as well.

Move the OMAP1 addresses a little higher to avoid crashing
at boot.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig.debug                      | 6 +++---
 arch/arm/mach-omap1/include/mach/hardware.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 0c9497d549e3..f57b449000f7 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1837,9 +1837,9 @@ config DEBUG_UART_VIRT
 	default 0xfec00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
 	default 0xfec00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
 	default 0xfef36000 if DEBUG_HIGHBANK_UART
-	default 0xfefb0000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
-	default 0xfefb0800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
-	default 0xfefb9800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
+	default 0xff000000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
+	default 0xff000800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
+	default 0xff009800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
 	default 0xffd01000 if DEBUG_HIP01_UART
 	default DEBUG_UART_PHYS if !MMU
 	depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
diff --git a/arch/arm/mach-omap1/include/mach/hardware.h b/arch/arm/mach-omap1/include/mach/hardware.h
index 05c5cd3e95f4..e3522e601ccd 100644
--- a/arch/arm/mach-omap1/include/mach/hardware.h
+++ b/arch/arm/mach-omap1/include/mach/hardware.h
@@ -63,7 +63,7 @@ static inline u32 omap_cs3_phys(void)
 
 #endif	/* ifndef __ASSEMBLER__ */
 
-#define OMAP1_IO_OFFSET		0x01000000	/* Virtual IO = 0xfefb0000 */
+#define OMAP1_IO_OFFSET		0x00fb0000	/* Virtual IO = 0xff000000 */
 #define OMAP1_IO_ADDRESS(pa)	IOMEM((pa) - OMAP1_IO_OFFSET)
 
 #include <mach/serial.h>
-- 
2.29.2

