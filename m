Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 575044928FD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 15:56:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05EA318EA;
	Tue, 18 Jan 2022 15:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05EA318EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642517819;
	bh=yipakij7RopUX4TLkU4j/WoZy2gIqhzYUpovC5x+MAM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q6/PZ5800trZlvj6OXSu5BzJ82Hn1P2/FwrlQdWl4Q/pFITJAGpNzO0UxCfeXrM65
	 u2ExQIB6cpaultQ7WHVbWno9TeY/2vZh3Q4V0VATN0P1B5tudy9NB1u836sErpbNXi
	 ZKOG98wpUAQAeqFLwLPd7dPaSgbxEONaRipZgGbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D0CF80536;
	Tue, 18 Jan 2022 15:54:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFF42F8052E; Tue, 18 Jan 2022 15:53:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2457CF8051B
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 15:53:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2457CF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lKgoHchX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20I3r9SN009450;
 Tue, 18 Jan 2022 08:53:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=+aIWqVLj1vDO8KKjD7Ahk8o53BxpDaMkVk6Yj9vwUSY=;
 b=lKgoHchXjezITGAhz/2S6sSY9JMRhtbkGxHl4igS/bdF+pf6iGajYYN49yjFftL7KLa+
 l64EDNrnU7LSGkmXjfAuEnWkvbAFFi1ciBcaCfV9qZ6iZd/q8Pk1hLyyEH1HqoqE7YIw
 uD+RNw1cTyfsMu4IiWXwCR/TwISKQi/JQLRdKaGb0clSaWc7Len8+e+e24Ib0m+5yc9g
 KsKeuukhxYrw1z/GOqEsTMILEfky7Pj/b85eJPYJ2TW3x1ks7ErXzQ2SsBOjVuxWfK1W
 UmXyi+EJzJvMsyNjTEKFrzHzvnnEiuJcf8aBLK8URL0UMVkuAqRqCXmPkh/sYCngvx1v Hw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dn8k2s8t5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Jan 2022 08:53:45 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 14:53:44 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 18 Jan 2022 14:53:44 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 333B37C;
 Tue, 18 Jan 2022 14:53:43 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 08/10] ACPI: bus-multi-instantiate: Add SPI support
Date: Tue, 18 Jan 2022 14:52:49 +0000
Message-ID: <20220118145251.1548-9-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118145251.1548-1-sbinding@opensource.cirrus.com>
References: <20220118145251.1548-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: j4Uni6o4ElVZnSWW4eBt5JLoMYzfTi7E
X-Proofpoint-ORIG-GUID: j4Uni6o4ElVZnSWW4eBt5JLoMYzfTi7E
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>,
 linux-spi@vger.kernel.org
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

Add support for spi bus in bus-multi-instantiate driver

Some peripherals can have either a I2C or a SPI connection
to the host (but not both) but use the same HID for both
types. So it is not possible to use the HID to determine
whether it is I2C or SPI. The driver must check the node
to see if it contains I2cSerialBus or SpiSerialBus entries.

