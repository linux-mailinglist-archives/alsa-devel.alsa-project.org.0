Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F54851DB
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:33:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB8F41832;
	Wed,  5 Jan 2022 12:32:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB8F41832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382423;
	bh=Wbtj8HqBr7e6k62hvJLIZRGks5WgCe7sDKJr/1MBOpI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eY/GhRBckrcvj06okomNm0Z8N1A0P5iQeFGiWiRa4hiLzwghsLsuIR8vTq+o/ycer
	 hIKR5lRuxjofRgXtNG0jkl63Zyi+N5uSacW7/00lBJIK/QQZ+EPHXCnKbNBbV/w+w6
	 mB0uzCiuBcc7mV2Ryabe6QdkIEmuRyiwV+JFP3aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1CE3F80524;
	Wed,  5 Jan 2022 12:30:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DFBBF802DF; Wed,  5 Jan 2022 12:30:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C247F80227
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C247F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lnuJ2pEu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2059IfsC015775;
 Wed, 5 Jan 2022 05:30:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=nezmz2TAvfHS1PFvXguf0eQ8df6hJ5ZoxLBkkmveLog=;
 b=lnuJ2pEu9ai4GriQWGLMhSLGEX/MUtFMFFh8Xfl3MMycHVlaLO0fXrfbxV9cHF7Wrozq
 BRoe4EjxlohYxdYNWH6t+39b0yLyM9rxaierQtPNKJBO4HrG5A/X+wmwww+4wVPn4VST
 OTCcbLk/hlxiX2CqUXSe7qnXJT0d3wG7uM/lG3Hq6yfQ//DLQh4gwyK24SkO6llueMzF
 iml+ljqIEKg1vohoXxoJsulXYkZoChE332RNFH+xZ/Exxx0Stfxpk2dFpkInhsg2p3n8
 6QaAAAMOxj3Er5lSf724b07AIT+W6PVRYV7lsLyWVyPjOWwm7GCv9kaAthC6Q5RXC9g/ xA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dd8jy839d-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 05:30:31 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 11:30:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 11:30:27 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 436FD11D8;
 Wed,  5 Jan 2022 11:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 7/8] ASoC: cs35l41: Update handling of test key registers
Date: Wed, 5 Jan 2022 11:30:25 +0000
Message-ID: <20220105113026.18955-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: W4MAp9sxuBzAI6NmiqdG3S0VK-zfR8Y0
X-Proofpoint-ORIG-GUID: W4MAp9sxuBzAI6NmiqdG3S0VK-zfR8Y0
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
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

In preparation for the addition of PM runtime support move the test
key out of the register patches themselves. This is necessary to
allow the test key to be held during cache synchronisation, which is
required by the OTP settings which were unpacked from the device and
written by the driver.

