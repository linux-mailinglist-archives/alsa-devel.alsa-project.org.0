Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C039644DF2
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 22:27:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A21491897;
	Tue,  6 Dec 2022 22:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A21491897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670362044;
	bh=2PEJAhY7V9foboU3omYoF4H+Vh1/kaqfwsz1ssXVXiM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G0GSnUFuqjOTkjOcZwBrZtjWvxxq45eEotjpgqngE0hE7+R5QanzKxwjfiGV9KeSV
	 c6opeP0dGtHNJZ5Q9EO9MiOmTygZ4LoIALE+0tyW8HK0PbLNSIvAChBYbk7OOUBVgK
	 0yw3WI1eUOrOs8oRXMrsAvynVtxsfNBNL6jjPKo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85A50F80564;
	Tue,  6 Dec 2022 22:25:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B225F8054A; Tue,  6 Dec 2022 22:25:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AD9DF804DA
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 22:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AD9DF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lUd8r3im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670361934; x=1701897934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2PEJAhY7V9foboU3omYoF4H+Vh1/kaqfwsz1ssXVXiM=;
 b=lUd8r3imV+lU3SqmZjZ+hKLObwgdWvVJL+P4xyCPCCAtOJHqATO0uzhW
 S/BboVTuF/JvKqMACWGqDmO3cwh3+nFosvlmFHmfpVRM/vNDriFtWHllM
 MVW+rFtzuhTcJzFX3a3soHEZjxWlNuqL4eoyLOLTphE0tRojZor9egaPP
 qzyTCnrKOqDQQLqyeOwcY3atP7MCFGh4G9GXrZrqL/xgQYS9hdBIJehmb
 UK0mNBtfF3CaAU3afJuz8CCCyWsKyMVGRmDDUIx8Tl4LEnOIEYnQQAfQH
 QOQK/zOGTxElqYxTSAglFPSAKTcPVihyEgB6WZFcxOpHiXw9I8esWr5MF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="300154676"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="300154676"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 13:25:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="646362660"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="646362660"
Received: from rwwalthe-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.124])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 13:25:25 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: Intel: sof_sdw: use common helpers for all Realtek
 amps
Date: Tue,  6 Dec 2022 15:25:06 -0600
Message-Id: <20221206212507.359993-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206212507.359993-1-pierre-louis.bossart@linux.intel.com>
References: <20221206212507.359993-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Gongjun Song <gongjun.song@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

sof_sdw_rt1308.c/sof_sdw_rt1316.c/sof_sdw_rt1318.c handle amp
in basically the same way, optimized and merged into one file.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Makefile               |   3 +-
 sound/soc/intel/boards/sof_sdw.c              |  10 +-
 sound/soc/intel/boards/sof_sdw_common.h       |  20 +-
 sound/soc/intel/boards/sof_sdw_rt1316.c       | 239 ------------------
 sound/soc/intel/boards/sof_sdw_rt1318.c       | 120 ---------
 .../{sof_sdw_rt1308.c => sof_sdw_rt_amp.c}    | 139 +++++++---
 6 files changed, 120 insertions(+), 411 deletions(-)
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt1316.c
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt1318.c
 rename sound/soc/intel/boards/{sof_sdw_rt1308.c => sof_sdw_rt_amp.c} (59%)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 7e1a4ff77ac32..d1fd7a2b32dbc 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -37,8 +37,7 @@ snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o
 snd-soc-ehl-rt5660-objs := ehl_rt5660.o
 snd-soc-sof-ssp-amp-objs := sof_ssp_amp.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
-			sof_sdw_max98373.o sof_sdw_rt1308.o	\
-			sof_sdw_rt1316.o sof_sdw_rt1318.o	\
+			sof_sdw_max98373.o sof_sdw_rt_amp.o	\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt711_sdca.o 	\
 			sof_sdw_rt715.o	sof_sdw_rt715_sdca.o 	\
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b58c7b35599d2..d2ed807abde95 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -550,23 +550,23 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, false},
 		.dai_name = "rt1308-aif",
 		.ops = &sof_sdw_rt1308_i2s_ops,
