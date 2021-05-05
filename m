Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A073742DB
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADD201729;
	Wed,  5 May 2021 18:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADD201729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233294;
	bh=8slR/hMeVew3Sq58diEhHPSIB2r+bV3Ok5qCj/p1QgE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFHkwHrSlA8pxPFkJbpjHs608lku6uB/dGlGVdaanYyy56VLEh0JUvvpAl23VaYOb
	 wylbx/kdes81TjBCdrz763nNHsM79BirJ96wfOoLsWClHNIIiXmrcvu62wVbTUhaq1
	 ZZg4J5cIYQDTP3IfSP4ibQS46wNWpeIIrgFYbFRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE0BF805B0;
	Wed,  5 May 2021 18:37:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B1ACF805BB; Wed,  5 May 2021 18:37:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50760F805A8
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50760F805A8
IronPort-SDR: vcFDhYcqsPPnJIc2p0871iaBUY3oaApkBimveZTsOv2Te/Fnhb9ffZ6AZq2CwCC6TeljJgM4+U
 gamZcPX4RDIg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="196219172"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="196219172"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:21 -0700
IronPort-SDR: SQaRnrsyHQE4bWyP7GKZ7voZtFpAmYKz7v0SXkm/pGWBi2L+iTHYrFJRBJv0tT8H+VeSm8SgVL
 FiZvGFUZjvkA==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="458800021"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/13] ASoC: Intel: boards: handle hda-dsp-common as a module
Date: Wed,  5 May 2021 11:36:57 -0500
Message-Id: <20210505163705.305616-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
References: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

hda-dsp-common.o is linked multiple times due to copy/paste and
inertia. Move to a dedicated module with a namespace.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                | 13 ++++++++++
 sound/soc/intel/boards/Makefile               | 24 +++++++++++--------
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  1 +
 sound/soc/intel/boards/bxt_rt298.c            |  1 +
 sound/soc/intel/boards/cml_rt1011_rt5682.c    |  1 +
 sound/soc/intel/boards/ehl_rt5660.c           |  1 +
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  1 +
 sound/soc/intel/boards/hda_dsp_common.c       |  5 ++++
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  1 +
 sound/soc/intel/boards/sof_da7219_max98373.c  |  1 +
 sound/soc/intel/boards/sof_pcm512x.c          |  1 +
 sound/soc/intel/boards/sof_rt5682.c           |  1 +
 sound/soc/intel/boards/sof_sdw.c              |  1 +
 13 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 58379393b8e4..ec4d754eb348 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -26,6 +26,9 @@ config SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES
 	  interface.
 	  If unsure select N.
 
+config SND_SOC_INTEL_HDA_DSP_COMMON
+	tristate
+
 if SND_SOC_INTEL_CATPT
 
 config SND_SOC_INTEL_HASWELL_MACH
@@ -278,6 +281,7 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	select SND_SOC_MAX98390
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	tristate
@@ -304,6 +308,7 @@ config SND_SOC_INTEL_BXT_RT298_MACH
 	select SND_SOC_RT298
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 	help
 	   This adds support for ASoC machine driver for Broxton platforms
 	   with RT286 I2S audio codec.
@@ -422,6 +427,7 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 	help
 	   This adds support for ASoC machine driver for Geminilake platforms
 	   with RT5682 + MAX98357A I2S audio codec.
@@ -437,6 +443,7 @@ config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 	depends on SND_HDA_CODEC_HDMI
 	depends on GPIOLIB
 	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_DMIC
 	# SND_SOC_HDAC_HDA is already selected
 	help
