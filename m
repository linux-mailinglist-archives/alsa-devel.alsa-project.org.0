Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A887C7685
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A07BFE93;
	Thu, 12 Oct 2023 21:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A07BFE93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138148;
	bh=FglCEOmIJpPudEha9/TgPbDFobhPrDVDq2ntt0dIBlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J+qINa/BeM1ZPywS0J/eEKHewpYJv5GMvlTrfJo/pUJauFmcZtodTs8sNUsmWtA9V
	 PYCpVKNoDcSWdPcDNDeyBi4OjzVSBc7MfdDsYjh+Fmm8t8wv32clNpG80KJ4RoK5e9
	 gJ22g3WVeNeMMRV1wPSQ6uNWPpdAW+wOXllEo6+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5865F805AE; Thu, 12 Oct 2023 21:10:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFC75F8065A;
	Thu, 12 Oct 2023 21:10:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95B84F80621; Thu, 12 Oct 2023 21:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22F03F802BE
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F03F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ijh9dWnr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137749; x=1728673749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FglCEOmIJpPudEha9/TgPbDFobhPrDVDq2ntt0dIBlw=;
  b=ijh9dWnrzs6Rd13bwOD7HeoLMYhmbS1BMzMtJoXxCSjGbF+EaaLDa/6a
   2Nl7PXXTnhKPimS9XBYyRcjwzr6Rc1aWmkG9cjO3/AaN/z0s+Hv26L73c
   2w3Cpz20MfKfClNDH8cKudtGRr7yJMmZg0gG1CdONg6d7OCKBTcOogowM
   q+RUzl/EwMVIh+AvYXCbfhvpU6yW/nCoJOTfDYDDbsS1Vxc48m2ucXdQZ
   Ft7AYNsx05pgFLl5xtzsjZsoFo04+wWKNYCKG6gckdLnwyBYaP4FwhC0n
   FVYhuK0p2PcKMSqWH/fNKwtb4vjxZ6eVVsd3QdZ+WmgvFgWiOJ2GILc+j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060265"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060265"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108130"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108130"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 23/23] ASoC: Intel: sof_ssp_amp: use common module for HDMI
 link
Date: Thu, 12 Oct 2023 15:08:26 -0400
Message-Id: <20231012190826.142619-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KXOEUZZ7UKMCI3HC4BMDJGIWJFCYYHRS
X-Message-ID-Hash: KXOEUZZ7UKMCI3HC4BMDJGIWJFCYYHRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXOEUZZ7UKMCI3HC4BMDJGIWJFCYYHRS/>
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
 sound/soc/intel/boards/sof_ssp_amp.c | 105 ++++++---------------------
 2 files changed, 24 insertions(+), 82 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index f085daef5ee1..9e427f00deac 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -641,6 +641,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	select SND_SOC_CS35L41_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	select SND_SOC_INTEL_SOF_CIRRUS_COMMON
 	select SND_SOC_INTEL_SOF_SSP_COMMON
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 58655c2f2939..23c0d507789c 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -17,8 +17,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
-#include "hda_dsp_common.h"
-#include "sof_hdmi_common.h"
+#include "sof_board_helpers.h"
 #include "sof_realtek_common.h"
 #include "sof_cirrus_common.h"
 #include "sof_ssp_common.h"
@@ -61,11 +60,6 @@
 /* Default: SSP2  */
 static unsigned long sof_ssp_amp_quirk = SOF_AMPLIFIER_SSP(2);
 
