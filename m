Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80275CB8D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:22:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D31203;
	Fri, 21 Jul 2023 17:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D31203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952958;
	bh=PIupXYEf/+s25/RlU+j6tA6D81v4eV4EBMT4CXUjk4w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=icJGMat8mlJK2U5YcN9lL+odOxaHiOEjmbWZ0rf9BQvMWLDe6pcKhxNSgC6TSFOfQ
	 CIQE6vrDjzl7bpJer5gICYmIu5myP2+rhk7sW8Tz9Nyc5+RkKjBEmEJI+kXXiog2So
	 CWPjNeb9Ksv5t1cyrk4R/j6ngue2DHUxPmzDkuxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 449CCF80567; Fri, 21 Jul 2023 17:20:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59021F80552;
	Fri, 21 Jul 2023 17:20:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 849A4F80494; Fri, 21 Jul 2023 17:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AF45F80527
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AF45F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SdadVdaD
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDppwn011284;
	Fri, 21 Jul 2023 10:18:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=bf5LPR1X7g9IbS0pw4I5MglPP8kBfPeDlXd9XwzFREY=; b=
	SdadVdaDArBl29qpApaVUy4TQO9AkJ3ITo5qmRq7bLXZtLDxx1Y7ai678TF3HYnc
	7z46l+NrI4bHVqfdrj4+UzTD6ROtgj6Y6AGBNHAs04QVbBZJsNq4oaAVNJGuXwxi
	/x0yIrGvMhgvKCqOblHDIG5Q6R8KvHIzS/zCcfFafQlYhGZYlTBH86D7cqd8XECk
	QucKVtzhnBzBAWlrKzzoM1w30+dAQU42opuvfpDlw5nG3NsjkFUwOqIq3HYT+RWT
	sl9IqqT+vQY2XCZHIrcysdjKqt1YOO9lZ3HxK84BFM923WOIwVYqEwhuiDz4qhzq
	Cwi2tktEI7sToZIz5cm6xA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g5-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:32 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 16:18:27 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EEDD4356D;
	Fri, 21 Jul 2023 15:18:26 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 06/11] ALSA: hda: cs35l41: Move Play and Pause into
 separate functions
Date: Fri, 21 Jul 2023 16:18:11 +0100
Message-ID: <20230721151816.2080453-7-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PySARjVG6RGjMYiIcFNDCftZ0Int-6XR
X-Proofpoint-ORIG-GUID: PySARjVG6RGjMYiIcFNDCftZ0Int-6XR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JU656TI3GX7XIXQ2XRGH4EGLMCGX2USF
X-Message-ID-Hash: JU656TI3GX7XIXQ2XRGH4EGLMCGX2USF
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JU656TI3GX7XIXQ2XRGH4EGLMCGX2USF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This allows play and pause to be called from multiple places,
which is necessary for system suspend and resume.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 131 ++++++++++++++++++++++--------------
 1 file changed, 79 insertions(+), 52 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d4a11f7b5dbd1..f77583b46b6b0 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -483,63 +483,103 @@ static void cs35l41_irq_release(struct cs35l41_hda *cs35l41)
 	cs35l41->irq_errors = 0;
 }
 
