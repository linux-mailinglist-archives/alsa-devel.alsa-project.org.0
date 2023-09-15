Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C047A1EED
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F128E0D;
	Fri, 15 Sep 2023 14:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F128E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781802;
	bh=tbN/G1zhPkgIt9wSBrNHxQMPQ72c8sAZ06gLjRWnJiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r54MK7kpzcEEddFeCpdWj6g8UP+3rtuR2h4uCMg7m6KD32wxZyDh6zY4oPG9OPmHc
	 H37DZdfd0d53BmLqj82X043NJX+R1M/mKl3w/zXWcfI9/gV28cP9K3KdhLSHEUgmWU
	 ji/vjNCb2qly6fd2pMLspJ3ruxNHmJ7j6jWF0mj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33341F805A1; Fri, 15 Sep 2023 14:40:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E1EAF805C6;
	Fri, 15 Sep 2023 14:40:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCB58F80558; Fri, 15 Sep 2023 14:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4FB5F80558
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4FB5F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cFO7gGsc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781626; x=1726317626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tbN/G1zhPkgIt9wSBrNHxQMPQ72c8sAZ06gLjRWnJiA=;
  b=cFO7gGscw9ULf0mLvFNldXzcQ9PfyqzdoCUSt//FlNax0CyE3LG8Jwsp
   e93G/mADL75GWhNf80YhUO4MrDj164RFEocJf2BAYUIxAgBhBwJA7uPtE
   2g8jgrksocOVPw0nfBfmIJxRrOQKkiMDnIeRffMLmxH6qJP1GmznlJqQu
   ovFcRd6VJJEAOz/w9ep+Nw+eLFf6yuV/vYaCVW/caGlMw+vg0oDOahz+Q
   u7dTCcsyIppOgBcYx94SXR4gr9v1nNAEWnt7BN51hZ2AnkOhdx1/hpaTP
   G77tKIpCod9Ltk2/NbLqj/qZtZ7nbgXb4z5vk5jYvIP6+F45Md7cvognX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653151"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653151"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304562"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304562"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:21 -0700
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
Subject: [PATCH 06/19] ASoC: Intel: sof_ssp_amp: use ssp-common module to
 detect codec
Date: Fri, 15 Sep 2023 20:48:39 +0800
Message-Id: <20230915124852.1696857-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SLXROAPW7ZYAMQ45C4ACHXFPOIFQJHEX
X-Message-ID-Hash: SLXROAPW7ZYAMQ45C4ACHXFPOIFQJHEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLXROAPW7ZYAMQ45C4ACHXFPOIFQJHEX/>
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
 sound/soc/intel/boards/Kconfig       |  1 +
 sound/soc/intel/boards/sof_ssp_amp.c | 53 ++++++++++++++++++----------
 2 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 1bc47f7c502a..857bb8628a4c 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -637,6 +637,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	select SND_SOC_INTEL_SOF_CIRRUS_COMMON
+	select SND_SOC_INTEL_SOF_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with RT1308/CS35L41 I2S audio codec.
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 5aa16fd3939b..e2b3553dbc65 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -21,6 +21,7 @@
 #include "hda_dsp_common.h"
 #include "sof_realtek_common.h"
 #include "sof_cirrus_common.h"
+#include "sof_ssp_common.h"
 
 #define NAME_SIZE 32
 
@@ -59,10 +60,6 @@
 #define SOF_BT_OFFLOAD_SSP(quirk)	\
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
 
-/* Speaker amplifiers */
-#define SOF_RT1308_SPEAKER_AMP_PRESENT		BIT(21)
-#define SOF_CS35L41_SPEAKER_AMP_PRESENT		BIT(22)
-
 /* Default: SSP2  */
 static unsigned long sof_ssp_amp_quirk = SOF_AMPLIFIER_SSP(2);
 
@@ -77,6 +74,7 @@ struct sof_card_private {
 	struct list_head hdmi_pcm_list;
 	bool common_hdmi_codec_drv;
 	bool idisp_codec;
+	enum sof_ssp_codec amp_type;
 };
 
 static const struct dmi_system_id chromebook_platforms[] = {
@@ -188,11 +186,10 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 #define IDISP_CODEC_MASK	0x4
 
-static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
-							  int ssp_codec,
-							  int dmic_be_num,
-							  int hdmi_num,
-							  bool idisp_codec)
+static struct snd_soc_dai_link *
+sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
+			  int ssp_codec, int dmic_be_num, int hdmi_num,
+			  bool idisp_codec)
 {
 	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *cpus;
@@ -243,11 +240,19 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		return NULL;
 
 	links[id].id = id;
-	if (sof_ssp_amp_quirk & SOF_RT1308_SPEAKER_AMP_PRESENT) {
-		sof_rt1308_dai_link(&links[id]);
-	} else if (sof_ssp_amp_quirk & SOF_CS35L41_SPEAKER_AMP_PRESENT) {
+
+	switch (amp_type) {
+	case CODEC_CS35L41:
 		cs35l41_set_dai_link(&links[id]);
+		break;
+	case CODEC_RT1308:
+		sof_rt1308_dai_link(&links[id]);
+		break;
+	default:
+		dev_err(dev, "invalid amp type %d\n", amp_type);
+		return NULL;
 	}
+
 	links[id].platforms = platform_component;
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].dpcm_playback = 1;
@@ -385,6 +390,8 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 
 	mach = pdev->dev.platform_data;
 
+	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
+
 	if (dmi_check_system(chromebook_platforms) || mach->mach_params.dmic_num > 0)
 		dmic_be_num = 2;
 
@@ -413,15 +420,26 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		sof_ssp_amp_card.num_links++;
 
-	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, dmic_be_num, hdmi_num, ctx->idisp_codec);
+	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
+					      ssp_codec, dmic_be_num, hdmi_num,
+					      ctx->idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
 
 	sof_ssp_amp_card.dai_link = dai_links;
 
 	/* update codec_conf */
-	if (sof_ssp_amp_quirk & SOF_CS35L41_SPEAKER_AMP_PRESENT) {
+	switch (ctx->amp_type) {
+	case CODEC_CS35L41:
 		cs35l41_set_codec_conf(&sof_ssp_amp_card);
+		break;
+	case CODEC_NONE:
+	case CODEC_RT1308:
+		/* no codec conf required */
+		break;
+	default:
+		dev_err(&pdev->dev, "invalid amp type %d\n", ctx->amp_type);
+		return -EINVAL;
 	}
 
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
@@ -451,8 +469,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
 					SOF_HDMI_CAPTURE_1_SSP(1) |
 					SOF_HDMI_CAPTURE_2_SSP(5) |
-					SOF_SSP_HDMI_CAPTURE_PRESENT |
-					SOF_RT1308_SPEAKER_AMP_PRESENT),
+					SOF_SSP_HDMI_CAPTURE_PRESENT),
 	},
 	{
 		.name = "adl_cs35l41",
@@ -460,8 +477,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_NO_OF_HDMI_PLAYBACK(4) |
 					SOF_HDMI_PLAYBACK_PRESENT |
 					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT |
-					SOF_CS35L41_SPEAKER_AMP_PRESENT),
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "adl_lt6911_hdmi_ssp",
@@ -502,3 +518,4 @@ MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_CIRRUS_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.25.1

