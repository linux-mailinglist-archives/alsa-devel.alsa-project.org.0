Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5F38D0E5E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5751EE9A;
	Mon, 27 May 2024 21:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5751EE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716839181;
	bh=Q2qiCg1xR3gvi8RN+ihU4uf5mBY0RVaHivpdoQhAdOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mJAzaMRdQtw/ThvZ5NI/XWcJZ0zWMyUZGgRHklDciVbo/HMOqP5rzFzM51c9bKv+3
	 rek2qX+FSPp0+ifvdPLDell79DO41/y/bI8+PQ4NBgqKc9UGhtKGK9iS1qsfR77JBH
	 hnqq9b2yxUUgDuUEplCayo/vTz1v9wlctBE5TWLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 267A6F8026D; Mon, 27 May 2024 21:45:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26E12F805E6;
	Mon, 27 May 2024 21:45:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65948F805A0; Mon, 27 May 2024 21:45:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE94CF80494
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE94CF80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XC3CoP0n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839110; x=1748375110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q2qiCg1xR3gvi8RN+ihU4uf5mBY0RVaHivpdoQhAdOM=;
  b=XC3CoP0nhwURjuLRJMdV44bC4kpBoZPOYoSI3hRp+B+WPRQRG+6fLxQ0
   xbWiMCZras3nwdGYt3Vqz6A6Dd3pysUMQiFmnudcU70DBVDN3d5lDxToT
   HzgFpU2Vt2am6jYuiZw7DriePhVUH1ZRTdEXNuhoKu9cnjUP34Yd57f8A
   AmjX/GKc0wOo76BNhigWKjhzK8RHakoke+gRSYsGVxzUA4L7agM3J9P23
   IAaZE/vITk4IqxIYVGew3q2VTZcfh+NHa4pBW+XTqJyCx70emCi1pL0Mk
   UqMEQsM/ZuJf+xnz1TKCnvJsXEAyQCF9jrE8Qak85TFIAOAq0ZUWuzw3u
   A==;
