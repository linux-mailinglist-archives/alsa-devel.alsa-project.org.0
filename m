Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD14D85FE
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 04:40:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 089E71654;
	Wed, 16 Oct 2019 04:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 089E71654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571193653;
	bh=vKaugpInW+Epdizl+SYSqJJq47IciVzGxGCHtUc1/3I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXlRThKAGglceZ6mth81gek2X82E6zizmvnK5WIsO+pTwHsP/83Q8cjlSu+l6PGn+
	 R9rJTkBvnFqE5y3cgZvnBczvfJ3XVFw29HIxM1Hn9GktuTh38t3XJLBliRVZxG1yps
	 i2R7r6P9vAUv0ObGR4OV6TY4MM0jmRfJnC+oEx4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C938F80369;
	Wed, 16 Oct 2019 04:39:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E09CF8036C; Wed, 16 Oct 2019 04:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id F1EBFF80362
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 04:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1EBFF80362
X-UUID: 696304e4c6f3425cbf18b72cd5196de8-20191016
X-UUID: 696304e4c6f3425cbf18b72cd5196de8-20191016
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 928964542; Wed, 16 Oct 2019 10:38:54 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 16 Oct 2019 10:38:50 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 16 Oct 2019 10:38:49 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <mark.rutland@arm.com>, <robh+dt@kernel.org>,
 <linux@roeck-us.net>, <wim@linux-watchdog.org>
Date: Wed, 16 Oct 2019 10:38:42 +0800
Message-ID: <1571193522-11886-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1571193522-11886-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1571193522-11886-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EDE643BDA5F2795A887B7DEE791A7E72E79A19DDBB5D9C481F742A084FC346522000:8
X-MTK: N
Cc: alsa-devel@alsa-project.org, yong.liang@mediatek.com, lgirdwood@gmail.com,
 jiaxin.yu@mediatek.com, tzungbi@google.com, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 2/2] watchdog: mtk_wdt: mt8183: Add reset
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

Add reset controller API in watchdog driver.
Besides watchdog, MTK toprgu module also provide sub-system (eg, audio,
camera, codec and connectivity) software reset functionality.

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 drivers/watchdog/Kconfig   |   1 +
 drivers/watchdog/mtk_wdt.c | 111 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 111 insertions(+), 1 deletion(-)

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
index 9c3d0033260d..d29484c7940a 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -9,6 +9,9 @@
  * Based on sunxi_wdt.c
  */
 
+#include <dt-bindings/reset-controller/mt2712-resets.h>
+#include <dt-bindings/reset-controller/mt8183-resets.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -16,10 +19,12 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
-#include <linux/delay.h>
 
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		1
@@ -44,6 +49,9 @@
 #define WDT_SWRST		0x14
 #define WDT_SWRST_KEY		0x1209
 
+#define WDT_SWSYSRST		0x18U
+#define WDT_SWSYS_RST_KEY	0x88000000
+
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
 
@@ -53,8 +61,99 @@ static unsigned int timeout;
 struct mtk_wdt_dev {
 	struct watchdog_device wdt_dev;
 	void __iomem *wdt_base;
+	spinlock_t lock; /* protects WDT_SWSYSRST reg */
+	struct reset_controller_dev rcdev;
+};
+
+struct mtk_wdt_data {
+	int sw_rst_num;
 };
 
+static const struct mtk_wdt_data mt2712_data = {
+	.sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
+};
+
+static const struct mtk_wdt_data mt8183_data = {
+	.sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
+};
+
+static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	unsigned int tmp;
+	unsigned long flags;
+	struct mtk_wdt_dev *data =
+		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
+	tmp |= BIT(id);
+	tmp |= WDT_SWSYS_RST_KEY;
+	writel(tmp, data->wdt_base + WDT_SWSYSRST);
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
+	struct mtk_wdt_dev *data =
+		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
+	tmp &= ~BIT(id);
+	tmp |= WDT_SWSYS_RST_KEY;
+	writel(tmp, data->wdt_base + WDT_SWSYSRST);
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
+static const struct reset_control_ops toprgu_reset_ops = {
+	.assert = toprgu_reset_assert,
+	.deassert = toprgu_reset_deassert,
+	.reset = toprgu_reset,
+};
+
+static int toprgu_register_reset_controller(struct platform_device *pdev,
+					    int rst_num)
+{
+	int ret;
+	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
+
+	spin_lock_init(&mtk_wdt->lock);
+
+	mtk_wdt->rcdev.owner = THIS_MODULE;
+	mtk_wdt->rcdev.nr_resets = rst_num;
+	mtk_wdt->rcdev.ops = &toprgu_reset_ops;
+	mtk_wdt->rcdev.of_node = pdev->dev.of_node;
+	ret = reset_controller_register(&mtk_wdt->rcdev);
+	if (ret != 0)
+		dev_err(&pdev->dev,
+			"couldn't register wdt reset controller: %d\n", ret);
+	return ret;
+}
+
 static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
 			   unsigned long action, void *data)
 {
@@ -155,6 +254,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
+	struct mtk_wdt_data *wdt_data;
 	int err;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
@@ -190,6 +290,13 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
 		 mtk_wdt->wdt_dev.timeout, nowayout);
 
+	wdt_data = (struct mtk_wdt_data *)of_device_get_match_data(dev);
+	if (wdt_data) {
+		err = toprgu_register_reset_controller(pdev,
+						       wdt_data->sw_rst_num);
+		if (err)
+			return err;
+	}
 	return 0;
 }
 
@@ -218,7 +325,9 @@ static int mtk_wdt_resume(struct device *dev)
 #endif
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
+	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
