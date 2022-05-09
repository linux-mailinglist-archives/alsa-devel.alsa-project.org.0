Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB24D5206F0
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:49:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DBA016DF;
	Mon,  9 May 2022 23:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DBA016DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652132973;
	bh=PfIDiU8UNlFGHYFljtPlY0Q7qLAt3IjS9hC4QOKl4J0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IhavWimjPnPP/QQvuJITQvY+TRqoWt12hcL8meKCnj9HrCrv3PE/CH1MG6LBK1Wbu
	 4odAsAGnt8TtqJSAYbV/Zk/tr+XbKKwSoz3VRvFLfcZGwhUpop2QKu403nGa3wfkAF
	 9pkwFHPxTQRb7ab6OshEbBIawJq6AhhrnIfDO0jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBE89F8053E;
	Mon,  9 May 2022 23:47:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C3ECF8053A; Mon,  9 May 2022 23:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC0CF80269
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC0CF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="A1aWHArG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249KTf3J031853;
 Mon, 9 May 2022 16:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oDYQrz5v9BfYEw41UD+JKXNKxN44X9BHFFonMWvDl3c=;
 b=A1aWHArGvDolNnJZN11oVWr4wZCuKhVkFjNt6EI1V0r92kQeZ2jGOpYR3yV+WXxrv2du
 PrniyziLHeT0vjg0Xz8TBwZnrU6+yrZJ+WCfIgP15T3u/TKOC+Qx5q5ffCG9ACWfyeqE
 cGaudTOrCS8U3FhWoXCwfF3wVc+iAv+5NErpWpwDWccvQAIXigJHy7KGjjfuC5uw9VRg
 XsvOtvicElBD/79/cXcPbD9UTceUjoQNS0AZP41PZftATDR+uQjx6Bwo9WH48gFaSwqB
 BudNk5Zv9s9AcH+cEEG5TtZZXzWBD4B/arQMz5Pgg28xHnXHSjIxQm19ksmKFSKnFiul Zw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nu87p-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 16:47:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 22:47:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 22:47:07 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.55])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4E6ADB10;
 Mon,  9 May 2022 21:47:07 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 08/26] ASoC: cs35l41: Move cs_dsp config struct into shared
 code
Date: Mon, 9 May 2022 22:46:45 +0100
Message-ID: <20220509214703.4482-9-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dKtnLKApwqfF52uxRk7kzm-prvvnccZY
X-Proofpoint-GUID: dKtnLKApwqfF52uxRk7kzm-prvvnccZY
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

This can then be used by HDA code to configure cs_dsp.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  2 ++
 sound/soc/codecs/cs35l41-lib.c | 24 ++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 20 ++------------------
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index ef08f2c17238..8972fa697622 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -11,6 +11,7 @@
 #define __CS35L41_H
 
 #include <linux/regmap.h>
+#include <linux/firmware/cirrus/cs_dsp.h>
 
 #define CS35L41_FIRSTREG		0x00000000
 #define CS35L41_LASTREG			0x03804FE8
@@ -876,6 +877,7 @@ int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 			 unsigned int tx_num, unsigned int *tx_slot,
 			 unsigned int rx_num, unsigned int *rx_slot);
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
+void cs35l41_configure_cs_dsp(struct device *dev, struct regmap *reg, struct cs_dsp *dsp);
 int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 			      enum cs35l41_cspl_mbox_cmd cmd);
 int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index a3cd1255500c..6d3070ea9e06 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -12,6 +12,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/firmware/cirrus/wmfw.h>
 
 #include <sound/cs35l41.h>
 
@@ -1227,6 +1228,29 @@ int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg)
 }
 EXPORT_SYMBOL_GPL(cs35l41_gpio_config);
 
