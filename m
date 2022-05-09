Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D6F5206F5
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1618D1712;
	Mon,  9 May 2022 23:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1618D1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652132991;
	bh=rBiBXfknrx83frg0qSUtDIYFqT8r8929LScFPKvXSuU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/EA5yVb5aljHrVB+5v8wjYid/k1QBDRKHgGwOVrhjSgCsj80y66blqQloB1/Mae9
	 r7Uvvyt/1/fVdRVekwpaLeSv3S4f5b+cKqJY3ptIKSbV1scZu9ROQhdlD6T0THwjW2
	 fAC9O1/Ii8c7cNQsvz1gXg4VUpXs0pn287wRgUU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E7EBF80508;
	Mon,  9 May 2022 23:47:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA4E2F80269; Mon,  9 May 2022 23:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61B70F802E3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B70F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fI4RTF9r"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249BF6xZ021606;
 Mon, 9 May 2022 16:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=1sdbHWAQsbxttE790Pq5zOZbcM8ipi1LZQmmjKe+QfE=;
 b=fI4RTF9r5H+QA9+fzyrhoJw9Vl43UO+X0CfQZPxyqCle1aYXy5CB3Xawi0aRjXqbBwI/
 mbIWeOFYdhwZ+uQld+Km+x97T52Q+/F6g6pwgjF4EvDBYzkC3MJ/MBSPbl/yW9DJqvuH
 eka9vaayXXzGEZc8WibeNL7LJouuxkPgmbXUTJ+sk2VRxvbqhVU4Yo9mCOhxgTfCdAK9
 mSrTtopXJMUNIRWSZjT/+5QozOAKioSqFsphYXeKNfvnOcqJFgisr5OEXDOeio9H7Sa3
 5fpJod82dELxlXNClnkJsYJoUayTRBqfKQ8oaoHJXs55XsGYh+tTNaR1ay8JJ1w5THT2 Lg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp613jer-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 16:47:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 22:47:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 22:47:06 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.55])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 77C7C11D1;
 Mon,  9 May 2022 21:47:06 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 06/26] ASoC: cs35l41: Move cs35l41_set_cspl_mbox_cmd to
 shared code
Date: Mon, 9 May 2022 22:46:43 +0100
Message-ID: <20220509214703.4482-7-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AuTfAIRdRP10hiXd2VShX_dzWAabuvUl
X-Proofpoint-ORIG-GUID: AuTfAIRdRP10hiXd2VShX_dzWAabuvUl
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

This function is used to control the DSP Firmware for cs35l41,
and will be needed by the cs35l41 hda driver, when firmware
support is added.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 include/sound/cs35l41.h        | 20 ++++++++++
 sound/soc/codecs/cs35l41-lib.c | 57 ++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 69 +++-------------------------------
 sound/soc/codecs/cs35l41.h     | 18 ---------
 4 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 5bd2a5d370ce..77cfd92cf33b 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -800,6 +800,24 @@ struct cs35l41_otp_map_element_t {
 	u32 word_offset;
 };
 
+enum cs35l41_cspl_mbox_status {
+	CSPL_MBOX_STS_RUNNING = 0,
+	CSPL_MBOX_STS_PAUSED = 1,
+	CSPL_MBOX_STS_RDY_FOR_REINIT = 2,
+};
+
+enum cs35l41_cspl_mbox_cmd {
+	CSPL_MBOX_CMD_NONE = 0,
+	CSPL_MBOX_CMD_PAUSE = 1,
+	CSPL_MBOX_CMD_RESUME = 2,
+	CSPL_MBOX_CMD_REINIT = 3,
+	CSPL_MBOX_CMD_STOP_PRE_REINIT = 4,
+	CSPL_MBOX_CMD_HIBERNATE = 5,
+	CSPL_MBOX_CMD_OUT_OF_HIBERNATE = 6,
+	CSPL_MBOX_CMD_UNKNOWN_CMD = -1,
+	CSPL_MBOX_CMD_INVALID_SEQUENCE = -2,
+};
+
 /*
  * IRQs
  */
