Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F6520710
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC7B7173F;
	Mon,  9 May 2022 23:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC7B7173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652133091;
	bh=5Vpql4i6MXGwcU9kscD7dJl2sB2wpkKcGdEayty/mZc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7XMSVXdmrG5mfXUHBa7LOCOsF/jqk7iJo2ha+uH2fjw3roHc/KDwDSvES0IM81wc
	 UcL+yHbAacwrySUiVOVdctdZsbZhxzpAJmDqQ8nXs4L3zaLWL4cKrNV2wSA/Nru6Ev
	 gHsmwrmMELKP3QrkZfzNr5MPb2JDALdyw2gw1k1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9424F8057D;
	Mon,  9 May 2022 23:47:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70705F80553; Mon,  9 May 2022 23:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A470F80237
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A470F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="j8isvyHm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249BF6xa021606;
 Mon, 9 May 2022 16:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=cVUaz1uHmz/wNo1g9bni33IIm5imQBWNw3gnREf9nhE=;
 b=j8isvyHmKS5zDSNqnF18Nos+iCk9vARtaEzIdZ1aSfp/rm9FZbqU/n/h6lMzgxfVyzy0
 EodAvlBr+2Asu4d4GrvEezw//CfJo/svSvgmRK55BRAgjBMEk7hTVeQ5iKrwAsyLkOXj
 tRFedIvLvQsfcTrO17pI/uVCSet+CbsTJ0dwtBSyMhjzPlXdabWOf9HOdiHr+RBOgpS/
 5coAUmw7HJCXDg3meXXJTsWBXVMVgEqAoXMjqX3xFYJ3VTvCG5wJqEwTwaNQMzael3Zv
 2Cw6vJEus1r/Xdgzzr1ojjuoGxbrQ9huV4vy53fppjXnJNMZ0e9ZUII3EX3Q4djbcOU3 Yw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp613jer-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 16:47:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 22:47:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 22:47:07 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.55])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DE8D7475;
 Mon,  9 May 2022 21:47:06 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 07/26] ASoC: cs35l41: Move cs35l41 fs errata into shared
 code
Date: Mon, 9 May 2022 22:46:44 +0100
Message-ID: <20220509214703.4482-8-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xeC6v3xzk4M_vqAne_H5MvG0969T9WQG
X-Proofpoint-ORIG-GUID: xeC6v3xzk4M_vqAne_H5MvG0969T9WQG
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
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

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  1 +
 sound/soc/codecs/cs35l41-lib.c | 32 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 26 ++------------------------
 3 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 77cfd92cf33b..ef08f2c17238 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -878,6 +878,7 @@ int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
 int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 			      enum cs35l41_cspl_mbox_cmd cmd);
+int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap);
 int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 		       struct cs35l41_hw_cfg *hw_cfg);
 bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 56464e5844d6..a3cd1255500c 100644
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
@@ -1265,6 +1284,19 @@ int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
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
2.34.1

