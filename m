Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B888947441B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 15:01:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D541F22;
	Tue, 14 Dec 2021 15:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D541F22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639490481;
	bh=C2PULqmr2LhYXOTyVzKx9xeOKW8rFR3AOhv7IKfD588=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KIB/QbBVMPplbNOt/0MuQ9FmHlaXgVzYs/9hlXVIqB9rRb3YwBuuZyMmsr7Ip/ySY
	 CW+imI8wOPVpGv1DDBpLvhaSho4sovvSzg/dOKDgarm/MmUIyRhNxtndAsi4Ye92YF
	 KNjQ3wsvjjWassxoroQ2hcJF0XboMWH/YODWbegI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C428FF8016A;
	Tue, 14 Dec 2021 15:00:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEB7CF804F2; Tue, 14 Dec 2021 15:00:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3A7CF8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 15:00:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A7CF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HUF9rTT/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE4Ko3k006814;
 Tue, 14 Dec 2021 08:00:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JwdEvJNSccwPwzdfwacOslSxZt9T4OuG+VPsh+orUNE=;
 b=HUF9rTT/zOdbVhTt+p4cQEYuOTyTwUwaInU5k7VMaxPABFIcbyLSckvaLRJi+JTh1IzC
 6KbCJPPNxQLAepsRwCz0bdMyMW4hihKTPgNfcuPz4q8VsrIP/2daR/QRVW6v3/BSUgzc
 89tPUcbaoQGv7Q2jCOOBhX8n8s+j3jhVUh1DO9+jaCdLb3c5xy5HZyjJ701+zQeys7JN
 HQ0yoUb8Jyi+bEi7ZPzbAmaD7WqnhZVu3KpPFBDa0/r5Le/0D95URVBZvmsAc4Dathyh
 By5r+PQJE0aQYupP14rbFzshA9hXbu82G9NTIoqdfDkra6Idwr8QXHkrQXPSBlqSXDXJ /Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cxh14grht-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Dec 2021 08:00:03 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 14:00:01 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 14 Dec 2021 14:00:01 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.39])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 41F09B12;
 Tue, 14 Dec 2021 14:00:01 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 02/10] ASoC: cs35l41: Move cs35l41_otp_unpack to shared code
Date: Tue, 14 Dec 2021 13:59:51 +0000
Message-ID: <20211214135959.1317949-3-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214135959.1317949-1-tanureal@opensource.cirrus.com>
References: <20211214135959.1317949-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: O1AZfcBVVIYM8LNb-F3KBNnZAsq8A3Cz
X-Proofpoint-ORIG-GUID: O1AZfcBVVIYM8LNb-F3KBNnZAsq8A3Cz
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
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

ASoC and HDA will do the same cs35l41_otp_unpack, so move it
to shared code

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |   4 +-
 sound/soc/codecs/cs35l41-lib.c | 121 ++++++++++++++++++++++++++++++-
 sound/soc/codecs/cs35l41.c     | 125 +--------------------------------
 3 files changed, 122 insertions(+), 128 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index aac3ffb9bc89..6cf3ef02b26a 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -534,7 +534,6 @@
 #define CS35L41_MAX_CACHE_REG		36
 #define CS35L41_OTP_SIZE_WORDS		32
 #define CS35L41_NUM_OTP_ELEM		100
-#define CS35L41_NUM_OTP_MAPS		5
 
 #define CS35L41_VALID_PDATA		0x80000000
 #define CS35L41_NUM_SUPPLIES            2
@@ -760,8 +759,9 @@ struct cs35l41_otp_map_element_t {
 	u32 word_offset;
 };
 
-extern const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[CS35L41_NUM_OTP_MAPS];
 extern struct regmap_config cs35l41_regmap_i2c;
 extern struct regmap_config cs35l41_regmap_spi;
 
+int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap);
+
 #endif /* __CS35L41_H */
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index f19531ebf729..dc5f502447a2 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -7,8 +7,11 @@
 // Author: David Rhodes <david.rhodes@cirrus.com>
 // Author: Lucas Tanure <lucas.tanure@cirrus.com>
 
+#include <linux/dev_printk.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 
 #include <sound/cs35l41.h>
 
@@ -655,7 +658,7 @@ static const struct cs35l41_otp_packed_element_t otp_map_2[CS35L41_NUM_OTP_ELEM]
 	{ 0x00017044,	0,	24 }, /*LOT_NUMBER*/
 };
 
