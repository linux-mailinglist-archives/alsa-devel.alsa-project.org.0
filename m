Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6C506EE0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9981A97;
	Tue, 19 Apr 2022 15:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9981A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376058;
	bh=4iDu1ZR93Hpdk0ePDMtItzf+hxINHA/lI2UqgUNvzAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D9vF84CCDwMg3Ugi6IHzOsqm5JN2J820bnQvALDguj3Dib1FHt1+CvEsfLJk3wksz
	 2AQBmlt0nwEYVLYPPcwjonrQp5/vwOuEv5Ss4dznNO1xEc30A7CdkbPC254gvxDTXZ
	 9DZezLb1XFsoQXbPJYbfSkoShE5NQzGow27G3vxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EEC1F80557;
	Tue, 19 Apr 2022 15:43:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F356F8025D; Tue, 19 Apr 2022 15:39:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10857F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10857F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iYu4XDHn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EABA5616A3;
 Tue, 19 Apr 2022 13:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1F3C385B0;
 Tue, 19 Apr 2022 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375534;
 bh=4iDu1ZR93Hpdk0ePDMtItzf+hxINHA/lI2UqgUNvzAk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iYu4XDHn5LNc7q3bp0MnU+38E/Ct276pZyBclM70B5U7U15YheXM7tnLSDrpUiUFQ
 LOdrjAjpzyttsvLOqFC2b7tDcSoaZFMybnxyY5aUJrfJtURup3vbi2iY75ltYnDLuS
 R0BLoJT+6r95ZIXxT2lNCWCFV7jGVZ7Sde1XjlYMf9LdvnqvV4unQN9PnYwj+Xjx8X
 7eBiNtO4k2iiNvODCKeMIIYXlu+l9Iz92DSuTWievPEejspI9ZHnElvJr2WOS2dbqw
 lFRLt6aXKxLOfia2VmyXNyqNDgSTrk89Sgbp424LQiBRKM9tKYyKriV+ZzqFh6k3u5
 x1pStxY//K6Sg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 10/41] ARM: omap1: move CF chipselect setup to board file
Date: Tue, 19 Apr 2022 15:36:52 +0200
Message-Id: <20220419133723.1394715-11-arnd@kernel.org>
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

There is only one board that uses the omap_cf driver, so
moving the chipselect configuration there does not lead
to code duplication but avoids the use of mach/tc.h
in drivers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-osk.c | 38 ++++++++++++++++++++++++++++-----
 drivers/pcmcia/Kconfig          |  3 ++-
 drivers/pcmcia/omap_cf.c        | 38 ++++++---------------------------
 3 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index b627a4351cf0..5dbc8f109aa7 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -153,14 +153,14 @@ static struct resource osk5912_cf_resources[] = {
 	[0] = {
 		.flags	= IORESOURCE_IRQ,
 	},
+	[1] = {
+		.flags = IORESOURCE_MEM,
+	},
 };
 
 static struct platform_device osk5912_cf_device = {
 	.name		= "omap_cf",
 	.id		= -1,
-	.dev = {
-		.platform_data	= (void *) 2 /* CS2 */,
-	},
 	.num_resources	= ARRAY_SIZE(osk5912_cf_resources),
 	.resource	= osk5912_cf_resources,
 };
@@ -275,13 +275,41 @@ static void __init osk_init_smc91x(void)
 	omap_writel(l, EMIFS_CCS(1));
 }
 
-static void __init osk_init_cf(void)
+static void __init osk_init_cf(int seg)
 {
+	struct resource *res = &osk5912_cf_resources[1];
+
 	omap_cfg_reg(M7_1610_GPIO62);
 	if ((gpio_request(62, "cf_irq")) < 0) {
 		printk("Error requesting gpio 62 for CF irq\n");
 		return;
 	}
+
+	switch (seg) {
+	/* NOTE: CS0 could be configured too ... */
+	case 1:
+		res->start = OMAP_CS1_PHYS;
+		break;
+	case 2:
+		res->start = OMAP_CS2_PHYS;
+		break;
+	case 3:
+		res->start = omap_cs3_phys();
+		break;
+	}
+
+	res->end = res->start + SZ_8K - 1;
+	osk5912_cf_device.dev.platform_data = (void *)(uintptr_t)seg;
+
+	/* NOTE:  better EMIFS setup might support more cards; but the
+	 * TRM only shows how to affect regular flash signals, not their
+	 * CF/PCMCIA variants...
+	 */
+	pr_debug("%s: cs%d, previous ccs %08x acs %08x\n", __func__,
+		seg, omap_readl(EMIFS_CCS(seg)), omap_readl(EMIFS_ACS(seg)));
+	omap_writel(0x0004a1b3, EMIFS_CCS(seg));	/* synch mode 4 etc */
+	omap_writel(0x00000000, EMIFS_ACS(seg));	/* OE hold/setup */
+
 	/* the CF I/O IRQ is really active-low */
 	irq_set_irq_type(gpio_to_irq(62), IRQ_TYPE_EDGE_FALLING);
 }
