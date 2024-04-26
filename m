Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168108B3B70
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:29:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AAADE0D;
	Fri, 26 Apr 2024 17:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AAADE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145375;
	bh=Y21SU9XxrAyEM080Cip1iZrzybquTip/1dFNecmyagc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bnyr83AifZ2Ay3LPHBYrjERiPrTYaRYDITKojOhO1lP1WJQpN0I3wzUoop3xavwDt
	 agGvS163zZenFSdfvNO0bwTMs/c4hh+0kMu0puXin8XNauSVbEBa2AvYdGgp8HRvoi
	 BLYmEeuqMnl93OrK6koHvYdQLUT8mP8AOmOMejt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9827FF805F6; Fri, 26 Apr 2024 17:26:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38F34F805F6;
	Fri, 26 Apr 2024 17:26:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9718EF805AE; Fri, 26 Apr 2024 17:26:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFEC6F805B2
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFEC6F805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QHVeB4Py
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145149; x=1745681149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y21SU9XxrAyEM080Cip1iZrzybquTip/1dFNecmyagc=;
  b=QHVeB4PynJ8t3hCo0rXZG4XiALwFwgKnpnyBXML4u9PwBiuHe1WxnbnR
   anMK72T1k/LMftT6+MGSUpc1bpydvoh/cfLsG8KdXabr8lLwggHZP5kJS
   A1JmJVi94ShzOxPZnSDW4Un4i3kyBU708L3HBW2W7TidRNAySj5z6U6lj
   z/pQfCJo95jN2LKoqqrdoI+2fmmL9w0ZEnCfBmfQSDZ2OJJt9gyv8bGXU
   VksmJ9aDHp2+gmtea0UyPcfNIi5x7FwPnjwVlb/yj0nvh98VD7tZSMkfW
   k4HJx8jCroaH2nFA2a5XhAgmxmbce4F10BVVWEILtVfv0+Qc12dvasQcz
   A==;
X-CSE-ConnectionGUID: 9yMvJaVaTeu5sOxKb6YrhQ==
X-CSE-MsgGUID: pgZl+hUtSb+45wZfCO9l7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291316"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:45 -0700
X-CSE-ConnectionGUID: mSZYyqzATiqXn91s39Lxkw==
X-CSE-MsgGUID: JFZ/4ERgRSOfNN9AWxTXcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259569"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/23] ASoC: Intel: bxt_da7219_max98357a: remove cml support
Date: Fri, 26 Apr 2024 10:25:16 -0500
Message-Id: <20240426152529.38345-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YVP35AKCLVF3RPVBQXWMRIFY6MADVCSA
X-Message-ID-Hash: YVP35AKCLVF3RPVBQXWMRIFY6MADVCSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVP35AKCLVF3RPVBQXWMRIFY6MADVCSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Remove cml platform support and use sof_da7219 machine driver instead
for existing cml boards with MAX98357A speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |  6 ++--
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 28 +------------------
 .../intel/common/soc-acpi-intel-cml-match.c   |  2 +-
 3 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 8dfc1cc0f08e..1d76c97c9c02 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -584,13 +584,11 @@ if (SND_SOC_SOF_COMETLAKE && SND_SOC_SOF_HDA_LINK)
 
 config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 	tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	imply SND_SOC_INTEL_SOF_DA7219_MACH
 	help
 	   This adds support for ASoC machine driver for Cometlake platforms
-	   with DA7219 + MAX98357A I2S audio codec.
+	   with DA7219 + MAX98357A I2S audio codec. This option is deprecated
+	   and please use SND_SOC_INTEL_SOF_DA7219_MACH instead.
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 9f167c828d1c..45fe1d7b8865 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -201,10 +201,7 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int clk_freq;
 
 	/* Configure sysclk for codec */
-	if (soc_intel_is_cml())
-		clk_freq = 24000000;
-	else
-		clk_freq = 19200000;
+	clk_freq = 19200000;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, clk_freq,
 				     SND_SOC_CLOCK_IN);
@@ -721,28 +718,6 @@ static int broxton_audio_probe(struct platform_device *pdev)
 				broxton_dais[i].cpus->dai_name = "SSP2 Pin";
 			}
 		}
-	} else if (soc_intel_is_cml()) {
-		unsigned int i;
-
-		broxton_audio_card.name = "cmlda7219max";
-
-		for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
-			if (!broxton_dais[i].codecs->dai_name)
-				continue;
-
-			/* MAXIM_CODEC is connected to SSP1. */
-			if (!strcmp(broxton_dais[i].codecs->dai_name,
-					BXT_MAXIM_CODEC_DAI)) {
-				broxton_dais[i].name = "SSP1-Codec";
-				broxton_dais[i].cpus->dai_name = "SSP1 Pin";
-			}
-			/* DIALOG_CODEC is connected to SSP0 */
-			else if (!strcmp(broxton_dais[i].codecs->dai_name,
-					BXT_DIALOG_CODEC_DAI)) {
-				broxton_dais[i].name = "SSP0-Codec";
-				broxton_dais[i].cpus->dai_name = "SSP0 Pin";
-			}
-		}
 	}
 
 	/* override platform name, if required */
@@ -762,7 +737,6 @@ static int broxton_audio_probe(struct platform_device *pdev)
 static const struct platform_device_id bxt_board_ids[] = {
 	{ .name = "bxt_da7219_mx98357a" },
 	{ .name = "glk_da7219_mx98357a" },
-	{ .name = "cml_da7219_mx98357a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bxt_board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 4217dbb716dc..f79d7558174a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -68,7 +68,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "cml_da7219_mx98357a",
+		.drv_name = "cml_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &max98357a_spk_codecs,
 		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
-- 
2.40.1

