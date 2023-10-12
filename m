Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EC47C7681
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D22E5E87;
	Thu, 12 Oct 2023 21:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D22E5E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138101;
	bh=eR9Dcq3N9VvwbsigljIYS/Gxq7b3ZkX/kkEqz3SCu6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B4icIsw93iTHcL61f+LPiBCzkHYrMXGOMoaOVl/FzYnrtKek74SNz1d+PBaqJWP86
	 qCOncwgCmlW/PaIWvJk9UIXadSagytB0p+AmevW6YZTbFnI6cjMIesQvCVpAjItf8g
	 CzB9K6YUAvBga52IZaO+8aSl10KT/QryElwL0V+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C473AF80636; Thu, 12 Oct 2023 21:10:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F083F8062F;
	Thu, 12 Oct 2023 21:10:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65A88F80600; Thu, 12 Oct 2023 21:09:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2312EF8027B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2312EF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VBrJFZ/j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137748; x=1728673748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eR9Dcq3N9VvwbsigljIYS/Gxq7b3ZkX/kkEqz3SCu6k=;
  b=VBrJFZ/jx8ZQer3xWa4Iuv+I+nWo6CAMYcWOsrVoXE638ZWorakyiYRW
   CuP65YIfaKc6M0pKQ3fnQDF9dzH1qkXa5MLN0C4o8fUUVWSpCTEBaQPtc
   j1PQ597AFNQ3Jf6BSFsQPKhDQKl1VtvUnwFT/Z6y7zM9+9QJbCQchLMhL
   MFuG6hIF3ZLmVyWhJ1DRcn993RGTs/ztY5dqzkGDy/uoHlUsl9/zyzivD
   FXCdjMS8Et96+CaCGVgg0EsSNg1fUS/ugLGFAnUfyKwQKQsHaR9gMKgo5
   J+BQGoXf2EB/9ILaX712otS+sGdlzYkmxKZ/WmCylAprAyIXt6sOab79+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060251"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060251"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108120"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108120"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 20/23] ASoC: Intel: sof_cs42l42: use common module for HDMI
 link
Date: Thu, 12 Oct 2023 15:08:23 -0400
Message-Id: <20231012190826.142619-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6LO4EPRILJKRTHSEX24UCPFSPI56TJ5B
X-Message-ID-Hash: 6LO4EPRILJKRTHSEX24UCPFSPI56TJ5B
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LO4EPRILJKRTHSEX24UCPFSPI56TJ5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module for Intel HDMI DAI link initialization.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig       |   1 +
 sound/soc/intel/boards/sof_cs42l42.c | 130 ++++++---------------------
 2 files changed, 29 insertions(+), 102 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 08569e0fc4a2..926305ba0511 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -517,6 +517,7 @@ config SND_SOC_INTEL_SOF_CS42L42_MACH
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_SSP_COMMON
 	help
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index b38c54cc5640..6c7d0c85f1a0 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -20,8 +20,7 @@
 #include <sound/soc-acpi.h>
 #include <dt-bindings/sound/cs42l42.h>
 #include "../common/soc-intel-quirks.h"
-#include "hda_dsp_common.h"
-#include "sof_hdmi_common.h"
+#include "sof_board_helpers.h"
 #include "sof_maxim_common.h"
 #include "sof_ssp_common.h"
 
