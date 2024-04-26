Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D7B8B3B72
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9233714DF;
	Fri, 26 Apr 2024 17:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9233714DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145387;
	bh=C1f3c+VXe0l4YguhLwGVH9/mM/FzT2FACXVo25ixV0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LxE5IHauihmPMNiuMYYO2/+r1CRTMgCCqmDLluW/tB10EMGVOWPllAcOXWqe9bPAW
	 +if8G6GVf33ZLNPb1bRF55o8wXgFm1pkJxT3/tRTEGuPh+29KFBIrKJjToSlVMrxgD
	 sqobgUJcDFAhJv7V7vxpo8yFFjtWRRoAG/FvzseU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE042F80806; Fri, 26 Apr 2024 17:26:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C8EEF805AB;
	Fri, 26 Apr 2024 17:26:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73828F80672; Fri, 26 Apr 2024 17:26:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F06C8F805B4
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F06C8F805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k1JqWuUH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145151; x=1745681151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C1f3c+VXe0l4YguhLwGVH9/mM/FzT2FACXVo25ixV0A=;
  b=k1JqWuUHj0v0c8iTuy73cRT0E1lB4ZtIdy1TNuPtqVUiG6oBsLdTWsEN
   solgOmIix9lg1mFEeBTdU/zY2GaYxFzO/BSBx4G6jd00vtq1ulzZQqYO2
   N0ReD7w4MoW1ZIkvOidzJ0q9zFQIGC+tvh/pbc27Or+W6TojrJnou+BN9
   4qJ1fl8c4YDKh+I1bztCkfY55vKsEbuCmx23cCnOjEKpWiPtQs0PQ/udZ
   HjI7JrcJOdmGxFKIo6U+FkuXwFZ190n/DZher9vINJ3BWPsKBGPcu/fDE
   FvMrqIW/DKM62rDCv3/nxDFrcG/Q/MckUlqOkdUuul1DYOlw0GMGPSBwD
   w==;
X-CSE-ConnectionGUID: KIy+NmwjR8GHFAXAJP1aWA==
X-CSE-MsgGUID: V5jDU87dTtCpTLeQoP1CNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291329"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:47 -0700
X-CSE-ConnectionGUID: /dMz3xRLTfC2tU+daWlcWw==
X-CSE-MsgGUID: dYseXB9WQ92EZQlMQ3oQqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259582"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/23] ASoC: Intel: bxt_da7219_max98357a: remove glk support
Date: Fri, 26 Apr 2024 10:25:19 -0500
Message-Id: <20240426152529.38345-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3UASCYC2TPUEUEJDHMMUIYJQ4LG6CQT3
X-Message-ID-Hash: 3UASCYC2TPUEUEJDHMMUIYJQ4LG6CQT3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UASCYC2TPUEUEJDHMMUIYJQ4LG6CQT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Remove glk platform support and use sof_da7219 machine driver instead
for existing glk boards with MAX98357A speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                | 14 ++----
 sound/soc/intel/boards/Makefile               |  2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 44 -------------------
 .../intel/common/soc-acpi-intel-glk-match.c   |  2 +-
 4 files changed, 6 insertions(+), 56 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 1d76c97c9c02..439c538208d6 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -305,10 +305,6 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 
-config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
-	tristate
-	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
-
 if SND_SOC_INTEL_APL
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
@@ -316,7 +312,7 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
-	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
+	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	help
 	   This adds support for ASoC machine driver for Broxton-P platforms
 	   with DA7219 + MAX98357A I2S audio codec.
@@ -432,13 +428,11 @@ if SND_SOC_SOF_GEMINILAKE
 
 config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
 	tristate "GLK with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
-	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
+	imply SND_SOC_INTEL_SOF_DA7219_MACH
 	help
 	   This adds support for ASoC machine driver for Geminilake platforms
