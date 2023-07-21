Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180975CB5C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0FF31F7;
	Fri, 21 Jul 2023 17:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0FF31F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952774;
	bh=efEUaNG0WfUCnRkmgngAHrJCFGgRIQgL4I7wGYG8qcU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eZKhtd7eiGwb7mkgI9WMUnQIkkdZaIstG1fsi72nitWrszuQn7xjn+NtOLoClhWJb
	 E0cgfl60soXi+xgSEr1eTcx3DuAW9cJu6iSv2XgWeKE8KipE34BFD1KrYU7sclMFzi
	 NjT0Vkiqs8YBELQ93sZSlkBVVRbxv6Iy/UbKXsPo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A03A4F80494; Fri, 21 Jul 2023 17:18:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28F69F80494;
	Fri, 21 Jul 2023 17:18:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCD7DF80552; Fri, 21 Jul 2023 17:18:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CBE5F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBE5F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VxAtXxwj
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDppwh011284;
	Fri, 21 Jul 2023 10:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Pop765tX/espGAVNilT1iKAuALz1mWdpJ3qDXGWdFD0=; b=
	VxAtXxwjrf2nrMjxotSepqnw1wM8AvXiG32QUSegfv5vsOs2ktJtPfG8bT/I/hxc
	ebjLMMhE7Q6W0FeWWKATJRg8jDjHnKHTJ+dunbFq9bc0N96q9lC2qYlCPwhvhiJ0
	5GV7dQcMpnr+3aWFZeyDJ3Q3T/yuqBEHFW5xOb7zS9klkPTggjIGmwWkZnmr65Vh
	McAkFnySGE0pKrwYUmAmc84yEDYGE0Yd8yncDGaF2hUUyHK4VnXkkJum1uqZRIYU
	KjGVvNNTDQHQuS2BCt9TqaucO8aC6w3O+RmAiUBcqoiuzQYei7GzTNLMo+osv5LH
	4gJHqCIm2kJH4NpxnjwOQA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:28 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 21 Jul 2023 16:18:25 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A3FBE3560;
	Fri, 21 Jul 2023 15:18:25 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 01/11] ALSA: cs35l41: Use mbox command to enable speaker
 output for external boost
Date: Fri, 21 Jul 2023 16:18:06 +0100
Message-ID: <20230721151816.2080453-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OFpE8lYm0V3lcYYJhpnchy2usvP-uh9J
X-Proofpoint-ORIG-GUID: OFpE8lYm0V3lcYYJhpnchy2usvP-uh9J
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5EB2V4P2A3ZLVN5OGJJV3TW2RLT6BSU3
X-Message-ID-Hash: 5EB2V4P2A3ZLVN5OGJJV3TW2RLT6BSU3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5EB2V4P2A3ZLVN5OGJJV3TW2RLT6BSU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To enable the speaker output in external boost mode, 2 registers must
be set, one after another. The longer the time between the writes of
the two registers, the more likely, and more loudly a pop may occur.
To minimize this, an mbox command can be used to allow the firmware
to perform this action, minimizing any delay between write, thus
minimizing any pop or click as a result. The old method will remain
when running without firmware.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  5 ++-
 sound/pci/hda/cs35l41_hda.c    |  9 ++--
 sound/soc/codecs/cs35l41-lib.c | 76 +++++++++++++++++++++++++++-------
 sound/soc/codecs/cs35l41.c     |  8 ++--
 4 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 7239d943942cb..1bf757901d024 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -829,6 +829,7 @@ enum cs35l41_cspl_mbox_cmd {
 	CSPL_MBOX_CMD_STOP_PRE_REINIT = 4,
 	CSPL_MBOX_CMD_HIBERNATE = 5,
 	CSPL_MBOX_CMD_OUT_OF_HIBERNATE = 6,
+	CSPL_MBOX_CMD_SPK_OUT_ENABLE = 7,
 	CSPL_MBOX_CMD_UNKNOWN_CMD = -1,
 	CSPL_MBOX_CMD_INVALID_SEQUENCE = -2,
 };
@@ -901,7 +902,7 @@ int cs35l41_exit_hibernate(struct device *dev, struct regmap *regmap);
 int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 		       struct cs35l41_hw_cfg *hw_cfg);
 bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
