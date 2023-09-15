Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 914E17A1EFE
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A1BBDF9;
	Fri, 15 Sep 2023 14:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A1BBDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781849;
	bh=BaxBV/Oz+EI6y2bppdoICrofYo9op8zjE+oxAlwSzwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BxJsH7lWqUFrnNgmTqbiSJjB3QRV6pLy/XFiTp/MDUG2IOg8lnMv1bOt/0dO2MpHk
	 aWmTgFQDFHBeK54W8uqD+lyWd/3H+/l9vyJZcVfXPkaKPybMUTqSvp+QaNKDr60H+N
	 AR9wDL6hboS1VTGdj70+wgVoWi3zkqEWiEc9R5Bg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62BA6F805F1; Fri, 15 Sep 2023 14:40:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 412E2F805EF;
	Fri, 15 Sep 2023 14:40:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE10EF805BE; Fri, 15 Sep 2023 14:40:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 902FDF80425
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 902FDF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YuoBXegp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781628; x=1726317628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BaxBV/Oz+EI6y2bppdoICrofYo9op8zjE+oxAlwSzwg=;
  b=YuoBXegpV13zLW+cX3B7LKYd++giapHqovEQw6TzL0KcZvycCUDlFK4b
   woDmcSsmQPBfAmFjNOrinDx3orh7s2/BCbWDj38fGk3XMHouTPSv995yU
   zrJQBN+VME5q/uTOLf7aYe3WzqQQyhNX/MHOv1VeeC1/HGW83juJMUStm
   MuuL77+OLgHOCfbJcauVhtIeUcojCI4Ow5O2xlNNhCqNVhyJY7sO3KbIl
   oNoCyTzxF+SxToSQdd8P5nYJ0JM0Em6BDMcan7Ld/8sZBTPVL0r2t6Dyn
   /ncJ6Szavy7j/qsInyrPGNkk3GFEsf4MtvYmRnfHpGHXNNw8ai4vsZhGb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653160"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653160"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304566"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304566"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:23 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 07/19] ASoC: Intel: sof_nau8825: use ssp-common module to
 detect codec
Date: Fri, 15 Sep 2023 20:48:40 +0800
Message-Id: <20230915124852.1696857-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VMVWJTLG44H6WDISTQU4QXGB7F5CBRPR
X-Message-ID-Hash: VMVWJTLG44H6WDISTQU4QXGB7F5CBRPR
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMVWJTLG44H6WDISTQU4QXGB7F5CBRPR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use ssp-common module to detect codec and amplifier type in driver
probe function and remove all quirks about codec and amplifier type.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig       |   1 +
 sound/soc/intel/boards/sof_nau8825.c | 111 ++++++++++++++-------------
 2 files changed, 57 insertions(+), 55 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 857bb8628a4c..6da6cad7fd05 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -566,6 +566,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
+	select SND_SOC_INTEL_SOF_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with nau8825 codec.
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 46b7ecf6f9f1..1e4fa5dbe0f6 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -23,12 +23,12 @@
 #include "hda_dsp_common.h"
 #include "sof_realtek_common.h"
 #include "sof_maxim_common.h"
+#include "sof_ssp_common.h"
 
 #define NAME_SIZE 32
 
 #define SOF_NAU8825_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
 #define SOF_NAU8825_SSP_CODEC_MASK		(GENMASK(2, 0))
-#define SOF_SPEAKER_AMP_PRESENT		BIT(3)
 #define SOF_NAU8825_SSP_AMP_SHIFT		4
 #define SOF_NAU8825_SSP_AMP_MASK		(GENMASK(6, 4))
 #define SOF_NAU8825_SSP_AMP(quirk)	\
@@ -44,11 +44,6 @@
 #define SOF_BT_OFFLOAD_SSP(quirk)	\
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
 #define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(13)
-#define SOF_RT1019P_SPEAKER_AMP_PRESENT	BIT(14)
-#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(15)
-#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(16)
-#define SOF_RT1015P_SPEAKER_AMP_PRESENT	BIT(17)
-#define SOF_NAU8318_SPEAKER_AMP_PRESENT	BIT(18)
 
 static unsigned long sof_nau8825_quirk = SOF_NAU8825_SSP_CODEC(0);
 
