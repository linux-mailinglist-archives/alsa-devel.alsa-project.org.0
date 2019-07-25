Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98575A5F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 00:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 188CE1F0F;
	Fri, 26 Jul 2019 00:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 188CE1F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564092385;
	bh=gygd7CTKPQgq/onv1HWVlEodyXAgk9x66LB5VFpfu4M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQsD1pZYu5Hl1RCKMcwT/MWRCmiltot2GAa1OB/XJWUscMNr8/TA1GzLKVyhdbMKo
	 W5JBNZSjzcL6OF4O6fK2vuhSKLevjbayoJ1GQ4lAWyAflnTDYwGcmmWVGHDS1/BPLe
	 mAy9NgSNYX7AFVuyHiQgd+n+Gw4/0JJ4snzQc9uY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD59CF804CF;
	Fri, 26 Jul 2019 00:03:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60E42F804CB; Fri, 26 Jul 2019 00:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75 autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFCE8F804AA
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 00:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFCE8F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="RVCisIW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564092179; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yihzcCahU7kYVlqvbVQWSNYg3/S6bAQS/kGuj+526xI=;
 b=RVCisIW5FlsMXoblaUmsRhPqh+R7lN+7JCxkE2l0eprF5+wTnHRWMctPYsIlMeieRmBA+E
 S7/0KsWRFD2t/YQ1RI/nLzAZeydZuDuHp5rZlzw6UoR/2nVpzwJeYQF1pjgiGLhZpeU27F
 haJFehe9+LxNyvrC/ysuSycEA/4s+dQ=
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lee Jones <lee.jones@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Reichel <sre@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Thu, 25 Jul 2019 18:02:07 -0400
Message-Id: <20190725220215.460-4-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org
Subject: [alsa-devel] [PATCH 03/11] MIPS: configs: LB60: update defconfig
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

Update the defconfig to select the new drivers instead of the old ones.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 arch/mips/configs/qi_lb60_defconfig | 44 ++++++++++++++---------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index 208da8a55f48..d3f4d5248d9f 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -1,7 +1,6 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
-CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_SYSCTL_SYSCALL=y
 CONFIG_KALLSYMS_ALL=y
@@ -17,9 +16,8 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_EFI_PARTITION is not set
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-# CONFIG_COMPACTION is not set
+CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -31,9 +29,6 @@ CONFIG_IP_ROUTE_MULTIPATH=y
 CONFIG_IP_ROUTE_VERBOSE=y
 CONFIG_IP_MROUTE=y
 CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 CONFIG_TCP_CONG_ADVANCED=y
 # CONFIG_TCP_CONG_BIC is not set
@@ -44,7 +39,8 @@ CONFIG_TCP_CONG_WESTWOOD=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_JZ4740=y
+CONFIG_MTD_NAND_JZ4780=y
+CONFIG_MTD_NAND_JZ4740_ECC=y
 CONFIG_MTD_UBI=y
 CONFIG_NETDEVICES=y
 # CONFIG_WLAN is not set
@@ -66,18 +62,20 @@ CONFIG_SERIAL_8250_INGENIC=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_POWER_SUPPLY=y
-CONFIG_BATTERY_JZ4740=y
+CONFIG_BATTERY_INGENIC=y
 CONFIG_CHARGER_GPIO=y
-# CONFIG_HWMON is not set
+CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
-CONFIG_MFD_JZ4740_ADC=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_FB=y
-CONFIG_FB_JZ4740=y
-CONFIG_LCD_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
+CONFIG_DRM=y
+CONFIG_DRM_FBDEV_OVERALLOC=200
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_INGENIC=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
@@ -92,13 +90,13 @@ CONFIG_SND=y
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_MIPS is not set
 CONFIG_SND_SOC=y
-CONFIG_SND_JZ4740_SOC=y
-CONFIG_SND_JZ4740_SOC_QI_LB60=y
-CONFIG_USB=y
-CONFIG_USB_OTG_BLACKLIST_HUB=y
+CONFIG_SND_JZ4740_SOC_I2S=y
+CONFIG_SND_SOC_JZ4740_CODEC=y
+CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB_MUSB_HDRC=y
-CONFIG_USB_MUSB_GADGET=y
 CONFIG_USB_MUSB_JZ4740=y
+CONFIG_USB_INVENTRA_DMA=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DEBUG=y
@@ -109,11 +107,13 @@ CONFIG_MMC_JZ4740=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
-CONFIG_DMA_JZ4740=y
+CONFIG_DMA_JZ4780=y
+CONFIG_MEMORY=y
+CONFIG_IIO=y
+CONFIG_INGENIC_ADC=y
 CONFIG_PWM=y
 CONFIG_PWM_JZ4740=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_VFAT_FS=y
 CONFIG_PROC_KCORE=y
-- 
2.21.0.593.g511ec345e18

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