Also whilst at it, the driver uses a mixture of accessing the test key
register by name and by address, consistently use the name.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  2 ++
 sound/soc/codecs/cs35l41-lib.c | 65 +++++++++++++++++++++---------------------
 sound/soc/codecs/cs35l41.c     | 32 ++++++++++++---------
 3 files changed, 52 insertions(+), 47 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 29a527457b486..56289b67b9a0e 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -762,6 +762,8 @@ struct cs35l41_otp_map_element_t {
 extern struct regmap_config cs35l41_regmap_i2c;
 extern struct regmap_config cs35l41_regmap_spi;
 
+int cs35l41_test_key_unlock(struct device *dev, struct regmap *regmap);
+int cs35l41_test_key_lock(struct device *dev, struct regmap *regmap);
 int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap);
 int cs35l41_register_errata_patch(struct device *dev, struct regmap *reg, unsigned int reg_revid);
 int cs35l41_set_channels(struct device *dev, struct regmap *reg,
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 639dcd25b17e9..4037831a2ca98 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -623,8 +623,6 @@ static const struct cs35l41_otp_packed_element_t otp_map_2[CS35L41_NUM_OTP_ELEM]
 };
 
 static const struct reg_sequence cs35l41_reva0_errata_patch[] = {
-	{ 0x00000040,			 0x00005555 },
-	{ 0x00000040,			 0x0000AAAA },
 	{ 0x00003854,			 0x05180240 },
 	{ CS35L41_VIMON_SPKMON_RESYNC,	 0x00000000 },
 	{ 0x00004310,			 0x00000000 },
@@ -637,38 +635,28 @@ static const struct reg_sequence cs35l41_reva0_errata_patch[] = {
 	{ CS35L41_IRQ2_DB3,		 0x00000000 },
 	{ CS35L41_DSP1_YM_ACCEL_PL0_PRI, 0x00000000 },
 	{ CS35L41_DSP1_XM_ACCEL_PL0_PRI, 0x00000000 },
-	{ 0x00000040,			 0x0000CCCC },
-	{ 0x00000040,			 0x00003333 },
 	{ CS35L41_PWR_CTRL2,		 0x00000000 },
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
 };
 
 static const struct reg_sequence cs35l41_revb0_errata_patch[] = {
-	{ 0x00000040,			 0x00005555 },
-	{ 0x00000040,			 0x0000AAAA },
 	{ CS35L41_VIMON_SPKMON_RESYNC,	 0x00000000 },
 	{ 0x00004310,			 0x00000000 },
 	{ CS35L41_VPVBST_FS_SEL,	 0x00000000 },
 	{ CS35L41_BSTCVRT_DCM_CTRL,	 0x00000051 },
 	{ CS35L41_DSP1_YM_ACCEL_PL0_PRI, 0x00000000 },
 	{ CS35L41_DSP1_XM_ACCEL_PL0_PRI, 0x00000000 },
-	{ 0x00000040,			 0x0000CCCC },
-	{ 0x00000040,			 0x00003333 },
 	{ CS35L41_PWR_CTRL2,		 0x00000000 },
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
 };
 
 static const struct reg_sequence cs35l41_revb2_errata_patch[] = {
-	{ 0x00000040,			 0x00005555 },
-	{ 0x00000040,			 0x0000AAAA },
 	{ CS35L41_VIMON_SPKMON_RESYNC,	 0x00000000 },
 	{ 0x00004310,			 0x00000000 },
 	{ CS35L41_VPVBST_FS_SEL,	 0x00000000 },
 	{ CS35L41_BSTCVRT_DCM_CTRL,	 0x00000051 },
 	{ CS35L41_DSP1_YM_ACCEL_PL0_PRI, 0x00000000 },
 	{ CS35L41_DSP1_XM_ACCEL_PL0_PRI, 0x00000000 },
-	{ 0x00000040,			 0x0000CCCC },
-	{ 0x00000040,			 0x00003333 },
 	{ CS35L41_PWR_CTRL2,		 0x00000000 },
 	{ CS35L41_AMP_GAIN_CTRL,	 0x00000000 },
 };
@@ -756,6 +744,37 @@ static const struct cs35l41_otp_map_element_t *cs35l41_find_otp_map(u32 otp_id)
 	return NULL;
 }
 
+int cs35l41_test_key_unlock(struct device *dev, struct regmap *regmap)
+{
+	static const struct reg_sequence unlock[] = {
+		{ CS35L41_TEST_KEY_CTL, 0x00000055 },
+		{ CS35L41_TEST_KEY_CTL, 0x000000AA },
+	};
+	int ret;
+
+	ret = regmap_multi_reg_write(regmap, unlock, ARRAY_SIZE(unlock));
+	if (ret)
+		dev_err(dev, "Failed to unlock test key: %d\n", ret);
+
+	return ret;
+}
+
+int cs35l41_test_key_lock(struct device *dev, struct regmap *regmap)
+{
+	static const struct reg_sequence unlock[] = {
+		{ CS35L41_TEST_KEY_CTL, 0x000000CC },
+		{ CS35L41_TEST_KEY_CTL, 0x00000033 },
+	};
+	int ret;
+
+	ret = regmap_multi_reg_write(regmap, unlock, ARRAY_SIZE(unlock));
+	if (ret)
+		dev_err(dev, "Failed to lock test key: %d\n", ret);
+
+	return ret;
+}
+
+/* Must be called with the TEST_KEY unlocked */
 int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
 {
 	const struct cs35l41_otp_map_element_t *otp_map_match;
@@ -794,17 +813,6 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
 	bit_offset = otp_map_match->bit_offset;
 	word_offset = otp_map_match->word_offset;
 
-	ret = regmap_write(regmap, CS35L41_TEST_KEY_CTL, 0x00000055);
-	if (ret) {
-		dev_err(dev, "Write Unlock key failed 1/2: %d\n", ret);
-		goto err_otp_unpack;
-	}
-	ret = regmap_write(regmap, CS35L41_TEST_KEY_CTL, 0x000000AA);
-	if (ret) {
-		dev_err(dev, "Write Unlock key failed 2/2: %d\n", ret);
-		goto err_otp_unpack;
-	}
-
 	for (i = 0; i < otp_map_match->num_elements; i++) {
 		dev_dbg(dev, "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d\n",
 			bit_offset, word_offset, bit_sum % 32);
@@ -840,16 +848,6 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
 		}
 	}
 