@@ -68,23 +67,6 @@ static struct snd_soc_jack_pin jack_pins[] = {
 /* Default: SSP2 */
 static unsigned long sof_cs42l42_quirk = SOF_CS42L42_SSP_CODEC(2);
 
-struct sof_card_private {
-	struct snd_soc_jack headset_jack;
-	struct sof_hdmi_private hdmi;
-	enum sof_ssp_codec codec_type;
-	enum sof_ssp_codec amp_type;
-};
-
-static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-
-	ctx->hdmi.hdmi_comp = dai->component;
-
-	return 0;
-}
-
 static int sof_cs42l42_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -165,15 +147,7 @@ static struct snd_soc_dai_link_component platform_component[] = {
 
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
-	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
-
-	if (!ctx->hdmi.idisp_codec)
-		return 0;
-
-	if (!ctx->hdmi.hdmi_comp)
-		return -EINVAL;
-
-	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
+	return sof_intel_board_card_late_probe(card);
 }
 
 static const struct snd_kcontrol_new sof_controls[] = {
@@ -389,65 +363,6 @@ static int create_dmic_dai_links(struct device *dev,
 	return 0;
 }
 
-static int create_hdmi_dai_links(struct device *dev,
-				 struct snd_soc_dai_link *links,
-				 struct snd_soc_dai_link_component *cpus,
-				 int *id, int hdmi_num)
-{
-	struct snd_soc_dai_link_component *idisp_components;
-	int i;
-
-	/* HDMI */
-	if (hdmi_num <= 0)
-		return 0;
-
-	idisp_components = devm_kcalloc(dev,
-					hdmi_num,
-					sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
-	if (!idisp_components)
-		goto devm_err;
-
-	for (i = 1; i <= hdmi_num; i++) {
-		links[*id].name = devm_kasprintf(dev, GFP_KERNEL,
-						 "iDisp%d", i);
-		if (!links[*id].name)
-			goto devm_err;
-
-		links[*id].id = *id;
-		links[*id].cpus = &cpus[*id];
-		links[*id].num_cpus = 1;
-		links[*id].cpus->dai_name = devm_kasprintf(dev,
-							   GFP_KERNEL,
-							   "iDisp%d Pin",
-							   i);
-		if (!links[*id].cpus->dai_name)
-			goto devm_err;
-
-		idisp_components[i - 1].name = "ehdaudio0D2";
-		idisp_components[i - 1].dai_name = devm_kasprintf(dev,
-								  GFP_KERNEL,
-								  "intel-hdmi-hifi%d",
-								  i);
-		if (!idisp_components[i - 1].dai_name)
-			goto devm_err;
-
-		links[*id].codecs = &idisp_components[i - 1];
-		links[*id].num_codecs = 1;
-		links[*id].platforms = platform_component;
-		links[*id].num_platforms = ARRAY_SIZE(platform_component);
-		links[*id].init = (i == 1) ? sof_hdmi_init : NULL;
-		links[*id].dpcm_playback = 1;
-		links[*id].no_pcm = 1;
-
-		(*id)++;
-	}
-
-	return 0;
-
-devm_err:
-	return -ENOMEM;
-}
-
 static int create_bt_offload_dai_links(struct device *dev,
 				       struct snd_soc_dai_link *links,
 				       struct snd_soc_dai_link_component *cpus,
@@ -491,11 +406,14 @@ static int create_bt_offload_dai_links(struct device *dev,
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_codec, int ssp_amp, int ssp_bt,
-			  int dmic_be_num, int hdmi_num)
+			  int dmic_be_num, int hdmi_num, bool idisp_codec)
 {
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
-	int ret, id = 0, link_seq;
+	int ret;
+	int id = 0;
+	int link_seq;
+	int i;
 
 	links = devm_kcalloc(dev, sof_audio_card_cs42l42.num_links,
 			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
@@ -536,11 +454,18 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			}
 			break;
 		case LINK_HDMI:
-			ret = create_hdmi_dai_links(dev, links, cpus, &id, hdmi_num);
-			if (ret < 0) {
-				dev_err(dev, "fail to create hdmi dai links, ret %d\n",
-					ret);
-				goto devm_err;
+			for (i = 1; i <= hdmi_num; i++) {
+				ret = sof_intel_board_set_intel_hdmi_link(dev,
+									  &links[id],
+									  id, i,
+									  idisp_codec);
+				if (ret) {
+					dev_err(dev, "fail to create hdmi link, ret %d\n",
+						ret);
+					goto devm_err;
+				}
+
+				id++;
 			}
 			break;
 		case LINK_BT:
@@ -571,7 +496,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int dmic_be_num, hdmi_num;
+	int dmic_be_num;
 	int ret, ssp_bt, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -586,14 +511,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	if (soc_intel_is_glk()) {
 		dmic_be_num = 1;
-		hdmi_num = 3;
+		ctx->hdmi_num = 3;
 	} else {
 		dmic_be_num = 2;
-		hdmi_num = (sof_cs42l42_quirk & SOF_CS42L42_NUM_HDMIDEV_MASK) >>
+		ctx->hdmi_num = (sof_cs42l42_quirk & SOF_CS42L42_NUM_HDMIDEV_MASK) >>
 			 SOF_CS42L42_NUM_HDMIDEV_SHIFT;
 		/* default number of HDMI DAI's */
-		if (!hdmi_num)
-			hdmi_num = 3;
+		if (!ctx->hdmi_num)
+			ctx->hdmi_num = 3;
 	}
 
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
@@ -610,7 +535,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
-	sof_audio_card_cs42l42.num_links = 1 + dmic_be_num + hdmi_num;
+	sof_audio_card_cs42l42.num_links = 1 + dmic_be_num + ctx->hdmi_num;
 
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_cs42l42.num_links++;
@@ -619,7 +544,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
 					      ssp_codec, ssp_amp, ssp_bt,
-					      dmic_be_num, hdmi_num);
+					      dmic_be_num, ctx->hdmi_num,
+					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -679,6 +605,6 @@ module_platform_driver(sof_audio)
 MODULE_DESCRIPTION("SOF Audio Machine driver for CS42L42");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.39.2

