Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5850B8B7
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:38:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FA616D7;
	Fri, 22 Apr 2022 15:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FA616D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634727;
	bh=SGqxTkP4Yr9w+PMtM+j5E4EDpF9DIlOXkFJV7VuUn10=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oInVjZmDk0K3sPbpFaoGC3CjzBmv22YdP92wR6p2/Jz+C6eezaTlyF2NtPUls13ed
	 podjeTzOyMvuOmRFz0cOOZSZod8DB64VF8tiMdRZgmxmnvybEq/AayJXixwasonz6n
	 Ilt1+qf35ooZCdDJuuCdcihChLZaxMBXcFYazK1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53AB2F805D8;
	Fri, 22 Apr 2022 15:32:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 380DFF8025D; Tue, 19 Apr 2022 18:40:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EF78F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF78F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J476G8wh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7ADBB819DB;
 Tue, 19 Apr 2022 16:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382D7C385A9;
 Tue, 19 Apr 2022 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386410;
 bh=SGqxTkP4Yr9w+PMtM+j5E4EDpF9DIlOXkFJV7VuUn10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J476G8whPsWPqoXfmTcW3H66Ko2zlz0uQsZ6TU0EUl86DuSdHIHaObWy3+2ayXbbE
 9tcrv8iJFW3XB6zGLTjBfOzqzBnUQfcNoxSRwygWz9qRjA/3hvnyrtoJPP+qGM0BUd
 QFasdm2hnuDiivmBAIAn3V2A2OWHkmQXMD181sPCzI4DKa3YRPRF2a0gu9e56K4g4D
 6XwLheiqMYZQMPv5KGN+mEayR89GlyjcX44pDKnThzPgmOflGge4QoBkmK2rL2dP0k
 AzKrkI/o/rO4a5tqIuH5ZjMi0ZlY/2g6UdQC2I5LWcSsp8w0TjU0C0UySK/EATZs+q
 yA8d0aCgP0Z5A==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/48] ARM: pxa: pxa2xx-ac97-lib: use IRQ resource
Date: Tue, 19 Apr 2022 18:37:32 +0200
Message-Id: <20220419163810.2118169-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:41 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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

From: Arnd Bergmann <arnd@arndb.de>

The pxa2xx-ac97-lib code is the last driver to use mach/irqs.h
for PXA. Almost everything already passes the interrupt as
a resource, so use it from there.

The one exception is the mxm8x10 machine, which apparently has
a resource-less device. Replacing it with the correct one
enables the driver here as well.

Cc: alsa-devel@alsa-project.org
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mxm8x10.c |  8 ++------
 sound/arm/pxa2xx-ac97-lib.c | 10 +++++++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-pxa/mxm8x10.c b/arch/arm/mach-pxa/mxm8x10.c
index fde386f6cffe..35546b59c88e 100644
--- a/arch/arm/mach-pxa/mxm8x10.c
+++ b/arch/arm/mach-pxa/mxm8x10.c
@@ -26,6 +26,7 @@
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include "pxa320.h"
 
 #include "mxm8x10.h"
@@ -356,14 +357,9 @@ void __init mxm_8x10_usb_host_init(void)
 	pxa_set_ohci_info(&mxm_8x10_ohci_platform_data);
 }
 
-/* AC97 Sound Support */
-static struct platform_device mxm_8x10_ac97_device = {
-	.name = "pxa2xx-ac97"
-};
-
 void __init mxm_8x10_ac97_init(void)
 {
-	platform_device_register(&mxm_8x10_ac97_device);
+	pxa_set_ac97_info(NULL);
 }
 
 /* NAND flash Support */
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 9b5c1f0f8998..8c79d224f03b 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -21,7 +21,6 @@
 
 #include <sound/pxa2xx-lib.h>
 
-#include <mach/irqs.h>
 #include <mach/regs-ac97.h>
 #include <linux/platform_data/asoc-pxa.h>
 
@@ -319,6 +318,7 @@ EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_resume);
 int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 {
 	int ret;
+	int irq;
 	pxa2xx_audio_ops_t *pdata = dev->dev.platform_data;
 
 	if (pdata) {
@@ -387,7 +387,11 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	if (ret)
 		goto err_clk2;
 
-	ret = request_irq(IRQ_AC97, pxa2xx_ac97_irq, 0, "AC97", NULL);
+	irq = platform_get_irq(dev, 0);
+	if (!irq)
+		goto err_irq;
+
+	ret = request_irq(irq, pxa2xx_ac97_irq, 0, "AC97", NULL);
 	if (ret < 0)
 		goto err_irq;
 
@@ -413,7 +417,7 @@ void pxa2xx_ac97_hw_remove(struct platform_device *dev)
 	if (cpu_is_pxa27x())
 		gpio_free(reset_gpio);
 	GCR |= GCR_ACLINK_OFF;
-	free_irq(IRQ_AC97, NULL);
+	free_irq(platform_get_irq(dev, 0), NULL);
 	if (ac97conf_clk) {
 		clk_put(ac97conf_clk);
 		ac97conf_clk = NULL;
-- 
2.29.2

