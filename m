Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BD904C3F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 09:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9AFBDF9;
	Wed, 12 Jun 2024 09:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9AFBDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718175696;
	bh=TFp9KTxFH8YkiPBoejjkkcdXXFeSeaXuTbZHmIoFrOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kQjPS5A+tjqABtRRGXs9kRxAU71PFtNW2sM6imR8OQDnyAXwAR91prR92TKd1n8em
	 3NiHiaLTtGmTI5a1vi0eF4JMFEPUj5T5yDWi2lmpezPR+LjYj36Qd6/XWwv9pmSd+x
	 hmZEgwqkosl/m5XgMvQiM1zZioteuFRXUgczX2mc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94FD6F805C2; Wed, 12 Jun 2024 09:01:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC30F805B6;
	Wed, 12 Jun 2024 09:01:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C107F80579; Wed, 12 Jun 2024 09:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5F6FF80588
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F6FF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f2jZnEAG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718175574; x=1749711574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TFp9KTxFH8YkiPBoejjkkcdXXFeSeaXuTbZHmIoFrOs=;
  b=f2jZnEAG6aSqrVp2iHTbD3sCnBiPEATnxCBFO8FVPMojxcAqfBpJjFyV
   ZGY/nMuDYf12KhwbsvJ0zMTbigaEuMA7HI4gjkEz6BIXxXY2Ei3imb0AO
   Q+jBQsHIaVmOt85QU35Isa85DFbwJ82j+UgHirdXtxFLnjwSPsOfz01KI
   v4BK3+9MaQMCW5CEeMfYZFW3wffxcU4NoRG7UaBEnuCz30GVEqoojVRVX
   mh0sy/OH3oyJ3djUGvZ22vBSVpfWDR9Ghbmsl0p0gPltT6ninE03+QBAp
   cbfTZfknIiVGdknHQRLBP79/xYGAzDLGPOAHjV+Ooel46n6FIlTAtWrvd
   A==;
X-CSE-ConnectionGUID: IcmcIgxTS/qDX74eGhFy3g==
X-CSE-MsgGUID: iN/QU0keS4qQeganWvoBwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15147434"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="15147434"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:30 -0700
X-CSE-ConnectionGUID: Mz6UrC/hT7WThJ2nmfiMmg==
X-CSE-MsgGUID: ErhqHidsQHu8hAHB/9fMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="70486878"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.56])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 2/5] ASoC: SOF: Intel: add initial support for PTL
Date: Wed, 12 Jun 2024 08:58:55 +0200
Message-ID: <20240612065858.53041-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
References: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IBAUEHZ4R7OBBYOZRMP43CKA7U5P37XG
X-Message-ID-Hash: IBAUEHZ4R7OBBYOZRMP43CKA7U5P37XG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBAUEHZ4R7OBBYOZRMP43CKA7U5P37XG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clone LNL for now.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig   | 17 ++++++++
 sound/soc/sof/intel/Makefile  |  2 +
 sound/soc/sof/intel/hda-dsp.c |  1 +
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/intel/lnl.c     | 27 ++++++++++++
 sound/soc/sof/intel/pci-ptl.c | 77 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/shim.h    |  1 +
 7 files changed, 126 insertions(+)
 create mode 100644 sound/soc/sof/intel/pci-ptl.c

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 3396bd46b778..2c43558d96b9 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -281,6 +281,23 @@ config SND_SOC_SOF_LUNARLAKE
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
+config SND_SOC_SOF_INTEL_PTL
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	select SND_SOC_SOF_IPC4
+	select SND_SOC_SOF_INTEL_LNL
+
+config SND_SOC_SOF_PANTHERLAKE
+	tristate "SOF support for Pantherlake"
+	default SND_SOC_SOF_PCI
+	select SND_SOC_SOF_INTEL_PTL
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Pantherlake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
 config SND_SOC_SOF_HDA_COMMON
 	tristate
 
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index b56fa5530b8b..f40daa616803 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -34,6 +34,7 @@ snd-sof-pci-intel-icl-y := pci-icl.o icl.o
 snd-sof-pci-intel-tgl-y := pci-tgl.o tgl.o
 snd-sof-pci-intel-mtl-y := pci-mtl.o mtl.o
 snd-sof-pci-intel-lnl-y := pci-lnl.o lnl.o
+snd-sof-pci-intel-ptl-y := pci-ptl.o
 
 obj-$(CONFIG_SND_SOC_SOF_MERRIFIELD) += snd-sof-pci-intel-tng.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_SKL) += snd-sof-pci-intel-skl.o
@@ -43,3 +44,4 @@ obj-$(CONFIG_SND_SOC_SOF_INTEL_ICL) += snd-sof-pci-intel-icl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TGL) += snd-sof-pci-intel-tgl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_MTL) += snd-sof-pci-intel-mtl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_LNL) += snd-sof-pci-intel-lnl.o
+obj-$(CONFIG_SND_SOC_SOF_INTEL_PTL) += snd-sof-pci-intel-ptl.o
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 1315f5bc3e31..4c88522d4048 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -69,6 +69,7 @@ static void hda_get_interfaces(struct snd_sof_dev *sdev, u32 *interface_mask)
 		interface_mask[SOF_DAI_HOST_ACCESS] = BIT(SOF_DAI_INTEL_HDA);
 		break;
 	case SOF_INTEL_ACE_2_0:
+	case SOF_INTEL_ACE_3_0:
 		interface_mask[SOF_DAI_DSP_ACCESS] =
 			BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
 			BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3c9e1d59e1ab..b74a472435b5 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -920,6 +920,7 @@ extern const struct sof_intel_dsp_desc adls_chip_info;
 extern const struct sof_intel_dsp_desc mtl_chip_info;
 extern const struct sof_intel_dsp_desc arl_s_chip_info;
 extern const struct sof_intel_dsp_desc lnl_chip_info;
+extern const struct sof_intel_dsp_desc ptl_chip_info;
 
 /* Probes support */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 4b5665f82170..3d5a1f8b17e5 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -22,6 +22,7 @@
 
 /* LunarLake ops */
 struct snd_sof_dsp_ops sof_lnl_ops;
+EXPORT_SYMBOL_NS(sof_lnl_ops, SND_SOC_SOF_INTEL_LNL);
 
 static const struct snd_sof_debugfs_map lnl_dsp_debugfs[] = {
 	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
@@ -181,6 +182,7 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 };
+EXPORT_SYMBOL_NS(sof_lnl_ops_init, SND_SOC_SOF_INTEL_LNL);
 
 /* Check if an SDW IRQ occurred */
 static bool lnl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
@@ -245,3 +247,28 @@ const struct sof_intel_dsp_desc lnl_chip_info = {
 	.disable_interrupts = lnl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_2_0,
 };
+
+const struct sof_intel_dsp_desc ptl_chip_info = {
+	.cores_num = 5,
+	.init_core_mask = BIT(0),
+	.host_managed_cores_mask = BIT(0),
+	.ipc_req = MTL_DSP_REG_HFIPCXIDR,
+	.ipc_req_mask = MTL_DSP_REG_HFIPCXIDR_BUSY,
+	.ipc_ack = MTL_DSP_REG_HFIPCXIDA,
+	.ipc_ack_mask = MTL_DSP_REG_HFIPCXIDA_DONE,
+	.ipc_ctl = MTL_DSP_REG_HFIPCXCTL,
+	.rom_status_reg = LNL_DSP_REG_HFDSC,
+	.rom_init_timeout = 300,
+	.ssp_count = MTL_SSP_COUNT,
+	.d0i3_offset = MTL_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_ext,
+	.enable_sdw_irq = lnl_enable_sdw_irq,
+	.check_sdw_irq = lnl_dsp_check_sdw_irq,
+	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
+	.check_ipc_irq = mtl_dsp_check_ipc_irq,
+	.cl_init = mtl_dsp_cl_init,
+	.power_down_dsp = mtl_power_down_dsp,
+	.disable_interrupts = lnl_dsp_disable_interrupts,
+	.hw_ip_version = SOF_INTEL_ACE_3_0,
+};
+EXPORT_SYMBOL_NS(ptl_chip_info, SND_SOC_SOF_INTEL_LNL);
diff --git a/sound/soc/sof/intel/pci-ptl.c b/sound/soc/sof/intel/pci-ptl.c
new file mode 100644
index 000000000000..69195b5e7b1a
--- /dev/null
+++ b/sound/soc/sof/intel/pci-ptl.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2024 Intel Corporation.
+//
+
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include <sound/sof.h>
+#include "../ops.h"
+#include "../sof-pci-dev.h"
+
+/* platform specific devices */
+#include "hda.h"
+#include "mtl.h"
+
+static const struct sof_dev_desc ptl_desc = {
+	.use_acpi_target_states	= true,
+	.machines               = snd_soc_acpi_intel_ptl_machines,
+	.alt_machines		= snd_soc_acpi_intel_ptl_sdw_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.chip_info		= &ptl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_4),
+	.ipc_default		= SOF_IPC_TYPE_4,
+	.dspless_mode_supported	= true,
+	.default_fw_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/ptl",
+	},
+	.default_lib_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/ptl",
+	},
+	.default_tplg_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_IPC_TYPE_4] = "sof-ptl.ri",
+	},
+	.nocodec_tplg_filename = "sof-ptl-nocodec.tplg",
+	.ops = &sof_lnl_ops,
+	.ops_init = sof_lnl_ops_init,
+};
+
+/* PCI IDs */
+static const struct pci_device_id sof_pci_ids[] = {
+	{ PCI_DEVICE_DATA(INTEL, HDA_PTL, &ptl_desc) }, /* PTL */
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, sof_pci_ids);
+
+/* pci_driver definition */
+static struct pci_driver snd_sof_pci_intel_ptl_driver = {
+	.name = "sof-audio-pci-intel-ptl",
+	.id_table = sof_pci_ids,
+	.probe = hda_pci_intel_probe,
+	.remove = sof_pci_remove,
+	.shutdown = sof_pci_shutdown,
+	.driver = {
+		.pm = &sof_pci_pm,
+	},
+};
+module_pci_driver(snd_sof_pci_intel_ptl_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF support for PantherLake platforms");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_LNL);
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_MTL);
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
+MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 9328d2bbfd03..8709b750a11e 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -22,6 +22,7 @@ enum sof_intel_hw_ip_version {
 	SOF_INTEL_CAVS_2_5,	/* TigerLake, AlderLake */
 	SOF_INTEL_ACE_1_0,	/* MeteorLake */
 	SOF_INTEL_ACE_2_0,	/* LunarLake */
+	SOF_INTEL_ACE_3_0,	/* PantherLake */
 };
 
 /*
-- 
2.43.0