-const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[CS35L41_NUM_OTP_MAPS] = {
+static const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[] = {
 	{
 		.id = 0x01,
 		.map = otp_map_1,
@@ -692,7 +695,6 @@ const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[CS35L41_NUM_OTP_MAPS]
 		.word_offset = 2,
 	},
 };
-EXPORT_SYMBOL_GPL(cs35l41_otp_map_map);
 
 struct regmap_config cs35l41_regmap_i2c = {
 	.reg_bits = 32,
@@ -727,6 +729,121 @@ struct regmap_config cs35l41_regmap_spi = {
 };
 EXPORT_SYMBOL_GPL(cs35l41_regmap_spi);
 
+static const struct cs35l41_otp_map_element_t *cs35l41_find_otp_map(u32 otp_id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cs35l41_otp_map_map); i++) {
+		if (cs35l41_otp_map_map[i].id == otp_id)
+			return &cs35l41_otp_map_map[i];
+	}
+
+	return NULL;
+}
+
+int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
+{
+	const struct cs35l41_otp_map_element_t *otp_map_match;
+	const struct cs35l41_otp_packed_element_t *otp_map;
+	int bit_offset, word_offset, ret, i;
+	unsigned int bit_sum = 8;
+	u32 otp_val, otp_id_reg;
+	u32 *otp_mem;
+
+	otp_mem = kmalloc_array(CS35L41_OTP_SIZE_WORDS, sizeof(*otp_mem), GFP_KERNEL);
+	if (!otp_mem)
+		return -ENOMEM;
+
+	ret = regmap_read(regmap, CS35L41_OTPID, &otp_id_reg);
+	if (ret) {
+		dev_err(dev, "Read OTP ID failed: %d\n", ret);
+		goto err_otp_unpack;
+	}
+
+	otp_map_match = cs35l41_find_otp_map(otp_id_reg);
+
+	if (!otp_map_match) {
+		dev_err(dev, "OTP Map matching ID %d not found\n", otp_id_reg);
+		ret = -EINVAL;
+		goto err_otp_unpack;
+	}
+
+	ret = regmap_bulk_read(regmap, CS35L41_OTP_MEM0, otp_mem, CS35L41_OTP_SIZE_WORDS);
+	if (ret) {
+		dev_err(dev, "Read OTP Mem failed: %d\n", ret);
+		goto err_otp_unpack;
+	}
+
+	otp_map = otp_map_match->map;
+
+	bit_offset = otp_map_match->bit_offset;
+	word_offset = otp_map_match->word_offset;
+
+	ret = regmap_write(regmap, CS35L41_TEST_KEY_CTL, 0x00000055);
+	if (ret) {
+		dev_err(dev, "Write Unlock key failed 1/2: %d\n", ret);
+		goto err_otp_unpack;
+	}
+	ret = regmap_write(regmap, CS35L41_TEST_KEY_CTL, 0x000000AA);
+	if (ret) {
+		dev_err(dev, "Write Unlock key failed 2/2: %d\n", ret);
+		goto err_otp_unpack;
+	}
+
+	for (i = 0; i < otp_map_match->num_elements; i++) {
+		dev_dbg(dev, "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d\n",
+			bit_offset, word_offset, bit_sum % 32);
+		if (bit_offset + otp_map[i].size - 1 >= 32) {
+			otp_val = (otp_mem[word_offset] &
+					GENMASK(31, bit_offset)) >> bit_offset;
+			otp_val |= (otp_mem[++word_offset] &
+					GENMASK(bit_offset + otp_map[i].size - 33, 0)) <<
+					(32 - bit_offset);
+			bit_offset += otp_map[i].size - 32;
+		} else {
+			otp_val = (otp_mem[word_offset] &
+				   GENMASK(bit_offset + otp_map[i].size - 1, bit_offset)
+				  ) >> bit_offset;
+			bit_offset += otp_map[i].size;
+		}
+		bit_sum += otp_map[i].size;
+
+		if (bit_offset == 32) {
+			bit_offset = 0;
+			word_offset++;
+		}
+
+		if (otp_map[i].reg != 0) {
+			ret = regmap_update_bits(regmap, otp_map[i].reg,
+						 GENMASK(otp_map[i].shift + otp_map[i].size - 1,
+							 otp_map[i].shift),
+						 otp_val << otp_map[i].shift);
+			if (ret < 0) {
+				dev_err(dev, "Write OTP val failed: %d\n", ret);
+				goto err_otp_unpack;
+			}
+		}
+	}
+
+	ret = regmap_write(regmap, CS35L41_TEST_KEY_CTL, 0x000000CC);
+	if (ret) {
+		dev_err(dev, "Write Lock key failed 1/2: %d\n", ret);
+		goto err_otp_unpack;
+	}
+	ret = regmap_write(regmap, CS35L41_TEST_KEY_CTL, 0x00000033);
+	if (ret) {
+		dev_err(dev, "Write Lock key failed 2/2: %d\n", ret);
+		goto err_otp_unpack;
+	}
+	ret = 0;
+
+err_otp_unpack:
+	kfree(otp_mem);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cs35l41_otp_unpack);
+
 MODULE_DESCRIPTION("CS35L41 library");
 MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 60332eae1162..aa57c59b334d 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -14,7 +14,6 @@
 #include <linux/moduleparam.h>
 #include <linux/of_device.h>
 #include <linux/property.h>
