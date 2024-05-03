Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 381988BAE26
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78ADCE69;
	Fri,  3 May 2024 15:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78ADCE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714744523;
	bh=xVPShmx1++InegjpLC4A4JwOWs2HuWxpPiTyA3wZWA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IN2Y7UfOe2sGGbPM/kaZLZ4MQKPJCQ89TLPy7ADLdsRunlPrPKaIMBbIb1j6vCrMI
	 mL5fzVzJxnMnkFYKIRStd+AQijAt8zxTyMicr6QGeakLMlU08QPWCoHcQD4YWLdzZT
	 kDcLUZK764YtIUjSqYNY5HMvBRkhRMk5hu7e5XLA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7A86F806D4; Fri,  3 May 2024 15:53:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F9EDF806CD;
	Fri,  3 May 2024 15:53:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B6AF80697; Fri,  3 May 2024 15:53:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BF3AF8057C
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF3AF8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HkDy4hyC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744364; x=1746280364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xVPShmx1++InegjpLC4A4JwOWs2HuWxpPiTyA3wZWA4=;
  b=HkDy4hyCbxapfsEEjUFq9YYueo+upgVq9eym7FY44+uAVXin3MNIoUgT
   IZ3De9Md4V+b/uQcgc3JHI0s0RnlTCDmVUs1BbX9KWswBQ5KIRg7s5/15
   XIx4PCg4AK5eXax48WYEhCIIEhZTy5w2HBzBoOpQEgJOmVt7Avt/l+Tw/
   lU8wBuTOwxQNJ82QySbICfHNEbgdL6vumLp0yEEB/tTeCB2m865vGhO6j
   hD2JMs8tSbLR20ZeUnRcCvpTvJ2BUgoC6MDRH8zANUVIIVJiAKdAaFKt4
   CyELB9+O24BaOflTzPvJu209Z7mfUlhJIxVT5xYnPtO9j94nhCqykw6ef
   Q==;
X-CSE-ConnectionGUID: girw9CURQXWhx2sHlLXx/Q==
X-CSE-MsgGUID: 6jHnGcUWRJuiB47Au3Txsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029433"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="28029433"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:38 -0700
X-CSE-ConnectionGUID: /HK7mJvcSrKCrceY6uK59A==
X-CSE-MsgGUID: 5n31FXhLQW+wRHr2b1/zQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27548778"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 7/7] ASoC: SOF: Intel: move hda.c to different module
Date: Fri,  3 May 2024 08:52:21 -0500
Message-Id: <20240503135221.229202-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H46GTMN4UATMJEDWW6ZECHMWSE7MJM6T
X-Message-ID-Hash: H46GTMN4UATMJEDWW6ZECHMWSE7MJM6T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H46GTMN4UATMJEDWW6ZECHMWSE7MJM6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that most of the code moves are done, we can add a new module and
the required EXPORT_SYMBOL definitions.

No functionality change, just a new module added.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig          | 22 +++++++++++++---------
 sound/soc/sof/intel/Makefile         |  6 ++++--
 sound/soc/sof/intel/hda-bus.c        |  2 ++
 sound/soc/sof/intel/hda-common-ops.c |  2 +-
 sound/soc/sof/intel/hda-ctrl.c       |  9 +++++++++
 sound/soc/sof/intel/hda-dai.c        |  5 +++++
 sound/soc/sof/intel/hda-dsp.c        |  9 +++++++++
 sound/soc/sof/intel/hda-ipc.c        |  5 +++++
 sound/soc/sof/intel/hda-loader.c     |  1 +
 sound/soc/sof/intel/hda-pcm.c        |  6 ++++++
 sound/soc/sof/intel/hda-probes.c     |  2 ++
 sound/soc/sof/intel/hda-stream.c     |  8 ++++++++
 sound/soc/sof/intel/hda-trace.c      |  3 +++
 sound/soc/sof/intel/hda.c            | 21 +++++++++++----------
 sound/soc/sof/intel/pci-apl.c        |  1 +
 sound/soc/sof/intel/pci-cnl.c        |  1 +
 sound/soc/sof/intel/pci-icl.c        |  1 +
 sound/soc/sof/intel/pci-lnl.c        |  1 +
 sound/soc/sof/intel/pci-mtl.c        |  1 +
 sound/soc/sof/intel/pci-skl.c        |  1 +
 sound/soc/sof/intel/pci-tgl.c        |  1 +
 sound/soc/sof/intel/tracepoints.c    |  2 ++
 22 files changed, 88 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index b804be7321be..3396bd46b778 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -97,7 +97,7 @@ config SND_SOC_SOF_MERRIFIELD
 
 config SND_SOC_SOF_INTEL_SKL
 	tristate
