Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EACCF45B4F9
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:10:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 919E416FE;
	Wed, 24 Nov 2021 08:09:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 919E416FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737812;
	bh=TX2is3teUxLF9uSHN6QN4+unvEH5Aj5Tp31LDeWhMrM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sVsBxe9xKTr/MmidlXsaVL09sbe/+ltlgWbM7h/HNqZjXb++JLuT8kK3+zx1fk9Xl
	 OuCnhWpNwSJsIlzNrgWuVqeGCbPghtNwUQ4j/HOtoEjuE1nSjunF9H+p9FQYIekMCr
	 G2XB9MjD4cVrpFQPbH+B+GHUuFKyr/9sajNsYg4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82ECDF8051F;
	Wed, 24 Nov 2021 08:06:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E03DBF804FC; Tue, 23 Nov 2021 17:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E201F804EC
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:31:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E201F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OjtN8j2b"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN6Jv73020525;
 Tue, 23 Nov 2021 10:31:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=YfmJ3QFELq+ojijO+3GcBv66WJJ4ZeAGwfcy4dwVxqQ=;
 b=OjtN8j2bmrwOPsLAe5ct8muw4UVcKLvNgb/gDs5VKPTVkP+BgIb4CyM+TJDDOjt1y8tP
 zuZZZhzXR7kH4pr2U4Ol2hg+9qsmfrkFTo3H67o4zipCYdVogtk5ENlEVlEE57CXRhzN
 fC3F76nUU9h25jNMHX+EXWCmhE9Qz5Q67or8drIgZU535sdBxfgmxQuZrmh0xPJolT7I
 mPtunpOrLqteyuNd1aWujFjWFLQq/1cil+UA/KRqe4xNrK8AQwCXQokKxPnYFEttw/71
 UMZ9pMH4zPIOUDRaSZvzyG/vNTovl7G4crHu7kS6CAEQn76ezsTRbUSzwJE9QKw1WJnc AQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cg5ms21nk-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Nov 2021 10:31:57 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 23 Nov
 2021 16:31:55 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 23 Nov 2021 16:31:55 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.11])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 60FDB2A3;
 Tue, 23 Nov 2021 16:31:54 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>, "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.intel.com>, David Rhodes
 <david.rhodes@cirrus.com>, Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PATCH 05/11] ASoC: cs35l41: Move cs35l41_otp_unpack to shared code
Date: Tue, 23 Nov 2021 16:31:43 +0000
Message-ID: <20211123163149.1530535-6-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TP07YcWZmvvoAVfCVZAmRsi8Q2s7FAFU
X-Proofpoint-ORIG-GUID: TP07YcWZmvvoAVfCVZAmRsi8Q2s7FAFU
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Chris Chiu <chris.chiu@canonical.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Jack Yu <jack.yu@realtek.com>, Lucas
 Tanure <tanureal@opensource.cirrus.com>, Arnd
 Bergmann <arnd@arndb.de>, Jeremy Szu <jeremy.szu@canonical.com>,
 patches@opensource.cirrus.com, Elia Devito <eliadevito@gmail.com>,
 alsa-devel@alsa-project.org, Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-acpi@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 linux-kernel@vger.kernel.org
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
 include/sound/cs35l41.h        |   1 +
 sound/soc/codecs/cs35l41-lib.c | 116 ++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 125 +--------------------------------
 sound/soc/codecs/cs35l41.h     |   3 -
 4 files changed, 118 insertions(+), 127 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 5039e876bad1..9241173740cc 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -764,5 +764,6 @@ extern struct regmap_config cs35l41_regmap_i2c;
 extern struct regmap_config cs35l41_regmap_spi;
 
 int cs35l41_init_supplies(struct device *dev, struct regulator_bulk_data *supplies);
+int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap);
 
 #endif /* __CS35L41_H */
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 4aba0f90b876..a13c5313f4e5 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -7,6 +7,8 @@
 // Author: David Rhodes <david.rhodes@cirrus.com>
 // Author: Lucas Tanure <lucas.tanure@cirrus.com>
 
+#include <linux/slab.h>
+#include <linux/dev_printk.h>
 #include <linux/regulator/consumer.h>
 #include <sound/cs35l41.h>
 
@@ -749,3 +751,117 @@ int cs35l41_init_supplies(struct device *dev, struct regulator_bulk_data *suppli
 	return 0;
 }
 
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
+
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index c8709de41aaf..0a88c2f164d1 100644
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
@@ -415,128 +414,6 @@ static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
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
@@ -1650,7 +1527,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 		goto err;
 	}
 
-	ret = cs35l41_otp_unpack(cs35l41);
+	ret = cs35l41_otp_unpack(cs35l41->dev, cs35l41->regmap);
 	if (ret < 0) {
 		dev_err(cs35l41->dev, "OTP Unpack failed: %d\n", ret);
 		goto err;
diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
index 453ece8889e0..26a08d58a8c3 100644
--- a/sound/soc/codecs/cs35l41.h
+++ b/sound/soc/codecs/cs35l41.h
@@ -21,9 +21,6 @@
 #define CS35L41_RX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 #define CS35L41_TX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
-extern const struct cs35l41_otp_map_element_t
-				cs35l41_otp_map_map[CS35L41_NUM_OTP_MAPS];
-
 enum cs35l41_cspl_mbox_status {
 	CSPL_MBOX_STS_RUNNING = 0,
 	CSPL_MBOX_STS_PAUSED = 1,
-- 
2.34.0

