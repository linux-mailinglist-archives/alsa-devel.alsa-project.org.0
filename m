Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C65C490C35
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 17:11:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082341868;
	Mon, 17 Jan 2022 17:10:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082341868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642435886;
	bh=zDrQv0PKH9cVu0bgwvI1P5H+U7lpA2md3Ihg//jzm0M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p659FUsSEhdLjlbD4I6CXrZ/TlWLjah0XabvImD5nIYC+n7NvPvLyYMj+c/jH7CKx
	 /IMtnfRyn8FEAdpKIEBzIwJKKFEOG761pKUCnI7BqI2CSDbpD8YpD9ZB4jr5AR0oHT
	 YIDcUbkU9cmllhbYYBN0InRyLh3MDJ8oGjpShyqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22B6AF80526;
	Mon, 17 Jan 2022 17:08:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F0C4F80425; Mon, 17 Jan 2022 17:08:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5441F80425
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 17:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5441F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="eNRF7JoF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HFFYHD025138;
 Mon, 17 Jan 2022 10:08:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rkVf5Ta3dVOEysOBHkfGKELVhtVqwWh+4bLEY+Szko0=;
 b=eNRF7JoFy+9Y6Z4/C8TB4Q5BlLxYS7MrGJAflN3VRofwyXVLad6F5X+wRg7PjBLB5+nM
 VnCHF04adLyAiUOclkRcq1k2Z3jvQSdAZAQp9c0IlF/hSSd45sNVUOPQ7yfFNZILzYNS
 zMm1VC4+1ANk9y7PQdCQ7VYHdeLGUWd3p7cJxsZRHsHAnLuTT/JmrtmZAmZp8ChtA16i
 rPKZq1p7eQye8sABYvI4W7QAbOIVuD9rDwYQRP7aNaNOYZPE86WRUqcaD+oJXL2VAg2w
 UdVXtNDHwWLMg8DVt0K16Pnwg632AJigauZeQzHM9W4IA/jbS2s80eJQoBRDDEBdgv69 aA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dnaxhr22f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 17 Jan 2022 10:08:35 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 16:08:33 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Mon, 17 Jan 2022 16:08:33 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6F14911D8;
 Mon, 17 Jan 2022 16:08:33 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 6/6] ALSA: hda: cs35l41: Tidyup code
Date: Mon, 17 Jan 2022 16:08:30 +0000
Message-ID: <20220117160830.709403-6-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117160830.709403-1-tanureal@opensource.cirrus.com>
References: <20220117160830.709403-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KN-mRtUjkbpn0FZlKpg8yeubRl2_ka8n
X-Proofpoint-ORIG-GUID: KN-mRtUjkbpn0FZlKpg8yeubRl2_ka8n
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

Clean up and simplify cs35l41_hda_bind function

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---

V2: Removed changes not related with clean up

---
 sound/pci/hda/cs35l41_hda.c     | 99 ++++++++++++++++-----------------
 sound/pci/hda/cs35l41_hda.h     |  2 +-
 sound/pci/hda/cs35l41_hda_i2c.c |  1 -
 sound/pci/hda/cs35l41_hda_spi.c |  1 -
 4 files changed, 49 insertions(+), 54 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index c317b392c3e3..3f9ddfb4eaf3 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// cs35l41.c -- CS35l41 ALSA HDA audio driver
+// CS35l41 ALSA HDA audio driver
 //
 // Copyright 2021 Cirrus Logic, Inc.
 //