-	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_IPC4
 
 config SND_SOC_SOF_SKYLAKE
@@ -122,7 +122,7 @@ config SND_SOC_SOF_KABYLAKE
 
 config SND_SOC_SOF_INTEL_APL
 	tristate
-	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_IPC4
 
@@ -148,7 +148,7 @@ config SND_SOC_SOF_GEMINILAKE
 
 config SND_SOC_SOF_INTEL_CNL
 	tristate
-	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_IPC4
@@ -184,7 +184,7 @@ config SND_SOC_SOF_COMETLAKE
 
 config SND_SOC_SOF_INTEL_ICL
 	tristate
-	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_IPC4
@@ -212,7 +212,7 @@ config SND_SOC_SOF_JASPERLAKE
 
 config SND_SOC_SOF_INTEL_TGL
 	tristate
-	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_IPC4
@@ -250,7 +250,7 @@ config SND_SOC_SOF_ALDERLAKE
 
 config SND_SOC_SOF_INTEL_MTL
 	tristate
-	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC4
 
@@ -266,7 +266,7 @@ config SND_SOC_SOF_METEORLAKE
 
 config SND_SOC_SOF_INTEL_LNL
 	tristate
-	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_MTL
@@ -283,6 +283,10 @@ config SND_SOC_SOF_LUNARLAKE
 
 config SND_SOC_SOF_HDA_COMMON
 	tristate
+
+config SND_SOC_SOF_HDA_GENERIC
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_SOF_PCI_DEV
 	select SND_INTEL_DSP_CONFIG
@@ -299,7 +303,7 @@ config SND_SOC_SOF_HDA_MLINK
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
 
-if SND_SOC_SOF_HDA_COMMON
+if SND_SOC_SOF_HDA_GENERIC
 
 config SND_SOC_SOF_HDA_LINK
 	bool "SOF support for HDA Links(HDA/HDMI)"
@@ -319,7 +323,7 @@ config SND_SOC_SOF_HDA_AUDIO_CODEC
 	  Say Y if you want to enable HDAudio codecs with SOF.
 	  If unsure select "N".
 
-endif ## SND_SOC_SOF_HDA_COMMON
+endif ## SND_SOC_SOF_HDA_GENERIC
 
 config SND_SOC_SOF_HDA_LINK_BASELINE
 	tristate
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index cf74548f87ad..806df08e3fd5 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -3,12 +3,13 @@
 snd-sof-acpi-intel-byt-objs := byt.o
 snd-sof-acpi-intel-bdw-objs := bdw.o
 
-snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
+snd-sof-intel-hda-common-objs := hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-dai-ops.o hda-bus.o \
-				 hda-common-ops.o \
 				 telemetry.o tracepoints.o
 
+snd-sof-intel-hda-generic-objs := hda.o hda-common-ops.o
+
 snd-sof-intel-hda-mlink-objs := hda-mlink.o
 
 snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-probes.o
@@ -21,6 +22,7 @@ obj-$(CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP) += snd-sof-intel-atom.o
 obj-$(CONFIG_SND_SOC_SOF_BAYTRAIL) += snd-sof-acpi-intel-byt.o
 obj-$(CONFIG_SND_SOC_SOF_BROADWELL) += snd-sof-acpi-intel-bdw.o
 obj-$(CONFIG_SND_SOC_SOF_HDA_COMMON) += snd-sof-intel-hda-common.o
