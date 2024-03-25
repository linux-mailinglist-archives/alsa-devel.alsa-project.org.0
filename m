Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC188B3BC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:15:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 466B92232;
	Mon, 25 Mar 2024 23:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 466B92232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404906;
	bh=Bg8bHueUGEorR/Bj8ktg+TuI3LOyayYHwRHY4N8/zmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q0iVSHnCaIbWulMzq7LXgcsXhrVUqm/4FCxuESphUYBTX9uFlPiEekvO7rB0p8iMC
	 nvOvxyUvIrxtst0FH8bQiumQiZm1agZFr69lJEJhXMA5JMUEH4QvQa41UQflC8tous
	 81UJPFTtJ/Oi3yNRj7At9zVdIAfbrCX6WDfYcOEg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C85D9F8076D; Mon, 25 Mar 2024 23:12:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F19A3F80791;
	Mon, 25 Mar 2024 23:12:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4AD4F80682; Mon, 25 Mar 2024 23:11:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5283DF805B0
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5283DF805B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YDhmGu8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404688; x=1742940688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bg8bHueUGEorR/Bj8ktg+TuI3LOyayYHwRHY4N8/zmU=;
  b=YDhmGu8fMDuE9CFcjdF2Y4YJCyN0Khv4pyeGUMP1U/iur0CyHkLBLeqq
   Kyg5Uf4NNmUoc1o8RnjQTqEmYau4cSp5t3Z5CJFRBoqNCF53H3CeJQSf5
   37su5JNKqnymqn30FpRsDV7F0azdU3HGnTn82JJd1TiZjBi+/LiK2ePJ9
   PPpiUpQGojbglRFY5hOGYA7FZQgRIlPSm2tKz4hk/oxPEf8tu91fGL3X4
   revTFxURDbFJgoqeCQ8lSvjJxy/I2ZNm1wc5h+9VTJOEUj7CudTz8Inie
   akUkn+wa2l8rf84gOpx+UsQnc9APAJc7CJD9sp3GWeG6nE/DSXVDNADi+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643644"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643644"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722131"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/21] ASoC: Intel: sof_rt5682: use common module for
 sof_card_private initialization
Date: Mon, 25 Mar 2024 17:10:48 -0500
Message-Id: <20240325221059.206042-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MNBQLIQYVVMIM3IRBJJWDO72X73WM6PN
X-Message-ID-Hash: MNBQLIQYVVMIM3IRBJJWDO72X73WM6PN
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNBQLIQYVVMIM3IRBJJWDO72X73WM6PN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module to initialize sof_card_private structure

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 218 +++++++++++-----------------
 1 file changed, 88 insertions(+), 130 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 640d17c6cd35..672636f07456 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -27,37 +27,14 @@
 #include "sof_board_helpers.h"
 #include "sof_maxim_common.h"
 #include "sof_realtek_common.h"
-#include "sof_ssp_common.h"
 
-#define SOF_RT5682_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
-#define SOF_RT5682_SSP_CODEC_MASK			(GENMASK(2, 0))
-#define SOF_RT5682_MCLK_EN			BIT(3)
-#define SOF_RT5682_SSP_AMP_SHIFT		6
-#define SOF_RT5682_SSP_AMP_MASK                 (GENMASK(8, 6))
-#define SOF_RT5682_SSP_AMP(quirk)	\
-	(((quirk) << SOF_RT5682_SSP_AMP_SHIFT) & SOF_RT5682_SSP_AMP_MASK)
-#define SOF_RT5682_MCLK_BYTCHT_EN		BIT(9)
-#define SOF_RT5682_NUM_HDMIDEV_SHIFT		10
-#define SOF_RT5682_NUM_HDMIDEV_MASK		(GENMASK(12, 10))
-#define SOF_RT5682_NUM_HDMIDEV(quirk)	\
-	((quirk << SOF_RT5682_NUM_HDMIDEV_SHIFT) & SOF_RT5682_NUM_HDMIDEV_MASK)
-
-/* BT audio offload: reserve 3 bits for future */
-#define SOF_BT_OFFLOAD_SSP_SHIFT		19
-#define SOF_BT_OFFLOAD_SSP_MASK		(GENMASK(21, 19))
-#define SOF_BT_OFFLOAD_SSP(quirk)	\
-	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
-#define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(22)
-
-/* HDMI capture*/
-#define SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT  27
-#define SOF_SSP_HDMI_CAPTURE_PRESENT_MASK (GENMASK(30, 27))
-#define SOF_HDMI_CAPTURE_SSP_MASK(quirk)   \
-	(((quirk) << SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT) & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK)
+/* Driver-specific board quirks: from bit 0 to 7 */
+#define SOF_RT5682_MCLK_EN			BIT(0)
+#define SOF_RT5682_MCLK_BYTCHT_EN		BIT(1)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0);
+					SOF_SSP_PORT_CODEC(0);
 
 static int sof_rt5682_quirk_cb(const struct dmi_system_id *id)
 {
@@ -72,7 +49,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Circuitco"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Minnowboard Max"),
 		},