-	ret = regmap_write(regmap, CS35L41_TEST_KEY_CTL, 0x000000CC);
-	if (ret) {
-		dev_err(dev, "Write Lock key failed 1/2: %d\n", ret);
-		goto err_otp_unpack;
-	}
-	ret = regmap_write(regmap, CS35L41_TEST_KEY_CTL, 0x00000033);
-	if (ret) {
-		dev_err(dev, "Write Lock key failed 2/2: %d\n", ret);
-		goto err_otp_unpack;
-	}
 	ret = 0;
 
 err_otp_unpack:
@@ -859,6 +857,7 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(cs35l41_otp_unpack);
 
+/* Must be called with the TEST_KEY unlocked */
 int cs35l41_register_errata_patch(struct device *dev, struct regmap *reg, unsigned int reg_revid)
 {
 	char *rev;
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 05839fabf97bc..e1b9fd8ee9966 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -534,19 +534,19 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 }
 
 static const struct reg_sequence cs35l41_pup_patch[] = {
-	{ 0x00000040, 0x00000055 },
-	{ 0x00000040, 0x000000AA },
+	{ CS35L41_TEST_KEY_CTL, 0x00000055 },
+	{ CS35L41_TEST_KEY_CTL, 0x000000AA },
 	{ 0x00002084, 0x002F1AA0 },
-	{ 0x00000040, 0x000000CC },
-	{ 0x00000040, 0x00000033 },
+	{ CS35L41_TEST_KEY_CTL, 0x000000CC },
+	{ CS35L41_TEST_KEY_CTL, 0x00000033 },
 };
 
 static const struct reg_sequence cs35l41_pdn_patch[] = {
-	{ 0x00000040, 0x00000055 },
-	{ 0x00000040, 0x000000AA },
+	{ CS35L41_TEST_KEY_CTL, 0x00000055 },
+	{ CS35L41_TEST_KEY_CTL, 0x000000AA },
 	{ 0x00002084, 0x002F1AA3 },
-	{ 0x00000040, 0x000000CC },
-	{ 0x00000040, 0x00000033 },
+	{ CS35L41_TEST_KEY_CTL, 0x000000CC },
+	{ CS35L41_TEST_KEY_CTL, 0x00000033 },
 };
 
 static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
@@ -1329,10 +1329,20 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 		goto err;
 	}
 
+	cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
+
 	ret = cs35l41_register_errata_patch(cs35l41->dev, cs35l41->regmap, reg_revid);
 	if (ret)
 		goto err;
 
+	ret = cs35l41_otp_unpack(cs35l41->dev, cs35l41->regmap);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "OTP Unpack failed: %d\n", ret);
+		goto err;
+	}
+
+	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
+
 	irq_pol = cs35l41_irq_gpio_config(cs35l41);
 
 	/* Set interrupt masks for critical errors */
@@ -1347,12 +1357,6 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 		goto err;
 	}
 
-	ret = cs35l41_otp_unpack(cs35l41->dev, cs35l41->regmap);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "OTP Unpack failed: %d\n", ret);
-		goto err;
-	}
-
 	ret = cs35l41_set_pdata(cs35l41);
 	if (ret < 0) {
 		dev_err(cs35l41->dev, "Set pdata failed: %d\n", ret);
-- 
2.11.0

