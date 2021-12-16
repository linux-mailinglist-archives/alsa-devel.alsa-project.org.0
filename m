Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D22477576
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:13:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DBF82013;
	Thu, 16 Dec 2021 16:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DBF82013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639667638;
	bh=wo0/768IeYKGmqfsb1w/JruQukWZ2kHRJFnqAlsPKhc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bb34TYlxaaBvwFemHzAWU/XoXS/qMn2bNE+B7KTpDNnlddPi8ziPzhXL+cF9GJDH1
	 o6ZNQ4iJjZHnuvl48PqUQWMWFskh6dj4jy6zRSmRUZFCtEmo280RvJyPAA1nm3hM4h
	 GoSdYukJOd5N05GMZtFdi1KKtH46vor6jDAVmTAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7BDAF8015B;
	Thu, 16 Dec 2021 16:12:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B8E5F80116; Thu, 16 Dec 2021 16:12:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA284F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA284F800B0
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226801581"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="226801581"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 07:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="662480310"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2021 07:12:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E93FC178; Thu, 16 Dec 2021 17:12:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] pinctrl: Propagate firmware node from a parent device
Date: Thu, 16 Dec 2021 17:12:27 +0200
Message-Id: <20211216151227.58687-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>
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

When creating MFD platform devices the firmware node is left unset.
This, in particular, prevents GPIO library to use it for different
purposes. Propagate firmware node from the parent device and let
GPIO library do the right thing.

While at it, slightly modify the headers to reflect the usage of APIs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed more compilation errors brought by header reshuffling (LKP)
 drivers/pinctrl/cirrus/pinctrl-madera-core.c |  5 ++++-
 drivers/pinctrl/pinctrl-as3722.c             | 13 +++++++------
 drivers/pinctrl/pinctrl-da9062.c             |  6 +++---
 drivers/pinctrl/pinctrl-max77620.c           | 11 +++++++----
 drivers/pinctrl/pinctrl-rk805.c              | 12 ++++++------
 5 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index dce2626384a9..e1cfbee3643a 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -8,8 +8,10 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
@@ -1004,13 +1006,14 @@ static int madera_pin_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = &pdev->dev;
 	priv->madera = madera;
-	pdev->dev.of_node = madera->dev->of_node;
 
 	switch (madera->type) {
 	case CS47L15:
diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 13c193156363..4313756b52e6 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -23,19 +23,20 @@
 #include <linux/delay.h>
 #include <linux/gpio/driver.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mfd/as3722.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/pm.h>
-#include <linux/slab.h>
 
 #include "core.h"
 #include "pinconf.h"
@@ -551,12 +552,13 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	struct as3722_pctrl_info *as_pci;
 	int ret;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	as_pci = devm_kzalloc(&pdev->dev, sizeof(*as_pci), GFP_KERNEL);
 	if (!as_pci)
 		return -ENOMEM;
 
 	as_pci->dev = &pdev->dev;
-	as_pci->dev->of_node = pdev->dev.parent->of_node;
 	as_pci->as3722 = dev_get_drvdata(pdev->dev.parent);
 	platform_set_drvdata(pdev, as_pci);
 
@@ -578,7 +580,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 
 	as_pci->gpio_chip = as3722_gpio_chip;
 	as_pci->gpio_chip.parent = &pdev->dev;
-	as_pci->gpio_chip.of_node = pdev->dev.parent->of_node;
 	ret = gpiochip_add_data(&as_pci->gpio_chip, as_pci);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Couldn't register gpiochip, %d\n", ret);
diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index 1c08579f0198..0e0ac3f3ffef 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -14,6 +14,7 @@
 #include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <linux/gpio/driver.h>
@@ -256,6 +257,8 @@ static int da9062_pctl_probe(struct platform_device *pdev)
 	struct da9062_pctl *pctl;
 	int i;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
 	if (!pctl)
 		return -ENOMEM;
@@ -277,9 +280,6 @@ static int da9062_pctl_probe(struct platform_device *pdev)
 	pctl->gc = reference_gc;
 	pctl->gc.label = dev_name(&pdev->dev);
 	pctl->gc.parent = &pdev->dev;
-#ifdef CONFIG_OF_GPIO
-	pctl->gc.of_node = parent->of_node;
-#endif
 
 	platform_set_drvdata(pdev, pctl);
 
diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index c643ed43ebbf..1ee94574f0af 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -10,14 +10,16 @@
  */
 
 #include <linux/mfd/max77620.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
 
 #include "core.h"
 #include "pinconf.h"
@@ -551,12 +553,13 @@ static int max77620_pinctrl_probe(struct platform_device *pdev)
 	struct max77620_pctrl_info *mpci;
 	int i;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	mpci = devm_kzalloc(&pdev->dev, sizeof(*mpci), GFP_KERNEL);
 	if (!mpci)
 		return -ENOMEM;
 
 	mpci->dev = &pdev->dev;
-	mpci->dev->of_node = pdev->dev.parent->of_node;
 	mpci->rmap = max77620->rmap;
 
 	mpci->pins = max77620_pins_desc;
diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index c6f4229eb106..7c1f7408fb9a 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -13,17 +13,17 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mfd/rk808.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/pm.h>
-#include <linux/slab.h>
 
 #include "core.h"
 #include "pinconf.h"
@@ -420,18 +420,18 @@ static int rk805_pinctrl_probe(struct platform_device *pdev)
 	struct rk805_pctrl_info *pci;
 	int ret;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	pci = devm_kzalloc(&pdev->dev, sizeof(*pci), GFP_KERNEL);
 	if (!pci)
 		return -ENOMEM;
 
 	pci->dev = &pdev->dev;
-	pci->dev->of_node = pdev->dev.parent->of_node;
 	pci->rk808 = dev_get_drvdata(pdev->dev.parent);
 
 	pci->pinctrl_desc = rk805_pinctrl_desc;
 	pci->gpio_chip = rk805_gpio_chip;
 	pci->gpio_chip.parent = &pdev->dev;
-	pci->gpio_chip.of_node = pdev->dev.parent->of_node;
 
 	platform_set_drvdata(pdev, pci);
 
-- 
2.34.1