+static const struct cs_dsp_region cs35l41_dsp1_regions[] = {
+	{ .type = WMFW_HALO_PM_PACKED,	.base = CS35L41_DSP1_PMEM_0 },
+	{ .type = WMFW_HALO_XM_PACKED,	.base = CS35L41_DSP1_XMEM_PACK_0 },
+	{ .type = WMFW_HALO_YM_PACKED,	.base = CS35L41_DSP1_YMEM_PACK_0 },
+	{. type = WMFW_ADSP2_XM,	.base = CS35L41_DSP1_XMEM_UNPACK24_0},
+	{. type = WMFW_ADSP2_YM,	.base = CS35L41_DSP1_YMEM_UNPACK24_0},
+};
+
+void cs35l41_configure_cs_dsp(struct device *dev, struct regmap *reg, struct cs_dsp *dsp)
+{
+	dsp->num = 1;
+	dsp->type = WMFW_HALO;
+	dsp->rev = 0;
+	dsp->dev = dev;
+	dsp->regmap = reg;
+	dsp->base = CS35L41_DSP1_CTRL_BASE;
+	dsp->base_sysinfo = CS35L41_DSP1_SYS_ID;
+	dsp->mem = cs35l41_dsp1_regions;
+	dsp->num_mems = ARRAY_SIZE(cs35l41_dsp1_regions);
+	dsp->lock_regions = 0xFFFFFFFF;
+}
+EXPORT_SYMBOL_GPL(cs35l41_configure_cs_dsp);
+
 static bool cs35l41_check_cspl_mbox_sts(enum cs35l41_cspl_mbox_cmd cmd,
 					enum cs35l41_cspl_mbox_status sts)
 {
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 75527649bb14..5f0eca229dd3 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -680,14 +680,6 @@ static const struct snd_soc_dapm_route cs35l41_audio_map[] = {
 	{"CLASS H", NULL, "PCM Source"},
 };
 
-static const struct cs_dsp_region cs35l41_dsp1_regions[] = {
-	{ .type = WMFW_HALO_PM_PACKED,	.base = CS35L41_DSP1_PMEM_0 },
-	{ .type = WMFW_HALO_XM_PACKED,	.base = CS35L41_DSP1_XMEM_PACK_0 },
-	{ .type = WMFW_HALO_YM_PACKED,	.base = CS35L41_DSP1_YMEM_PACK_0 },
-	{. type = WMFW_ADSP2_XM,	.base = CS35L41_DSP1_XMEM_UNPACK24_0},
-	{. type = WMFW_ADSP2_YM,	.base = CS35L41_DSP1_YMEM_UNPACK24_0},
-};
-
 static int cs35l41_set_channel_map(struct snd_soc_dai *dai, unsigned int tx_n,
 				   unsigned int *tx_slot, unsigned int rx_n, unsigned int *rx_slot)
 {
@@ -1100,18 +1092,10 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 
 	dsp = &cs35l41->dsp;
 	dsp->part = "cs35l41";
-	dsp->cs_dsp.num = 1;
-	dsp->cs_dsp.type = WMFW_HALO;
-	dsp->cs_dsp.rev = 0;
 	dsp->fw = 9; /* 9 is WM_ADSP_FW_SPK_PROT in wm_adsp.c */
 	dsp->toggle_preload = true;
-	dsp->cs_dsp.dev = cs35l41->dev;
-	dsp->cs_dsp.regmap = cs35l41->regmap;
-	dsp->cs_dsp.base = CS35L41_DSP1_CTRL_BASE;
-	dsp->cs_dsp.base_sysinfo = CS35L41_DSP1_SYS_ID;
-	dsp->cs_dsp.mem = cs35l41_dsp1_regions;
-	dsp->cs_dsp.num_mems = ARRAY_SIZE(cs35l41_dsp1_regions);
-	dsp->cs_dsp.lock_regions = 0xFFFFFFFF;
+
+	cs35l41_configure_cs_dsp(cs35l41->dev, cs35l41->regmap, &dsp->cs_dsp);
 
 	ret = cs35l41_write_fs_errata(cs35l41->dev, cs35l41->regmap);
 	if (ret < 0)
-- 
2.34.1

