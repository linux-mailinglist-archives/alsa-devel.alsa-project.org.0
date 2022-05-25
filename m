Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EBC533DAF
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 15:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A39E16CA;
	Wed, 25 May 2022 15:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A39E16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653484842;
	bh=N7pcZixcgkaNbY2C/6f7AtiQBk8uffYtr7pBgalrhks=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTLqCHe3rhpq3iX20iKarH8fje6AZlXsF1NzqMr2uYNnkMD6a0QqkY2m0dJkRRgCX
	 7zg/90pORQq4j7UpJd3Y2nmNxJjN+fDZyjAqc1UBFJeUt8ccBK6ALisKHab3dpuI6L
	 1BiNZzhspHjFIgumEEksHd0bC1St3Teh1QMrJ+rI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C52DF80563;
	Wed, 25 May 2022 15:17:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DA49F8053D; Wed, 25 May 2022 15:17:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24C6DF8051B
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 15:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24C6DF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jP7fT1ej"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PCRmjH022096;
 Wed, 25 May 2022 08:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=VKkphNH8QA4Izj/k6GEo35fXfHV4R/YMLEy/KzQdSnU=;
 b=jP7fT1ej2z2m41sBzlDseWlKV99LTN8gfPvg51F/7GnvoJMJhrr9DJw7rp1TlfNNejs+
 TuYVyGzHM40wNumeQiIhDhcw/4rc+jXAK8Y4FB07H3USS+7lVtxTSLxuziAK8C2v8RCA
 E8j9qrPCI0ougajNBLbP3I6FfoX5i0yA89ikzi3d8uaVRUKXXZ05m+NSz7+8Fgt4jT5n
 dD54KiwOYp4SXxyt73EH8shCc9tXJK+iiDRUBkHFtDJeby5q/z2cAYxr1UD3SkWgDept
 qtqZ3FAZaNrxCRl70fGMtjpJc0wkamRZu28wn0/T1HFVQEckuAuKBwOqZie9J/Ch1ZUE ew== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g93u20we6-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 May 2022 08:16:45 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 14:16:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 25 May 2022 14:16:43 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.233])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F3B83468;
 Wed, 25 May 2022 13:16:42 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v4 09/17] ASoC: cs35l41: Move cs35l41 exit hibernate function
 into shared code
Date: Wed, 25 May 2022 14:16:30 +0100
Message-ID: <20220525131638.5512-10-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dnloY0RABqJh7uxlYje9FcPNbQuiYcmI
X-Proofpoint-GUID: dnloY0RABqJh7uxlYje9FcPNbQuiYcmI
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

CS35L41 HDA Driver will support hibernation using DSP firmware,
move the exit hibernate function into shared code so this can
be reused.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes since v2:
 - No change
 
 include/sound/cs35l41.h        |  1 +
 sound/soc/codecs/cs35l41-lib.c | 60 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 61 +---------------------------------
 3 files changed, 62 insertions(+), 60 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 8887087815a7..f848ba1e75b3 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -885,6 +885,7 @@ void cs35l41_configure_cs_dsp(struct device *dev, struct regmap *reg, struct cs_
 int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 			      enum cs35l41_cspl_mbox_cmd cmd);
 int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap);
+int cs35l41_exit_hibernate(struct device *dev, struct regmap *regmap);
 int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 		       struct cs35l41_hw_cfg *hw_cfg);
 bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 6d3070ea9e06..cc5366c8bdd6 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1321,6 +1321,66 @@ int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(cs35l41_write_fs_errata);
 