@@ -17,19 +17,19 @@
 #include "cs35l41_hda.h"
 
 static const struct reg_sequence cs35l41_hda_config[] = {
-	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, //3200000Hz, BCLK Input, PLL_REFCLK_EN = 1
-	{ CS35L41_GLOBAL_CLK_CTRL,	0x00000003 }, //GLOBAL_FS = 48 kHz
-	{ CS35L41_SP_ENABLES,		0x00010000 }, //ASP_RX1_EN = 1
-	{ CS35L41_SP_RATE_CTRL,		0x00000021 }, //ASP_BCLK_FREQ = 3.072 MHz
-	{ CS35L41_SP_FORMAT,		0x20200200 }, //24 bits, I2S, BCLK Slave, FSYNC Slave
-	{ CS35L41_DAC_PCM1_SRC,		0x00000008 }, //DACPCM1_SRC = ASPRX1
-	{ CS35L41_AMP_DIG_VOL_CTRL,	0x00000000 }, //AMP_VOL_PCM  0.0 dB
-	{ CS35L41_AMP_GAIN_CTRL,	0x00000084 }, //AMP_GAIN_PCM 4.5 dB
-	{ CS35L41_PWR_CTRL2,		0x00000001 }, //AMP_EN = 1
+	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3200000Hz, BCLK Input, PLL_REFCLK_EN = 1
+	{ CS35L41_GLOBAL_CLK_CTRL,	0x00000003 }, // GLOBAL_FS = 48 kHz
+	{ CS35L41_SP_ENABLES,		0x00010000 }, // ASP_RX1_EN = 1
+	{ CS35L41_SP_RATE_CTRL,		0x00000021 }, // ASP_BCLK_FREQ = 3.072 MHz
+	{ CS35L41_SP_FORMAT,		0x20200200 }, // 24 bits, I2S, BCLK Slave, FSYNC Slave
+	{ CS35L41_DAC_PCM1_SRC,		0x00000008 }, // DACPCM1_SRC = ASPRX1
+	{ CS35L41_AMP_DIG_VOL_CTRL,	0x00000000 }, // AMP_VOL_PCM  0.0 dB
+	{ CS35L41_AMP_GAIN_CTRL,	0x00000084 }, // AMP_GAIN_PCM 4.5 dB
+	{ CS35L41_PWR_CTRL2,		0x00000001 }, // AMP_EN = 1
 };
 
 static const struct reg_sequence cs35l41_hda_start_bst[] = {
-	{ CS35L41_PWR_CTRL2,		0x00000021 }, //BST_EN = 10, AMP_EN = 1
+	{ CS35L41_PWR_CTRL2,		0x00000021 }, // BST_EN = 10, AMP_EN = 1
 	{ CS35L41_PWR_CTRL1,		0x00000001, 3000}, // set GLOBAL_EN = 1
 };
 
@@ -60,7 +60,7 @@ static const struct reg_sequence cs35l41_stop_ext_vspk[] = {
 	{ 0x00000040,			0x00000055 },
 	{ 0x00000040,			0x000000AA },
 	{ 0x00007438,			0x00585941 },
-	{ 0x00002014,			0x00000000, 3000}, //set GLOBAL_EN = 0
+	{ 0x00002014,			0x00000000, 3000}, // set GLOBAL_EN = 0
 	{ 0x0000742C,			0x00000009 },
 	{ 0x00007438,			0x00580941 },
 	{ 0x00011008,			0x00000001 },
@@ -78,7 +78,7 @@ static const struct reg_sequence cs35l41_safe_to_active[] = {
 	{ 0x0000742C,			0x0000000F },
 	{ 0x0000742C,			0x00000079 },
 	{ 0x00007438,			0x00585941 },
-	{ CS35L41_PWR_CTRL1,		0x00000001, 2000 }, //GLOBAL_EN = 1
+	{ CS35L41_PWR_CTRL1,		0x00000001, 2000 }, // GLOBAL_EN = 1
 	{ 0x0000742C,			0x000000F9 },
 	{ 0x00007438,			0x00580941 },
 	{ 0x00000040,			0x000000CC },
@@ -89,8 +89,8 @@ static const struct reg_sequence cs35l41_active_to_safe[] = {
 	{ 0x00000040,			0x00000055 },
 	{ 0x00000040,			0x000000AA },
 	{ 0x00007438,			0x00585941 },
-	{ CS35L41_AMP_DIG_VOL_CTRL,	0x0000A678 }, //AMP_VOL_PCM Mute
-	{ CS35L41_PWR_CTRL2,		0x00000000 }, //AMP_EN = 0
+	{ CS35L41_AMP_DIG_VOL_CTRL,	0x0000A678 }, // AMP_VOL_PCM Mute
+	{ CS35L41_PWR_CTRL2,		0x00000000 }, // AMP_EN = 0
 	{ CS35L41_PWR_CTRL1,		0x00000000 },
 	{ 0x0000742C,			0x00000009, 2000 },
 	{ 0x00007438,			0x00580941 },
@@ -168,7 +168,6 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 
 	if (ret)
 		dev_warn(cs35l41->dev, "Failed to apply multi reg write: %d\n", ret);
-
 }
 
 static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsigned int *tx_slot,
@@ -185,20 +184,19 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
 
-	if (comps && cs35l41->index >= 0 && cs35l41->index < HDA_MAX_COMPONENTS)
-		comps = &comps[cs35l41->index];
-	else
+	if (!comps || cs35l41->index < 0 || cs35l41->index >= HDA_MAX_COMPONENTS)
 		return -EINVAL;
 
-	if (!comps->dev) {
-		comps->dev = dev;
-		strscpy(comps->name, dev_name(dev), sizeof(comps->name));
-		comps->playback_hook = cs35l41_hda_playback_hook;
-		comps->set_channel_map = cs35l41_hda_channel_map;
-		return 0;
-	}
+	comps = &comps[cs35l41->index];
+	if (comps->dev)
+		return -EBUSY;
 
-	return -EBUSY;
+	comps->dev = dev;
+	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
+	comps->playback_hook = cs35l41_hda_playback_hook;
+	comps->set_channel_map = cs35l41_hda_channel_map;
+
+	return 0;
 }
 
 static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *master_data)
