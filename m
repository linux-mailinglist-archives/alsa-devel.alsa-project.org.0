Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E384F470
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 12:19:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7668584D;
	Fri,  9 Feb 2024 12:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7668584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707477579;
	bh=2QCTzPWA/DkT9N/CK7WxD3DS5kay/KOm54BbjT+1Owg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ua+YLLfBzflJwfp89flTut4sfs0Hi0t01pBpyBJ9VojmqNbjQYj42aJ0x57I4FSCN
	 7b4u+bjTsRdTeDpf7ZlH0CWxc+6XAUEub8dw9DyIuuGyi3x7MLIBtXazyC6kzlqHvu
	 NBR5ycHbiW354CRZwvC//qZ8BNbtPBG6Z2kzVwSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05C1DF80578; Fri,  9 Feb 2024 12:19:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 410A9F801EB;
	Fri,  9 Feb 2024 12:19:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4567F801EB; Fri,  9 Feb 2024 12:19:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49B56F8016E
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 12:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49B56F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fBymMNbP
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4198U6AO001304;
	Fri, 9 Feb 2024 05:18:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=B
	y/TgVzKI6B9xuMXwgwHXxQ8DBbq/f8zckfTpi+B+/M=; b=fBymMNbPRHed0uZv2
	iT1vbBFsdfi64rJHFJ/kPt3VV8pqVEWzHFGFThwWgtteVLX5JrUcXIfwW30XO0g0
	wkN7ilG2sV7mt8BXK7qTKr552qVTF8irV66KZ+rDBVa0al9h41GCEAzDWFMaHeJ/
	3NfXiJ3c+S07CigfD7RC/c+SRH86uVwCLAZNunpgKvpvG+DIRCwK4aBLe8qlyBW9
	OP6Pd0Q24FX7WKU453KySynVljxoKcHBJvsVr3iZglG9Wglva2OghjHFVu2yX8IO
	CB5m4zwISPRWy/PeamnEep9+dBhHF3haF02eXrZ2G4x5OjpYjrQvBHFEcjnkcUyd
	HcdRg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w46p7b0he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 05:18:53 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 11:18:40 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 9 Feb 2024 11:18:40 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 72610820243;
	Fri,  9 Feb 2024 11:18:40 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Workaround for ACPI with broken spk-id-gpios
 property
Date: Fri, 9 Feb 2024 11:18:40 +0000
Message-ID: <20240209111840.1543630-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8t-zjLHLUIdE2Aoj5UtkS0trOnV8Bbcd
X-Proofpoint-GUID: 8t-zjLHLUIdE2Aoj5UtkS0trOnV8Bbcd
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CYAYBHIB2PBHAH5ELYCOACNURUXUXRRD
X-Message-ID-Hash: CYAYBHIB2PBHAH5ELYCOACNURUXUXRRD
X-MailFrom: prvs=97692a8f23=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYAYBHIB2PBHAH5ELYCOACNURUXUXRRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ACPI in some SoundWire laptops has a spk-id-gpios property but
it points to the wrong Device node. This patch adds a workaround to
try to get the GPIO directly from the correct Device node.

If the attempt to get the GPIOs from the property fails, the workaround
looks for the SDCA node "AF01", which is where the GpioIo resource is
defined. If this exists, a spk-id-gpios mapping is added to that node
and then the GPIO is got from that node using the property.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 93 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 98d3957c66e7..2c1313e34cce 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <linux/acpi.h>
 #include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -15,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -1260,6 +1262,94 @@ static int cs35l56_get_firmware_uid(struct cs35l56_private *cs35l56)
 	return 0;
 }
 
+/*
+ * Some SoundWire laptops have a spk-id-gpios property but it points to
+ * the wrong ACPI Device node so can't be used to get the GPIO. Try to
+ * find the SDCA node containing the GpioIo resource and add a GPIO
+ * mapping to it.
+ */
+static const struct acpi_gpio_params cs35l56_af01_first_gpio = { 0, 0, false };
+static const struct acpi_gpio_mapping cs35l56_af01_spkid_gpios_mapping[] = {
+	{ "spk-id-gpios", &cs35l56_af01_first_gpio, 1 },
+	{ }
+};
+
+static void cs35l56_acpi_dev_release_driver_gpios(void *adev)
+{
+	acpi_dev_remove_driver_gpios(adev);
+}
+
+static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l56)
+{
+	struct fwnode_handle *af01_fwnode;
+	const union acpi_object *obj;
+	struct gpio_desc *desc;
+	int ret;
+
+	/* Find the SDCA node containing the GpioIo */
+	af01_fwnode = device_get_named_child_node(cs35l56->base.dev, "AF01");
+	if (!af01_fwnode) {
+		dev_dbg(cs35l56->base.dev, "No AF01 node\n");
+		return -ENOENT;
+	}
+
+	ret = acpi_dev_get_property(ACPI_COMPANION(cs35l56->base.dev),
+				    "spk-id-gpios", ACPI_TYPE_PACKAGE, &obj);
+	if (ret) {
+		dev_dbg(cs35l56->base.dev, "Could not get spk-id-gpios package: %d\n", ret);
+		return -ENOENT;
+	}
+
+	/* The broken properties we can handle are a 4-element package (one GPIO) */
+	if (obj->package.count != 4) {
+		dev_warn(cs35l56->base.dev, "Unexpected spk-id element count %d\n",
+			 obj->package.count);
+		return -ENOENT;
+	}
+
+	/* Add a GPIO mapping if it doesn't already have one */
+	if (!fwnode_property_present(af01_fwnode, "spk-id-gpios")) {
+		struct acpi_device *adev = to_acpi_device_node(af01_fwnode);
+
+		/*
+		 * Can't use devm_acpi_dev_add_driver_gpios() because the
+		 * mapping isn't being added to the node pointed to by
+		 * ACPI_COMPANION().
+		 */
+		ret = acpi_dev_add_driver_gpios(adev, cs35l56_af01_spkid_gpios_mapping);
+		if (ret) {
+			return dev_err_probe(cs35l56->base.dev, ret,
+					     "Failed to add gpio mapping to AF01\n");
+		}
+
+		ret = devm_add_action_or_reset(cs35l56->base.dev,
+					       cs35l56_acpi_dev_release_driver_gpios,
+					       adev);
+		if (ret)
+			return ret;
+
+		dev_dbg(cs35l56->base.dev, "Added spk-id-gpios mapping to AF01\n");
+	}
+
+	desc = fwnode_gpiod_get_index(af01_fwnode, "spk-id", 0, GPIOD_IN, NULL);
+	if (IS_ERR(desc)) {
+		ret = PTR_ERR(desc);
+		return dev_err_probe(cs35l56->base.dev, ret, "Get GPIO from AF01 failed\n");
+	}
+
+	ret = gpiod_get_value_cansleep(desc);
+	gpiod_put(desc);
+
+	if (ret < 0) {
+		dev_err_probe(cs35l56->base.dev, ret, "Error reading spk-id GPIO\n");
+		return ret;
+		}
+
+	dev_info(cs35l56->base.dev, "Got spk-id from AF01\n");
+
+	return ret;
+}
+
 int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 {
 	int ret;
@@ -1304,6 +1394,9 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 	}
 
 	ret = cs35l56_get_speaker_id(&cs35l56->base);
+	if (ACPI_COMPANION(cs35l56->base.dev) && cs35l56->sdw_peripheral && (ret == -ENOENT))
+		ret = cs35l56_try_get_broken_sdca_spkid_gpio(cs35l56);
+
 	if ((ret < 0) && (ret != -ENOENT))
 		goto err;
 
-- 
2.30.2