-struct sof_card_private {
-	struct sof_hdmi_private hdmi;
-	enum sof_ssp_codec amp_type;
-};
-
 static const struct dmi_system_id chromebook_platforms[] = {
 	{
 		.ident = "Google Chromebooks",
@@ -87,18 +81,7 @@ static const struct snd_soc_dapm_route sof_ssp_amp_dapm_routes[] = {
 
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
-	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
-
-	if (!(sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT))
-		return 0;
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
 
 static struct snd_soc_card sof_ssp_amp_card = {
@@ -126,16 +109,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
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
 /* BE ID defined in sof-tgl-rt1308-hdmi-ssp.m4 */
 #define HDMI_IN_BE_ID		0
 #define SPK_BE_ID		2
@@ -147,11 +120,13 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_codec, int dmic_be_num, int hdmi_num,
 			  bool idisp_codec)
 {
-	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
-	int i, id = 0;
+	int i;
+	int id = 0;
+	int ret;
 	bool fixed_be = false;
+	int be_id;
 
 	links = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
 					sizeof(struct snd_soc_dai_link), GFP_KERNEL);
@@ -258,51 +233,14 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 	}
 
 	/* HDMI playback */
-	if (sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT) {
-		/* HDMI */
-		if (hdmi_num > 0) {
-			idisp_components = devm_kcalloc(dev,
-					   hdmi_num,
-					   sizeof(struct snd_soc_dai_link_component),
-					   GFP_KERNEL);
-			if (!idisp_components)
-				goto devm_err;
-		}
-		for (i = 1; i <= hdmi_num; i++) {
-			links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-							"iDisp%d", i);
-			if (!links[id].name)
-				goto devm_err;
+	for (i = 1; i <= hdmi_num; i++) {
+		be_id = fixed_be ? (INTEL_HDMI_BE_ID + i - 1) : id;
+		ret = sof_intel_board_set_intel_hdmi_link(dev, &links[id], be_id,
+							  i, idisp_codec);
+		if (ret)
+			return NULL;
 
-			links[id].id = fixed_be ? (INTEL_HDMI_BE_ID + i - 1) : id;
-			links[id].cpus = &cpus[id];
-			links[id].num_cpus = 1;
-			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								  "iDisp%d Pin", i);
-			if (!links[id].cpus->dai_name)
-				goto devm_err;
-
-			if (idisp_codec) {
-				idisp_components[i - 1].name = "ehdaudio0D2";
-				idisp_components[i - 1].dai_name = devm_kasprintf(dev,
-										  GFP_KERNEL,
-										  "intel-hdmi-hifi%d",
-										  i);
-				if (!idisp_components[i - 1].dai_name)
-					goto devm_err;
-			} else {
-				idisp_components[i - 1] = snd_soc_dummy_dlc;
-			}
-
-			links[id].codecs = &idisp_components[i - 1];
-			links[id].num_codecs = 1;
-			links[id].platforms = platform_component;
-			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].init = (i == 1) ? sof_hdmi_init : NULL;
-			links[id].dpcm_playback = 1;
-			links[id].no_pcm = 1;
-			id++;
-		}
+		id++;
 	}
 
 	/* BT audio offload */
@@ -340,7 +278,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int dmic_be_num = 0, hdmi_num = 0;
+	int dmic_be_num = 0;
 	int ret, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -368,23 +306,26 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
 
 	if (sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT) {
-		hdmi_num = (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_PLAYBACK_MASK) >>
+		ctx->hdmi_num = (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_PLAYBACK_MASK) >>
 				SOF_NO_OF_HDMI_PLAYBACK_SHIFT;
 		/* default number of HDMI DAI's */
-		if (!hdmi_num)
-			hdmi_num = 3;
+		if (!ctx->hdmi_num)
+			ctx->hdmi_num = 3;
 
 		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 			ctx->hdmi.idisp_codec = true;
 
-		sof_ssp_amp_card.num_links += hdmi_num;
+		sof_ssp_amp_card.num_links += ctx->hdmi_num;
+	} else {
+		ctx->hdmi_num = 0;
 	}
 
 	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		sof_ssp_amp_card.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ssp_codec, dmic_be_num, hdmi_num,
+					      ssp_codec, dmic_be_num,
+					      ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
@@ -483,7 +424,7 @@ MODULE_DESCRIPTION("ASoC Intel(R) SOF Amplifier Machine driver");
 MODULE_AUTHOR("Balamurugan C <balamurugan.c@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_CIRRUS_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.39.2