-		.driver_data = (void *)(SOF_RT5682_SSP_CODEC(2)),
+		.driver_data = (void *)(SOF_SSP_PORT_CODEC(2)),
 	},
 	{
 		.callback = sof_rt5682_quirk_cb,
@@ -80,7 +57,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "UP-CHT01"),
 		},
-		.driver_data = (void *)(SOF_RT5682_SSP_CODEC(2)),
+		.driver_data = (void *)(SOF_SSP_PORT_CODEC(2)),
 	},
 	{
 		.callback = sof_rt5682_quirk_cb,
@@ -89,7 +66,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "WhiskeyLake Client"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(1)),
+					SOF_SSP_PORT_CODEC(1)),
 	},
 	{
 		.callback = sof_rt5682_quirk_cb,
@@ -97,8 +74,8 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Hatch"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1)),
 	},
 	{
 		.callback = sof_rt5682_quirk_cb,
@@ -107,7 +84,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Ice Lake Client"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0)),
+					SOF_SSP_PORT_CODEC(0)),
 	},
 	{
 		.callback = sof_rt5682_quirk_cb,
@@ -116,9 +93,9 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98373_ALC5682I_I2S_UP4"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(2) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(2) |
+					SOF_NUM_IDISP_HDMI(4)),
 	},
 	{
 		.callback = sof_rt5682_quirk_cb,
@@ -128,9 +105,9 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_OEM_STRING, "AUDIO-ADL_MAX98373_ALC5682I_I2S"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(2) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(2) |
+					SOF_NUM_IDISP_HDMI(4)),
 	},
 	{
 		.callback = sof_rt5682_quirk_cb,
@@ -139,9 +116,9 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98390_ALC5682I_I2S"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(2) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(2) |
+					SOF_NUM_IDISP_HDMI(4)),
 	},
 	{
 		.callback = sof_rt5682_quirk_cb,
@@ -150,9 +127,9 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_I2S_AMP_SSP2"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(2) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(2) |
+					SOF_NUM_IDISP_HDMI(4)),
 	},
 	{
 		.callback = sof_rt5682_quirk_cb,
@@ -160,11 +137,11 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3) |
-					SOF_BT_OFFLOAD_SSP(1) |
-					SOF_SSP_BT_OFFLOAD_PRESENT
+					SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(0) |
+					SOF_NUM_IDISP_HDMI(3) |
+					SOF_SSP_PORT_BT_OFFLOAD(1) |
+					SOF_BT_OFFLOAD_PRESENT
 					),
 	},
 	{}
@@ -630,19 +607,29 @@ static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct sof_card_private *ctx;
+	bool is_legacy_cpu;
 	int ret;
 
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		sof_rt5682_quirk = (unsigned long)pdev->id_entry->driver_data;
 
 	dmi_check_system(sof_rt5682_quirk_table);
 
