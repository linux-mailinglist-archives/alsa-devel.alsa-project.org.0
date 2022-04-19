Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA13506EDC
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:47:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABE0D1937;
	Tue, 19 Apr 2022 15:46:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABE0D1937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376028;
	bh=vO/bPd1PQ9hX0L2CV68DjG3d21RjoFDCbeNW9JFFn4s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IuSpBG+VtdH2cKS5pjd6l6u6QG9VCO5vOsDF1pFsyctzgieHWHEdBfeiaxGyZM7BR
	 J/LZP/CniOMcjtEq3HTZEKqxn2n3zPOetBsHet76q7gL0rn/ywVOvUZzrTiJ6cBpXU
	 sUcVLy7ZgUDorpp49kn54lotjY8O7bgPSuc9oH/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 511A1F80548;
	Tue, 19 Apr 2022 15:43:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA5AAF80121; Tue, 19 Apr 2022 15:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C767CF80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C767CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i/7k/0F4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C313A61481;
 Tue, 19 Apr 2022 13:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2380AC385A8;
 Tue, 19 Apr 2022 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375549;
 bh=vO/bPd1PQ9hX0L2CV68DjG3d21RjoFDCbeNW9JFFn4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i/7k/0F4r+E1Ur3z329l1Cj5g6ftB8oHQwHSKR1c5qv5Sg7DTH6Yfai9kN/3xqIG2
 6IN+CC95Vy2J9Ecwiqu9jWLiRWHVIRsEYbraSEFksjcs4ejGoj4CLQt1bPvfSrevg1
 Yq0O4PA1y1h2ip/jGL8GEaPuT5rLYGT2eKrRRFBMDLn3T+XmQZzgJHZaYZjmp5Ifqh
 zPEF1FobgULdceNOjlrrAVUkcHB8AklSGR/iVkkqLtnOeADz098ACszzEAEOTLv0jD
 wNQhDFHsfHDookQXljdeMUAjhviMzHxOZBk30q/fEeERal0vp7CC5caie0j1VqHLTj
 MLWQvzBYRx05A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 12/41] usb: omap: avoid mach/*.h headers
Date: Tue, 19 Apr 2022 15:36:54 +0200
Message-Id: <20220419133723.1394715-13-arnd@kernel.org>
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
 Felipe Balbi <felipe.balbi@linux.intel.com>, Kevin Hilman <khilman@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
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

The omap usb drivers still rely on mach/*.h headers that
are explicitly or implicitly included, but all the required
definitions are now in include/linux/soc/ti/, so use those
instead and allow compile-testing on other architectures.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/gadget/udc/Kconfig     | 2 +-
 drivers/usb/gadget/udc/omap_udc.c  | 2 ++
 drivers/usb/host/Kconfig           | 2 +-
 drivers/usb/host/ohci-omap.c       | 7 +++----
 drivers/usb/phy/Kconfig            | 3 ++-
 drivers/usb/phy/phy-isp1301-omap.c | 4 ++--
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 69394dc1cdfb..cee934dce4f0 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -128,7 +128,7 @@ config USB_GR_UDC
 
 config USB_OMAP
 	tristate "OMAP USB Device Controller"
-	depends on ARCH_OMAP1
+	depends on ARCH_OMAP1 || (ARCH_OMAP && COMPILE_TEST)
 	depends on ISP1301_OMAP || !(MACH_OMAP_H2 || MACH_OMAP_H3)
 	help
 	   Many Texas Instruments OMAP processors have flexible full
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index b1da584585cf..5096d24915ce 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -43,6 +43,8 @@
 #include <linux/platform_data/usb-omap1.h>
 
 #include <linux/soc/ti/omap1-usb.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include "omap_udc.h"
 
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 57ca5f97a3dc..682b3d2da623 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -214,7 +214,7 @@ config USB_EHCI_HCD_NPCM7XX
 
 config USB_EHCI_HCD_OMAP
 	tristate "EHCI support for OMAP3 and later chips"
-	depends on ARCH_OMAP
+	depends on ARCH_OMAP || COMPILE_TEST
 	depends on NOP_USB_XCEIV
 	default y
 	help
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 7be1ffefc40e..750a90c41a0a 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -27,6 +27,9 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/usb-omap1.h>
 #include <linux/soc/ti/omap1-usb.h>
+#include <linux/soc/ti/omap1-mux.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-io.h>
 #include <linux/signal.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
@@ -36,10 +39,6 @@
 #include <asm/io.h>
 #include <asm/mach-types.h>
 
-#include <mach/mux.h>
-
-#include <mach/hardware.h>
-
 #define DRIVER_DESC "OHCI OMAP driver"
 
 struct ohci_omap_priv {
diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 52eebcb88c1f..2acbe41fbf7e 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -30,7 +30,8 @@ config FSL_USB2_OTG
 
 config ISP1301_OMAP
 	tristate "Philips ISP1301 with OMAP OTG"
-	depends on I2C && ARCH_OMAP_OTG
+	depends on I2C
+	depends on ARCH_OMAP_OTG || (ARM && COMPILE_TEST)
 	depends on USB
 	depends on USB_GADGET || !USB_GADGET # if USB_GADGET=m, this can't be 'y'
 	select USB_PHY
diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index 88aade82b82b..f8bd93fe69cd 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -23,9 +23,9 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <mach/mux.h>
-
+#include <linux/soc/ti/omap1-mux.h>
 #include <linux/soc/ti/omap1-usb.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #undef VERBOSE
 
-- 
2.29.2

