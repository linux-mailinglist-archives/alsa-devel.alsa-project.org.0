Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F1506EFA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:52:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70721B12;
	Tue, 19 Apr 2022 15:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70721B12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376372;
	bh=tnWw7oBH8X/XBSc06dB4T/Xrxth9FWCIgmXAbL0gUiI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZF4+GvU2q7zKqFO6WSecNJU89tVMeeMyLZI3dfo02nfy5bXh7Tf5jhMRn8jIv5Rg6
	 01vUK7t0WOwTa5T2helUtlt4J1T0JglbB9qCnPUJhO/zz4SeSTOHhqAD16oPmZEOU7
	 CCM/JZLj/gnFt9lu8+S8U0fvZwb/9tau9A1r1t/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FF3F805F4;
	Tue, 19 Apr 2022 15:43:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F28ECF804FE; Tue, 19 Apr 2022 15:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94E1EF804FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94E1EF804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l353b3xn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 338E8B81980;
 Tue, 19 Apr 2022 13:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB39C385A8;
 Tue, 19 Apr 2022 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375692;
 bh=tnWw7oBH8X/XBSc06dB4T/Xrxth9FWCIgmXAbL0gUiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l353b3xn7RP12XuOF9Cs9zO9tge/orX72WpKCH58E7muL7FyXckbWebpZVTgREpYO
 94nj83AEJ8G4ma3/hGOjwiDA7u44mm32sOWTOmedTY1j9E754Khi/eBhNw7sZcR/fP
 sEELa4g6tqqCHlME51Brhwnr6YLWLyI8Af7wRGM8o8xD8amnnB09engI4zVkiclXXu
 mCNS0Sb+wp3+DZySStUMonTFolm2Ob9v/CLQNN4JWPX7Aweoh7N2XbyQM1ddcyBgBz
 1g2qalhGNLlbW40TdlyWoLmDXnGz4w+LLuOQpSk9G4QwyJjZxE6HKbSgWD1lwNbvb3
 UwCXSJ2vUo86g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 31/41] ARM: OMAP1: clock: Fix early UART rate issues
Date: Tue, 19 Apr 2022 15:37:13 +0200
Message-Id: <20220419133723.1394715-32-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 15:43:17 +0200
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

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Commit ef772f2ee31e ("ARM: OMAP: Fix CONFIG_DEBUG_LL") was supposed to fix
low level debugging, most possibly by early enabling UART clocks.  The fix
actually introduced early reset of most bits of MOD_CONF_CTRL_0 register,
with the exception of UART1 and UART2 clock related bits which were set
high.  However, UART1 clock bit can play different roles on different
OMAP1 variants.  On OMAP1610 it enables the clock as intended, but on
OMAP1510 it switches the clock rate from 12 to 48 MHz.  Even worth, for
UART2 the bit changes its clock rate also on OMAP1610.  As a result, UART
rates set by a bootloader can be unintentionally changed early on kernel
boot and low level debugging broken, not fixed.  Besides, reset of all
other bits was not justified.

Don't touch register bits not related to UART clocks.  Also, don't touch
the bit of UART2 clock.  Make sure UART1 and UART3 are enabled early on
relevant OMAP1610 machine types while preserving bootloader UART clock
rates on others.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/clock_data.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index 36f04da4b939..57d3752babf8 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -766,11 +766,11 @@ int __init omap1_clk_init(void)
 	u32 reg;
 
 #ifdef CONFIG_DEBUG_LL
-	/*
-	 * Resets some clocks that may be left on from bootloader,
-	 * but leaves serial clocks on.
-	 */
-	omap_writel(0x3 << 29, MOD_CONF_CTRL_0);
+	/* Make sure UART clocks are enabled early */
+	if (cpu_is_omap16xx())
+		omap_writel(omap_readl(MOD_CONF_CTRL_0) |
+			    CONF_MOD_UART1_CLK_MODE_R |
+			    CONF_MOD_UART3_CLK_MODE_R, MOD_CONF_CTRL_0);
 #endif
 
 	/* USB_REQ_EN will be disabled later if necessary (usb_dc_ck) */
-- 
2.29.2

