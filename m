Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFC5506EF5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:51:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1271AF3;
	Tue, 19 Apr 2022 15:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1271AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376309;
	bh=Lqql5jJ2TjMR0BVNQRp5+3ddwljyuhELVCm/kXj+7ik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N9NyngS1Mha2i3Phriw9Ij2bAGDxgMN5+FyTgfIXwrjYAeXcfHVHQsgYjaKZ+wlG6
	 p+mh6qnq+MbaQmKrehqM8AiG5vtNQyHvOYzwHYixYbjXp1giFTA22cTK5IiKTpyWrJ
	 yQL1Ps4n7p93RPUXBjeL22kdezM+kEn3PYpPHUZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E912AF805E4;
	Tue, 19 Apr 2022 15:43:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ADF5F8025D; Tue, 19 Apr 2022 15:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82F05F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82F05F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JIoRCZ5P"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B942B8197F;
 Tue, 19 Apr 2022 13:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD10C385A5;
 Tue, 19 Apr 2022 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375683;
 bh=Lqql5jJ2TjMR0BVNQRp5+3ddwljyuhELVCm/kXj+7ik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JIoRCZ5P7nywKXcKjFEeDGGEvckH/ddxelOi4sgLLOtXOcDjoGje3+bE947Tyfmia
 404OQdFoYPFkbzMHBsltzemOp8kG1cXvkIXl73jYoerRI3ggoObRe7dclw+jMSy9H8
 F+o3O5viIo54fVXJj2D8nfZNTbQ86aaDw5H9fg3Kd6DLTGBA7lJG4+V5LTJULF9e+r
 tvfzzSP4zoEJRSSCciMSDW0M3yqyLWUuAL26tBfmvTvd3LCp7oXzclqlFOfsHHkqez
 QdbmAWEIjwpUIeKE0k/ZBNkPe/Zdvsshi18aHuPRwsuSu3oIE5fxAI7S7/ls1bYkDQ
 VWwgVS/Bp5Amw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 30/41] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to
 CCF
Date: Tue, 19 Apr 2022 15:37:12 +0200
Message-Id: <20220419133723.1394715-31-arnd@kernel.org>
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

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

In preparation for conversion of OMAP1 clocks to common clock framework,
identify arch/arm/mach-omap1 local users of those clocks and update them
to call clk_prepare_enable/clk_disable_unprepare() instead of just
clk_enable/disable(), as required by CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/mcbsp.c    | 8 ++++----
 arch/arm/mach-omap1/ocpi.c     | 4 ++--
 arch/arm/mach-omap1/serial.c   | 6 +++---
 arch/arm/mach-omap1/timer32k.c | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-omap1/mcbsp.c b/arch/arm/mach-omap1/mcbsp.c
index b7bc7e4b426c..05c25c432449 100644
--- a/arch/arm/mach-omap1/mcbsp.c
+++ b/arch/arm/mach-omap1/mcbsp.c
@@ -43,8 +43,8 @@ static void omap1_mcbsp_request(unsigned int id)
 			api_clk = clk_get(NULL, "api_ck");
 			dsp_clk = clk_get(NULL, "dsp_ck");
 			if (!IS_ERR(api_clk) && !IS_ERR(dsp_clk)) {
-				clk_enable(api_clk);
-				clk_enable(dsp_clk);
+				clk_prepare_enable(api_clk);
+				clk_prepare_enable(dsp_clk);
 
 				/*
 				 * DSP external peripheral reset
@@ -62,11 +62,11 @@ static void omap1_mcbsp_free(unsigned int id)
 	if (id == 0 || id == 2) {
 		if (--dsp_use == 0) {
 			if (!IS_ERR(api_clk)) {
-				clk_disable(api_clk);
+				clk_disable_unprepare(api_clk);
 				clk_put(api_clk);
 			}
 			if (!IS_ERR(dsp_clk)) {
-				clk_disable(dsp_clk);
+				clk_disable_unprepare(dsp_clk);
 				clk_put(dsp_clk);
 			}
 		}
diff --git a/arch/arm/mach-omap1/ocpi.c b/arch/arm/mach-omap1/ocpi.c
index c4a33ace4a8b..d48f726571a4 100644
--- a/arch/arm/mach-omap1/ocpi.c
+++ b/arch/arm/mach-omap1/ocpi.c
@@ -73,7 +73,7 @@ static int __init omap_ocpi_init(void)
 	if (IS_ERR(ocpi_ck))
 		return PTR_ERR(ocpi_ck);
 
-	clk_enable(ocpi_ck);
+	clk_prepare_enable(ocpi_ck);
 	ocpi_enable();
 	pr_info("OMAP OCPI interconnect driver loaded\n");
 
@@ -87,7 +87,7 @@ static void __exit omap_ocpi_exit(void)
 	if (!cpu_is_omap16xx())
 		return;
 
-	clk_disable(ocpi_ck);
+	clk_disable_unprepare(ocpi_ck);
 	clk_put(ocpi_ck);
 }
 
diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index d6d1843337a5..299ae1106187 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -142,7 +142,7 @@ void __init omap_serial_init(void)
 			if (IS_ERR(uart1_ck))
 				printk("Could not get uart1_ck\n");
 			else {
-				clk_enable(uart1_ck);
+				clk_prepare_enable(uart1_ck);
 				if (cpu_is_omap15xx())
 					clk_set_rate(uart1_ck, 12000000);
 			}
@@ -152,7 +152,7 @@ void __init omap_serial_init(void)
 			if (IS_ERR(uart2_ck))
 				printk("Could not get uart2_ck\n");
 			else {
-				clk_enable(uart2_ck);
+				clk_prepare_enable(uart2_ck);
 				if (cpu_is_omap15xx())
 					clk_set_rate(uart2_ck, 12000000);
 				else
@@ -164,7 +164,7 @@ void __init omap_serial_init(void)
 			if (IS_ERR(uart3_ck))
 				printk("Could not get uart3_ck\n");
 			else {
-				clk_enable(uart3_ck);
+				clk_prepare_enable(uart3_ck);
 				if (cpu_is_omap15xx())
 					clk_set_rate(uart3_ck, 12000000);
 			}
diff --git a/arch/arm/mach-omap1/timer32k.c b/arch/arm/mach-omap1/timer32k.c
index 23952a85ac79..560cd16568a7 100644
--- a/arch/arm/mach-omap1/timer32k.c
+++ b/arch/arm/mach-omap1/timer32k.c
@@ -270,7 +270,7 @@ int __init omap_32k_timer_init(void)
 
 		sync32k_ick = clk_get(NULL, "omap_32ksync_ick");
 		if (!IS_ERR(sync32k_ick))
-			clk_enable(sync32k_ick);
+			clk_prepare_enable(sync32k_ick);
 
 		ret = omap_init_clocksource_32k(base);
 	}
-- 
2.29.2