@@ -858,6 +876,8 @@ int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 			 unsigned int tx_num, unsigned int *tx_slot,
 			 unsigned int rx_num, unsigned int *rx_slot);
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
+int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
+			      enum cs35l41_cspl_mbox_cmd cmd);
 int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 		       struct cs35l41_hw_cfg *hw_cfg);
 bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index d6017461766c..56464e5844d6 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1208,6 +1208,63 @@ int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg)
 }
 EXPORT_SYMBOL_GPL(cs35l41_gpio_config);
 
+static bool cs35l41_check_cspl_mbox_sts(enum cs35l41_cspl_mbox_cmd cmd,
+					enum cs35l41_cspl_mbox_status sts)
+{
+	switch (cmd) {
+	case CSPL_MBOX_CMD_NONE:
+	case CSPL_MBOX_CMD_UNKNOWN_CMD:
+		return true;
+	case CSPL_MBOX_CMD_PAUSE:
+	case CSPL_MBOX_CMD_OUT_OF_HIBERNATE:
+		return (sts == CSPL_MBOX_STS_PAUSED);
+	case CSPL_MBOX_CMD_RESUME:
+		return (sts == CSPL_MBOX_STS_RUNNING);
+	case CSPL_MBOX_CMD_REINIT:
+		return (sts == CSPL_MBOX_STS_RUNNING);
+	case CSPL_MBOX_CMD_STOP_PRE_REINIT:
+		return (sts == CSPL_MBOX_STS_RDY_FOR_REINIT);
+	default:
+		return false;
+	}
+}
+
+int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
+			      enum cs35l41_cspl_mbox_cmd cmd)
+{
+	unsigned int sts = 0, i;
+	int ret;
+
+	// Set mailbox cmd
+	ret = regmap_write(regmap, CS35L41_DSP_VIRT1_MBOX_1, cmd);
+	if (ret < 0) {
+		if (cmd != CSPL_MBOX_CMD_OUT_OF_HIBERNATE)
+			dev_err(dev, "Failed to write MBOX: %d\n", ret);
+		return ret;
+	}
+
+	// Read mailbox status and verify it is appropriate for the given cmd
+	for (i = 0; i < 5; i++) {
+		usleep_range(1000, 1100);
+
+		ret = regmap_read(regmap, CS35L41_DSP_MBOX_2, &sts);
+		if (ret < 0) {
+			dev_err(dev, "Failed to read MBOX STS: %d\n", ret);
+			continue;
+		}
+
+		if (!cs35l41_check_cspl_mbox_sts(cmd, sts))
+			dev_dbg(dev, "[%u] cmd %u returned invalid sts %u", i, cmd, sts);
+		else
+			return 0;
+	}
+
+	dev_err(dev, "Failed to set mailbox cmd %u (status %u)\n", cmd, sts);
+
+	return -ENOMSG;
+}
+EXPORT_SYMBOL_GPL(cs35l41_set_cspl_mbox_cmd);
+
 MODULE_DESCRIPTION("CS35L41 library");
 MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 912196f45648..0285946688f7 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -208,67 +208,6 @@ static int cs35l41_dsp_preload_ev(struct snd_soc_dapm_widget *w,
 	}
 }
 