-static void cs35l41_hda_playback_hook(struct device *dev, int action)
+static void cs35l41_hda_play_start(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct regmap *reg = cs35l41->regmap;
-	int ret = 0;
+
+	dev_dbg(dev, "Play (Start)\n");
+
+	if (cs35l41->playback_started) {
+		dev_dbg(dev, "Playback already started.");
+		return;
+	}
+
+	cs35l41->playback_started = true;
+
+	if (cs35l41->firmware_running) {
+		regmap_multi_reg_write(reg, cs35l41_hda_config_dsp,
+				       ARRAY_SIZE(cs35l41_hda_config_dsp));
+		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
+				   CS35L41_VMON_EN_MASK | CS35L41_IMON_EN_MASK,
+				   1 << CS35L41_VMON_EN_SHIFT | 1 << CS35L41_IMON_EN_SHIFT);
+		cs35l41_set_cspl_mbox_cmd(cs35l41->dev, reg, CSPL_MBOX_CMD_RESUME);
+	} else {
+		regmap_multi_reg_write(reg, cs35l41_hda_config, ARRAY_SIZE(cs35l41_hda_config));
+	}
+	regmap_update_bits(reg, CS35L41_PWR_CTRL2, CS35L41_AMP_EN_MASK, 1 << CS35L41_AMP_EN_SHIFT);
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
+		regmap_write(reg, CS35L41_GPIO1_CTRL1, 0x00008001);
+
+}
+
+static void cs35l41_hda_play_done(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	struct regmap *reg = cs35l41->regmap;
+
+	dev_dbg(dev, "Play (Complete)\n");
+
+	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 1, NULL,
+			      cs35l41->firmware_running);
+}
+
+static void cs35l41_hda_pause_start(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	struct regmap *reg = cs35l41->regmap;
+
+	dev_dbg(dev, "Pause (Start)\n");
+
+	regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
+	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 0, NULL,
+			      cs35l41->firmware_running);
+}
+
+static void cs35l41_hda_pause_done(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	struct regmap *reg = cs35l41->regmap;
+
+	dev_dbg(dev, "Pause (Complete)\n");
+
+	regmap_update_bits(reg, CS35L41_PWR_CTRL2, CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
+		regmap_write(reg, CS35L41_GPIO1_CTRL1, 0x00000001);
+	if (cs35l41->firmware_running) {
+		cs35l41_set_cspl_mbox_cmd(dev, reg, CSPL_MBOX_CMD_PAUSE);
+		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
+				   CS35L41_VMON_EN_MASK | CS35L41_IMON_EN_MASK,
+				   0 << CS35L41_VMON_EN_SHIFT | 0 << CS35L41_IMON_EN_SHIFT);
+	}
+	cs35l41_irq_release(cs35l41);
+	cs35l41->playback_started = false;
+}
+
+static void cs35l41_hda_playback_hook(struct device *dev, int action)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
 	switch (action) {
 	case HDA_GEN_PCM_ACT_OPEN:
 		pm_runtime_get_sync(dev);
 		mutex_lock(&cs35l41->fw_mutex);
-		cs35l41->playback_started = true;
-		if (cs35l41->firmware_running) {
-			regmap_multi_reg_write(reg, cs35l41_hda_config_dsp,
-					       ARRAY_SIZE(cs35l41_hda_config_dsp));
-			regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-					   CS35L41_VMON_EN_MASK | CS35L41_IMON_EN_MASK,
-					   1 << CS35L41_VMON_EN_SHIFT | 1 << CS35L41_IMON_EN_SHIFT);
-			cs35l41_set_cspl_mbox_cmd(cs35l41->dev, cs35l41->regmap,
-						  CSPL_MBOX_CMD_RESUME);
-		} else {
-			regmap_multi_reg_write(reg, cs35l41_hda_config,
-					       ARRAY_SIZE(cs35l41_hda_config));
-		}
-		ret = regmap_update_bits(reg, CS35L41_PWR_CTRL2,
-					 CS35L41_AMP_EN_MASK, 1 << CS35L41_AMP_EN_SHIFT);
-		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
-			regmap_write(reg, CS35L41_GPIO1_CTRL1, 0x00008001);
+		cs35l41_hda_play_start(dev);
 		mutex_unlock(&cs35l41->fw_mutex);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
 		mutex_lock(&cs35l41->fw_mutex);
-		ret = cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 1, NULL,
-					    cs35l41->firmware_running);
+		cs35l41_hda_play_done(dev);
 		mutex_unlock(&cs35l41->fw_mutex);
 		break;
 	case HDA_GEN_PCM_ACT_CLEANUP:
 		mutex_lock(&cs35l41->fw_mutex);
-		regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
-		ret = cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 0, NULL,
-					    cs35l41->firmware_running);
+		cs35l41_hda_pause_start(dev);
 		mutex_unlock(&cs35l41->fw_mutex);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
 		mutex_lock(&cs35l41->fw_mutex);
-		ret = regmap_update_bits(reg, CS35L41_PWR_CTRL2,
-					 CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
-		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
-			regmap_write(reg, CS35L41_GPIO1_CTRL1, 0x00000001);
-		if (cs35l41->firmware_running) {
-			cs35l41_set_cspl_mbox_cmd(cs35l41->dev, cs35l41->regmap,
-						  CSPL_MBOX_CMD_PAUSE);
-			regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-					   CS35L41_VMON_EN_MASK | CS35L41_IMON_EN_MASK,
-					   0 << CS35L41_VMON_EN_SHIFT | 0 << CS35L41_IMON_EN_SHIFT);
-		}
-		cs35l41_irq_release(cs35l41);
-		cs35l41->playback_started = false;
+		cs35l41_hda_pause_done(dev);
 		mutex_unlock(&cs35l41->fw_mutex);
 
 		pm_runtime_mark_last_busy(dev);
@@ -549,9 +589,6 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		dev_warn(cs35l41->dev, "Playback action not supported: %d\n", action);
 		break;
 	}
-
-	if (ret)
-		dev_err(cs35l41->dev, "Regmap access fail: %d\n", ret);
 }
 
 static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsigned int *tx_slot,
@@ -703,18 +740,8 @@ static int cs35l41_runtime_suspend(struct device *dev)
 	mutex_lock(&cs35l41->fw_mutex);
 
 	if (cs35l41->playback_started) {
-		regmap_multi_reg_write(cs35l41->regmap, cs35l41_hda_mute,
-				       ARRAY_SIZE(cs35l41_hda_mute));
-		cs35l41_global_enable(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type, 0,
-				      NULL, cs35l41->firmware_running);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-				   CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
-		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
-			regmap_write(cs35l41->regmap, CS35L41_GPIO1_CTRL1, 0x00000001);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-				   CS35L41_VMON_EN_MASK | CS35L41_IMON_EN_MASK,
-				   0 << CS35L41_VMON_EN_SHIFT | 0 << CS35L41_IMON_EN_SHIFT);
-		cs35l41->playback_started = false;
+		cs35l41_hda_pause_start(dev);
+		cs35l41_hda_pause_done(dev);
 	}
 
 	if (cs35l41->firmware_running) {
-- 
2.34.1

