Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC4B7A1F24
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:47:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA66CE82;
	Fri, 15 Sep 2023 14:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA66CE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694782034;
	bh=seFLRDX7sQMghpahCaXfUPpjzxPsuqdphMzdpg6AJ7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X3M2bHxh3jl45+xhw1ibZ7ql52wqtbnOzqGwMnjF1BYSVnArb8epuvwHVC1oEBdWY
	 +ofLaXs2Lfy4uXt8/dEL2AU8eUoUNRAU4VWCElWvxYecoSlNlsTrc6A5QDC4CQ7TAG
	 4FDIuNwvXUc/z1BVAPRw5DkGXj9o9a+DXF7kt4ek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4C88F80681; Fri, 15 Sep 2023 14:41:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB230F8067F;
	Fri, 15 Sep 2023 14:41:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E88A9F8060D; Fri, 15 Sep 2023 14:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAEB1F805F8
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAEB1F805F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Os72Zkn3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781660; x=1726317660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=seFLRDX7sQMghpahCaXfUPpjzxPsuqdphMzdpg6AJ7A=;
  b=Os72Zkn3atSYeJh1MAL1arffXfna3loRJrWYsKoD7jvWlrLyT5PQBVYC
   NBXVicVXrE4RjKtZvjLBo2HclA8bPw65VVh3ceJPkkqJRNuuwN9LvlyQp
   s9Y1h963AkNyc9bSFUBZo+oARSHOBjYkjdHPVGe2AD+A2cdeTUaS26ruL
   PDDYwLgtIorS6Jewo2AAHLPQ5eooD5HcLc+FPH6UVFn+Ec97x7Gtqlrzb
   CEM2IJgLapsXfDTgSjvtIiuMQ1kpJKObVGGA7cdcRR563QPYAaYqfrk78
   P06sQyveiNMyzW4syxyl32xIRB72L9fXk2QjQqGGtY2rn/AOgM2UXjgQZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653273"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304738"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304738"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:55 -0700
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
Subject: [PATCH 19/19] ASoC: Intel: sof_da7219: use ssp-common module to
 detect codec
Date: Fri, 15 Sep 2023 20:48:52 +0800
Message-Id: <20230915124852.1696857-20-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7ADZEAQDRGJG5TWABPCG2KRABPGHA4LP
X-Message-ID-Hash: 7ADZEAQDRGJG5TWABPCG2KRABPGHA4LP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ADZEAQDRGJG5TWABPCG2KRABPGHA4LP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use ssp-common module to detect codec and amplifier type in driver
probe function and remove all quirks about amplifier type.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |  1 +
 sound/soc/intel/boards/sof_da7219.c           | 45 ++++++++++++-------
 .../intel/common/soc-acpi-intel-jsl-match.c   | 12 ++---
 3 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 6c97e22f248c..fa3252b6f1bf 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -621,6 +621,7 @@ config SND_SOC_INTEL_SOF_DA7219_MACH
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
+	select SND_SOC_INTEL_SOF_SSP_COMMON
 	help
 	  This adds support for ASoC machine driver for SOF platforms
 	  with Dialog DA7219 I2S audio codec.
diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 9fe9fe5e795d..6a71d5871938 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -17,12 +17,7 @@
 #include "../../codecs/da7219.h"
 #include "hda_dsp_common.h"
 #include "sof_maxim_common.h"
-
-/* Speaker amp type
- * TBD: use ssp-common module for type detection
- */
-#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(0)
-#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(1)
+#include "sof_ssp_common.h"
 
 /* Board Quirks */
 #define SOF_DA7219_JSL_BOARD			BIT(2)
@@ -39,6 +34,8 @@ struct card_private {
 	struct snd_soc_jack headset_jack;
 	struct list_head hdmi_pcm_list;
 	struct snd_soc_jack hdmi[3];
+	enum sof_ssp_codec codec_type;
+	enum sof_ssp_codec amp_type;
 
 	unsigned int pll_bypass:1;
 };
