Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D87A1F1A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C3DE7A;
	Fri, 15 Sep 2023 14:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C3DE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781982;
	bh=TJHPKjAa/3Mwa+riqAKz7f7NRQpGWWQChIkC5bJZVwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NmwFk/L9xvzKDkE4iQ1bYKmSZggJJsSuDM7P1mwJ4Xgh3rI/t+S1hyAceVx9X1DZ+
	 KLVnVPGdBnPIi1ahubVMi3TJZbkkoaCGnqyiUAXIequnuZbjvT0vQ+BIBZeydr/+Xm
	 we95WLgXoGGUyOrtdwzwsRegpMqRnOJfqDD2V8KM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83E20F80655; Fri, 15 Sep 2023 14:41:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9ECF80641;
	Fri, 15 Sep 2023 14:41:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 101BFF805F8; Fri, 15 Sep 2023 14:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9134F805E6
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9134F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BvtIy/6v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781653; x=1726317653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TJHPKjAa/3Mwa+riqAKz7f7NRQpGWWQChIkC5bJZVwY=;
  b=BvtIy/6vvkve1TosHVsojtpyzpmSJ5GCOkqS2sk2WNXH92O/Q/q82cVI
   1ZOoD4vlG/Xe2eM9/i8XuHy/EVDhktLR8gqIZ0hjjUrUfCV1d48F2gg15
   5/lr0irjzH9yw3EHp/ghik17MrIwOzZOskDENn+27ZASmgoPu1L5CLl+o
   xwn9NzE8HZ8S74L8UIQXH1emiWHbzfDfuFuSr293XL3ekMPoCsWkVoLBQ
   INCz2WK8i7iUEwdMgWFCKTi4zCGkF+NiBjkWTueTmuetWJBV09tZj8+Do
   5NPLOCyDFWCWFMeIC6rJ50tsIjGu+rpmJM8yOQlEnFHGE+QoyeUkQN8Kz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653246"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304686"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304686"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:47 -0700
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
Subject: [PATCH 16/19] ASoC: Intel: sof_da7219: rename driver file and kernel
 option
Date: Fri, 15 Sep 2023 20:48:49 +0800
Message-Id: <20230915124852.1696857-17-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FKV266A3UJF7OGTDAAWLUFW2XRGQJVZ3
X-Message-ID-Hash: FKV266A3UJF7OGTDAAWLUFW2XRGQJVZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FKV266A3UJF7OGTDAAWLUFW2XRGQJVZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Rename the driver file and kernel option to be consistent with other
SOF machine drivers.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                        | 11 ++++-------
 sound/soc/intel/boards/Makefile                       |  4 ++--
 .../boards/{sof_da7219_max98373.c => sof_da7219.c}    |  0
 3 files changed, 6 insertions(+), 9 deletions(-)
 rename sound/soc/intel/boards/{sof_da7219_max98373.c => sof_da7219.c} (100%)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index f3901a6259f7..b6aa8db86b67 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -610,25 +610,22 @@ config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 
 endif ## SND_SOC_SOF_COMETLAKE && SND_SOC_SOF_HDA_LINK
 
-if SND_SOC_SOF_JASPERLAKE
-
-config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
-	tristate "SOF with DA7219 and MAX98373/MAX98360A in I2S Mode"
+config SND_SOC_INTEL_SOF_DA7219_MACH
+	tristate "SOF with DA7219 codec in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_DA7219
+	select SND_SOC_MAX98357A
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_DMIC
 	help
 	  This adds support for ASoC machine driver for SOF platforms
-	  with DA7219 + MAX98373/MAX98360A I2S audio codec.
+	  with Dialog DA7219 I2S audio codec.
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
-endif ## SND_SOC_SOF_JASPERLAKE
-
 if SND_SOC_SOF_HDA_LINK
 
 config SND_SOC_INTEL_SOF_SSP_AMP_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 70eb596f4ec3..ae78e4aa69fc 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -23,6 +23,7 @@ snd-soc-sof_rt5682-objs := sof_rt5682.o
 snd-soc-sof_cs42l42-objs := sof_cs42l42.o
 snd-soc-sof_es8336-objs := sof_es8336.o
 snd-soc-sof_nau8825-objs := sof_nau8825.o
+snd-soc-sof_da7219-objs := sof_da7219.o
 snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
@@ -33,7 +34,6 @@ snd-soc-skl_rt286-objs := skl_rt286.o
 snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o
 snd-skl_nau88l25_max98357a-objs := skl_nau88l25_max98357a.o
 snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
-snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o
 snd-soc-ehl-rt5660-objs := ehl_rt5660.o
 snd-soc-sof-ssp-amp-objs := sof_ssp_amp.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
@@ -49,6 +49,7 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_ES8336_MACH) += snd-soc-sof_es8336.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_NAU8825_MACH) += snd-soc-sof_nau8825.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MACH) += snd-soc-sof_da7219.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-hsw-rt5640.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
@@ -79,7 +80,6 @@ obj-$(CONFIG_SND_SOC_INTEL_SKL_RT286_MACH) += snd-soc-skl_rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH) += snd-skl_nau88l25_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH) += snd-soc-skl_nau88l25_ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
-obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH) += snd-soc-sof_da7219_max98373.o
 obj-$(CONFIG_SND_SOC_INTEL_EHL_RT5660_MACH) += snd-soc-ehl-rt5660.o
 obj-$(CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH) += snd-soc-sof-sdw.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_AMP_MACH) += snd-soc-sof-ssp-amp.o
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219.c
similarity index 100%
rename from sound/soc/intel/boards/sof_da7219_max98373.c
rename to sound/soc/intel/boards/sof_da7219.c
-- 
2.25.1