-	   with DA7219 + MAX98357A I2S audio codec.
+	   with DA7219 + MAX98357A I2S audio codec. This option is deprecated
+	   and please use SND_SOC_INTEL_SOF_DA7219_MACH instead.
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 1c099e717eca..1ec779a0befb 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -52,7 +52,7 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_ES8336_MACH) += snd-soc-sof_es8336.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_NAU8825_MACH) += snd-soc-sof_nau8825.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MACH) += snd-soc-sof_da7219.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-hsw-rt5640.o
-obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da7219_max98357a.o
+obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH) += snd-soc-sst-bxt-da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_PCM512x_MACH) += snd-soc-sst-sof-pcm512x.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_WM8804_MACH) += snd-soc-sst-sof-wm8804.o
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 45fe1d7b8865..57e75f87bea6 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -134,9 +134,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 	/* speaker */
 	{"Spk", NULL, "Speaker"},
-};
 
-static const struct snd_soc_dapm_route broxton_map[] = {
 	{"HiFi Playback", NULL, "ssp5 Tx"},
 	{"ssp5 Tx", NULL, "codec0_out"},
 
@@ -147,17 +145,6 @@ static const struct snd_soc_dapm_route broxton_map[] = {
 	{"ssp1 Rx", NULL, "Capture"},
 };
 
-static const struct snd_soc_dapm_route gemini_map[] = {
-	{"HiFi Playback", NULL, "ssp1 Tx"},
-	{"ssp1 Tx", NULL, "codec0_out"},
-
-	{"Playback", NULL, "ssp2 Tx"},
-	{"ssp2 Tx", NULL, "codec1_out"},
-
-	{"codec0_in", NULL, "ssp2 Rx"},
-	{"ssp2 Rx", NULL, "Capture"},
-};
-
 static struct snd_soc_jack_pin jack_pins[] = {
 	{
 		.pin    = "Headphone Jack",
@@ -626,13 +613,6 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 	int err, i = 0;
 	char jack_name[NAME_SIZE];
 
-	if (soc_intel_is_glk())
-		snd_soc_dapm_add_routes(&card->dapm, gemini_map,
-					ARRAY_SIZE(gemini_map));
-	else
-		snd_soc_dapm_add_routes(&card->dapm, broxton_map,
-					ARRAY_SIZE(broxton_map));
-
 	if (list_empty(&ctx->hdmi_pcm_list))
 		return -EINVAL;
 
@@ -696,29 +676,6 @@ static int broxton_audio_probe(struct platform_device *pdev)
 
 	broxton_audio_card.dev = &pdev->dev;
 	snd_soc_card_set_drvdata(&broxton_audio_card, ctx);
-	if (soc_intel_is_glk()) {
-		unsigned int i;
-
-		broxton_audio_card.name = "glkda7219max";
-		/* Fixup the SSP entries for geminilake */
-		for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
-			if (!broxton_dais[i].codecs->dai_name)
-				continue;
-
-			/* MAXIM_CODEC is connected to SSP1. */
-			if (!strcmp(broxton_dais[i].codecs->dai_name,
-				    BXT_MAXIM_CODEC_DAI)) {
-				broxton_dais[i].name = "SSP1-Codec";
-				broxton_dais[i].cpus->dai_name = "SSP1 Pin";
-			}
-			/* DIALOG_CODE is connected to SSP2 */
-			else if (!strcmp(broxton_dais[i].codecs->dai_name,
-					 BXT_DIALOG_CODEC_DAI)) {
-				broxton_dais[i].name = "SSP2-Codec";
-				broxton_dais[i].cpus->dai_name = "SSP2 Pin";
-			}
-		}
-	}
 
 	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
@@ -736,7 +693,6 @@ static int broxton_audio_probe(struct platform_device *pdev)
 
 static const struct platform_device_id bxt_board_ids[] = {
 	{ .name = "bxt_da7219_mx98357a" },
-	{ .name = "glk_da7219_mx98357a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bxt_board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 8911c90bbaf6..1d30991afdc8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -33,7 +33,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "glk_da7219_mx98357a",
+		.drv_name = "glk_da7219_def",
 		.fw_filename = "intel/dsp_fw_glk.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &glk_codecs,
-- 
2.40.1