@@ -269,11 +267,7 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41,
 		cs35l41->reg_seq = &cs35l41_hda_reg_seq_ext_bst;
 	}
 
-	ret = cs35l41_hda_channel_map(cs35l41->dev, 0, NULL, 1, (unsigned int *)&hw_cfg->spk_pos);
-	if (ret)
-		return ret;
-
-	return 0;
+	return cs35l41_hda_channel_map(cs35l41->dev, 0, NULL, 1, (unsigned int *)&hw_cfg->spk_pos);
 }
 
 static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41,
@@ -282,7 +276,7 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 	struct cs35l41_hda_hw_config *hw_cfg;
 	u32 values[HDA_MAX_COMPONENTS];
 	struct acpi_device *adev;
-	struct device *acpi_dev;
+	struct device *physdev;
 	char *property;
 	size_t nval;
 	int i, ret;
@@ -293,11 +287,11 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 		return ERR_PTR(-ENODEV);
 	}
 
-	acpi_dev = get_device(acpi_get_first_physical_node(adev));
+	physdev = get_device(acpi_get_first_physical_node(adev));
 	acpi_dev_put(adev);
 
 	property = "cirrus,dev-index";
-	ret = device_property_count_u32(acpi_dev, property);
+	ret = device_property_count_u32(physdev, property);
 	if (ret <= 0)
 		goto no_acpi_dsd;
 
@@ -307,7 +301,7 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 	}
 	nval = ret;
 
-	ret = device_property_read_u32_array(acpi_dev, property, values, nval);
+	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret)
 		goto err;
 
@@ -324,7 +318,9 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 		goto err;
 	}
 
-	/* No devm_ version as CLSA0100, in no_acpi_dsd case, can't use devm version */
+	/* To use the same release code for all laptop variants we can't use devm_ version of
+	 * gpiod_get here, as CLSA010* don't have a fully functional bios with an _DSD node
+	 */
 	cs35l41->reset_gpio = fwnode_gpiod_get_index(&adev->fwnode, "reset", cs35l41->index,
 						     GPIOD_OUT_LOW, "cs35l41-reset");
 
@@ -335,46 +331,46 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 	}
 
 	property = "cirrus,speaker-position";
-	ret = device_property_read_u32_array(acpi_dev, property, values, nval);
+	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret)
 		goto err_free;
 	hw_cfg->spk_pos = values[cs35l41->index];
 
 	property = "cirrus,gpio1-func";
-	ret = device_property_read_u32_array(acpi_dev, property, values, nval);
+	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret)
 		goto err_free;
 	hw_cfg->gpio1_func = values[cs35l41->index];
 
 	property = "cirrus,gpio2-func";
-	ret = device_property_read_u32_array(acpi_dev, property, values, nval);
+	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret)
 		goto err_free;
 	hw_cfg->gpio2_func = values[cs35l41->index];
 
 	property = "cirrus,boost-peak-milliamp";
