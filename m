Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC052072D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:55:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF271853;
	Mon,  9 May 2022 23:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF271853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652133307;
	bh=WByTLJK8eEZt/36exvIGie5BV5/WiGAaOF8dOo2Krvo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghkMvkE9wwSEPsIgnjAnKuZmoHZikL1g9YF/p7sjLhe3b/TEQ7bpDHrFuMc3Ul9yy
	 vO+C5Tw5ljNrebvedQ3/sLbOeXQBjYag5c2YE/leHIXGE8kHrCCBLTohlet2Ebm5RO
	 xprl5cj2OQ5a3v5Vz3g/aV8tyAOBi8uykb7t915g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE6A2F805EA;
	Mon,  9 May 2022 23:47:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4FA1F805B4; Mon,  9 May 2022 23:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2424BF80529
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2424BF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ydn/MApz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249Bt3ZE026043;
 Mon, 9 May 2022 16:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=AeTi/0ntakaOsDizqbK3Yl89HyXJuFjIDJN3l+/qPNA=;
 b=Ydn/MApzjKqSZ71jk6u8N3mg4PWLf5kDFcHSHNXATlhydN4pZRDyG9A7PvDxJP+jqqv3
 waZ1uNhoKnQKeRHFgRZaYQf5uV2OgCLex/5+VqWQ8C/+XuFAeCpR3ezftYbpWSXvSFWV
 rxBB933s8TaPQ6T7umLaxbsOdkDwTUnjX1F4p2SY5aNOqegniPC2DXDI7bm4nCOdeeko
 NnZnvaMbslN0skr5ZAmcHfgdOrIVS7b7SmJdeN6m+Kem7xtTrvKwUOm0gxPSqQnUFwg0
 1Zhm1RmJhIk2tfmcQTNhcMRuE7kFLEAV5qpBi1mzO8SOVeV3NuGzXuu18ZQD+sdp+Zph KQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp613jeu-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 16:47:15 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 22:47:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 22:47:11 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.55])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 26454B10;
 Mon,  9 May 2022 21:47:11 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 18/26] ASoC: cs35l41: Move cs35l41 exit hibernate function
 into shared code
Date: Mon, 9 May 2022 22:46:55 +0100
Message-ID: <20220509214703.4482-19-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 66GmFrRYn5ULHTQsapDPdxi-g3jxnkxf
X-Proofpoint-ORIG-GUID: 66GmFrRYn5ULHTQsapDPdxi-g3jxnkxf
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
2.34.1