@@ -479,15 +476,24 @@ static int audio_probe(struct platform_device *pdev)
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		board_quirk = (unsigned long)pdev->id_entry->driver_data;
 
+	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
+	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
+
 	if (board_quirk & SOF_DA7219_JSL_BOARD) {
 		/* backward-compatible with existing devices */
-		if (board_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT)
+		switch (ctx->amp_type) {
+		case CODEC_MAX98360A:
 			card_da7219.name = devm_kstrdup(&pdev->dev,
 							"da7219max98360a",
 							GFP_KERNEL);
-		else if (board_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
+			break;
+		case CODEC_MAX98373:
 			card_da7219.name = devm_kstrdup(&pdev->dev, "da7219max",
 							GFP_KERNEL);
+			break;
+		default:
+			break;
+		}
 
 		dai_links = jsl_dais;
 		amp_idx = 0;
@@ -503,9 +509,11 @@ static int audio_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "board_quirk = %lx\n", board_quirk);
 
 	/* speaker amp */
-	if (board_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
+	switch (ctx->amp_type) {
+	case CODEC_MAX98360A:
 		max_98360a_dai_link(&dai_links[amp_idx]);
-	} else if (board_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
+		break;
+	case CODEC_MAX98373:
 		dai_links[amp_idx].codecs = max_98373_components;
 		dai_links[amp_idx].num_codecs = ARRAY_SIZE(max_98373_components);
 		dai_links[amp_idx].init = max_98373_spk_codec_init;
@@ -518,6 +526,10 @@ static int audio_probe(struct platform_device *pdev)
 		}
 
 		max_98373_set_codec_conf(&card_da7219);
+		break;
+	default:
+		dev_err(&pdev->dev, "invalid amp type %d\n", ctx->amp_type);
+		return -EINVAL;
 	}
 
 	card_da7219.dai_link = dai_links;
@@ -538,18 +550,16 @@ static int audio_probe(struct platform_device *pdev)
 
 static const struct platform_device_id board_ids[] = {
 	{
-		.name = "sof_da7219_mx98373",
-		.driver_data = (kernel_ulong_t)(SOF_MAX98373_SPEAKER_AMP_PRESENT |
-					SOF_DA7219_JSL_BOARD),
+		.name = "jsl_mx98373_da7219",
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_JSL_BOARD),
 	},
 	{
-		.name = "sof_da7219_mx98360a",
-		.driver_data = (kernel_ulong_t)(SOF_MAX98360A_SPEAKER_AMP_PRESENT |
-					SOF_DA7219_JSL_BOARD),
+		.name = "jsl_mx98360_da7219",
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_JSL_BOARD),
 	},
 	{
 		.name = "adl_mx98360_da7219",
-		.driver_data = (kernel_ulong_t)(SOF_MAX98360A_SPEAKER_AMP_PRESENT),
+		/* no quirk needed for this board */
 	},
 	{ }
 };
@@ -572,3 +582,4 @@ MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index f56bd7d656e9..342bbbb48ca7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -14,7 +14,7 @@ static const struct snd_soc_acpi_codecs essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
-static const struct snd_soc_acpi_codecs jsl_7219_98373_codecs = {
+static const struct snd_soc_acpi_codecs mx98373_spk = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
 };
@@ -52,14 +52,16 @@ static const struct snd_soc_acpi_codecs rt5682_rt5682s_hp = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	{
 		.id = "DLGS7219",
-		.drv_name = "sof_da7219_mx98373",
+		.drv_name = "jsl_mx98373_da7219",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mx98373_spk,
 		.sof_tplg_filename = "sof-jsl-da7219.tplg",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &jsl_7219_98373_codecs,
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "sof_da7219_mx98360a",
+		.drv_name = "jsl_mx98360_da7219",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-da7219-mx98360a.tplg",
 	},
 	{
-- 
2.25.1