-int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable,
-			  struct completion *pll_lock);
+int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l41_boost_type b_type,
+			  int enable, struct completion *pll_lock, bool firmware_running);
 
 #endif /* __CS35L41_H */
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index ce5faa6205170..f9c97270db6f6 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -514,13 +514,15 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
 		mutex_lock(&cs35l41->fw_mutex);
-		ret = cs35l41_global_enable(reg, cs35l41->hw_cfg.bst_type, 1, NULL);
+		ret = cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 1, NULL,
+					    cs35l41->firmware_running);
 		mutex_unlock(&cs35l41->fw_mutex);
 		break;
 	case HDA_GEN_PCM_ACT_CLEANUP:
 		mutex_lock(&cs35l41->fw_mutex);
 		regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
-		ret = cs35l41_global_enable(reg, cs35l41->hw_cfg.bst_type, 0, NULL);
+		ret = cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 0, NULL,
+					    cs35l41->firmware_running);
 		mutex_unlock(&cs35l41->fw_mutex);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
@@ -672,7 +674,8 @@ static int cs35l41_runtime_suspend(struct device *dev)
 	if (cs35l41->playback_started) {
 		regmap_multi_reg_write(cs35l41->regmap, cs35l41_hda_mute,
 				       ARRAY_SIZE(cs35l41_hda_mute));
-		cs35l41_global_enable(cs35l41->regmap, cs35l41->hw_cfg.bst_type, 0, NULL);
+		cs35l41_global_enable(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type, 0,
+				      NULL, cs35l41->firmware_running);
 		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
 				   CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
 		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index ac7cc492bcb05..ce3f475023756 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1080,28 +1080,32 @@ static const struct reg_sequence cs35l41_safe_to_reset[] = {
 	{ 0x00000040,			0x00000033 },
 };
 
-static const struct reg_sequence cs35l41_active_to_safe[] = {
+static const struct reg_sequence cs35l41_active_to_safe_start[] = {
 	{ 0x00000040,			0x00000055 },
 	{ 0x00000040,			0x000000AA },
 	{ 0x00007438,			0x00585941 },
 	{ CS35L41_PWR_CTRL1,		0x00000000 },
-	{ 0x0000742C,			0x00000009, 3000 },
+	{ 0x0000742C,			0x00000009 },
+};
+
+static const struct reg_sequence cs35l41_active_to_safe_end[] = {
 	{ 0x00007438,			0x00580941 },
 	{ 0x00000040,			0x000000CC },
 	{ 0x00000040,			0x00000033 },
 };
 
-static const struct reg_sequence cs35l41_safe_to_active[] = {
+static const struct reg_sequence cs35l41_safe_to_active_start[] = {
 	{ 0x00000040,			0x00000055 },
 	{ 0x00000040,			0x000000AA },
 	{ 0x0000742C,			0x0000000F },
 	{ 0x0000742C,			0x00000079 },
 	{ 0x00007438,			0x00585941 },
-	{ CS35L41_PWR_CTRL1,		0x00000001, 3000 }, // GLOBAL_EN = 1
+	{ CS35L41_PWR_CTRL1,		0x00000001 }, // GLOBAL_EN = 1
+};
+
+static const struct reg_sequence cs35l41_safe_to_active_en_spk[] = {
 	{ 0x0000742C,			0x000000F9 },
 	{ 0x00007438,			0x00580941 },
-	{ 0x00000040,			0x000000CC },
-	{ 0x00000040,			0x00000033 },
 };
 
 static const struct reg_sequence cs35l41_reset_to_safe[] = {
@@ -1188,11 +1192,11 @@ bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type)
 }
 EXPORT_SYMBOL_GPL(cs35l41_safe_reset);
 
-int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable,
-			  struct completion *pll_lock)
+int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l41_boost_type b_type,
+			  int enable, struct completion *pll_lock, bool firmware_running)
 {
 	int ret;
-	unsigned int gpio1_func, pad_control, pwr_ctrl1, pwr_ctrl3;
+	unsigned int gpio1_func, pad_control, pwr_ctrl1, pwr_ctrl3, int_status;
 	struct reg_sequence cs35l41_mdsync_down_seq[] = {
 		{CS35L41_PWR_CTRL3,		0},
 		{CS35L41_GPIO_PAD_CONTROL,	0},
@@ -1204,6 +1208,14 @@ int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type,
 		{CS35L41_PWR_CTRL1,	0x00000001, 3000},
 	};
 
+	if ((pwr_ctl1_val & CS35L41_GLOBAL_EN_MASK) && enable) {
+		dev_dbg(dev, "Cannot set Global Enable - already set.\n");
+		return 0;
+	} else if (!(pwr_ctl1_val & CS35L41_GLOBAL_EN_MASK) && !enable) {
+		dev_dbg(dev, "Cannot unset Global Enable - not set.\n");
+		return 0;
+	}
+
 	switch (b_type) {
 	case CS35L41_SHD_BOOST_ACTV:
 	case CS35L41_SHD_BOOST_PASS:
@@ -1244,16 +1256,48 @@ int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type,
 	case CS35L41_INT_BOOST:
 		ret = regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
 					 enable << CS35L41_GLOBAL_EN_SHIFT);
+		if (ret) {
+			dev_err(dev, "CS35L41_PWR_CTRL1 set failed: %d\n", ret);
+			return ret;
+		}
 		usleep_range(3000, 3100);
 		break;
 	case CS35L41_EXT_BOOST:
 	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
-		if (enable)
-			ret = regmap_multi_reg_write(regmap, cs35l41_safe_to_active,
-						     ARRAY_SIZE(cs35l41_safe_to_active));
-		else
-			ret = regmap_multi_reg_write(regmap, cs35l41_active_to_safe,
-						     ARRAY_SIZE(cs35l41_active_to_safe));
+		if (enable) {
+			/* Test Key is unlocked here */
+			ret = regmap_multi_reg_write(regmap, cs35l41_safe_to_active_start,
+						     ARRAY_SIZE(cs35l41_safe_to_active_start));
+			if (ret)
+				return ret;
+
+			usleep_range(3000, 3100);
+
+			if (firmware_running)
+				ret = cs35l41_set_cspl_mbox_cmd(dev, regmap,
+								CSPL_MBOX_CMD_SPK_OUT_ENABLE);
+			else
+				ret = regmap_multi_reg_write(regmap, cs35l41_safe_to_active_en_spk,
+							ARRAY_SIZE(cs35l41_safe_to_active_en_spk));
+
+			/* Lock the test key, it was unlocked during the multi_reg_write */
+			cs35l41_test_key_lock(dev, regmap);
+		} else {
+			/* Test Key is unlocked here */
+			ret = regmap_multi_reg_write(regmap, cs35l41_active_to_safe_start,
+						     ARRAY_SIZE(cs35l41_active_to_safe_start));
+			if (ret) {
+				/* Lock the test key, it was unlocked during the multi_reg_write */
+				cs35l41_test_key_lock(dev, regmap);
+				return ret;
+			}
+
+			usleep_range(3000, 3100);
+
+			/* Test Key is locked here */
+			ret = regmap_multi_reg_write(regmap, cs35l41_active_to_safe_end,
+						     ARRAY_SIZE(cs35l41_active_to_safe_end));
+		}
 		break;
 	default:
 		ret = -EINVAL;
@@ -1344,6 +1388,8 @@ static bool cs35l41_check_cspl_mbox_sts(enum cs35l41_cspl_mbox_cmd cmd,
 		return (sts == CSPL_MBOX_STS_RUNNING);
 	case CSPL_MBOX_CMD_STOP_PRE_REINIT:
 		return (sts == CSPL_MBOX_STS_RDY_FOR_REINIT);
+	case CSPL_MBOX_CMD_SPK_OUT_ENABLE:
+		return (sts == CSPL_MBOX_STS_RUNNING);
 	default:
 		return false;
 	}
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 6ac501f008eca..d4e9c9d9b50a6 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -500,12 +500,12 @@ static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
 						cs35l41_pup_patch,
 						ARRAY_SIZE(cs35l41_pup_patch));
 
-		cs35l41_global_enable(cs35l41->regmap, cs35l41->hw_cfg.bst_type, 1,
-				      &cs35l41->pll_lock);
+		ret = cs35l41_global_enable(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type,
+					    1, &cs35l41->pll_lock, cs35l41->dsp.cs_dsp.running);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		cs35l41_global_enable(cs35l41->regmap, cs35l41->hw_cfg.bst_type, 0,
-				      &cs35l41->pll_lock);
+		ret = cs35l41_global_enable(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type,
+					    0, &cs35l41->pll_lock, cs35l41->dsp.cs_dsp.running);
 
 		ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
 					       val, val &  CS35L41_PDN_DONE_MASK,
-- 
2.34.1

