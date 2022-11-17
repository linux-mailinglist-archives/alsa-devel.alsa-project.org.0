Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7336062CF8B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 01:27:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F8716AF;
	Thu, 17 Nov 2022 01:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F8716AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668644824;
	bh=yHaMF+9oWHXcfit4bXuzkLFvLjoYJDOuoms5SavMpKA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=et6GJmKDijqq4afdlQHCBb//4FCFSMWbaBsykl71qEC7ligLCu/fsh3TgnRasIc0X
	 S3k7cFr51t4gWYGBctrJPi/y+uRUXLPZn+qKGK1CYU1WA+7lPJL9xhnIvAvM0sZYlU
	 zr0X53tcGLrcu3mRby8gp1tPAO+WnhiOD42nYEGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1996F804BC;
	Thu, 17 Nov 2022 01:25:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B01DF804BC; Thu, 17 Nov 2022 01:25:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1579F800B5
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 01:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1579F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cslSU2UG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668644739; x=1700180739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yHaMF+9oWHXcfit4bXuzkLFvLjoYJDOuoms5SavMpKA=;
 b=cslSU2UGMKk41dhCDIf7P5F7ePBqpgFfkqlU7WxZs76ecw8NOj00XoCP
 VVos/+Bux5WtdhWfEdEV5Z7zo3mT6rz5FlyWFYYikkv59SMV0i0UbglLz
 pYp4NaESLckI51rOZ0Z6lqJCG3+ef38CJ55ZLBI0+GrwC2bk2yprq1JTN
 1bt5rLAIEJW+/ZbZ9K7qQLiKohfkLO2t/XB6Zxr5266l5A4Rwkpm6wzdI
 dfMAUQukgmoIA//nX00Ywb5BB7vvoRvCEoL0jVTfIunsq0CpIYzM5DLYt
 gSPZG3s+BUJb6NMAAFbenq1caSl8fS4EOoCS02qroDXSTmQ2cUYq7rHpx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="314523551"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="314523551"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 16:25:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="764535125"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="764535125"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 16:25:34 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 1/3] ASoC: intel: sof_sdw: add rt1318 codec support.
Date: Thu, 17 Nov 2022 08:27:56 +0800
Message-Id: <20221117002758.496211-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117002758.496211-1-yung-chuan.liao@linux.intel.com>
References: <20221117002758.496211-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

From: Gongjun Song <gongjun.song@intel.com>

Add rt1318 sdca codec support in sof_sdw machine driver.

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig          |   1 +
 sound/soc/intel/boards/Makefile         |   4 +-
 sound/soc/intel/boards/sof_sdw.c        |   7 ++
 sound/soc/intel/boards/sof_sdw_common.h |   7 ++
 sound/soc/intel/boards/sof_sdw_rt1318.c | 120 ++++++++++++++++++++++++
 5 files changed, 137 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt1318.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index aa12d7e3dd2f..a472de1909f4 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -668,6 +668,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT1308_SDW
 	select SND_SOC_RT1308
 	select SND_SOC_RT1316_SDW
+	select SND_SOC_RT1318_SDW
 	select SND_SOC_RT715_SDW
 	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT5682_SDW
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 53458e748191..7e1a4ff77ac3 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -37,8 +37,8 @@ snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o
 snd-soc-ehl-rt5660-objs := ehl_rt5660.o
 snd-soc-sof-ssp-amp-objs := sof_ssp_amp.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
-			sof_sdw_max98373.o			\
-			sof_sdw_rt1308.o sof_sdw_rt1316.o	\
+			sof_sdw_max98373.o sof_sdw_rt1308.o	\
+			sof_sdw_rt1316.o sof_sdw_rt1318.o	\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt711_sdca.o 	\
 			sof_sdw_rt715.o	sof_sdw_rt715_sdca.o 	\
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 172f008adea0..b86b1c5579bb 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -542,6 +542,13 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.exit = sof_sdw_rt1316_exit,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
+	{
+		.part_id = 0x1318,
+		.direction = {true, true},
+		.dai_name = "rt1318-aif",
+		.init = sof_sdw_rt1318_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
+	},
 	{
 		.part_id = 0x714,
 		.version_id = 3,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index bac93fdc8d82..54a50f7da4da 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -143,6 +143,13 @@ int sof_sdw_rt1316_init(struct snd_soc_card *card,
 			bool playback);
 int sof_sdw_rt1316_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
+/* RT1318 support */
+int sof_sdw_rt1318_init(struct snd_soc_card *card,
+			const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback);
+
 /* RT715 support */
 int sof_sdw_rt715_init(struct snd_soc_card *card,
 		       const struct snd_soc_acpi_link_adr *link,
diff --git a/sound/soc/intel/boards/sof_sdw_rt1318.c b/sound/soc/intel/boards/sof_sdw_rt1318.c
new file mode 100644
index 000000000000..dbee4bf5c814
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt1318.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2022 Intel Corporation
+
+/*
+ *  sof_sdw_rt1318 - Helpers to handle RT1318 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include "sof_sdw_common.h"
+
+static const struct snd_soc_dapm_widget rt1318_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+/*
+ * dapm routes for rt1318 will be registered dynamically according
+ * to the number of rt1318 used. The first two entries will be registered
+ * for one codec case, and the last two entries are also registered
+ * if two 1318s are used.
+ */
+static const struct snd_soc_dapm_route rt1318_map[] = {
+	{ "Speaker", NULL, "rt1318-1 SPOL" },
+	{ "Speaker", NULL, "rt1318-1 SPOR" },
+	{ "Speaker", NULL, "rt1318-2 SPOL" },
+	{ "Speaker", NULL, "rt1318-2 SPOR" },
+};
+
+static const struct snd_kcontrol_new rt1318_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:rt1318",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, rt1318_controls,
+					ARRAY_SIZE(rt1318_controls));
+	if (ret) {
+		dev_err(card->dev, "rt1318 controls addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt1318_widgets,
+					ARRAY_SIZE(rt1318_widgets));
+	if (ret) {
+		dev_err(card->dev, "rt1318 widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1318_map, 2);
+	if (ret)
+		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
+
+	return ret;
+}
+
+static int second_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1318_map + 2, 2);
+	if (ret)
+		dev_err(rtd->dev, "failed to add second SPK map: %d\n", ret);
+
+	return ret;
+}
+
+static int all_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+
+	ret = first_spk_init(rtd);
+	if (ret)
+		return ret;
+
+	return second_spk_init(rtd);
+}
+
+int sof_sdw_rt1318_init(struct snd_soc_card *card,
+			const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback)
+{
+	/* Count amp number and do init on playback link only. */
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+	if (info->amp_num == 1)
+		dai_links->init = first_spk_init;
+
+	if (info->amp_num == 2) {
+		/*
+		 * if two 1318s are in one dai link, the init function
+		 * in this dai link will be first set for the first speaker,
+		 * and it should be reset to initialize all speakers when
+		 * the second speaker is found.
+		 */
+		if (dai_links->init)
+			dai_links->init = all_spk_init;
+		else
+			dai_links->init = second_spk_init;
+	}
+
+	return 0;
+}
-- 
2.25.1