-#include <linux/slab.h>
 #include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -420,128 +419,6 @@ static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
 	WM_ADSP_FW_CONTROL("DSP1", 0),
 };
 
-static const struct cs35l41_otp_map_element_t *cs35l41_find_otp_map(u32 otp_id)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(cs35l41_otp_map_map); i++) {
-		if (cs35l41_otp_map_map[i].id == otp_id)
-			return &cs35l41_otp_map_map[i];
-	}
-
-	return NULL;
-}
-
-static int cs35l41_otp_unpack(void *data)
-{
-	const struct cs35l41_otp_map_element_t *otp_map_match;
-	const struct cs35l41_otp_packed_element_t *otp_map;
-	struct cs35l41_private *cs35l41 = data;
-	int bit_offset, word_offset, ret, i;
-	unsigned int bit_sum = 8;
-	u32 otp_val, otp_id_reg;
-	u32 *otp_mem;
-
-	otp_mem = kmalloc_array(CS35L41_OTP_SIZE_WORDS, sizeof(*otp_mem), GFP_KERNEL);
-	if (!otp_mem)
-		return -ENOMEM;
-
-	ret = regmap_read(cs35l41->regmap, CS35L41_OTPID, &otp_id_reg);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Read OTP ID failed: %d\n", ret);
-		goto err_otp_unpack;
-	}
-
-	otp_map_match = cs35l41_find_otp_map(otp_id_reg);
-
-	if (!otp_map_match) {
-		dev_err(cs35l41->dev, "OTP Map matching ID %d not found\n",
-			otp_id_reg);
-		ret = -EINVAL;
-		goto err_otp_unpack;
-	}
-
-	ret = regmap_bulk_read(cs35l41->regmap, CS35L41_OTP_MEM0, otp_mem,
-			       CS35L41_OTP_SIZE_WORDS);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Read OTP Mem failed: %d\n", ret);
-		goto err_otp_unpack;
-	}
-
-	otp_map = otp_map_match->map;
-
-	bit_offset = otp_map_match->bit_offset;
-	word_offset = otp_map_match->word_offset;
-
-	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x00000055);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write Unlock key failed 1/2: %d\n", ret);
-		goto err_otp_unpack;
-	}
-	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x000000AA);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write Unlock key failed 2/2: %d\n", ret);
-		goto err_otp_unpack;
-	}
-
-	for (i = 0; i < otp_map_match->num_elements; i++) {
-		dev_dbg(cs35l41->dev,
-			"bitoffset= %d, word_offset=%d, bit_sum mod 32=%d\n",
-			bit_offset, word_offset, bit_sum % 32);
-		if (bit_offset + otp_map[i].size - 1 >= 32) {
-			otp_val = (otp_mem[word_offset] &
-					GENMASK(31, bit_offset)) >>
-					bit_offset;
-			otp_val |= (otp_mem[++word_offset] &
-					GENMASK(bit_offset +
-						otp_map[i].size - 33, 0)) <<
-					(32 - bit_offset);
-			bit_offset += otp_map[i].size - 32;
-		} else {
-			otp_val = (otp_mem[word_offset] &
-				GENMASK(bit_offset + otp_map[i].size - 1,
-					bit_offset)) >>	bit_offset;
-			bit_offset += otp_map[i].size;
-		}
-		bit_sum += otp_map[i].size;
-
-		if (bit_offset == 32) {
-			bit_offset = 0;
-			word_offset++;
-		}
-
-		if (otp_map[i].reg != 0) {
-			ret = regmap_update_bits(cs35l41->regmap,
-						 otp_map[i].reg,
-						 GENMASK(otp_map[i].shift +
-							 otp_map[i].size - 1,
-						 otp_map[i].shift),
-						 otp_val << otp_map[i].shift);
-			if (ret < 0) {
-				dev_err(cs35l41->dev, "Write OTP val failed: %d\n",
-					ret);
-				goto err_otp_unpack;
-			}
-		}
-	}
-
-	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x000000CC);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write Lock key failed 1/2: %d\n", ret);
-		goto err_otp_unpack;
-	}
-	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x00000033);
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write Lock key failed 2/2: %d\n", ret);
-		goto err_otp_unpack;
-	}
-	ret = 0;
-
-err_otp_unpack:
-	kfree(otp_mem);
-	return ret;
-}
-
 static irqreturn_t cs35l41_irq(int irq, void *data)
 {
 	struct cs35l41_private *cs35l41 = data;
@@ -1667,7 +1544,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 		goto err;
 	}
 
-	ret = cs35l41_otp_unpack(cs35l41);
+	ret = cs35l41_otp_unpack(cs35l41->dev, cs35l41->regmap);
 	if (ret < 0) {
 		dev_err(cs35l41->dev, "OTP Unpack failed: %d\n", ret);
 		goto err;
-- 
2.34.1