-		.init = sof_sdw_rt1308_init,
-		.exit = sof_sdw_rt1308_exit,
+		.init = sof_sdw_rt_amp_init,
+		.exit = sof_sdw_rt_amp_exit,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x1316,
 		.direction = {true, true},
 		.dai_name = "rt1316-aif",
-		.init = sof_sdw_rt1316_init,
-		.exit = sof_sdw_rt1316_exit,
+		.init = sof_sdw_rt_amp_init,
+		.exit = sof_sdw_rt_amp_exit,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x1318,
 		.direction = {true, true},
 		.dai_name = "rt1318-aif",
-		.init = sof_sdw_rt1318_init,
+		.init = sof_sdw_rt_amp_init,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 54a50f7da4da7..350010b0e5f4f 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -125,30 +125,18 @@ int sof_sdw_rt700_init(struct snd_soc_card *card,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
-/* RT1308 support */
+/* RT1308 I2S support */
 extern struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
 
-int sof_sdw_rt1308_init(struct snd_soc_card *card,
+/* generic amp support */
+int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback);
-int sof_sdw_rt1308_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT1316 support */
-int sof_sdw_rt1316_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
-			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
-			bool playback);
-int sof_sdw_rt1316_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
-
-/* RT1318 support */
-int sof_sdw_rt1318_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
-			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
-			bool playback);
 
 /* RT715 support */
 int sof_sdw_rt715_init(struct snd_soc_card *card,
diff --git a/sound/soc/intel/boards/sof_sdw_rt1316.c b/sound/soc/intel/boards/sof_sdw_rt1316.c
deleted file mode 100644
index f6bbea0d38105..0000000000000
--- a/sound/soc/intel/boards/sof_sdw_rt1316.c
+++ /dev/null
@@ -1,239 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright (c) 2020 Intel Corporation
-
-/*
- *  sof_sdw_rt1316 - Helpers to handle RT1316 from generic machine driver
- */
-
-#include <linux/device.h>
-#include <linux/errno.h>
-#include <sound/control.h>
-#include <sound/soc.h>
-#include <sound/soc-acpi.h>
-#include <sound/soc-dapm.h>
-#include <linux/soundwire/sdw.h>
-#include <linux/soundwire/sdw_type.h>
-#include <linux/dmi.h>
-#include "sof_sdw_common.h"
-#include "sof_sdw_amp_coeff_tables.h"
-
-struct rt1316_platform_data {
-	const unsigned char *bq_params;
-	const unsigned int bq_params_cnt;
-};
-
-static const struct rt1316_platform_data dell_0b00_platform_data = {
-	.bq_params = dell_0b00_bq_params,
-	.bq_params_cnt = ARRAY_SIZE(dell_0b00_bq_params),
-};
-
-static const struct dmi_system_id dmi_platform_data[] = {
-	/* AlderLake devices */
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B00")
-		},
-		.driver_data = (void *)&dell_0b00_platform_data,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B01")
-		},
-		.driver_data = (void *)&dell_0b00_platform_data,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFF")
-		},
-		.driver_data = (void *)&dell_0b00_platform_data,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFE")
-		},
-		.driver_data = (void *)&dell_0b00_platform_data,
-	},
-};
-
-static int rt1316_add_device_props(struct device *sdw_dev)
-{
-	struct property_entry props[3] = {};
-	struct fwnode_handle *fwnode;
-	const struct dmi_system_id *dmi_data;
-	const struct rt1316_platform_data *pdata;
-	unsigned char params[RT1316_MAX_BQ_REG];
-	int ret;
-
-	dmi_data = dmi_first_match(dmi_platform_data);
-	if (!dmi_data)
-		return 0;
-
-	pdata = dmi_data->driver_data;
-	memcpy(&params, pdata->bq_params, sizeof(unsigned char) * pdata->bq_params_cnt);
-
-	props[0] = PROPERTY_ENTRY_U8_ARRAY("realtek,bq-params", params);
-	props[1] = PROPERTY_ENTRY_U32("realtek,bq-params-cnt", pdata->bq_params_cnt);
-
-	fwnode = fwnode_create_software_node(props, NULL);
-	if (IS_ERR(fwnode))
-		return PTR_ERR(fwnode);
-
-	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
-
-	fwnode_handle_put(fwnode);
-
-	return ret;
-}
-
-static const struct snd_soc_dapm_widget rt1316_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
-/*
- * dapm routes for rt1316 will be registered dynamically according
- * to the number of rt1316 used. The first two entries will be registered
- * for one codec case, and the last two entries are also registered
- * if two 1316s are used.
- */
-static const struct snd_soc_dapm_route rt1316_map[] = {
-	{ "Speaker", NULL, "rt1316-1 SPOL" },
-	{ "Speaker", NULL, "rt1316-1 SPOR" },
-	{ "Speaker", NULL, "rt1316-2 SPOL" },
-	{ "Speaker", NULL, "rt1316-2 SPOR" },
-};
-
-static const struct snd_kcontrol_new rt1316_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
-static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	int ret;
-
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:rt1316",
-					  card->components);
-	if (!card->components)
-		return -ENOMEM;
-
-	ret = snd_soc_add_card_controls(card, rt1316_controls,
-					ARRAY_SIZE(rt1316_controls));
-	if (ret) {
-		dev_err(card->dev, "rt1316 controls addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt1316_widgets,
-					ARRAY_SIZE(rt1316_widgets));
-	if (ret) {
-		dev_err(card->dev, "rt1316 widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1316_map, 2);
-	if (ret)
-		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
-
-	return ret;
-}
-
-static int second_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	int ret;
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1316_map + 2, 2);
-	if (ret)
-		dev_err(rtd->dev, "failed to add second SPK map: %d\n", ret);
-
-	return ret;
-}
-
-static int all_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-
-	ret = first_spk_init(rtd);
-	if (ret)
-		return ret;
-
-	return second_spk_init(rtd);
-}
-
-int sof_sdw_rt1316_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
-{
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-
-	if (ctx->amp_dev1) {
-		device_remove_software_node(ctx->amp_dev1);
-		put_device(ctx->amp_dev1);
-	}
-
-	if (ctx->amp_dev2) {
-		device_remove_software_node(ctx->amp_dev2);
-		put_device(ctx->amp_dev2);
-	}
-
-	return 0;
-}
-
-int sof_sdw_rt1316_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
-			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
-			bool playback)
-{
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct device *sdw_dev1, *sdw_dev2;
-	int ret;
-
-	/* Count amp number and do init on playback link only. */
-	if (!playback)
-		return 0;
-
-	info->amp_num++;
-	if (info->amp_num == 1)
-		dai_links->init = first_spk_init;
-
-	if (info->amp_num == 2) {
-		sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
-		if (!sdw_dev1)
-			return -EPROBE_DEFER;
-
-		ret = rt1316_add_device_props(sdw_dev1);
-		if (ret < 0) {
-			put_device(sdw_dev1);
-			return ret;
-		}
-		ctx->amp_dev1 = sdw_dev1;
-
-		sdw_dev2 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[1].name);
-		if (!sdw_dev2)
-			return -EPROBE_DEFER;
-
-		ret = rt1316_add_device_props(sdw_dev2);
-		if (ret < 0) {
-			put_device(sdw_dev2);
-			return ret;
-		}
-		ctx->amp_dev2 = sdw_dev2;
-
-		/*
-		 * if two 1316s are in one dai link, the init function
-		 * in this dai link will be first set for the first speaker,
-		 * and it should be reset to initialize all speakers when
-		 * the second speaker is found.
-		 */
-		if (dai_links->init)
-			dai_links->init = all_spk_init;
-		else
-			dai_links->init = second_spk_init;
-	}
-
-	return 0;
-}
diff --git a/sound/soc/intel/boards/sof_sdw_rt1318.c b/sound/soc/intel/boards/sof_sdw_rt1318.c
deleted file mode 100644
index dbee4bf5c8149..0000000000000
--- a/sound/soc/intel/boards/sof_sdw_rt1318.c
+++ /dev/null
@@ -1,120 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright (c) 2022 Intel Corporation
-
-/*
- *  sof_sdw_rt1318 - Helpers to handle RT1318 from generic machine driver
- */
-
-#include <linux/device.h>
-#include <linux/errno.h>
-#include <sound/control.h>
-#include <sound/soc.h>
-#include <sound/soc-acpi.h>
-#include <sound/soc-dapm.h>
-#include "sof_sdw_common.h"
-
-static const struct snd_soc_dapm_widget rt1318_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
-/*
- * dapm routes for rt1318 will be registered dynamically according
- * to the number of rt1318 used. The first two entries will be registered
- * for one codec case, and the last two entries are also registered
- * if two 1318s are used.
- */
-static const struct snd_soc_dapm_route rt1318_map[] = {
-	{ "Speaker", NULL, "rt1318-1 SPOL" },
-	{ "Speaker", NULL, "rt1318-1 SPOR" },
-	{ "Speaker", NULL, "rt1318-2 SPOL" },
-	{ "Speaker", NULL, "rt1318-2 SPOR" },
-};
-
-static const struct snd_kcontrol_new rt1318_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
-static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	int ret;
-
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:rt1318",
-					  card->components);
-	if (!card->components)
-		return -ENOMEM;
-
-	ret = snd_soc_add_card_controls(card, rt1318_controls,
-					ARRAY_SIZE(rt1318_controls));
-	if (ret) {
-		dev_err(card->dev, "rt1318 controls addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt1318_widgets,
-					ARRAY_SIZE(rt1318_widgets));
-	if (ret) {
-		dev_err(card->dev, "rt1318 widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1318_map, 2);
-	if (ret)
-		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
-
-	return ret;
-}
-
-static int second_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	int ret;
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1318_map + 2, 2);
-	if (ret)
-		dev_err(rtd->dev, "failed to add second SPK map: %d\n", ret);
-
-	return ret;
-}
-
-static int all_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-
-	ret = first_spk_init(rtd);
-	if (ret)
-		return ret;
-
-	return second_spk_init(rtd);
-}
-
-int sof_sdw_rt1318_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
-			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
-			bool playback)
-{
-	/* Count amp number and do init on playback link only. */
-	if (!playback)
-		return 0;
-
-	info->amp_num++;
-	if (info->amp_num == 1)
-		dai_links->init = first_spk_init;
-
-	if (info->amp_num == 2) {
-		/*
-		 * if two 1318s are in one dai link, the init function
-		 * in this dai link will be first set for the first speaker,
-		 * and it should be reset to initialize all speakers when
-		 * the second speaker is found.
-		 */
-		if (dai_links->init)
-			dai_links->init = all_spk_init;
-		else
-			dai_links->init = second_spk_init;
-	}
-
-	return 0;
-}
diff --git a/sound/soc/intel/boards/sof_sdw_rt1308.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
similarity index 59%
rename from sound/soc/intel/boards/sof_sdw_rt1308.c
rename to sound/soc/intel/boards/sof_sdw_rt_amp.c
index a19b055b9c6f8..26bf9e0dd3d24 100644
--- a/sound/soc/intel/boards/sof_sdw_rt1308.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// Copyright (c) 2020 Intel Corporation
+// Copyright (c) 2022 Intel Corporation
 
 /*
- *  sof_sdw_rt1308 - Helpers to handle RT1308 from generic machine driver
+ *  sof_sdw_rt_amp - Helpers to handle RT1308/RT1316/RT1318 from generic machine driver
  */
 
 #include <linux/device.h>
