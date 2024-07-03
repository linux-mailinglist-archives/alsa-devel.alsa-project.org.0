Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F277C9262EB
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 16:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E8D2F54;
	Wed,  3 Jul 2024 16:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E8D2F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720015774;
	bh=Bw4vY7jEjSOg6hMIE8OqvIBgzXuo4jFCd+M5ok113KI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aBZ+086UnzMXJrvyZkxyIVjOFUAdxGd8WRbeeofxQUl9McOqFtuTnYK9AOz1bbkNf
	 uNJpFpwX+6MV7OvBmSsWbkw7uuY/cM4+9C5HPG8GStNhhj1/VSQv/GSmBQYBia/SPF
	 XqihwrzAd612A1KncLzRfY9nXrZvqoH2OafQBoUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4599F805B3; Wed,  3 Jul 2024 16:09:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61214F805AF;
	Wed,  3 Jul 2024 16:09:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35437F8025E; Wed,  3 Jul 2024 16:08:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A84C2F800F8
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 16:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A84C2F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qb3NIjXO
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4634xaHm026216;
	Wed, 3 Jul 2024 09:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=bVB0i4pNoq2fQu30
	FpUkrcVgBx0xpMu1TujfbGuFeIw=; b=qb3NIjXOYfTGDwBoLoQwY2zOV3ql/wLk
	hHOsSOcZnjMNd71YramZEb8TKr7sQOXJlSQLX+CM2hCOfQeDIshWlMZPgjYIJsE+
	vbYraNDSiuA55GA3XhqbijJOp5VNB26CoeD4IDeEOLo/N767b6HJl5k1IBLZ5vHt
	P9uR1oUkZAdItjNu/vxczaereSAdKhXVV6M58gxmBZ/qGGqjd0DUztn78eErMZzF
	RYLFCiqIU7iOfyeKwkG1wfCBf53uTUWQlYRHt5ZaDSG6lmj14cYQHyN1o0BQMFSi
	A/G3SH5ZWC+aiObCD8+9PSSMyAq4klFupGTNMqxWCG+OEBuspMTG3g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 402fnxd5vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 09:08:25 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 15:08:23 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 3 Jul 2024 15:08:23 +0100
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com
 [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7A5FC820244;
	Wed,  3 Jul 2024 14:08:23 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ALSA: hda: cs35l41: Fix missing Speaker ID GPIO
 description in _DSD
Date: Wed, 3 Jul 2024 15:07:28 +0100
Message-ID: <20240703140802.27688-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NQIdW6bR-EvdD0F1Gn5Cil1PY5TeSeum
X-Proofpoint-ORIG-GUID: NQIdW6bR-EvdD0F1Gn5Cil1PY5TeSeum
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2S37L5LW6W2DHQXFIUZTOHMNEXIGBTA4
X-Message-ID-Hash: 2S37L5LW6W2DHQXFIUZTOHMNEXIGBTA4
X-MailFrom: prvs=491440e6b3=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2S37L5LW6W2DHQXFIUZTOHMNEXIGBTA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Laptop 10431A63 contains valid _DSD, but missing Speaker ID
description. Add this discription, but keep the rest of the _DSD to
ensure the correct firmware and tuning is loaded for this laptop.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c          | 86 ++++++++++++++++------------
 sound/pci/hda/cs35l41_hda.h          |  1 +
 sound/pci/hda/cs35l41_hda_property.c | 15 +++++
 3 files changed, 65 insertions(+), 37 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index ee9f83b737de..4b411ed8c3fe 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1753,38 +1753,14 @@ int cs35l41_get_speaker_id(struct device *dev, int amp_index, int num_amps, int
 	return speaker_id;
 }
 
-static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, int id)
+int cs35l41_hda_parse_acpi(struct cs35l41_hda *cs35l41, struct device *physdev, int id)
 {
 	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
 	u32 values[HDA_MAX_COMPONENTS];
-	struct acpi_device *adev;
-	struct device *physdev;
-	struct spi_device *spi;
-	const char *sub;
 	char *property;
 	size_t nval;
 	int i, ret;
 
-	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
-	if (!adev) {
-		dev_err(cs35l41->dev, "Failed to find an ACPI device for %s\n", hid);
-		return -ENODEV;
-	}
-
-	cs35l41->dacpi = adev;
-	physdev = get_device(acpi_get_first_physical_node(adev));
-
-	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
-	if (IS_ERR(sub))
-		sub = NULL;
-	cs35l41->acpi_subsystem_id = sub;
-
-	ret = cs35l41_add_dsd_properties(cs35l41, physdev, id, hid);
-	if (!ret) {
-		dev_info(cs35l41->dev, "Using extra _DSD properties, bypassing _DSD in ACPI\n");
-		goto out;
-	}
-
 	property = "cirrus,dev-index";
 	ret = device_property_count_u32(physdev, property);
 	if (ret <= 0)
@@ -1816,8 +1792,9 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	/* To use the same release code for all laptop variants we can't use devm_ version of
 	 * gpiod_get here, as CLSA010* don't have a fully functional bios with an _DSD node
 	 */
-	cs35l41->reset_gpio = fwnode_gpiod_get_index(acpi_fwnode_handle(adev), "reset", cs35l41->index,
-						     GPIOD_OUT_LOW, "cs35l41-reset");
+	cs35l41->reset_gpio = fwnode_gpiod_get_index(acpi_fwnode_handle(cs35l41->dacpi), "reset",
+						     cs35l41->index, GPIOD_OUT_LOW,
+						     "cs35l41-reset");
 
 	property = "cirrus,speaker-position";
 	ret = device_property_read_u32_array(physdev, property, values, nval);
@@ -1873,6 +1850,51 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 		hw_cfg->bst_type = CS35L41_EXT_BOOST;
 
 	hw_cfg->valid = true;
+
+	return 0;
+err:
+	dev_err(cs35l41->dev, "Failed property %s: %d\n", property, ret);
+	hw_cfg->valid = false;
+	hw_cfg->gpio1.valid = false;
+	hw_cfg->gpio2.valid = false;
+	acpi_dev_put(cs35l41->dacpi);
+
+	return ret;
+}
+
+static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, int id)
+{
+	struct acpi_device *adev;
+	struct device *physdev;
+	struct spi_device *spi;
+	const char *sub;
+	int ret;
+
+	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
+	if (!adev) {
+		dev_err(cs35l41->dev, "Failed to find an ACPI device for %s\n", hid);
+		return -ENODEV;
+	}
+
+	cs35l41->dacpi = adev;
+	physdev = get_device(acpi_get_first_physical_node(adev));
+
+	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
+	if (IS_ERR(sub))
+		sub = NULL;
+	cs35l41->acpi_subsystem_id = sub;
+
+	ret = cs35l41_add_dsd_properties(cs35l41, physdev, id, hid);
+	if (!ret) {
+		dev_info(cs35l41->dev, "Using extra _DSD properties, bypassing _DSD in ACPI\n");
+		goto out;
+	}
+
+	ret = cs35l41_hda_parse_acpi(cs35l41, physdev, id);
+	if (ret) {
+		put_device(physdev);
+		return ret;
+	}
 out:
 	put_device(physdev);
 
@@ -1888,16 +1910,6 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	}
 
 	return 0;