@@ -461,6 +468,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with rt5682 codec.
@@ -473,6 +481,7 @@ config SND_SOC_INTEL_SOF_PCM512x_MACH
 	depends on (SND_SOC_SOF_HDA_AUDIO_CODEC && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	depends on SND_HDA_CODEC_HDMI
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_PCM512x_I2C
 	help
 	  This adds support for ASoC machine driver for SOF platforms
@@ -504,6 +513,7 @@ config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 	help
 	  This adds support for ASoC machine driver for SOF platform with
 	  RT1011 + RT5682 I2S codec.
@@ -519,6 +529,7 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_DMIC
@@ -539,6 +550,7 @@ config SND_SOC_INTEL_EHL_RT5660_MACH
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_RT5660
 	select SND_SOC_DMIC
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 	help
 	  This adds support for ASoC machine driver for Elkhart Lake
 	  platform with RT5660 I2S audio codec.
@@ -566,6 +578,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT5682_SDW
 	select SND_SOC_DMIC
+	select SND_SOC_INTEL_HDA_DSP_COMMON
 	help
 	  Add support for Intel SoundWire-based platforms connected to
 	  MAX98373, RT700, RT711, RT1308 and RT715
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 616c5fbab7d5..a48ee9b74e73 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -3,11 +3,11 @@ snd-soc-sst-haswell-objs := haswell.o
 snd-soc-sst-bdw-rt5650-mach-objs := bdw-rt5650.o
 snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
 snd-soc-sst-broadwell-objs := broadwell.o
-snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o hda_dsp_common.o
-snd-soc-sst-bxt-rt298-objs := bxt_rt298.o hda_dsp_common.o
-snd-soc-sst-sof-pcm512x-objs := sof_pcm512x.o hda_dsp_common.o
+snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o
+snd-soc-sst-bxt-rt298-objs := bxt_rt298.o
+snd-soc-sst-sof-pcm512x-objs := sof_pcm512x.o
 snd-soc-sst-sof-wm8804-objs := sof_wm8804.o
-snd-soc-sst-glk-rt5682_max98357a-objs := glk_rt5682_max98357a.o hda_dsp_common.o
+snd-soc-sst-glk-rt5682_max98357a-objs := glk_rt5682_max98357a.o
 snd-soc-sst-bytcr-rt5640-objs := bytcr_rt5640.o
 snd-soc-sst-bytcr-rt5651-objs := bytcr_rt5651.o
 snd-soc-sst-bytcr-wm5102-objs := bytcr_wm5102.o
@@ -19,19 +19,19 @@ snd-soc-sst-byt-cht-cx2072x-objs := bytcht_cx2072x.o
 snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
-snd-soc-sof_rt5682-objs := sof_rt5682.o hda_dsp_common.o sof_maxim_common.o sof_realtek_common.o
-snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o hda_dsp_common.o
+snd-soc-sof_rt5682-objs := sof_rt5682.o sof_maxim_common.o sof_realtek_common.o
+snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
 snd-soc-kbl_rt5663_max98927-objs := kbl_rt5663_max98927.o
 snd-soc-kbl_rt5663_rt5514_max98927-objs := kbl_rt5663_rt5514_max98927.o
 snd-soc-kbl_rt5660-objs := kbl_rt5660.o
 snd-soc-skl_rt286-objs := skl_rt286.o
-snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o hda_dsp_common.o
+snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o
 snd-skl_nau88l25_max98357a-objs := skl_nau88l25_max98357a.o
 snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
-snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o hda_dsp_common.o
-snd-soc-ehl-rt5660-objs := ehl_rt5660.o hda_dsp_common.o
+snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o
+snd-soc-ehl-rt5660-objs := ehl_rt5660.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_max98373.o			\
 			sof_sdw_rt1308.o sof_sdw_rt1316.o	\
@@ -39,7 +39,7 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt711.o sof_sdw_rt711_sdca.o 	\
 			sof_sdw_rt715.o	sof_sdw_rt715_sdca.o 	\
 			sof_maxim_common.o                      \
-			sof_sdw_dmic.o sof_sdw_hdmi.o hda_dsp_common.o
+			sof_sdw_dmic.o sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da7219_max98357a.o
@@ -74,3 +74,7 @@ obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH) += snd-soc-sof_da7219_max98373.o
 obj-$(CONFIG_SND_SOC_INTEL_EHL_RT5660_MACH) += snd-soc-ehl-rt5660.o
 obj-$(CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH) += snd-soc-sof-sdw.o
+
+# common modules
+snd-soc-intel-hda-dsp-common-objs := hda_dsp_common.o
+obj-$(CONFIG_SND_SOC_INTEL_HDA_DSP_COMMON) += snd-soc-intel-hda-dsp-common.o
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 9ffef396f8f2..07ae950b0127 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -869,3 +869,4 @@ MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:bxt_da7219_max98357a");
 MODULE_ALIAS("platform:glk_da7219_max98357a");
 MODULE_ALIAS("platform:cml_da7219_max98357a");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 0f3157dfa838..32a776fa0b86 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -667,3 +667,4 @@ MODULE_DESCRIPTION("Intel SST Audio for Broxton");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:bxt_alc298s_i2s");
 MODULE_ALIAS("platform:glk_alc298s_i2s");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index 14813beb33d1..27615acddacd 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -594,3 +594,4 @@ MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:cml_rt1011_rt5682");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 7c0d4e915406..b9b72d05b335 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -321,3 +321,4 @@ MODULE_DESCRIPTION("ASoC Intel(R) Elkhartlake + rt5660 Machine driver");
 MODULE_AUTHOR("libin.yang@intel.com");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:ehl_rt5660");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 62cca511522e..19e2ff90886a 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -642,3 +642,4 @@ MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
 MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:glk_rt5682_max98357a");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index 91ad2a0ad1ce..efdc4bc4bb1f 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -2,6 +2,7 @@
 //
 // Copyright(c) 2019 Intel Corporation. All rights reserved.
 
+#include <linux/module.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 #include <sound/hda_codec.h>
@@ -82,5 +83,9 @@ int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
 
 	return err;
 }
+EXPORT_SYMBOL_NS(hda_dsp_hdmi_build_controls, SND_SOC_INTEL_HDA_DSP_COMMON);
 
 #endif
+
+MODULE_DESCRIPTION("ASoC Intel HDMI helpers");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index bc50eda297ab..f4b4eeca3e03 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -258,3 +258,4 @@ MODULE_DESCRIPTION("SKL/KBL/BXT/APL HDA Generic Machine driver");
 MODULE_AUTHOR("Rakesh Ughreja <rakesh.a.ughreja@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:skl_hda_dsp_generic");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index f3cb0773e70e..0604d25e745f 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -457,3 +457,4 @@ MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_da7219_max98360a");
 MODULE_ALIAS("platform:sof_da7219_max98373");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index d2b0456236c7..8620d4f38493 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -437,3 +437,4 @@ MODULE_DESCRIPTION("ASoC Intel(R) SOF + PCM512x Machine driver");
 MODULE_AUTHOR("Pierre-Louis Bossart");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_pcm512x");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 358a19d62458..514ee19ab4a2 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1054,3 +1054,4 @@ MODULE_ALIAS("platform:tgl_rt1011_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_rt1015p");
 MODULE_ALIAS("platform:adl_max98373_rt5682");
 MODULE_ALIAS("platform:adl_max98357a_rt5682");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 85a2797c2550..73929f238f7b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1317,3 +1317,4 @@ MODULE_AUTHOR("Rander Wang <rander.wang@linux.intel.com>");
 MODULE_AUTHOR("Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_sdw");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-- 
2.25.1