@@ -580,7 +608,7 @@ static void __init osk_init(void)
 	u32 l;
 
 	osk_init_smc91x();
-	osk_init_cf();
+	osk_init_cf(2); /* CS2 */
 
 	/* Workaround for wrong CS3 (NOR flash) timing
 	 * There are some U-Boot versions out there which configure
diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index 2ce261cfff8e..ec977f031bc2 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -246,7 +246,8 @@ config PCMCIA_VRC4171
 
 config OMAP_CF
 	tristate "OMAP CompactFlash Controller"
-	depends on PCMCIA && ARCH_OMAP16XX
+	depends on PCMCIA
+	depends on ARCH_OMAP16XX || (ARM && COMPILE_TEST)
 	help
 	  Say Y here to support the CompactFlash controller on OMAP.
 	  Note that this doesn't support "True IDE" mode.
diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
index f0b2c2d03469..093022ce7d91 100644
--- a/drivers/pcmcia/omap_cf.c
+++ b/drivers/pcmcia/omap_cf.c
@@ -16,13 +16,12 @@
 
 #include <pcmcia/ss.h>
 
-#include <mach/hardware.h>
 #include <asm/io.h>
 #include <linux/sizes.h>
 
-#include <mach/mux.h>
-#include <mach/tc.h>
-
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-mux.h>
 
 /* NOTE:  don't expect this to support many I/O cards.  The 16xx chips have
  * hard-wired timings to support Compact Flash memory cards; they won't work
@@ -205,6 +204,7 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 	struct omap_cf_socket	*cf;
 	int			irq;
 	int			status;
+	struct resource		*res;
 
 	seg = (int) pdev->dev.platform_data;
 	if (seg == 0 || seg > 3)
@@ -215,6 +215,8 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return -EINVAL;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
 	cf = kzalloc(sizeof *cf, GFP_KERNEL);
 	if (!cf)
 		return -ENOMEM;
@@ -230,24 +232,7 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 		goto fail0;
 	cf->irq = irq;
 	cf->socket.pci_irq = irq;
-
-	switch (seg) {
-	/* NOTE: CS0 could be configured too ... */
-	case 1:
-		cf->phys_cf = OMAP_CS1_PHYS;
-		break;
-	case 2:
-		cf->phys_cf = OMAP_CS2_PHYS;
-		break;
-	case 3:
-		cf->phys_cf = omap_cs3_phys();
-		break;
-	default:
-		goto  fail1;
-	}
-	cf->iomem.start = cf->phys_cf;
-	cf->iomem.end = cf->iomem.end + SZ_8K - 1;
-	cf->iomem.flags = IORESOURCE_MEM;
+	cf->phys_cf = res->start;
 
 	/* pcmcia layer only remaps "real" memory */
 	cf->socket.io_offset = (unsigned long)
@@ -273,15 +258,6 @@ static int __init omap_cf_probe(struct platform_device *pdev)
 
 	pr_info("%s: cs%d on irq %d\n", driver_name, seg, irq);
 
-	/* NOTE:  better EMIFS setup might support more cards; but the
-	 * TRM only shows how to affect regular flash signals, not their
-	 * CF/PCMCIA variants...
-	 */
-	pr_debug("%s: cs%d, previous ccs %08x acs %08x\n", driver_name,
-		seg, omap_readl(EMIFS_CCS(seg)), omap_readl(EMIFS_ACS(seg)));
-	omap_writel(0x0004a1b3, EMIFS_CCS(seg));	/* synch mode 4 etc */
-	omap_writel(0x00000000, EMIFS_ACS(seg));	/* OE hold/setup */
-
 	/* CF uses armxor_ck, which is "always" available */
 
 	pr_debug("%s: sts %04x cfg %04x control %04x %s\n", driver_name,
-- 
2.29.2