+obj-$(CONFIG_SND_SOC_SOF_HDA_GENERIC) += snd-sof-intel-hda-generic.o
 obj-$(CONFIG_SND_SOC_SOF_HDA_MLINK) += snd-sof-intel-hda-mlink.o
 obj-$(CONFIG_SND_SOC_SOF_HDA) += snd-sof-intel-hda.o
 
diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index f78d6b998be0..292fd334330b 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -99,6 +99,7 @@ void sof_hda_bus_init(struct snd_sof_dev *sdev, struct device *dev)
 	spin_lock_init(&bus->reg_lock);
 #endif /* CONFIG_SND_SOC_SOF_HDA_LINK */
 }
+EXPORT_SYMBOL_NS(sof_hda_bus_init, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void sof_hda_bus_exit(struct snd_sof_dev *sdev)
 {
@@ -108,3 +109,4 @@ void sof_hda_bus_exit(struct snd_sof_dev *sdev)
 	snd_hdac_ext_bus_exit(bus);
 #endif
 }
+EXPORT_SYMBOL_NS(sof_hda_bus_exit, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 6a863ceba8da..e4c5031d227e 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -105,4 +105,4 @@ const struct snd_sof_dsp_ops sof_hda_common_ops = {
 
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
-EXPORT_SYMBOL_NS(sof_hda_common_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_hda_common_ops, SND_SOC_SOF_INTEL_HDA_GENERIC);
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 56c0f493042c..810a2ba4fbe4 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -128,6 +128,7 @@ int hda_dsp_ctrl_get_caps(struct snd_sof_dev *sdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_get_caps, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_dsp_ctrl_ppcap_enable(struct snd_sof_dev *sdev, bool enable)
 {
@@ -136,6 +137,7 @@ void hda_dsp_ctrl_ppcap_enable(struct snd_sof_dev *sdev, bool enable)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
 				SOF_HDA_PPCTL_GPROCEN, val);
 }
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_ppcap_enable, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_dsp_ctrl_ppcap_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
@@ -144,6 +146,7 @@ void hda_dsp_ctrl_ppcap_int_enable(struct snd_sof_dev *sdev, bool enable)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
 				SOF_HDA_PPCTL_PIE, val);
 }
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_ppcap_int_enable, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_dsp_ctrl_misc_clock_gating(struct snd_sof_dev *sdev, bool enable)
 {
@@ -263,6 +266,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_init_chip, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 {
@@ -322,3 +326,8 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 
 	bus->chip_init = false;
 }
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 650e3a37326e..f494d8701345 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -54,6 +54,7 @@ int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dai_config, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 
@@ -542,6 +543,7 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	}
 	return 0;
 }