-
-err:
-	dev_err(cs35l41->dev, "Failed property %s: %d\n", property, ret);
-	hw_cfg->valid = false;
-	hw_cfg->gpio1.valid = false;
-	hw_cfg->gpio2.valid = false;
-	acpi_dev_put(cs35l41->dacpi);
-	put_device(physdev);
-
-	return ret;
 }
 
 int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index b0bebb778462..c730b3351589 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -104,5 +104,6 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 		      struct regmap *regmap, enum control_bus control_bus);
 void cs35l41_hda_remove(struct device *dev);
 int cs35l41_get_speaker_id(struct device *dev, int amp_index, int num_amps, int fixed_gpio_id);
+int cs35l41_hda_parse_acpi(struct cs35l41_hda *cs35l41, struct device *physdev, int id);
 
 #endif /*__CS35L41_HDA_H__*/
diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 51998d1c72ff..5860379a0412 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -428,6 +428,20 @@ static int lenovo_legion_no_acpi(struct cs35l41_hda *cs35l41, struct device *phy
 	return 0;
 }
 
+static int missing_speaker_id_gpio2(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
+				    const char *hid)
+{
+	int ret;
+
+	ret = cs35l41_add_gpios(cs35l41, physdev, -1, 2, -1, 2);
+	if (ret) {
+		dev_err(cs35l41->dev, "Error adding GPIO mapping: %d\n", ret);
+		return ret;
+	}
+
+	return cs35l41_hda_parse_acpi(cs35l41, physdev, id);
+}
+
 struct cs35l41_prop_model {
 	const char *hid;
 	const char *ssid;
@@ -501,6 +515,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "104317F3", generic_dsd_config },
 	{ "CSC3551", "10431863", generic_dsd_config },
 	{ "CSC3551", "104318D3", generic_dsd_config },
+	{ "CSC3551", "10431A63", missing_speaker_id_gpio2 },
 	{ "CSC3551", "10431A83", generic_dsd_config },
 	{ "CSC3551", "10431B93", generic_dsd_config },
 	{ "CSC3551", "10431C9F", generic_dsd_config },
-- 
2.43.0