X-CSE-ConnectionGUID: 2BVFEdqZS8yCn7kyREUafg==
X-CSE-MsgGUID: vgJ9WmgpTvOncnwnWAf/HQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30679498"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="30679498"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:05 -0700
X-CSE-ConnectionGUID: MNFDxKlPSQWLX1DiuibRFQ==
X-CSE-MsgGUID: N15fKTIORCWWgz6+fQ5srA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="39280549"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 4/4] ASoC: SOF: add missing MODULE_DESCRIPTION()
Date: Mon, 27 May 2024 14:44:14 -0500
Message-ID: <20240527194414.166156-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
References: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FQAUO7AOJ2XIM4K7B26T2DELLD6HRJUA
X-Message-ID-Hash: FQAUO7AOJ2XIM4K7B26T2DELLD6HRJUA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQAUO7AOJ2XIM4K7B26T2DELLD6HRJUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MODULE_DESCRIPTION() was optional until it became mandatory and
flagged as an error by 'make W=1'.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/imx/imx-common.c           | 1 +
 sound/soc/sof/imx/imx8.c                 | 3 ++-
 sound/soc/sof/imx/imx8m.c                | 3 ++-
 sound/soc/sof/imx/imx8ulp.c              | 3 ++-
 sound/soc/sof/intel/atom.c               | 1 +
 sound/soc/sof/intel/bdw.c                | 1 +
 sound/soc/sof/intel/byt.c                | 1 +
 sound/soc/sof/intel/hda-codec.c          | 1 +
 sound/soc/sof/intel/hda-ctrl.c           | 1 +
 sound/soc/sof/intel/hda-mlink.c          | 1 +
 sound/soc/sof/intel/hda.c                | 1 +
 sound/soc/sof/intel/pci-apl.c            | 1 +
 sound/soc/sof/intel/pci-cnl.c            | 1 +
 sound/soc/sof/intel/pci-icl.c            | 1 +
 sound/soc/sof/intel/pci-lnl.c            | 1 +
 sound/soc/sof/intel/pci-mtl.c            | 1 +
 sound/soc/sof/intel/pci-skl.c            | 1 +
 sound/soc/sof/intel/pci-tgl.c            | 1 +
 sound/soc/sof/intel/pci-tng.c            | 1 +
 sound/soc/sof/mediatek/mt8186/mt8186.c   | 3 ++-
 sound/soc/sof/mediatek/mt8195/mt8195.c   | 3 ++-
 sound/soc/sof/mediatek/mtk-adsp-common.c | 1 +
 sound/soc/sof/sof-acpi-dev.c             | 1 +
 sound/soc/sof/sof-of-dev.c               | 1 +
 sound/soc/sof/sof-pci-dev.c              | 1 +
 sound/soc/sof/sof-utils.c                | 1 +
 26 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 2981aea123d9..fce6d9cf6a6b 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -75,3 +75,4 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
 EXPORT_SYMBOL(imx8_dump);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF helpers for IMX platforms");
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 3021dc87ab5a..9f24e3c283dd 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -667,5 +667,6 @@ static struct platform_driver snd_sof_of_imx8_driver = {
 };
 module_platform_driver(snd_sof_of_imx8_driver);
 
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for IMX8 platforms");
+MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 3c3eeef0e282..2a7ad67a3ef3 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -558,5 +558,6 @@ static struct platform_driver snd_sof_of_imx8m_driver = {
 };
 module_platform_driver(snd_sof_of_imx8m_driver);
 
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for IMX8M platforms");
+MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index 8adfdd00413a..2585b1beef23 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -516,5 +516,6 @@ static struct platform_driver snd_sof_of_imx8ulp_driver = {
 };
 module_platform_driver(snd_sof_of_imx8ulp_driver);
 
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for IMX8ULP platforms");
+MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
index 86af4e9a716e..3505ac3a1b14 100644
--- a/sound/soc/sof/intel/atom.c
+++ b/sound/soc/sof/intel/atom.c
@@ -418,3 +418,4 @@ void atom_set_mach_params(struct snd_soc_acpi_mach *mach,
 EXPORT_SYMBOL_NS(atom_set_mach_params, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for Atom platforms");
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 3262286a9a9d..7f18080e4e19 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -694,6 +694,7 @@ static struct platform_driver snd_sof_acpi_intel_bdw_driver = {
 module_platform_driver(snd_sof_acpi_intel_bdw_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for Broadwell platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_IMPORT_NS(SND_SOC_SOF_ACPI_DEV);
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index d78d11d4cfbf..7a57e162fb1c 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -475,6 +475,7 @@ static struct platform_driver snd_sof_acpi_intel_byt_driver = {
 module_platform_driver(snd_sof_acpi_intel_byt_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for Baytrail/Cherrytrail");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_IMPORT_NS(SND_SOC_SOF_ACPI_DEV);
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index da3db3ed379e..dc46888faa0d 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -457,3 +457,4 @@ EXPORT_SYMBOL_NS_GPL(hda_codec_i915_exit, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 #endif
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for HDaudio codecs");
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 262b482dc0a8..b9a02750ce61 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -328,6 +328,7 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 }
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF helpers for HDaudio platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 04bbc5c9904c..9a3559c78b62 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -972,3 +972,4 @@ EXPORT_SYMBOL_NS(hdac_bus_eml_enable_offload, SND_SOC_SOF_HDA_MLINK);
 #endif
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for HDaudio multi-link");
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 541c6052d4ed..daf364f773dd 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1522,6 +1522,7 @@ void hda_unregister_clients(struct snd_sof_dev *sdev)
 }
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for HDaudio platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index df6d897da290..f006dcf5458a 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -105,6 +105,7 @@ static struct pci_driver snd_sof_pci_intel_apl_driver = {
 module_pci_driver(snd_sof_pci_intel_apl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for ApolloLake platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index a39fa3657d55..a8406342f08b 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -143,6 +143,7 @@ static struct pci_driver snd_sof_pci_intel_cnl_driver = {
 module_pci_driver(snd_sof_pci_intel_cnl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for CannonLake platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 9f1fe47475fb..25effca50d9f 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -108,6 +108,7 @@ static struct pci_driver snd_sof_pci_intel_icl_driver = {
 module_pci_driver(snd_sof_pci_intel_icl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for IceLake platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_CNL);
diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index 68e5c90151b2..602c574064eb 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -70,6 +70,7 @@ static struct pci_driver snd_sof_pci_intel_lnl_driver = {
 module_pci_driver(snd_sof_pci_intel_lnl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for LunarLake platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_MTL);
diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index c685cb8d6171..8cb0333c033e 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -133,6 +133,7 @@ static struct pci_driver snd_sof_pci_intel_mtl_driver = {
 module_pci_driver(snd_sof_pci_intel_mtl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for MeteorLake platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
index 862da8009543..8ca0231d7e4f 100644
--- a/sound/soc/sof/intel/pci-skl.c
+++ b/sound/soc/sof/intel/pci-skl.c
@@ -89,6 +89,7 @@ static struct pci_driver snd_sof_pci_intel_skl_driver = {
 module_pci_driver(snd_sof_pci_intel_skl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for SkyLake platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index f73bb47cd79e..ebe1a7d16689 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -317,6 +317,7 @@ static struct pci_driver snd_sof_pci_intel_tgl_driver = {
 module_pci_driver(snd_sof_pci_intel_tgl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for TigerLake platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_CNL);
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 5c3069588bb7..1375c393827e 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -244,6 +244,7 @@ static struct pci_driver snd_sof_pci_intel_tng_driver = {
 module_pci_driver(snd_sof_pci_intel_tng_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for Tangier platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c63e0d2f4b96..bea1b9d9ca28 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -666,6 +666,7 @@ static struct platform_driver snd_sof_of_mt8186_driver = {
 };
 module_platform_driver(snd_sof_of_mt8186_driver);
 
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for MT8186/MT8188 platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_IMPORT_NS(SND_SOC_SOF_MTK_COMMON);
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index fc1c016104ae..31dc98d1b1d8 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -619,6 +619,7 @@ static struct platform_driver snd_sof_of_mt8195_driver = {
 };
 module_platform_driver(snd_sof_of_mt8195_driver);
 
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for MTL 8195 platforms");
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_IMPORT_NS(SND_SOC_SOF_MTK_COMMON);
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/mediatek/mtk-adsp-common.c b/sound/soc/sof/mediatek/mtk-adsp-common.c
index de8dbe27cd0d..20bcf5590eb8 100644
--- a/sound/soc/sof/mediatek/mtk-adsp-common.c
+++ b/sound/soc/sof/mediatek/mtk-adsp-common.c
@@ -82,3 +82,4 @@ void mtk_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
 EXPORT_SYMBOL(mtk_adsp_dump);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF helpers for MTK ADSP platforms");
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 2d96d00f1c44..b196b2b74c26 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -100,3 +100,4 @@ void sof_acpi_remove(struct platform_device *pdev)
 EXPORT_SYMBOL_NS(sof_acpi_remove, SND_SOC_SOF_ACPI_DEV);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for ACPI platforms");
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index b9a499e92b9a..71f7153cf79c 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -93,3 +93,4 @@ void sof_of_shutdown(struct platform_device *pdev)
 EXPORT_SYMBOL(sof_of_shutdown);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for OF/DT platforms");
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 4365405783e6..38f2187da5de 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -304,3 +304,4 @@ void sof_pci_shutdown(struct pci_dev *pci)
 EXPORT_SYMBOL_NS(sof_pci_shutdown, SND_SOC_SOF_PCI_DEV);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for PCI platforms");
diff --git a/sound/soc/sof/sof-utils.c b/sound/soc/sof/sof-utils.c
index cad041bf56cc..44608682e9f8 100644
--- a/sound/soc/sof/sof-utils.c
+++ b/sound/soc/sof/sof-utils.c
@@ -73,3 +73,4 @@ int snd_sof_create_page_table(struct device *dev,
 EXPORT_SYMBOL(snd_sof_create_page_table);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF utils");
-- 
2.43.0

