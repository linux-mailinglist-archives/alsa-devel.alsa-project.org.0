Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD6511BB5
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:13:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90CD41710;
	Wed, 27 Apr 2022 17:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90CD41710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651072391;
	bh=S/hCJfnSYwUEgXoleUNEWtEfYDf53Pd/QyeH/heGOj4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TCfccen4Dmq2/Qtoqela2xDkc0UKa4MA9i0HXi+WN8kXQ3rVqYbRaylnP1kHnf298
	 34vt+X/s7nCbRjrqAoYGCD5IvHmNdEoaKBcx52iILssciYBxvNqWnNUTghLzTQJuUs
	 8/Es21wFswjxCSHcVAvTT/q+/8qw9m0VKqUg0Ris=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B776F805B0;
	Wed, 27 Apr 2022 17:08:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA5E3F80526; Wed, 27 Apr 2022 17:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5C6EF8051A
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5C6EF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hHfxsDlt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RBg6qF022428;
 Wed, 27 Apr 2022 10:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=zDxVSGAkKtjv3g42QnYWCUu981r8tGgcEbCI7pSZaJg=;
 b=hHfxsDltFzmEQNO1qJ9KjMXFxyGCUeqGOOoBlNREsXuAGHbbG1FwO3TtnTSiUYyg8cL8
 9YQr4X00sc/ty162nLIiF+BGeCyulUMZyiW9qdQy9IaeTCZh7zmQDjtAEY4v66ybF0d6
 kLfERri8zkqfrinmCr9AkjWrQqlLeikfgSC9nTl2So4mMi+/gio0F2njZz6joxK98flP
 jRwMjEZjGVt9hPS24yCV9A1Wl7TG2Stgki7g6yykT2+4dZMC3BIcUom2pL/oOp4z3M8Y
 qSKb8DDqkdJ4GH2NERAu3zTyugdbFANNKzWsVwfxbos/S8y6qco1BdINx1hZPMzysnIF 7A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt60xte-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 10:07:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 16:07:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 16:07:25 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.170])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 72AA5478;
 Wed, 27 Apr 2022 15:07:25 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH 08/26] ASoC: cs35l41: Move cs_dsp config struct into shared
 code
Date: Wed, 27 Apr 2022 16:07:02 +0100
Message-ID: <20220427150720.9194-9-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: J4BoIbla7a2EjL3dpvG-BhHct41IwOgV
X-Proofpoint-ORIG-GUID: J4BoIbla7a2EjL3dpvG-BhHct41IwOgV
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

This can then be used by HDA code to configure cs_dsp.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  2 ++
 sound/soc/codecs/cs35l41-lib.c | 24 ++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 20 ++------------------
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index d0cfb41495b0..dd70fb8dd860 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -11,6 +11,7 @@
 #define __CS35L41_H
 
 #include <linux/regmap.h>
+#include <linux/firmware/cirrus/cs_dsp.h>
 
 #define CS35L41_FIRSTREG		0x00000000
 #define CS35L41_LASTREG			0x03804FE8
@@ -877,6 +878,7 @@ int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 			 unsigned int tx_num, unsigned int *tx_slot,
 			 unsigned int rx_num, unsigned int *rx_slot);
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
+void cs35l41_configure_cs_dsp(struct device *dev, struct regmap *reg, struct cs_dsp *dsp);
 int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 			      enum cs35l41_cspl_mbox_cmd cmd);
 int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 85fe5f88d6b4..37ae8ddccac9 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -12,6 +12,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/firmware/cirrus/wmfw.h>
 
 #include <sound/cs35l41.h>
 
@@ -1225,6 +1226,29 @@ int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg)
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
2.32.0

