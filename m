Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A139C487A21
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 17:08:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3699318A0;
	Fri,  7 Jan 2022 17:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3699318A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641571717;
	bh=CRWV+1dFP31wnUUAJ2oZVOve/6O/0i6sftpNr10znjc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXST39Bby0y20tsyl7ssG4glrQj164MOOnMaTneAGzaqtcbfm52Ir5h8lTv4+oqFq
	 XX9IvEFS+KFUPiC1jKgHPf1q8xO2R2Gb0/3u+LvQmdbmSgmlZERRKRDe8L9QHBrU93
	 6ng6Hp+QuSsgmAhjeC22yMrruKN3RlGrMbYI+unU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F9CF804FE;
	Fri,  7 Jan 2022 17:06:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4169DF8014B; Fri,  7 Jan 2022 17:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 023A5F80249
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 17:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 023A5F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pXDZzVaJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207Fo5eo008257;
 Fri, 7 Jan 2022 10:06:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=kTV3zg6j8rGQu729I9Oh6oFpaMyA+Bi9ITFzceFmli8=;
 b=pXDZzVaJeKI8B7ubYnksmqc0pili3NADUDXNNO1aKS80AyPWt5xd5+TsJRdErRmQgYx4
 s9t4p+nO5sy2SPhK/qUnyNl4lAuig6QC1oTYReIGFc3rWMwl3OhR/akggmI36piUw49O
 S/h3Qqn+v9YO5d84A00rqqvfqmYDPGegyopQ9EfMQZIZDMmznLJFT/LI1r1JaWiRjkFf
 uaOtxWCnNbf/nkeXx+HkBwiKLbJsTzFh5GDC8KSYFlY3YX4sSzuj4Wh6XsBq301nDQfW
 gQfMy7lb4c6VF8TsqLtKlt7pYX4rPIAnQ86eWlE96Sx4yhJGrXxGt9hOWI1PXAEvpXw2 7g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dergng0n6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 07 Jan 2022 10:06:39 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 7 Jan
 2022 16:06:37 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 7 Jan 2022 16:06:37 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0158C459;
 Fri,  7 Jan 2022 16:06:36 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 1/2] ASoC: cs35l41: Update handling of test key registers
Date: Fri, 7 Jan 2022 16:06:35 +0000
Message-ID: <20220107160636.6555-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220107160636.6555-1-ckeepax@opensource.cirrus.com>
References: <20220107160636.6555-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: cADnJHmJFiCQJ_MDNAaMMeCj0_n3DaDZ
X-Proofpoint-ORIG-GUID: cADnJHmJFiCQJ_MDNAaMMeCj0_n3DaDZ
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

Changes since v1:
 - Add missing export symbol for new test_key functions

 include/sound/cs35l41.h        |  2 ++
 sound/soc/codecs/cs35l41-lib.c | 67 +++++++++++++++++++++---------------------
 sound/soc/codecs/cs35l41.c     | 32 +++++++++++---------
 3 files changed, 54 insertions(+), 47 deletions(-)

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
index 639dcd25b17e9..ecaf67fd76531 100644
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
@@ -756,6 +744,39 @@ static const struct cs35l41_otp_map_element_t *cs35l41_find_otp_map(u32 otp_id)
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
+EXPORT_SYMBOL_GPL(cs35l41_test_key_unlock);
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
+EXPORT_SYMBOL_GPL(cs35l41_test_key_lock);
+
+/* Must be called with the TEST_KEY unlocked */
 int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
 {
 	const struct cs35l41_otp_map_element_t *otp_map_match;
@@ -794,17 +815,6 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
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
@@ -840,16 +850,6 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
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
@@ -859,6 +859,7 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
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

