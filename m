Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 528D85810DE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 12:12:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0AC485D;
	Tue, 26 Jul 2022 12:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0AC485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658830370;
	bh=aSCHI1NHCj5q+lgDDhTLBz2NIly5uG9vM9Ws8ooP+II=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oaia4pfIr4ymRfKOqQPDznvfJEsg2EuHahQ2g+5frB9yIX8xk85F6aCWWN6Gcofth
	 Bk/1lLDzM5cXJpFi39y4dbwnkCbQt0R7OKKtFNUUuj6a64hlhYK/aWTbov+MNIHYra
	 vdndW6ATtsS1KZTPzS73p5sw1+ypEglyM5u+X/DU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5764EF80539;
	Tue, 26 Jul 2022 12:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC4D7F804FD; Tue, 26 Jul 2022 12:11:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF3CEF8025A
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 12:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF3CEF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MmAJsIDa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q7EUxi002774;
 Tue, 26 Jul 2022 05:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=J6a4T8pQxftHI75LH/Irjoxs38fV4yY7RSYMSSab9K4=;
 b=MmAJsIDayach9umbmhJxpygRVzvMiS9BP51/7B3oqLpASHXkV4Xu51AowBqnKQfccPuY
 PDt3NndaCfaqeDVQ8LiQXGB6yRzNurOH/l7SHp6gjfViUS/zcTiMkevRHHmeNfUCaIAq
 XlXiG1fgNF69cDQGZkvgfTyXxHgfXZD9W85yU1jrRZoJHOJkyTi8kEVEWWFEmYGD7ITB
 1yyQ6M5p91h5mwEKOMky8eZ4YDKdhyFw9A5I/R0gD+hdg2VuMNU28p9HeZYO7HV3ioeS
 /YtrIPZiuiy8fBWK+eXRGCD5SZs5d0MmHbc03CJheox7QUbwjmapc/SfY/Rx3aCr68qs YA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1ub6f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 05:11:38 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 26 Jul
 2022 05:11:35 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Tue, 26 Jul 2022 05:11:35 -0500
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.94])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BFD722C5;
 Tue, 26 Jul 2022 10:11:35 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cameron
 Berkenpas <cam@neo-zeon.de>
Subject: [PATCH 2/2] ALSA: hda: cs35l41: Support CLSA0101
Date: Tue, 26 Jul 2022 11:11:31 +0100
Message-ID: <20220726101131.68058-3-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726101131.68058-1-tanureal@opensource.cirrus.com>
References: <20220726101131.68058-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qMB8JG4mIG_t3gyNHuQ7TjYZvBgoSvf9
X-Proofpoint-ORIG-GUID: qMB8JG4mIG_t3gyNHuQ7TjYZvBgoSvf9
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

Add support for Intel version of Legion 7 laptop.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c   | 66 +++++++++++++++++++++--------------
 sound/pci/hda/patch_realtek.c | 12 +++++++
 2 files changed, 52 insertions(+), 26 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 48d94c683b75..6edf95553745 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1133,6 +1133,45 @@ static int cs35l41_get_speaker_id(struct device *dev, int amp_index,
 	return speaker_id;
 }
 
+/*
+ * Device CLSA010(0/1) doesn't have _DSD so a gpiod_get by the label reset won't work.
+ * And devices created by serial-multi-instantiate don't have their device struct
+ * pointing to the correct fwnode, so acpi_dev must be used here.
+ * And devm functions expect that the device requesting the resource has the correct
+ * fwnode.
+ */
+static int cs35l41_no_acpi_dsd(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
+			       const char *hid)
+{
+	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
+
+	/* check I2C address to assign the index */
+	cs35l41->index = id == 0x40 ? 0 : 1;
+	cs35l41->channel_index = 0;
+	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
+	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, 0, 0, 2);
+	hw_cfg->spk_pos = cs35l41->index;
+	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
+	hw_cfg->gpio2.valid = true;
+	hw_cfg->valid = true;
+	put_device(physdev);
+
+	if (strncmp(hid, "CLSA0100", 8) == 0) {
+		hw_cfg->bst_type = CS35L41_EXT_BOOST_NO_VSPK_SWITCH;
+	} else if (strncmp(hid, "CLSA0101", 8) == 0) {
+		hw_cfg->bst_type = CS35L41_EXT_BOOST;
+		hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
+		hw_cfg->gpio1.valid = true;
+	} else {
+		hw_cfg->valid = false;
+		hw_cfg->gpio1.valid = false;
+		hw_cfg->gpio2.valid = false;
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, int id)
 {
 	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
@@ -1161,7 +1200,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	property = "cirrus,dev-index";
 	ret = device_property_count_u32(physdev, property);
 	if (ret <= 0)
-		goto no_acpi_dsd;
+		return cs35l41_no_acpi_dsd(cs35l41, physdev, id, hid);
 
 	if (ret > ARRAY_SIZE(values)) {
 		ret = -EINVAL;
@@ -1255,31 +1294,6 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	dev_err(cs35l41->dev, "Failed property %s: %d\n", property, ret);
 
 	return ret;
-
-no_acpi_dsd:
-	/*
-	 * Device CLSA0100 doesn't have _DSD so a gpiod_get by the label reset won't work.
-	 * And devices created by serial-multi-instantiate don't have their device struct
-	 * pointing to the correct fwnode, so acpi_dev must be used here.
-	 * And devm functions expect that the device requesting the resource has the correct
-	 * fwnode.
-	 */
-	if (strncmp(hid, "CLSA0100", 8) != 0)
-		return -EINVAL;
-
-	/* check I2C address to assign the index */
-	cs35l41->index = id == 0x40 ? 0 : 1;
-	cs35l41->hw_cfg.spk_pos = cs35l41->index;
-	cs35l41->channel_index = 0;
-	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
-	cs35l41->hw_cfg.bst_type = CS35L41_EXT_BOOST_NO_VSPK_SWITCH;
-	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, 0, 0, 2);
-	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
-	hw_cfg->gpio2.valid = true;
-	cs35l41->hw_cfg.valid = true;
-	put_device(physdev);
-
-	return 0;
 }
 
 int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0e340c0934db..65fd3e599a83 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6710,6 +6710,12 @@ static void alc287_fixup_legion_16achg6_speakers(struct hda_codec *cdc, const st
 	cs35l41_generic_fixup(cdc, action, "i2c", "CLSA0100", 2);
 }
 
+static void alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const struct hda_fixup *fix,
+						 int action)
+{
+	cs35l41_generic_fixup(cdc, action, "i2c", "CLSA0101", 2);
+}
+
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
@@ -7047,6 +7053,7 @@ enum {
 	ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED,
 	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
 	ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE,
+	ALC287_FIXUP_LEGION_16ITHG6,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -8889,6 +8896,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC287_FIXUP_LEGION_16ITHG6] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_legion_16ithg6_speakers,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9353,6 +9364,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x384a, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6", ALC287_FIXUP_LEGION_16ITHG6),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
-- 
2.37.1

