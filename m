Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CCE511BB3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:12:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2DD16E7;
	Wed, 27 Apr 2022 17:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2DD16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651072374;
	bh=CJGF5c9P5YCV1G0y0LyKh5/Z2fv2Bz7n7otj47F3sIM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X2snLgUccCYpMtLOBhz27sOZkl2v7ynWVaO3By2lm0dvVLUjNQucHwtH5L/rawYyv
	 ajXnexvYQ1ON1mMRBNk098yJMyu666Ki4vA9kL9qGkQh3UNrWgkei15XPKcbFKJMQD
	 FOsLwy1rVBjOtWXR0wTeAQTdSAecgPIZoCT4aVXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA574F805A0;
	Wed, 27 Apr 2022 17:08:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55741F80551; Wed, 27 Apr 2022 17:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 857FBF80519
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 857FBF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DE59EqXX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R6M8vn014103;
 Wed, 27 Apr 2022 10:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ArcewcoP0tuLPjnpGDtq73r4Bynp3YQrvgJpLfisDOQ=;
 b=DE59EqXX8dHw3G/B+M5Wq4jKJpiT6d4qBPbsOaBfTQojm7Yp16ZhwsumW7KVf54iU3dB
 0ghXgg6AaiX0FP1RnRypTE8sJkVBVcajshSTHArYbHwnjRSj5EJlelSuuj5aaa1rgF1W
 RlBL6q5x95bMiOWEv6bawMLFvwBK9wHFDH0kPpnGozLCySLcKI2VctCs5kWZbpCzk7dg
 brTZFGdRGfvsG2iucAAhBHnqPhoELLH68Fb3/O30UOdmoikoEmtyHZvMmN1EmjpQPEbW
 Z2s8CgpxLcZ3QwkBK7FfjbyhRE4QF4Zl+trb11C3/nCt+yBnELaM/63JJFV6LJ3ZFtax FQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt60xth-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 10:07:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 16:07:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 16:07:30 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.170])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 04676B1A;
 Wed, 27 Apr 2022 15:07:29 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH 18/26] ASoC: cs35l41: Move cs35l41 exit hibernate function
 into shared code
Date: Wed, 27 Apr 2022 16:07:12 +0100
Message-ID: <20220427150720.9194-19-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mfluf5woC9VU3-7USLj7_SXnRwm33w2w
X-Proofpoint-ORIG-GUID: mfluf5woC9VU3-7USLj7_SXnRwm33w2w
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

CS35L41 HDA Driver will support hibernation using DSP firmware,
move the exit hibernate function into shared code so this can
be reused.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  1 +
 sound/soc/codecs/cs35l41-lib.c | 60 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 61 +---------------------------------
 3 files changed, 62 insertions(+), 60 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 85db31174adb..938f5846e4d4 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -886,6 +886,7 @@ void cs35l41_configure_cs_dsp(struct device *dev, struct regmap *reg, struct cs_
 int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 			      enum cs35l41_cspl_mbox_cmd cmd);
 int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap);
+int cs35l41_exit_hibernate(struct device *dev, struct regmap *regmap);
 int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 		       struct cs35l41_hw_cfg *hw_cfg);
 bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 37ae8ddccac9..dc4654f43157 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1319,6 +1319,66 @@ int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap)
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
index 5f0eca229dd3..0400c6e091d5 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1349,65 +1349,6 @@ static int __maybe_unused cs35l41_runtime_suspend(struct device *dev)
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
@@ -1420,7 +1361,7 @@ static int __maybe_unused cs35l41_runtime_resume(struct device *dev)
 
 	regcache_cache_only(cs35l41->regmap, false);
 
-	ret = cs35l41_exit_hibernate(cs35l41);
+	ret = cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
 	if (ret)
 		return ret;
 
-- 
2.32.0

