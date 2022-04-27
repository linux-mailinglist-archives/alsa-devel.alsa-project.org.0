Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8612511BAA
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 409E416D1;
	Wed, 27 Apr 2022 17:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 409E416D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651072274;
	bh=4/49InIZ76HCUwpd/60SrnuCATFbXMBPCdzbsR7CI0Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vgm4bwXHBppSUUBornIMZ1iH+3p8BLp6xTlimqBHH20ihMmGnsiK7MBqIpOkB5363
	 QzJqtshKVTQF4MVUHAlVVEOM+VtyLz6MEMkb/Ubb2NGDahVukzBLTfBLDkaFR54RST
	 OxFI/8myz0uu8XsxfuoGCtyNfO9yWMVrt8bOW3q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D2C5F80528;
	Wed, 27 Apr 2022 17:08:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9AF9F80543; Wed, 27 Apr 2022 17:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FA3CF80511
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FA3CF80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WTQNBVhV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RBg6qE022428;
 Wed, 27 Apr 2022 10:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oexWDZMMh/7506IlXy/tU91+gIURReqabzxPCviuK/4=;
 b=WTQNBVhV8D807snXKPHhjaII8By5fVUkw35/AjmyYI/NJLol8R4gQp1xHl1uo9sBbb9b
 s+emR+aNKlNGC9camdAU756IadnQMc4RPVFxiSlttA4wCZlINdqWWhmGCOLCA3qzr5Ju
 RhspINXbduk0Yggki/csBrENgkplYGAXnkYTeC1qAYghuuNGO6K4ii540DZv8MOQB8Id
 OxV57kh6tyPIkmNV5ANO/j0TOA4QFZbLTImeDA6Kt9ns4RYhILZ1alYuklk9SMdOsfq5
 lXhGA7FpiDVZ7lN0q/NSCnfwjYNGOwZa0x6+kBywdMOPpkuF4dnL3GeiHsGVwPtHB1rc Cw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt60xte-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 10:07:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 16:07:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 16:07:25 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.170])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B69F146C;
 Wed, 27 Apr 2022 15:07:24 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH 07/26] ASoC: cs35l41: Move cs35l41 fs errata into shared code
Date: Wed, 27 Apr 2022 16:07:01 +0100
Message-ID: <20220427150720.9194-8-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SugMQLUQVDdRxosv0negCrPeLDnd-fdI
X-Proofpoint-ORIG-GUID: SugMQLUQVDdRxosv0negCrPeLDnd-fdI
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

This sequence is required to setup firmware, and will
be needed for hda driver.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  1 +
 sound/soc/codecs/cs35l41-lib.c | 32 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 26 ++------------------------
 3 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 2271471225b1..d0cfb41495b0 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -879,6 +879,7 @@ int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
 int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 			      enum cs35l41_cspl_mbox_cmd cmd);
+int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap);
 int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 		       struct cs35l41_hw_cfg *hw_cfg);
 bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 451d3be37157..85fe5f88d6b4 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -667,6 +667,25 @@ static const struct reg_sequence cs35l41_revb2_errata_patch[] = {
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
 };
 
+static const struct reg_sequence cs35l41_fs_errata_patch[] = {
+	{ CS35L41_DSP1_RX1_RATE,	0x00000001 },
+	{ CS35L41_DSP1_RX2_RATE,	0x00000001 },
+	{ CS35L41_DSP1_RX3_RATE,	0x00000001 },
+	{ CS35L41_DSP1_RX4_RATE,	0x00000001 },
+	{ CS35L41_DSP1_RX5_RATE,	0x00000001 },
+	{ CS35L41_DSP1_RX6_RATE,	0x00000001 },
+	{ CS35L41_DSP1_RX7_RATE,	0x00000001 },
+	{ CS35L41_DSP1_RX8_RATE,	0x00000001 },
+	{ CS35L41_DSP1_TX1_RATE,	0x00000001 },
+	{ CS35L41_DSP1_TX2_RATE,	0x00000001 },
+	{ CS35L41_DSP1_TX3_RATE,	0x00000001 },
+	{ CS35L41_DSP1_TX4_RATE,	0x00000001 },
+	{ CS35L41_DSP1_TX5_RATE,	0x00000001 },
+	{ CS35L41_DSP1_TX6_RATE,	0x00000001 },
+	{ CS35L41_DSP1_TX7_RATE,	0x00000001 },
+	{ CS35L41_DSP1_TX8_RATE,	0x00000001 },
+};
+
 static const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[] = {
 	{
 		.id = 0x01,
@@ -1263,6 +1282,19 @@ int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 }
 EXPORT_SYMBOL_GPL(cs35l41_set_cspl_mbox_cmd);
 
+int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap)
+{
+	int ret;
+
+	ret = regmap_multi_reg_write(regmap, cs35l41_fs_errata_patch,
+				     ARRAY_SIZE(cs35l41_fs_errata_patch));
+	if (ret < 0)
+		dev_err(dev, "Failed to write fs errata: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cs35l41_write_fs_errata);
+
 MODULE_DESCRIPTION("CS35L41 library");
 MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 0285946688f7..75527649bb14 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1093,25 +1093,6 @@ static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_hw_cfg *hw_cf
 	return 0;
 }
 
-static const struct reg_sequence cs35l41_fs_errata_patch[] = {
-	{ CS35L41_DSP1_RX1_RATE,	0x00000001 },
-	{ CS35L41_DSP1_RX2_RATE,	0x00000001 },
-	{ CS35L41_DSP1_RX3_RATE,	0x00000001 },
-	{ CS35L41_DSP1_RX4_RATE,	0x00000001 },
-	{ CS35L41_DSP1_RX5_RATE,	0x00000001 },
-	{ CS35L41_DSP1_RX6_RATE,	0x00000001 },
-	{ CS35L41_DSP1_RX7_RATE,	0x00000001 },
-	{ CS35L41_DSP1_RX8_RATE,	0x00000001 },
-	{ CS35L41_DSP1_TX1_RATE,	0x00000001 },
-	{ CS35L41_DSP1_TX2_RATE,	0x00000001 },
-	{ CS35L41_DSP1_TX3_RATE,	0x00000001 },
-	{ CS35L41_DSP1_TX4_RATE,	0x00000001 },
-	{ CS35L41_DSP1_TX5_RATE,	0x00000001 },
-	{ CS35L41_DSP1_TX6_RATE,	0x00000001 },
-	{ CS35L41_DSP1_TX7_RATE,	0x00000001 },
-	{ CS35L41_DSP1_TX8_RATE,	0x00000001 },
-};
-
 static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 {
 	struct wm_adsp *dsp;
@@ -1132,12 +1113,9 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 	dsp->cs_dsp.num_mems = ARRAY_SIZE(cs35l41_dsp1_regions);
 	dsp->cs_dsp.lock_regions = 0xFFFFFFFF;
 
-	ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_fs_errata_patch,
-				     ARRAY_SIZE(cs35l41_fs_errata_patch));
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Failed to write fs errata: %d\n", ret);
+	ret = cs35l41_write_fs_errata(cs35l41->dev, cs35l41->regmap);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = wm_halo_init(dsp);
 	if (ret) {
-- 
2.32.0