-	ret = device_property_read_u32_array(acpi_dev, property, values, nval);
+	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret == 0)
 		hw_cfg->bst_ipk = values[cs35l41->index];
 
 	property = "cirrus,boost-ind-nanohenry";
-	ret = device_property_read_u32_array(acpi_dev, property, values, nval);
+	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret == 0)
 		hw_cfg->bst_ind = values[cs35l41->index];
 
 	property = "cirrus,boost-cap-microfarad";
-	ret = device_property_read_u32_array(acpi_dev, property, values, nval);
+	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret == 0)
 		hw_cfg->bst_cap = values[cs35l41->index];
 
-	put_device(acpi_dev);
+	put_device(physdev);
 
 	return hw_cfg;
 
 err_free:
 	kfree(hw_cfg);
 err:
-	put_device(acpi_dev);
+	put_device(physdev);
 	dev_err(cs35l41->dev, "Failed property %s: %d\n", property, ret);
 
 	return ERR_PTR(ret);
@@ -383,18 +379,18 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 	/*
 	 * Device CLSA0100 doesn't have _DSD so a gpiod_get by the label reset won't work.
 	 * And devices created by i2c-multi-instantiate don't have their device struct pointing to
-	 * the correct fwnode, so acpi_dev must be used here
+	 * the correct fwnode, so acpi_dev must be used here.
 	 * And devm functions expect that the device requesting the resource has the correct
-	 * fwnode
+	 * fwnode.
 	 */
 	if (strncmp(hid, "CLSA0100", 8) != 0)
 		return ERR_PTR(-EINVAL);
 
 	/* check I2C address to assign the index */
 	cs35l41->index = id == 0x40 ? 0 : 1;
-	cs35l41->reset_gpio = gpiod_get_index(acpi_dev, NULL, 0, GPIOD_OUT_HIGH);
+	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
 	cs35l41->vspk_always_on = true;
-	put_device(acpi_dev);
+	put_device(physdev);
 
 	return NULL;
 }
@@ -449,7 +445,8 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_sts);
 	if (ret || (int_sts & CS35L41_OTP_BOOT_ERR)) {
-		dev_err(cs35l41->dev, "OTP Boot error\n");
+		dev_err(cs35l41->dev, "OTP Boot status %x error: %d\n",
+			int_sts & CS35L41_OTP_BOOT_ERR, ret);
 		ret = -EIO;
 		goto err;
 	}
@@ -501,7 +498,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	if (cs35l41->reg_seq->probe) {
 		ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41->reg_seq->probe,
-					    cs35l41->reg_seq->num_probe);
+					     cs35l41->reg_seq->num_probe);
 		if (ret) {
 			dev_err(cs35l41->dev, "Fail to apply probe reg patch: %d\n", ret);
 			goto err;
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 76c69a8a22f6..640afc98b686 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
- * cs35l41_hda.h -- CS35L41 ALSA HDA audio driver
+ * CS35L41 ALSA HDA audio driver
  *
  * Copyright 2021 Cirrus Logic, Inc.
  *
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index eeb387853ee3..c2397dc53e78 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -58,7 +58,6 @@ static struct i2c_driver cs35l41_i2c_driver = {
 	.probe		= cs35l41_hda_i2c_probe,
 	.remove		= cs35l41_hda_i2c_remove,
 };
-
 module_i2c_driver(cs35l41_i2c_driver);
 
 MODULE_DESCRIPTION("HDA CS35L41 driver");
diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/pci/hda/cs35l41_hda_spi.c
index 15345a72b9d1..36815ab4e461 100644
--- a/sound/pci/hda/cs35l41_hda_spi.c
+++ b/sound/pci/hda/cs35l41_hda_spi.c
@@ -55,7 +55,6 @@ static struct spi_driver cs35l41_spi_driver = {
 	.probe		= cs35l41_hda_spi_probe,
 	.remove		= cs35l41_hda_spi_remove,
 };
-
 module_spi_driver(cs35l41_spi_driver);
 
 MODULE_DESCRIPTION("HDA CS35L41 driver");
-- 
2.34.1