-static bool cs35l41_check_cspl_mbox_sts(enum cs35l41_cspl_mbox_cmd cmd,
-					enum cs35l41_cspl_mbox_status sts)
-{
-	switch (cmd) {
-	case CSPL_MBOX_CMD_NONE:
-	case CSPL_MBOX_CMD_UNKNOWN_CMD:
-		return true;
-	case CSPL_MBOX_CMD_PAUSE:
-	case CSPL_MBOX_CMD_OUT_OF_HIBERNATE:
-		return (sts == CSPL_MBOX_STS_PAUSED);
-	case CSPL_MBOX_CMD_RESUME:
-		return (sts == CSPL_MBOX_STS_RUNNING);
-	case CSPL_MBOX_CMD_REINIT:
-		return (sts == CSPL_MBOX_STS_RUNNING);
-	case CSPL_MBOX_CMD_STOP_PRE_REINIT:
-		return (sts == CSPL_MBOX_STS_RDY_FOR_REINIT);
-	default:
-		return false;
-	}
-}
-
-static int cs35l41_set_cspl_mbox_cmd(struct cs35l41_private *cs35l41,
-				     enum cs35l41_cspl_mbox_cmd cmd)
-{
-	unsigned int sts = 0, i;
-	int ret;
-
-	// Set mailbox cmd
-	ret = regmap_write(cs35l41->regmap, CS35L41_DSP_VIRT1_MBOX_1, cmd);
-	if (ret < 0) {
-		if (cmd != CSPL_MBOX_CMD_OUT_OF_HIBERNATE)
-			dev_err(cs35l41->dev, "Failed to write MBOX: %d\n", ret);
-		return ret;
-	}
-
-	// Read mailbox status and verify it is appropriate for the given cmd
-	for (i = 0; i < 5; i++) {
-		usleep_range(1000, 1100);
-
-		ret = regmap_read(cs35l41->regmap, CS35L41_DSP_MBOX_2, &sts);
-		if (ret < 0) {
-			dev_err(cs35l41->dev, "Failed to read MBOX STS: %d\n", ret);
-			continue;
-		}
-
-		if (!cs35l41_check_cspl_mbox_sts(cmd, sts)) {
-			dev_dbg(cs35l41->dev,
-				"[%u] cmd %u returned invalid sts %u",
-				i, cmd, sts);
-		} else {
-			return 0;
-		}
-	}
-
-	dev_err(cs35l41->dev,
-		"Failed to set mailbox cmd %u (status %u)\n",
-		cmd, sts);
-
-	return -ENOMSG;
-}
-
 static int cs35l41_dsp_audio_ev(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
@@ -299,9 +238,11 @@ static int cs35l41_dsp_audio_ev(struct snd_soc_dapm_widget *w,
 			return -EINVAL;
 		}
 
-		return cs35l41_set_cspl_mbox_cmd(cs35l41, CSPL_MBOX_CMD_RESUME);
+		return cs35l41_set_cspl_mbox_cmd(cs35l41->dev, cs35l41->regmap,
+						 CSPL_MBOX_CMD_RESUME);
 	case SND_SOC_DAPM_PRE_PMD:
-		return cs35l41_set_cspl_mbox_cmd(cs35l41, CSPL_MBOX_CMD_PAUSE);
+		return cs35l41_set_cspl_mbox_cmd(cs35l41->dev, cs35l41->regmap,
+						 CSPL_MBOX_CMD_PAUSE);
 	default:
 		return 0;
 	}
@@ -1475,7 +1416,7 @@ static int cs35l41_exit_hibernate(struct cs35l41_private *cs35l41)
 		dev_dbg(cs35l41->dev, "Exit hibernate\n");
 
 		for (j = 0; j < wake_retries; j++) {
-			ret = cs35l41_set_cspl_mbox_cmd(cs35l41,
+			ret = cs35l41_set_cspl_mbox_cmd(cs35l41->dev, cs35l41->regmap,
 							CSPL_MBOX_CMD_OUT_OF_HIBERNATE);
 			if (!ret)
 				break;
diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
index e3369e0aa89f..c85cbc1dd333 100644
--- a/sound/soc/codecs/cs35l41.h
+++ b/sound/soc/codecs/cs35l41.h
@@ -23,24 +23,6 @@
 
 extern const struct dev_pm_ops cs35l41_pm_ops;
 
-enum cs35l41_cspl_mbox_status {
-	CSPL_MBOX_STS_RUNNING = 0,
-	CSPL_MBOX_STS_PAUSED = 1,
-	CSPL_MBOX_STS_RDY_FOR_REINIT = 2,
-};
-
-enum cs35l41_cspl_mbox_cmd {
-	CSPL_MBOX_CMD_NONE = 0,
-	CSPL_MBOX_CMD_PAUSE = 1,
-	CSPL_MBOX_CMD_RESUME = 2,
-	CSPL_MBOX_CMD_REINIT = 3,
-	CSPL_MBOX_CMD_STOP_PRE_REINIT = 4,
-	CSPL_MBOX_CMD_HIBERNATE = 5,
-	CSPL_MBOX_CMD_OUT_OF_HIBERNATE = 6,
-	CSPL_MBOX_CMD_UNKNOWN_CMD = -1,
-	CSPL_MBOX_CMD_INVALID_SEQUENCE = -2,
-};
-
 struct cs35l41_private {
 	struct wm_adsp dsp; /* needs to be first member */
 	struct snd_soc_codec *codec;
-- 
2.34.1

