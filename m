Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAFCC0383
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 12:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412F41678;
	Fri, 27 Sep 2019 12:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412F41678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569580598;
	bh=Jv919FYaKLwhOfGqKsn2DMcAyh1BE+QgAsd46j2LBE8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f3lH+y9UHyIAd0nwgNfRWC8D0jVCwntaEuQ0T0Hw/EiTHQm6yQjsvUoquOTBnXABt
	 wNKEAE0Gyk/+1Uzd+htqveK8Rbk2jXW1nH3vk5P/+xdrSpmKy6hOCso0ys6DDfRYN8
	 /q8XT2z3LchXQWYl56VpzOgOLXlGLILxijoQzvYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A553F80611;
	Fri, 27 Sep 2019 12:32:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D809EF804CA; Fri, 27 Sep 2019 12:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 6D024F8049C
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 12:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D024F8049C
X-UUID: 49a4752778af46fb867350553e1f7d57-20190927
X-UUID: 49a4752778af46fb867350553e1f7d57-20190927
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1844649825; Fri, 27 Sep 2019 18:32:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Sep 2019 18:31:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Sep 2019 18:31:59 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <mark.rutland@arm.com>, <robh+dt@kernel.org>,
 <linux@roeck-us.net>, <wim@linux-watchdog.org>
Date: Fri, 27 Sep 2019 18:31:55 +0800
Message-ID: <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: alsa-devel@alsa-project.org, yong.liang@mediatek.com, lgirdwood@gmail.com,
 jiaxin.yu@mediatek.com, tzungbi@google.com, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v2 2/4] watchdog: mtk_wdt: mt8183: Add reset
	controller
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

From: "yong.liang" <yong.liang@mediatek.com>

Provide assert/deassert/reset API in watchdog driver.
Register reset controller for toprgu device in watchdog probe.

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 drivers/watchdog/Kconfig   |   1 +
 drivers/watchdog/mtk_wdt.c | 110 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 2e07caab9db2..629249fe5305 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -717,6 +717,7 @@ config MEDIATEK_WATCHDOG
 	tristate "Mediatek SoCs watchdog support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select WATCHDOG_CORE
+	select RESET_CONTROLLER
 	help
 	  Say Y here to include support for the watchdog timer
 	  in Mediatek SoCs.
diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 9c3d0033260d..660fb0e48d8e 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -20,6 +20,10 @@
 #include <linux/types.h>
 #include <linux/watchdog.h>
 #include <linux/delay.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/reset.h>
+#include <linux/of_device.h>
 
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		1
@@ -44,17 +48,113 @@
 #define WDT_SWRST		0x14
 #define WDT_SWRST_KEY		0x1209
 
+#define WDT_SWSYSRST		0x18U
+#define WDT_SWSYS_RST_KEY	0x88000000
+
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 static unsigned int timeout;
 
+struct toprgu_reset {
+	spinlock_t lock; /* Protects reset_controller access */
+	void __iomem *toprgu_swrst_base;
+	int regofs;
+	struct reset_controller_dev rcdev;
+};
+
 struct mtk_wdt_dev {
 	struct watchdog_device wdt_dev;
 	void __iomem *wdt_base;
+	struct toprgu_reset reset_controller;
+	const struct mtk_wdt_compatible *dev_comp;
+};
+
+struct mtk_wdt_compatible {
+	int sw_rst_num;
+};
+
+static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	unsigned int tmp;
+	unsigned long flags;
+	struct toprgu_reset *data = container_of(rcdev,
+				struct toprgu_reset, rcdev);
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
+	tmp |= BIT(id);
+	tmp |= WDT_SWSYS_RST_KEY;
+	writel(tmp, data->toprgu_swrst_base + data->regofs);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+
+	return 0;
+}
+
+static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	unsigned int tmp;
+	unsigned long flags;
+	struct toprgu_reset *data = container_of(rcdev,
+					struct toprgu_reset, rcdev);
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
+	tmp &= ~BIT(id);
+	tmp |= WDT_SWSYS_RST_KEY;
+	writel(tmp, data->toprgu_swrst_base + data->regofs);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+
+	return 0;
+}
+
+static int toprgu_reset(struct reset_controller_dev *rcdev,
+			unsigned long id)
+{
+	int ret;
+
+	ret = toprgu_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return toprgu_reset_deassert(rcdev, id);
+}
+
+static struct reset_control_ops toprgu_reset_ops = {
+	.assert = toprgu_reset_assert,
+	.deassert = toprgu_reset_deassert,
+	.reset = toprgu_reset,
 };
 
+static void toprgu_register_reset_controller(struct platform_device *pdev,
+					     int regofs)
+{
+	int ret;
+	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
+
+	spin_lock_init(&mtk_wdt->reset_controller.lock);
+
+	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);
+	mtk_wdt->reset_controller.toprgu_swrst_base = mtk_wdt->wdt_base;
+	mtk_wdt->reset_controller.regofs = regofs;
+	mtk_wdt->reset_controller.rcdev.owner = THIS_MODULE;
+	mtk_wdt->reset_controller.rcdev.nr_resets =
+				mtk_wdt->dev_comp->sw_rst_num;
+	mtk_wdt->reset_controller.rcdev.ops = &toprgu_reset_ops;
+	mtk_wdt->reset_controller.rcdev.of_node = pdev->dev.of_node;
+	ret = reset_controller_register(&mtk_wdt->reset_controller.rcdev);
+	if (ret != 0)
+		dev_err(&pdev->dev,
+			"couldn't register wdt reset controller: %d\n", ret);
+}
+
 static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
 			   unsigned long action, void *data)
 {
@@ -187,9 +287,12 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (unlikely(err))
 		return err;
 
-	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
+	dev_info(&pdev->dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
 		 mtk_wdt->wdt_dev.timeout, nowayout);
 
+	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);
+	if (mtk_wdt->dev_comp)
+		toprgu_register_reset_controller(pdev, WDT_SWSYSRST);
 	return 0;
 }
 
@@ -217,7 +320,12 @@ static int mtk_wdt_resume(struct device *dev)
 }
 #endif
 
+static const struct mtk_wdt_compatible mt8183_compat = {
+	.sw_rst_num = 18,
+};
+
 static const struct of_device_id mtk_wdt_dt_ids[] = {
+	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_compat },
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ /* sentinel */ }
 };
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