For backwards-compatibility with the existing nodes I2C is
checked first and if such entries are found ONLY I2C devices
are created. Since some existing nodes that were already
handled by this driver could also contain unrelated
SpiSerialBus nodes that were previously ignored, and this
preserves that behavior. If there is ever a need to handle
a node where both I2C and SPI devices must be instantiated
this can be added in future.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/acpi/Kconfig                 |  10 +-
 drivers/acpi/bus-multi-instantiate.c | 200 +++++++++++++++++++++++----
 drivers/acpi/scan.c                  |  13 +-
 3 files changed, 182 insertions(+), 41 deletions(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index cb414113c238..3550e0efeb16 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -296,12 +296,12 @@ config ACPI_PROCESSOR
 	  the module will be called processor.
 
 config ACPI_BUS_MULTI_INST
-	tristate "I2C multi instantiate pseudo device driver"
-	depends on I2C
+	tristate "I2C and SPI multi instantiate pseudo device driver"
+	depends on I2C && SPI
 	help
-	  Some ACPI-based systems list multiple i2c-devices in a single ACPI
-	  firmware-node. This driver will instantiate separate i2c-clients
-	  for each device in the firmware-node.
+	  Some ACPI-based systems list multiple i2c/spi devices in a
+	  single ACPI firmware-node. This driver will instantiate separate
+	  i2c-clients or spi-devices for each device in the firmware-node.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called bus-multi-instantiate.
diff --git a/drivers/acpi/bus-multi-instantiate.c b/drivers/acpi/bus-multi-instantiate.c
index 50f1540762e9..05bc941a38fd 100644
--- a/drivers/acpi/bus-multi-instantiate.c
+++ b/drivers/acpi/bus-multi-instantiate.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Bus multi-instantiate driver, pseudo driver to instantiate multiple
- * i2c-clients from a single fwnode.
+ * i2c-clients or spi-devices from a single fwnode.
  *
  * Copyright 2018 Hans de Goede <hdegoede@redhat.com>
  */
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/spi/spi.h>
 #include <linux/types.h>
 
 #define IRQ_RESOURCE_TYPE	GENMASK(1, 0)
@@ -21,15 +22,28 @@
 #define IRQ_RESOURCE_GPIO	1
 #define IRQ_RESOURCE_APIC	2
 
+enum bmi_bus_type {
+	BMI_I2C,
+	BMI_SPI,
+	BMI_AUTO_DETECT,
+};
+
 struct bmi_instance {
 	const char *type;
 	unsigned int flags;
 	int irq_idx;
 };
 
+struct bmi_node {
+	enum bmi_bus_type bus_type;
+	struct bmi_instance instances[];
+};
+
 struct bmi {
 	int i2c_num;
+	int spi_num;
 	struct i2c_client **i2c_devs;
+	struct spi_device **spi_devs;
 };
 
 static int bmi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
@@ -60,6 +74,92 @@ static void bmi_devs_unregister(struct bmi *bmi)
 {
 	while (bmi->i2c_num > 0)
 		i2c_unregister_device(bmi->i2c_devs[--bmi->i2c_num]);
+
+	while (bmi->spi_num > 0)
+		spi_unregister_device(bmi->spi_devs[--bmi->spi_num]);
+}
+
+/**
+ * bmi_spi_probe - Instantiate multiple SPI devices from inst array
+ * @pdev:	Platform device
+ * @adev:	ACPI device
+ * @bmi:	Internal struct for Bus multi instantiate driver
+ * @inst:	Array of instances to probe
+ *
+ * Returns the number of SPI devices instantiate, Zero if none is found or a negative error code.
+ */
+static int bmi_spi_probe(struct platform_device *pdev, struct acpi_device *adev, struct bmi *bmi,
+			 const struct bmi_instance *inst_array)
+{
+	struct device *dev = &pdev->dev;
+	struct spi_controller *ctlr;
+	struct spi_device *spi_dev;
+	char name[50];
+	int i, ret, count;
+
+	ret = acpi_spi_count_resources(adev);
+	if (ret <= 0)
+		return ret;
+	count = ret;
+
+	bmi->spi_devs = devm_kcalloc(dev, count, sizeof(*bmi->spi_devs), GFP_KERNEL);
+	if (!bmi->spi_devs)
+		return -ENOMEM;
+
+	for (i = 0; i < count && inst_array[i].type; i++) {
+
+		spi_dev = acpi_spi_device_alloc(NULL, adev, i, inst_array[i].irq_idx);
+		if (IS_ERR(spi_dev)) {
+			ret = PTR_ERR(spi_dev);
+			goto error;
+		}
+
+		ctlr = spi_dev->controller;
+
+		strscpy(spi_dev->modalias, inst_array[i].type, sizeof(spi_dev->modalias));
+
+		if (spi_dev->irq < 0) {
+			ret = bmi_get_irq(pdev, adev, &inst_array[i]);
+			if (ret < 0) {
+				spi_dev_put(spi_dev);
+				goto error;
+			}
+			spi_dev->irq = ret;
+		}
+
+		snprintf(name, sizeof(name), "%s-%s-%s.%d", dev_name(&ctlr->dev), dev_name(dev),
+			 inst_array[i].type, i);
+		spi_dev->dev.init_name = name;
+
+		ret = spi_add_device(spi_dev);
+		if (ret) {
+			dev_err(&ctlr->dev, "failed to add SPI device %s from ACPI: %d\n",
+				dev_name(&adev->dev), ret);
+			spi_dev_put(spi_dev);
+			goto error;
+		}
+
+		dev_dbg(dev, "SPI device %s using chip select %u", name, spi_dev->chip_select);
+
+		bmi->spi_devs[i] = spi_dev;
+		bmi->spi_num++;
+	}
+
+	if (bmi->spi_num < count) {
+		dev_err(dev, "Error finding driver, idx %d\n", i);
+		ret = -ENODEV;
+		goto error;
+	}
+
+	dev_info(dev, "Instantiate %d SPI devices.\n", bmi->spi_num);
+
+	return bmi->spi_num;
+error:
+	bmi_devs_unregister(bmi);
+	dev_err_probe(dev, ret, "SPI error %d\n", ret);
+
+	return ret;
+
 }
 
 /**
@@ -125,14 +225,14 @@ static int bmi_i2c_probe(struct platform_device *pdev, struct acpi_device *adev,
 
 static int bmi_probe(struct platform_device *pdev)
 {
-	const struct bmi_instance *inst_array;
 	struct device *dev = &pdev->dev;
+	const struct bmi_node *node;
 	struct acpi_device *adev;
 	struct bmi *bmi;
-	int ret;
+	int i2c_ret = 0, spi_ret = 0;
 
-	inst_array = device_get_match_data(dev);
-	if (!inst_array) {
+	node = device_get_match_data(dev);
+	if (!node) {
 		dev_err(dev, "Error ACPI match data is missing\n");
 		return -ENODEV;
 	}
@@ -147,13 +247,44 @@ static int bmi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bmi);
 
-	ret = bmi_i2c_probe(pdev, adev, bmi, inst_array);
-	if (ret > 0)
+	/* Each time this driver probes only one type of bus will be chosen.
+	 * And I2C has preference, which means that if find a I2cSerialBus it assumes
+	 * that all following devices will also be I2C.
+	 * In case there are zero I2C devices, it assumes that all following devices are SPI.
+	 */
+	if (node->bus_type != BMI_SPI) {
+		i2c_ret = bmi_i2c_probe(pdev, adev, bmi, node->instances);
+		if (i2c_ret > 0)
+			return 0;
+		else if (i2c_ret == -EPROBE_DEFER)
+			return i2c_ret;
+		if (node->bus_type == BMI_I2C) {
+			if (i2c_ret == 0)
+				return -ENODEV;
+			else
+				return i2c_ret;
+		}
+	}
+	/* BMI_SPI or BMI_AUTO_DETECT */
+	spi_ret = bmi_spi_probe(pdev, adev, bmi, node->instances);
+	if (spi_ret > 0)
 		return 0;
-	if (ret == 0)
-		ret = -ENODEV;
+	else if (spi_ret == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (node->bus_type == BMI_SPI) {
+		if (spi_ret == 0)
+			return -ENODEV;
+		else
+			return spi_ret;
+	}
 
-	return ret;
+	/* The only way to get here is BMI_AUTO_DETECT and i2c_ret <= 0 and spi_ret <= 0 */
+	if (i2c_ret == 0 && spi_ret == 0)
+		return -ENODEV;
+	else if (i2c_ret == 0 && spi_ret)
+		return spi_ret;
+
+	return i2c_ret;
 }
 
 static int bmi_remove(struct platform_device *pdev)
@@ -165,27 +296,36 @@ static int bmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct bmi_instance bsg1160_data[]  = {
-	{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
-	{ "bmc150_magn" },
-	{ "bmg160" },
-	{}
+static const struct bmi_node bsg1160_data = {
+	.instances = {
+		{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
+		{ "bmc150_magn" },
+		{ "bmg160" },
+		{}
+	},
+	.bus_type = BMI_I2C,
 };
 
-static const struct bmi_instance bsg2150_data[]  = {
-	{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
-	{ "bmc150_magn" },
-	/* The resources describe a 3th client, but it is not really there. */
-	{ "bsg2150_dummy_dev" },
-	{}
+static const struct bmi_node bsg2150_data = {
+	.instances = {
+		{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
+		{ "bmc150_magn" },
+		/* The resources describe a 3th client, but it is not really there. */
+		{ "bsg2150_dummy_dev" },
+		{}
+	},
+	.bus_type = BMI_I2C,
 };
 
-static const struct bmi_instance int3515_data[]  = {
-	{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
-	{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
-	{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
-	{ "tps6598x", IRQ_RESOURCE_APIC, 3 },
-	{}
+static const struct bmi_node int3515_data = {
+	.instances = {
+		{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
+		{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
+		{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
+		{ "tps6598x", IRQ_RESOURCE_APIC, 3 },
+		{}
+	},
+	.bus_type = BMI_I2C,
 };
 
 /*
@@ -193,9 +333,9 @@ static const struct bmi_instance int3515_data[]  = {
  * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
  */
 static const struct acpi_device_id bmi_acpi_ids[] = {
-	{ "BSG1160", (unsigned long)bsg1160_data },
-	{ "BSG2150", (unsigned long)bsg2150_data },
-	{ "INT3515", (unsigned long)int3515_data },
+	{ "BSG1160", (unsigned long)&bsg1160_data },
+	{ "BSG2150", (unsigned long)&bsg2150_data },
+	{ "INT3515", (unsigned long)&int3515_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bmi_acpi_ids);
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index a015a3b1d6f2..3a92b7bdb91d 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1734,12 +1734,13 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 	bool is_serial_bus_slave = false;
 	static const struct acpi_device_id ignore_serial_bus_ids[] = {
 	/*
-	 * These devices have multiple I2cSerialBus resources and an i2c-client
-	 * must be instantiated for each, each with its own i2c_device_id.
-	 * Normally we only instantiate an i2c-client for the first resource,
-	 * using the ACPI HID as id. These special cases are handled by the
-	 * drivers/acpi/bus-multi-instantiate.c driver, which knows
-	 * which i2c_device_id to use for each resource.
+	 * These devices have multiple I2cSerialBus/SpiSerialBus resources
+	 * and an (i2c/spi)-client must be instantiated for each, each with
+	 * its own i2c_device_id/spi_device_id.
+	 * Normally we only instantiate an (i2c/spi)-client for the first
+	 * resource, using the ACPI HID as id. These special cases are handled
+	 * by the drivers/acpi/bus-multi-instantiate.c driver, which
+	 * knows which i2c_device_id or spi_device_id to use for each resource.
 	 */
 		{"BSG1160", },
 		{"BSG2150", },
-- 
2.25.1

