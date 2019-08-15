Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837438F011
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 18:05:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 215D61671;
	Thu, 15 Aug 2019 18:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 215D61671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565885144;
	bh=TF5P5OMusNwnlpT2SY+aAbvg18L6HhwPnd1zLzm7uyg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enOp2zpyK3oJ3DDck2OhPH7y6sbM3AiZ8GTnCemcDYFe1yQj3yCPyUdnYoFyWFi5T
	 jJEbU1S37QGF3atB89quXH3lsxhI3Jwt5PG3+USnT7S8VQqHcTDYjqn2Pnczvaq5pP
	 ah6pbkfa64Mmf0asFHRLuvWyLpGI2VASdcmzLKY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA213F8060D;
	Thu, 15 Aug 2019 18:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 757D1F8060E; Thu, 15 Aug 2019 18:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47370F805FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 18:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47370F805FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 08:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="194790047"
Received: from ranofal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.136.131])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 08:58:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Aug 2019 10:57:49 -0500
Message-Id: <20190815155749.29304-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815155749.29304-1-pierre-louis.bossart@linux.intel.com>
References: <20190815155749.29304-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/4] ASoC: SOF: Intel: initial support for
	Elkhart Lake
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pan Xiuli <xiuli.pan@linux.intel.com>

Add Kconfig, PCI ID and chip info for EHL platform.

Note that the core mask is different from previous platforms, only
Core0 can be controlled by the host. Additional patches will be
required for multi-core functionality.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 16 ++++++++++++++++
 sound/soc/sof/intel/cnl.c   | 16 ++++++++++++++++
 sound/soc/sof/intel/hda.h   |  1 +
 sound/soc/sof/sof-pci-dev.c | 22 ++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 0dc5da661b61..889b6202d054 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -28,6 +28,7 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_COMETLAKE_LP if SND_SOC_SOF_COMETLAKE_LP_SUPPORT
 	select SND_SOC_SOF_COMETLAKE_H if SND_SOC_SOF_COMETLAKE_H_SUPPORT
 	select SND_SOC_SOF_TIGERLAKE   if SND_SOC_SOF_TIGERLAKE_SUPPORT
+	select SND_SOC_SOF_ELKHARTLAKE if SND_SOC_SOF_ELKHARTLAKE_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -228,6 +229,21 @@ config SND_SOC_SOF_TIGERLAKE
           This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_ELKHARTLAKE_SUPPORT
+	bool "SOF support for ElkhartLake"
+	help
+          This adds support for Sound Open Firmware for Intel(R) platforms
+          using the ElkhartLake processors.
+          Say Y if you have such a device.
+          If unsure select "N".
+
+config SND_SOC_SOF_ELKHARTLAKE
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+          This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
 config SND_SOC_SOF_HDA_COMMON
 	tristate
 	select SND_SOC_SOF_INTEL_COMMON
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 5de281fcc122..4ddd73762d81 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -311,3 +311,19 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
 EXPORT_SYMBOL(tgl_chip_info);
+
+const struct sof_intel_dsp_desc ehl_chip_info = {
+	/* Elkhartlake */
+	.cores_num = 4,
+	.init_core_mask = 1,
+	.cores_mask = HDA_DSP_CORE_MASK(0),
+	.ipc_req = CNL_DSP_REG_HIPCIDR,
+	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
+	.ipc_ack = CNL_DSP_REG_HIPCIDA,
+	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
+	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 300,
+	.ssp_count = ICL_SSP_COUNT,
+	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+};
+EXPORT_SYMBOL(ehl_chip_info);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index cbb431f7835d..5591841a1b6f 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -600,5 +600,6 @@ extern const struct sof_intel_dsp_desc cnl_chip_info;
 extern const struct sof_intel_dsp_desc skl_chip_info;
 extern const struct sof_intel_dsp_desc icl_chip_info;
 extern const struct sof_intel_dsp_desc tgl_chip_info;
+extern const struct sof_intel_dsp_desc ehl_chip_info;
 
 #endif
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 9f92504ad5b4..d66412a77873 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -221,6 +221,24 @@ static const struct sof_dev_desc tgl_desc = {
 };
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
+static const struct sof_dev_desc ehl_desc = {
+	.machines               = snd_soc_acpi_intel_ehl_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.resindex_dma_base      = -1,
+	.chip_info = &ehl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-ehl.ri",
+	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
+	.ops = &sof_cnl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
 static const struct dev_pm_ops sof_pci_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
@@ -406,6 +424,10 @@ static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
 	{ PCI_DEVICE(0x8086, 0xa0c8),
 		.driver_data = (unsigned long)&tgl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
+	{ PCI_DEVICE(0x8086, 0x4b55),
+		.driver_data = (unsigned long)&ehl_desc},
 #endif
 	{ 0, }
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
