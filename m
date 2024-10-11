Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D511899A018
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 11:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 515BA85D;
	Fri, 11 Oct 2024 11:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 515BA85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728638614;
	bh=0yFtKQoVOjJqZvJsyiHOb8icb0oscB8+syNQOO/JFu4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rmw1hjCFjsleK9T644vgLXg8h18MeapjOlbXU07ciyF4/jgmNUmVTYU5s55ut0zDD
	 WbY9dHYGNH0kIsqcY7qVM8sL1qBKjXCWEUqPngJrJ5H4erVlmfBo1Fucl4G50cXY++
	 RKl4Esti/logt6i/hu/auMfCcNMu8/SbY3bFyC9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75B19F80727; Fri, 11 Oct 2024 11:21:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98404F805B2;
	Fri, 11 Oct 2024 11:21:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 220BFF80528; Fri, 11 Oct 2024 10:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D862EF80496
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 10:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D862EF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=N6YoSBhf
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49B8rbxh024524;
	Fri, 11 Oct 2024 03:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728636817;
	bh=+Shu2aoaU2vVehSY+LLbrY6m+HHX1k5cPbMb75n6AKY=;
	h=From:To:CC:Subject:Date;
	b=N6YoSBhfXO/KEWrZNVMhTG1OQ80/GWyLSbpUkh7Byvd8omCYsdkcB2QMqo85cFxhu
	 VWPErC4HXTfUt+qdCVicPfrlrcfykHFA8wkmS1B95GNdW/tWb2LI02pik8JOGgus1j
	 Daf0KAq4+sFdm0JyvgyXf6lfnb7QNlq7pf9Q7m8o=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49B8rbBD064864;
	Fri, 11 Oct 2024 03:53:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 03:53:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 03:53:36 -0500
Received: from lelvsmtp5.itg.ti.com ([10.250.165.138])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49B8rS0M127994;
	Fri, 11 Oct 2024 03:53:29 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <kevin-lu@ti.com>,
        <shenghao-ding@ti.com>, <navada@ti.com>, <13916275206@139.com>,
        <v-hampiholi@ti.com>, <v-po@ti.com>, <niranjan.hy@ti.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <liam.r.girdwood@intel.com>, <yung-chuan.liao@linux.intel.com>,
        <baojun.xu@ti.com>, <broonie@kernel.org>, <soyer@irl.hu>
Subject: [PATCH v1] ALSA: hda/tas2781: Add speaker id check for ASUS projects
Date: Fri, 11 Oct 2024 16:53:03 +0800
Message-ID: <20241011085303.738-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KHCSI75CCEUHSVCPPFNB7QUTHHA6CRUI
X-Message-ID-Hash: KHCSI75CCEUHSVCPPFNB7QUTHHA6CRUI
X-Mailman-Approved-At: Fri, 11 Oct 2024 09:20:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHCSI75CCEUHSVCPPFNB7QUTHHA6CRUI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add speaker id check by gpio in ACPI for ASUS projects.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 include/sound/tas2781.h         |  3 +++
 sound/pci/hda/tas2781_hda_i2c.c | 39 ++++++++++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 8cd6da0480b7..f8a3dc13cbbc 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -107,6 +107,8 @@
 #define TASDEVICE_CMD_DELAY		0x3
 #define TASDEVICE_CMD_FIELD_W		0x4
 
+#define TAS2781_ASUS_ID			0x10430000
+
 enum audio_device {
 	TAS2563,
 	TAS2781,
@@ -156,6 +158,7 @@ struct tasdevice_priv {
 	struct tasdevice_rca rcabin;
 	struct calidata cali_data;
 	struct tasdevice_fw *fmw;
+	struct gpio_desc *speaker_id;
 	struct gpio_desc *reset;
 	struct mutex codec_lock;
 	struct regmap *regmap;
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 370d847517f9..1f71927825b2 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -615,7 +615,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	struct tasdevice_priv *tas_priv = context;
 	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
 	struct hda_codec *codec = tas_priv->codec;
-	int i, ret;
+	int i, ret, spk_id;
 
 	pm_runtime_get_sync(tas_priv->dev);
 	mutex_lock(&tas_priv->codec_lock);
@@ -648,8 +648,23 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tasdevice_dsp_remove(tas_priv);
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
-	scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X.bin",
-		codec->core.subsystem_id & 0xffff);
+	if ((codec->core.subsystem_id & 0xffff0000) == TAS2781_ASUS_ID) {
+		// Speaker id need to be checked.
+		if (tas_priv->speaker_id)
+			spk_id = gpiod_get_value(tas_priv->speaker_id);
+		else
+			spk_id = 0;
+		if (spk_id < 0 || spk_id > 1) {
+			// Speaker id is not valid, use default.
+			dev_dbg(tas_priv->dev, "Wrong spk_id = %d\n", spk_id);
+			spk_id = 0;
+		}
+		scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X%01d.bin",
+			codec->core.subsystem_id & 0xffff, spk_id);
+	} else {
+		scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X.bin",
+			codec->core.subsystem_id & 0xffff);
+	}
 	ret = tasdevice_dsp_parser(tas_priv);
 	if (ret) {
 		dev_err(tas_priv->dev, "dspfw load %s error\n",
@@ -787,6 +802,15 @@ static void tas2781_hda_remove(struct device *dev)
 	tasdevice_remove(tas_hda->priv);
 }
 
+static const struct acpi_gpio_params speakerid_gpios = { 0, 0, false };
+static const struct acpi_gpio_params interrupt_gpios = { 1, 0, false };
+
+static const struct acpi_gpio_mapping tas2781_speaker_id_gpios[] = {
+	{ "speakerid-gpios", &speakerid_gpios, 1 },
+	{ "interrupt-gpios", &interrupt_gpios, 1 },
+	{ }
+};
+
 static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 {
 	struct tas2781_hda *tas_hda;
@@ -823,6 +847,15 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	if (ret)
 		return dev_err_probe(tas_hda->dev, ret,
 			"Platform not supported\n");
+	ret = devm_acpi_dev_add_driver_gpios(tas_hda->dev,
+					     tas2781_speaker_id_gpios);
+	if (ret)
+		dev_info(tas_hda->dev, "Unable to add GPIO mapping table\n");
+
+	tas_hda->priv->speaker_id = devm_gpiod_get(tas_hda->dev, "speakerid",
+						   GPIOD_IN);
+	if (IS_ERR(tas_hda->priv->speaker_id))
+		dev_info(tas_hda->dev, "Failed to get Speaker id gpio.\n");
 
 	ret = tasdevice_init(tas_hda->priv);
 	if (ret)
-- 
2.43.0

