Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51B757FFF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:47:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3A01D9;
	Tue, 18 Jul 2023 16:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3A01D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689691665;
	bh=qUIeHByOOABhazgK9uLD7rW2K/z0/dp/IZ15RZZuOgM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=saqIhXORzBIILKRtOurVjKdHOW8OSmYLPb7JKxvqtOZMSSuoYHnzYN22rDWtih9YF
	 fuU2KdMYFkLWh20ymloVd/sVEKsXGSKLBXVbMpEEPiSaSohlzQT7gvZyPUXJV2VGy8
	 OvY8h3wA86BYfLArD1unTeHDA/kfApkfhp1s5LKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5837BF8007E; Tue, 18 Jul 2023 16:46:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FB5F8027B;
	Tue, 18 Jul 2023 16:46:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54012F8032D; Tue, 18 Jul 2023 16:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA702F80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA702F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PNb+OnjB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36I7kHxC024058;
	Tue, 18 Jul 2023 09:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=0
	G3ywaHiTI2K4Iq59zz0mJoTcYfX+05Q6H/h75rm73M=; b=PNb+OnjBag/MGfHC0
	00o37F5KNsBH6vj9JJBzi0ZTOSPfCd/vnL5fP6WVxBwBGf5SZM/WNp7wT39BgF/C
	FbJakYU0eTtdFtRdhpp0mKO3wlASiMcK53/M38xm2pO22gLlAfXgFVB2EqcN1EFN
	nfj9WuabIF/loeXPWNDm/fP7pvTwq0pycnPrOS6IxXCs34pfzl4VCIHKuxSj2XKF
	yOvWb9qGcjgiDTSDunXwESK/9GxufHlX2jrJXBDd2SS4cz74ktBd9Ft4BDP2NyN8
	vfAD8t4DvpT4pCNmHUrDBV4kKk9alBYLfDeu5LduWqMzklVmF8v8qC5Jp5Bi79Oa
	cNGpA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62ucu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 09:46:41 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 15:46:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 18 Jul 2023 15:46:29 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.65.142])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E77DD11AB;
	Tue, 18 Jul 2023 14:46:28 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Patch soft registers to defaults
Date: Tue, 18 Jul 2023 15:46:25 +0100
Message-ID: <20230718144625.39634-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: v5oVImHN2qJH3UiahHtCUQ8k9EC0bKRg
X-Proofpoint-ORIG-GUID: v5oVImHN2qJH3UiahHtCUQ8k9EC0bKRg
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LS6NPLESGJY5JXPHPNOBFEARHCBCKO4X
X-Message-ID-Hash: LS6NPLESGJY5JXPHPNOBFEARHCBCKO4X
X-MailFrom: prvs=2563f3668e=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LS6NPLESGJY5JXPHPNOBFEARHCBCKO4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The soft (firmware) registers for volume/mute/posture are not reset by
a chip soft-reset, so use a regmap patch to set them to defaults.

cs35l56_reread_firmware_registers() has been removed. Its intent was to
use whatever the firmware set as a default. But the driver now patches the
defaults to the registers.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  2 +-
 sound/soc/codecs/cs35l56-shared.c | 38 +++++++++++++------------------
 sound/soc/codecs/cs35l56.c        |  5 ++--
 3 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 1f9713d7ca76..ec672daa36cf 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -260,7 +260,7 @@ extern const struct cs_dsp_region cs35l56_dsp1_regions[CS35L56_NUM_DSP_REGIONS];
 extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
 extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 
-void cs35l56_reread_firmware_registers(struct device *dev, struct regmap *regmap);
+int cs35l56_set_patch(struct regmap *regmap);
 int cs35l56_get_bclk_freq_id(unsigned int freq);
 void cs35l56_fill_supply_names(struct regulator_bulk_data *data);
 
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 60da8c75b7b9..7126f06b8047 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -11,6 +11,19 @@
 
 #include "cs35l56.h"
 
+static const struct reg_sequence cs35l56_patch[] = {
+	/* These are not reset by a soft-reset, so patch to defaults. */
+	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
+	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },
+	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
+};
+
+int cs35l56_set_patch(struct regmap *regmap)
+{
+	return regmap_register_patch(regmap, cs35l56_patch, ARRAY_SIZE(cs35l56_patch));
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, SND_SOC_CS35L56_SHARED);
+
 static const struct reg_default cs35l56_reg_defaults[] = {
 	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
 	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
@@ -35,9 +48,9 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 	{ CS35L56_IRQ1_MASK_8,			0xfc000fff },
 	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
 	{ CS35L56_IRQ1_MASK_20,			0x15c00000 },
-	/* CS35L56_MAIN_RENDER_USER_MUTE - soft register, no default	*/
-	/* CS35L56_MAIN_RENDER_USER_VOLUME - soft register, no default	*/
-	/* CS35L56_MAIN_POSTURE_NUMBER - soft register, no default	*/
+	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
+	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },
+	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
 };
 
 static bool cs35l56_is_dsp_memory(unsigned int reg)
@@ -181,25 +194,6 @@ static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const u32 cs35l56_firmware_registers[] = {
-	CS35L56_MAIN_RENDER_USER_MUTE,
-	CS35L56_MAIN_RENDER_USER_VOLUME,
-	CS35L56_MAIN_POSTURE_NUMBER,
-};
-
-void cs35l56_reread_firmware_registers(struct device *dev, struct regmap *regmap)
-{
-	int i;
-	unsigned int val;
-
-	for (i = 0; i < ARRAY_SIZE(cs35l56_firmware_registers); i++) {
-		regmap_read(regmap, cs35l56_firmware_registers[i], &val);
-		dev_dbg(dev, "%s: %d: %#x: %#x\n", __func__,
-			i, cs35l56_firmware_registers[i], val);
-	}
-}
-EXPORT_SYMBOL_NS_GPL(cs35l56_reread_firmware_registers, SND_SOC_CS35L56_SHARED);
-
 const struct cs_dsp_region cs35l56_dsp1_regions[] = {
 	{ .type = WMFW_HALO_PM_PACKED,	.base = CS35L56_DSP1_PMEM_0 },
 	{ .type = WMFW_HALO_XM_PACKED,	.base = CS35L56_DSP1_XMEM_PACKED_0 },
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index c03f9d3c9a13..e046fdd26b74 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1572,8 +1572,9 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	if (ret)
 		return ret;
 
-	/* Populate soft registers in the regmap cache */
-	cs35l56_reread_firmware_registers(cs35l56->dev, cs35l56->regmap);
+	ret = cs35l56_set_patch(cs35l56->regmap);
+	if (ret)
+		return ret;
 
 	/* Registers could be dirty after soft reset or SoundWire enumeration */
 	regcache_sync(cs35l56->regmap);
-- 
2.30.2