-	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
-	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
+	if (soc_intel_is_byt() || soc_intel_is_cht()) {
+		is_legacy_cpu = true;
+
+		/* default quirk for legacy cpu */
+		sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
+				   SOF_RT5682_MCLK_BYTCHT_EN |
+				   SOF_SSP_PORT_CODEC(2);
+	}
+
+	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
+
+	/* initialize ctx with board quirk */
+	ctx = sof_intel_board_get_ctx(&pdev->dev, sof_rt5682_quirk);
+	if (!ctx)
+		return -ENOMEM;
 
 	if (ctx->codec_type == CODEC_RT5650) {
 		sof_audio_card_rt5682.name = devm_kstrdup(&pdev->dev, "rt5650",
@@ -653,23 +640,12 @@ static int sof_audio_probe(struct platform_device *pdev)
 			ctx->amp_type = CODEC_RT5650;
 	}
 
-	if (soc_intel_is_byt() || soc_intel_is_cht()) {
+	if (is_legacy_cpu) {
 		ctx->rt5682.is_legacy_cpu = true;
 		ctx->dmic_be_num = 0;
 		/* HDMI is not supported by SOF on Baytrail/CherryTrail */
 		ctx->hdmi_num = 0;
-		/* default quirk for legacy cpu */
-		sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
-						SOF_RT5682_MCLK_BYTCHT_EN |
-						SOF_RT5682_SSP_CODEC(2);
 	} else {
-		ctx->dmic_be_num = 2;
-		ctx->hdmi_num = (sof_rt5682_quirk & SOF_RT5682_NUM_HDMIDEV_MASK) >>
-			 SOF_RT5682_NUM_HDMIDEV_SHIFT;
-		/* default number of HDMI DAI's */
-		if (!ctx->hdmi_num)
-			ctx->hdmi_num = 3;
-
 		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 			ctx->hdmi.idisp_codec = true;
 	}
@@ -694,23 +670,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 		}
 	}
 
-	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
-
-	/* port number/mask of peripherals attached to ssp interface */
-	ctx->ssp_mask_hdmi_in = (sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK) >>
-			SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
-
-	ctx->ssp_bt = (sof_rt5682_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-			SOF_BT_OFFLOAD_SSP_SHIFT;
-
-	ctx->ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
-			SOF_RT5682_SSP_AMP_SHIFT;
-
-	ctx->ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
-
-	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
-		ctx->bt_offload_present = true;
-
 	/* update dai_link */
 	ret = sof_card_dai_links_create(&pdev->dev, &sof_audio_card_rt5682, ctx);
 	if (ret)
@@ -766,96 +725,96 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "cml_rt1015_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1)),
 	},
 	{
 		.name = "jsl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1)),
 	},
 	{
 		.name = "tgl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "adl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "adl_mx98357_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(2) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(2) |
+					SOF_NUM_IDISP_HDMI(4)),
 	},
 	{
 		.name = "adl_rt5682_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(1) |
-					SOF_RT5682_NUM_HDMIDEV(3) |
+					SOF_SSP_PORT_CODEC(1) |
+					SOF_NUM_IDISP_HDMI(3) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_HDMI_CAPTURE_SSP_MASK(0x5)),
+					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
 	{
 		.name = "rpl_mx98357_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(2) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(2) |
+					SOF_NUM_IDISP_HDMI(4)),
 	},
 	{
 		.name = "rpl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "rpl_rt5682_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(1) |
-					SOF_RT5682_NUM_HDMIDEV(3) |
+					SOF_SSP_PORT_CODEC(1) |
+					SOF_NUM_IDISP_HDMI(3) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_HDMI_CAPTURE_SSP_MASK(0x5)),
+					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
 	{
 		.name = "mtl_mx98357_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(3) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(3) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "mtl_mx98360_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(3)),
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(3)),
 	},
 	{
 		.name = "mtl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3) |
-					SOF_BT_OFFLOAD_SSP(1) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+					SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(0) |
+					SOF_NUM_IDISP_HDMI(3) |
+					SOF_SSP_PORT_BT_OFFLOAD(1) |
+					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{ }
 };
@@ -881,4 +840,3 @@ MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.40.1