@@ -18,16 +18,26 @@
 #include "sof_sdw_amp_coeff_tables.h"
 #include "../../codecs/rt1308.h"
 
-struct rt1308_platform_data {
+#define CODEC_NAME_SIZE	7
+
+/* choose a larger value to resolve compatibility issues */
+#define RT_AMP_MAX_BQ_REG RT1316_MAX_BQ_REG
+
+struct rt_amp_platform_data {
 	const unsigned char *bq_params;
 	const unsigned int bq_params_cnt;
 };
 
-static const struct rt1308_platform_data dell_0a5d_platform_data = {
+static const struct rt_amp_platform_data dell_0a5d_platform_data = {
 	.bq_params = dell_0a5d_bq_params,
 	.bq_params_cnt = ARRAY_SIZE(dell_0a5d_bq_params),
 };
 
+static const struct rt_amp_platform_data dell_0b00_platform_data = {
+	.bq_params = dell_0b00_bq_params,
+	.bq_params_cnt = ARRAY_SIZE(dell_0b00_bq_params),
+};
+
 static const struct dmi_system_id dmi_platform_data[] = {
 	/* CometLake devices */
 	{
@@ -59,15 +69,45 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&dell_0a5d_platform_data,
 	},
+	/* AlderLake devices */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B00")
+		},
+		.driver_data = (void *)&dell_0b00_platform_data,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B01")
+		},
+		.driver_data = (void *)&dell_0b00_platform_data,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFF")
+		},
+		.driver_data = (void *)&dell_0b00_platform_data,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFE")
+		},
+		.driver_data = (void *)&dell_0b00_platform_data,
+	},
+	{},
 };
 