+static void cs35l41_wait_for_pwrmgt_sts(struct device *dev, struct regmap *regmap)
+{
+	const int pwrmgt_retries = 10;
+	unsigned int sts;
+	int i, ret;
+
+	for (i = 0; i < pwrmgt_retries; i++) {
+		ret = regmap_read(regmap, CS35L41_PWRMGT_STS, &sts);
+		if (ret)
+			dev_err(dev, "Failed to read PWRMGT_STS: %d\n", ret);
+		else if (!(sts & CS35L41_WR_PEND_STS_MASK))
+			return;
+
+		udelay(20);
+	}
+
+	dev_err(dev, "Timed out reading PWRMGT_STS\n");
+}
+
+int cs35l41_exit_hibernate(struct device *dev, struct regmap *regmap)
+{
+	const int wake_retries = 20;
+	const int sleep_retries = 5;
+	int ret, i, j;
+
+	for (i = 0; i < sleep_retries; i++) {
+		dev_dbg(dev, "Exit hibernate\n");
+
+		for (j = 0; j < wake_retries; j++) {
+			ret = cs35l41_set_cspl_mbox_cmd(dev, regmap,
+							CSPL_MBOX_CMD_OUT_OF_HIBERNATE);
+			if (!ret)
+				break;
+
+			usleep_range(100, 200);
+		}
+
+		if (j < wake_retries) {
+			dev_dbg(dev, "Wake success at cycle: %d\n", j);
+			return 0;
+		}
+
+		dev_err(dev, "Wake failed, re-enter hibernate: %d\n", ret);
+
+		cs35l41_wait_for_pwrmgt_sts(dev, regmap);
+		regmap_write(regmap, CS35L41_WAKESRC_CTL, 0x0088);
+
+		cs35l41_wait_for_pwrmgt_sts(dev, regmap);
+		regmap_write(regmap, CS35L41_WAKESRC_CTL, 0x0188);
+
+		cs35l41_wait_for_pwrmgt_sts(dev, regmap);
+		regmap_write(regmap, CS35L41_PWRMGT_CTL, 0x3);
+	}
+
+	dev_err(dev, "Timed out waking device\n");
+
+	return -ETIMEDOUT;
+}
+EXPORT_SYMBOL_GPL(cs35l41_exit_hibernate);
+
 MODULE_DESCRIPTION("CS35L41 library");
 MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 3e68a07a3c8e..be7d02517739 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1351,65 +1351,6 @@ static int __maybe_unused cs35l41_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static void cs35l41_wait_for_pwrmgt_sts(struct cs35l41_private *cs35l41)
-{
-	const int pwrmgt_retries = 10;
-	unsigned int sts;
-	int i, ret;
-
-	for (i = 0; i < pwrmgt_retries; i++) {
-		ret = regmap_read(cs35l41->regmap, CS35L41_PWRMGT_STS, &sts);
-		if (ret)
-			dev_err(cs35l41->dev, "Failed to read PWRMGT_STS: %d\n", ret);
-		else if (!(sts & CS35L41_WR_PEND_STS_MASK))
-			return;
-
-		udelay(20);
-	}
-
-	dev_err(cs35l41->dev, "Timed out reading PWRMGT_STS\n");
-}
-
-static int cs35l41_exit_hibernate(struct cs35l41_private *cs35l41)
-{
-	const int wake_retries = 20;
-	const int sleep_retries = 5;
-	int ret, i, j;
-
-	for (i = 0; i < sleep_retries; i++) {
-		dev_dbg(cs35l41->dev, "Exit hibernate\n");
-
-		for (j = 0; j < wake_retries; j++) {
-			ret = cs35l41_set_cspl_mbox_cmd(cs35l41->dev, cs35l41->regmap,
-							CSPL_MBOX_CMD_OUT_OF_HIBERNATE);
-			if (!ret)
-				break;
-
-			usleep_range(100, 200);
-		}
-
-		if (j < wake_retries) {
-			dev_dbg(cs35l41->dev, "Wake success at cycle: %d\n", j);
-			return 0;
-		}
-
-		dev_err(cs35l41->dev, "Wake failed, re-enter hibernate: %d\n", ret);
-
-		cs35l41_wait_for_pwrmgt_sts(cs35l41);
-		regmap_write(cs35l41->regmap, CS35L41_WAKESRC_CTL, 0x0088);
-
-		cs35l41_wait_for_pwrmgt_sts(cs35l41);
-		regmap_write(cs35l41->regmap, CS35L41_WAKESRC_CTL, 0x0188);
-
-		cs35l41_wait_for_pwrmgt_sts(cs35l41);
-		regmap_write(cs35l41->regmap, CS35L41_PWRMGT_CTL, 0x3);
-	}
-
-	dev_err(cs35l41->dev, "Timed out waking device\n");
-
-	return -ETIMEDOUT;
-}
-
 static int __maybe_unused cs35l41_runtime_resume(struct device *dev)
 {
 	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
@@ -1422,7 +1363,7 @@ static int __maybe_unused cs35l41_runtime_resume(struct device *dev)
 
 	regcache_cache_only(cs35l41->regmap, false);
 
-	ret = cs35l41_exit_hibernate(cs35l41);
+	ret = cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
 	if (ret)
 		return ret;
 
-- 
2.34.1