+EXPORT_SYMBOL_NS(sdw_hda_dai_hw_params, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int sdw_hda_dai_hw_free(struct snd_pcm_substream *substream,
 			struct snd_soc_dai *cpu_dai,
@@ -570,12 +572,14 @@ int sdw_hda_dai_hw_free(struct snd_pcm_substream *substream,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(sdw_hda_dai_hw_free, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int sdw_hda_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			struct snd_soc_dai *cpu_dai)
 {
 	return hda_dai_trigger(substream, cmd, cpu_dai);
 }
+EXPORT_SYMBOL_NS(sdw_hda_dai_trigger, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 static int hda_dai_suspend(struct hdac_bus *bus)
 {
@@ -856,6 +860,7 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 #endif
 };
+EXPORT_SYMBOL_NS(skl_dai, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_dais_suspend(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 780f4c33e678..4a27e1dfca39 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -89,6 +89,7 @@ u32 hda_get_interface_mask(struct snd_sof_dev *sdev)
 
 	return interface_mask[sdev->dspless_mode_selected];
 }
+EXPORT_SYMBOL_NS(hda_get_interface_mask, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 bool hda_is_chain_dma_supported(struct snd_sof_dev *sdev, u32 dai_type)
 {
@@ -118,6 +119,7 @@ bool hda_is_chain_dma_supported(struct snd_sof_dev *sdev, u32 dai_type)
 		return false;
 	}
 }
+EXPORT_SYMBOL_NS(hda_is_chain_dma_supported, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 /*
  * DSP Core control.
@@ -980,6 +982,7 @@ int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dsp_runtime_idle, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 {
@@ -1001,6 +1004,7 @@ int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 
 	return snd_sof_dsp_set_power_state(sdev, &target_state);
 }
+EXPORT_SYMBOL_NS(hda_dsp_runtime_suspend, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
@@ -1061,6 +1065,7 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 
 	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
 }
+EXPORT_SYMBOL_NS(hda_dsp_suspend, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 static unsigned int hda_dsp_check_for_dma_streams(struct snd_sof_dev *sdev)
 {
@@ -1153,6 +1158,7 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(hda_dsp_set_hw_params_upon_resume, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_dsp_d0i3_work(struct work_struct *work)
 {
@@ -1179,6 +1185,7 @@ void hda_dsp_d0i3_work(struct work_struct *work)
 				    "error: failed to set DSP state %d substate %d\n",
 				    target_state.state, target_state.substate);
 }
+EXPORT_SYMBOL_NS(hda_dsp_d0i3_work, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_core_get(struct snd_sof_dev *sdev, int core)
 {
@@ -1311,6 +1318,7 @@ int hda_sdw_check_lcount(struct snd_sof_dev *sdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_sdw_check_lcount, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
@@ -1619,3 +1627,4 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 		hda_dsp_dump_ext_rom_status(sdev, level, flags);
 	}
 }
+EXPORT_SYMBOL_NS(hda_dsp_dump, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 2252c9198cc0..6b7f2337567c 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -398,11 +398,13 @@ int hda_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	return HDA_DSP_MBOX_UPLINK_OFFSET;
 }
+EXPORT_SYMBOL_NS(hda_dsp_ipc_get_mailbox_offset, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
 	return SRAM_WINDOW_OFFSET(id);
 }
+EXPORT_SYMBOL_NS(hda_dsp_ipc_get_window_offset, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 		     struct snd_sof_pcm_stream *sps,
@@ -428,6 +430,7 @@ int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_ipc_msg_data, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_sof_pcm_stream *sps,
@@ -452,6 +455,7 @@ int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_set_stream_data_offset, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_ipc4_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
@@ -477,6 +481,7 @@ bool hda_check_ipc_irq(struct snd_sof_dev *sdev)
 
 	return false;
 }
+EXPORT_SYMBOL_NS(hda_check_ipc_irq, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_ipc_irq_dump(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 34c18275c949..df668806a8c4 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -691,3 +691,4 @@ int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dsp_ext_man_get_cavs_config_data, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index d7b446f3f973..27dc134f04a8 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -142,6 +142,7 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dsp_pcm_hw_params, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 /* update SPIB register with appl position */
 int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
@@ -164,6 +165,7 @@ int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substrea
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dsp_pcm_ack, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream, int cmd)
@@ -173,6 +175,7 @@ int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 
 	return hda_dsp_stream_trigger(sdev, hext_stream, cmd);
 }
+EXPORT_SYMBOL_NS(hda_dsp_pcm_trigger, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream)
@@ -204,6 +207,7 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 	trace_sof_intel_hda_dsp_pcm(sdev, hstream, substream, pos);
 	return pos;
 }
+EXPORT_SYMBOL_NS(hda_dsp_pcm_pointer, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream)
@@ -292,6 +296,7 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dsp_pcm_open, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
 		      struct snd_pcm_substream *substream)
@@ -311,3 +316,4 @@ int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
 	substream->runtime->private_data = NULL;
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dsp_pcm_close, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda-probes.c b/sound/soc/sof/intel/hda-probes.c
index 56a533c63cb0..be0fd56ddb27 100644
--- a/sound/soc/sof/intel/hda-probes.c
+++ b/sound/soc/sof/intel/hda-probes.c
@@ -139,10 +139,12 @@ int hda_probes_register(struct snd_sof_dev *sdev)
 	return sof_client_dev_register(sdev, "hda-probes", 0, &hda_probes_ops,
 				       sizeof(hda_probes_ops));
 }
+EXPORT_SYMBOL_NS(hda_probes_register, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_probes_unregister(struct snd_sof_dev *sdev)
 {
 	sof_client_dev_unregister(sdev, "hda-probes", 0);
 }
+EXPORT_SYMBOL_NS(hda_probes_unregister, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 4fef1964b5cd..7a38bea663fe 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -27,6 +27,7 @@
 int sof_hda_position_quirk = SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS;
 module_param_named(position_quirk, sof_hda_position_quirk, int, 0444);
 MODULE_PARM_DESC(position_quirk, "SOF HDaudio position quirk");
+EXPORT_SYMBOL_NS(sof_hda_position_quirk, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 #define HDA_LTRP_GB_VALUE_US	95
 
@@ -713,6 +714,7 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dsp_stream_hw_free, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 {
@@ -735,6 +737,7 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(hda_dsp_check_stream_irq, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 static void
 hda_dsp_compr_bytes_transferred(struct hdac_stream *hstream, int direction)
@@ -831,6 +834,7 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_NS(hda_dsp_stream_threaded_handler, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 {
@@ -968,6 +972,7 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_dsp_stream_init, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 void hda_dsp_stream_free(struct snd_sof_dev *sdev)
 {
@@ -997,6 +1002,7 @@ void hda_dsp_stream_free(struct snd_sof_dev *sdev)
 		devm_kfree(sdev->dev, hda_stream);
 	}
 }
+EXPORT_SYMBOL_NS(hda_dsp_stream_free, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 snd_pcm_uframes_t hda_dsp_stream_get_position(struct hdac_stream *hstream,
 					      int direction, bool can_sleep)
@@ -1123,6 +1129,7 @@ u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
 
 	return merge_u64(llp_u, llp_l);
 }
+EXPORT_SYMBOL_NS(hda_dsp_get_stream_llp, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 /**
  * hda_dsp_get_stream_ldp - Retrieve the LDP (Linear DMA Position) of the stream
@@ -1154,3 +1161,4 @@ u64 hda_dsp_get_stream_ldp(struct snd_sof_dev *sdev,
 
 	return ((u64)ldp_u << 32) | ldp_l;
 }
+EXPORT_SYMBOL_NS(hda_dsp_get_stream_ldp, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index cbb9bd7770e6..f0d959ba50c4 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -68,6 +68,7 @@ int hda_dsp_trace_init(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(hda_dsp_trace_init, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_trace_release(struct snd_sof_dev *sdev)
 {
@@ -86,6 +87,7 @@ int hda_dsp_trace_release(struct snd_sof_dev *sdev)
 	dev_dbg(sdev->dev, "DMA trace stream is not opened!\n");
 	return -ENODEV;
 }
+EXPORT_SYMBOL_NS(hda_dsp_trace_release, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd)
 {
@@ -93,3 +95,4 @@ int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd)
 
 	return hda_dsp_stream_trigger(sdev, hda->dtrace_stream, cmd);
 }
+EXPORT_SYMBOL_NS(hda_dsp_trace_trigger, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 183b2526b6d2..70b36b0b4147 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -238,7 +238,7 @@ int hda_sdw_startup(struct snd_sof_dev *sdev)
 
 	return sdw_intel_startup(hdev->sdw);
 }
-EXPORT_SYMBOL_NS(hda_sdw_startup, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_sdw_startup, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 static int hda_sdw_exit(struct snd_sof_dev *sdev)
 {
@@ -280,7 +280,7 @@ bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 out:
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_common_check_sdw_irq, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_common_check_sdw_irq, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 static bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 {
@@ -314,7 +314,7 @@ bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev)
 
 	return false;
 }
-EXPORT_SYMBOL_NS(hda_sdw_check_wakeen_irq_common, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_sdw_check_wakeen_irq_common, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 {
@@ -345,7 +345,7 @@ void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev)
 
 	sdw_intel_process_wakeen_event(hdev->sdw);
 }
-EXPORT_SYMBOL_NS(hda_sdw_process_wakeen_common, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_sdw_process_wakeen_common, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 #else /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 static inline int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
@@ -418,7 +418,7 @@ int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	/* re-enable clock gating and power gating */
 	return hda_dsp_ctrl_clock_power_gating(sdev, true);
 }
-EXPORT_SYMBOL_NS(hda_dsp_post_fw_run, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_post_fw_run, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 /*
  * Debug
@@ -807,7 +807,7 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
 err:
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_probe_early, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_probe_early, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 int hda_dsp_probe(struct snd_sof_dev *sdev)
 {
@@ -964,7 +964,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_probe, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_probe, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 void hda_dsp_remove(struct snd_sof_dev *sdev)
 {
@@ -1018,7 +1018,7 @@ void hda_dsp_remove(struct snd_sof_dev *sdev)
 	if (!sdev->dspless_mode_selected)
 		iounmap(sdev->bar[HDA_DSP_BAR]);
 }
-EXPORT_SYMBOL_NS(hda_dsp_remove, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_remove, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 void hda_dsp_remove_late(struct snd_sof_dev *sdev)
 {
@@ -1034,7 +1034,7 @@ int hda_power_down_dsp(struct snd_sof_dev *sdev)
 
 	return hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 }
-EXPORT_SYMBOL_NS(hda_power_down_dsp, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_power_down_dsp, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 static void hda_generic_machine_select(struct snd_sof_dev *sdev,
@@ -1509,7 +1509,7 @@ int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	return sof_pci_probe(pci, pci_id);
 }
-EXPORT_SYMBOL_NS(hda_pci_intel_probe, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_pci_intel_probe, SND_SOC_SOF_INTEL_HDA_GENERIC);
 
 int hda_register_clients(struct snd_sof_dev *sdev)
 {
@@ -1530,4 +1530,5 @@ MODULE_IMPORT_NS(SND_INTEL_SOUNDWIRE_ACPI);
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_MATCH);
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index 4b287b5e9077..7551d4eb150d 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -105,5 +105,6 @@ static struct pci_driver snd_sof_pci_intel_apl_driver = {
 module_pci_driver(snd_sof_pci_intel_apl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index 9fa0cd2eae79..f2584a314711 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -143,5 +143,6 @@ static struct pci_driver snd_sof_pci_intel_cnl_driver = {
 module_pci_driver(snd_sof_pci_intel_cnl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 70689b8b431b..a2826073ad3b 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -108,6 +108,7 @@ static struct pci_driver snd_sof_pci_intel_icl_driver = {
 module_pci_driver(snd_sof_pci_intel_icl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_CNL);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index 38ae649d1def..5ad497826983 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -70,6 +70,7 @@ static struct pci_driver snd_sof_pci_intel_lnl_driver = {
 module_pci_driver(snd_sof_pci_intel_lnl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_MTL);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index cacc985d80f4..ad2615808394 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -133,5 +133,6 @@ static struct pci_driver snd_sof_pci_intel_mtl_driver = {
 module_pci_driver(snd_sof_pci_intel_mtl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
index 9dde439a0b0f..0bbfc4f55ff3 100644
--- a/sound/soc/sof/intel/pci-skl.c
+++ b/sound/soc/sof/intel/pci-skl.c
@@ -89,5 +89,6 @@ static struct pci_driver snd_sof_pci_intel_skl_driver = {
 module_pci_driver(snd_sof_pci_intel_skl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index d7ecb892550f..dc40ec8c6256 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -317,6 +317,7 @@ static struct pci_driver snd_sof_pci_intel_tgl_driver = {
 module_pci_driver(snd_sof_pci_intel_tgl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_CNL);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/tracepoints.c b/sound/soc/sof/intel/tracepoints.c
index c223c96fe0e3..9e3260a062c2 100644
--- a/sound/soc/sof/intel/tracepoints.c
+++ b/sound/soc/sof/intel/tracepoints.c
@@ -1,3 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 #define CREATE_TRACE_POINTS
 #include <trace/events/sof_intel.h>
+
+EXPORT_TRACEPOINT_SYMBOL(sof_intel_hda_irq);
-- 
2.40.1