@@ -62,6 +57,8 @@ struct sof_card_private {
 	struct clk *mclk;
 	struct snd_soc_jack sof_headset;
 	struct list_head hdmi_pcm_list;
+	enum sof_ssp_codec codec_type;
+	enum sof_ssp_codec amp_type;
 };
 
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
@@ -192,7 +189,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	struct sof_hdmi_pcm *pcm;
 	int err;
 
-	if (sof_nau8825_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
+	if (ctx->amp_type == CODEC_MAX98373) {
 		/* Disable Left and Right Spk pin after boot */
 		snd_soc_dapm_disable_pin(dapm, "Left Spk");
 		snd_soc_dapm_disable_pin(dapm, "Right Spk");
@@ -346,11 +343,10 @@ static struct snd_soc_dai_link_component nau8318_components[] = {
 	}
 };
 
-static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
-							  int ssp_codec,
-							  int ssp_amp,
-							  int dmic_be_num,
-							  int hdmi_num)
+static struct snd_soc_dai_link *
+sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
+			  int ssp_codec, int ssp_amp, int dmic_be_num,
+			  int hdmi_num)
 {
 	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *cpus;
@@ -463,35 +459,40 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	}
 
 	/* speaker amp */
-	if (sof_nau8825_quirk & SOF_SPEAKER_AMP_PRESENT) {
+	if (amp_type != CODEC_NONE) {
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
 						"SSP%d-Codec", ssp_amp);
 		if (!links[id].name)
 			goto devm_err;
 
 		links[id].id = id;
-		if (sof_nau8825_quirk & SOF_RT1019P_SPEAKER_AMP_PRESENT) {
-			links[id].codecs = rt1019p_component;
-			links[id].num_codecs = ARRAY_SIZE(rt1019p_component);
-			links[id].init = speaker_codec_init;
-		} else if (sof_nau8825_quirk &
-				SOF_MAX98373_SPEAKER_AMP_PRESENT) {
+
+		switch (amp_type) {
+		case CODEC_MAX98360A:
+			max_98360a_dai_link(&links[id]);
+			break;
+		case CODEC_MAX98373:
 			links[id].codecs = max_98373_components;
 			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
 			links[id].init = max_98373_spk_codec_init;
 			links[id].ops = &max_98373_ops;
-		} else if (sof_nau8825_quirk &
-				SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
-			max_98360a_dai_link(&links[id]);
-		} else if (sof_nau8825_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
-			sof_rt1015p_dai_link(&links[id]);
-		} else if (sof_nau8825_quirk &
-				SOF_NAU8318_SPEAKER_AMP_PRESENT) {
+			break;
+		case CODEC_NAU8318:
 			links[id].codecs = nau8318_components;
 			links[id].num_codecs = ARRAY_SIZE(nau8318_components);
 			links[id].init = speaker_codec_init;
-		} else {
-			goto devm_err;
+			break;
+		case CODEC_RT1015P:
+			sof_rt1015p_dai_link(&links[id]);
+			break;
+		case CODEC_RT1019P:
+			links[id].codecs = rt1019p_component;
+			links[id].num_codecs = ARRAY_SIZE(rt1019p_component);
+			links[id].init = speaker_codec_init;
+			break;
+		default:
+			dev_err(dev, "invalid amp type %d\n", amp_type);
+			return NULL;
 		}
 
 		links[id].platforms = platform_component;
@@ -557,11 +558,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	mach = pdev->dev.platform_data;
 
-	/* A speaker amp might not be present when the quirk claims one is.
-	 * Detect this via whether the machine driver match includes quirk_data.
-	 */
-	if ((sof_nau8825_quirk & SOF_SPEAKER_AMP_PRESENT) && !mach->quirk_data)
-		sof_nau8825_quirk &= ~SOF_SPEAKER_AMP_PRESENT;
+	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
+	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
 
 	dev_dbg(&pdev->dev, "sof_nau8825_quirk = %lx\n", sof_nau8825_quirk);
 
@@ -581,24 +579,39 @@ static int sof_audio_probe(struct platform_device *pdev)
 	/* compute number of dai links */
 	sof_audio_card_nau8825.num_links = 1 + dmic_be_num + hdmi_num;
 
-	if (sof_nau8825_quirk & SOF_SPEAKER_AMP_PRESENT)
+	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_nau8825.num_links++;
 
-	if (sof_nau8825_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
-		max_98373_set_codec_conf(&sof_audio_card_nau8825);
-	else if (sof_nau8825_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
-		sof_rt1015p_codec_conf(&sof_audio_card_nau8825);
-
 	if (sof_nau8825_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		sof_audio_card_nau8825.num_links++;
 
-	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
-					      dmic_be_num, hdmi_num);
+	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
+					      ssp_codec, ssp_amp, dmic_be_num,
+					      hdmi_num);
 	if (!dai_links)
 		return -ENOMEM;
 
 	sof_audio_card_nau8825.dai_link = dai_links;
 
+	/* update codec_conf */
+	switch (ctx->amp_type) {
+	case CODEC_MAX98373:
+		max_98373_set_codec_conf(&sof_audio_card_nau8825);
+		break;
+	case CODEC_RT1015P:
+		sof_rt1015p_codec_conf(&sof_audio_card_nau8825);
+		break;
+	case CODEC_NONE:
+	case CODEC_MAX98360A:
+	case CODEC_NAU8318:
+	case CODEC_RT1019P:
+		/* no codec conf required */
+		break;
+	default:
+		dev_err(&pdev->dev, "invalid amp type %d\n", ctx->amp_type);
+		return -EINVAL;
+	}
+
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
 	sof_audio_card_nau8825.dev = &pdev->dev;
@@ -627,16 +640,12 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "adl_rt1019p_8825",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_RT1019P_SPEAKER_AMP_PRESENT |
 					SOF_NAU8825_SSP_AMP(2) |
 					SOF_NAU8825_NUM_HDMIDEV(4)),
 	},
 	{
 		.name = "adl_max98373_8825",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_MAX98373_SPEAKER_AMP_PRESENT |
 					SOF_NAU8825_SSP_AMP(1) |
 					SOF_NAU8825_NUM_HDMIDEV(4) |
 					SOF_BT_OFFLOAD_SSP(2) |
@@ -646,8 +655,6 @@ static const struct platform_device_id board_ids[] = {
 		/* The limitation of length of char array, shorten the name */
 		.name = "adl_mx98360a_8825",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
 					SOF_NAU8825_SSP_AMP(1) |
 					SOF_NAU8825_NUM_HDMIDEV(4) |
 					SOF_BT_OFFLOAD_SSP(2) |
@@ -657,8 +664,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "adl_rt1015p_8825",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_RT1015P_SPEAKER_AMP_PRESENT |
 					SOF_NAU8825_SSP_AMP(1) |
 					SOF_NAU8825_NUM_HDMIDEV(4) |
 					SOF_BT_OFFLOAD_SSP(2) |
@@ -667,8 +672,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "adl_nau8318_8825",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_NAU8318_SPEAKER_AMP_PRESENT |
 					SOF_NAU8825_SSP_AMP(1) |
 					SOF_NAU8825_NUM_HDMIDEV(4) |
 					SOF_BT_OFFLOAD_SSP(2) |
@@ -677,8 +680,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "rpl_max98373_8825",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_MAX98373_SPEAKER_AMP_PRESENT |
 					SOF_NAU8825_SSP_AMP(1) |
 					SOF_NAU8825_NUM_HDMIDEV(4) |
 					SOF_BT_OFFLOAD_SSP(2) |
@@ -687,8 +688,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "rpl_nau8318_8825",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_NAU8318_SPEAKER_AMP_PRESENT |
 					SOF_NAU8825_SSP_AMP(1) |
 					SOF_NAU8825_NUM_HDMIDEV(4) |
 					SOF_BT_OFFLOAD_SSP(2) |
@@ -712,7 +711,9 @@ module_platform_driver(sof_audio)
 MODULE_DESCRIPTION("SOF Audio Machine driver for NAU8825");
 MODULE_AUTHOR("David Lin <ctlin0@nuvoton.com>");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
+MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.25.1