-static int rt1308_add_device_props(struct device *sdw_dev)
+static int rt_amp_add_device_props(struct device *sdw_dev)
 {
 	struct property_entry props[3] = {};
 	struct fwnode_handle *fwnode;
 	const struct dmi_system_id *dmi_data;
-	const struct rt1308_platform_data *pdata;
-	unsigned char params[RT1308_MAX_BQ_REG];
+	const struct rt_amp_platform_data *pdata;
+	unsigned char params[RT_AMP_MAX_BQ_REG];
 	int ret;
 
 	dmi_data = dmi_first_match(dmi_platform_data);
@@ -91,15 +131,19 @@ static int rt1308_add_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_soc_dapm_widget rt1308_widgets[] = {
+static const struct snd_kcontrol_new rt_amp_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static const struct snd_soc_dapm_widget rt_amp_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
 /*
- * dapm routes for rt1308 will be registered dynamically according
- * to the number of rt1308 used. The first two entries will be registered
- * for one codec case, and the last two entries are also registered
- * if two 1308s are used.
+ * dapm routes for rt1308/rt1316/rt1318 will be registered dynamically
+ * according to the number of rt1308/rt1316/rt1318 used. The first two
+ * entries will be registered for one codec case, and the last two entries
+ * are also registered if two 1308s/1316s/1318s are used.
  */
 static const struct snd_soc_dapm_route rt1308_map[] = {
 	{ "Speaker", NULL, "rt1308-1 SPOL" },
@@ -108,36 +152,69 @@ static const struct snd_soc_dapm_route rt1308_map[] = {
 	{ "Speaker", NULL, "rt1308-2 SPOR" },
 };
 
-static const struct snd_kcontrol_new rt1308_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
+static const struct snd_soc_dapm_route rt1316_map[] = {
+	{ "Speaker", NULL, "rt1316-1 SPOL" },
+	{ "Speaker", NULL, "rt1316-1 SPOR" },
+	{ "Speaker", NULL, "rt1316-2 SPOL" },
+	{ "Speaker", NULL, "rt1316-2 SPOR" },
 };
 
+static const struct snd_soc_dapm_route rt1318_map[] = {
+	{ "Speaker", NULL, "rt1318-1 SPOL" },
+	{ "Speaker", NULL, "rt1318-1 SPOR" },
+	{ "Speaker", NULL, "rt1318-2 SPOL" },
+	{ "Speaker", NULL, "rt1318-2 SPOR" },
+};
+
+static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_pcm_runtime *rtd,
+								 char *codec_name)
+{
+	const char *dai_name;
+
+	dai_name = rtd->dai_link->codecs->dai_name;
+
+	/* get the codec name */
+	snprintf(codec_name, CODEC_NAME_SIZE, "%s", dai_name);
+
+	/* choose the right codec's map  */
+	if (strcmp(codec_name, "rt1308") == 0)
+		return rt1308_map;
+	else if (strcmp(codec_name, "rt1316") == 0)
+		return rt1316_map;
+	else
+		return rt1318_map;
+}
+
 static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	const struct snd_soc_dapm_route *rt_amp_map;
+	char codec_name[CODEC_NAME_SIZE];
 	int ret;
 
+	rt_amp_map = get_codec_name_and_route(rtd, codec_name);
+
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:rt1308",
-					  card->components);
+					  "%s spk:%s",
+					  card->components, codec_name);
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt1308_controls,
-					ARRAY_SIZE(rt1308_controls));
+	ret = snd_soc_add_card_controls(card, rt_amp_controls,
+					ARRAY_SIZE(rt_amp_controls));
 	if (ret) {
-		dev_err(card->dev, "rt1308 controls addition failed: %d\n", ret);
+		dev_err(card->dev, "%s controls addition failed: %d\n", codec_name, ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt1308_widgets,
-					ARRAY_SIZE(rt1308_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt_amp_widgets,
+					ARRAY_SIZE(rt_amp_widgets));
 	if (ret) {
-		dev_err(card->dev, "rt1308 widgets addition failed: %d\n", ret);
+		dev_err(card->dev, "%s widgets addition failed: %d\n", codec_name, ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1308_map, 2);
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
 	if (ret)
 		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
 
@@ -147,9 +224,13 @@ static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
 static int second_spk_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	const struct snd_soc_dapm_route *rt_amp_map;
+	char codec_name[CODEC_NAME_SIZE];
 	int ret;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1308_map + 2, 2);
+	rt_amp_map = get_codec_name_and_route(rtd, codec_name);
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
 	if (ret)
 		dev_err(rtd->dev, "failed to add second SPK map: %d\n", ret);
 
@@ -204,7 +285,7 @@ struct snd_soc_ops sof_sdw_rt1308_i2s_ops = {
 	.hw_params = rt1308_i2s_hw_params,
 };
 
-int sof_sdw_rt1308_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
@@ -221,7 +302,7 @@ int sof_sdw_rt1308_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 	return 0;
 }
 
-int sof_sdw_rt1308_init(struct snd_soc_card *card,
+int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
@@ -244,7 +325,7 @@ int sof_sdw_rt1308_init(struct snd_soc_card *card,
 		if (!sdw_dev1)
 			return -EPROBE_DEFER;
 
-		ret = rt1308_add_device_props(sdw_dev1);
+		ret = rt_amp_add_device_props(sdw_dev1);
 		if (ret < 0) {
 			put_device(sdw_dev1);
 			return ret;
@@ -255,7 +336,7 @@ int sof_sdw_rt1308_init(struct snd_soc_card *card,
 		if (!sdw_dev2)
 			return -EPROBE_DEFER;
 
-		ret = rt1308_add_device_props(sdw_dev2);
+		ret = rt_amp_add_device_props(sdw_dev2);
 		if (ret < 0) {
 			put_device(sdw_dev2);
 			return ret;
@@ -263,7 +344,7 @@ int sof_sdw_rt1308_init(struct snd_soc_card *card,
 		ctx->amp_dev2 = sdw_dev2;
 
 		/*
-		 * if two 1308s are in one dai link, the init function
+		 * if two amps are in one dai link, the init function
 		 * in this dai link will be first set for the first speaker,
 		 * and it should be reset to initialize all speakers when
 		 * the second speaker is found.
-- 
2.34.1

