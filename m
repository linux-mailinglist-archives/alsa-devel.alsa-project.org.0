Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988D7730FB
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:13:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3D62A4D;
	Mon,  7 Aug 2023 23:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3D62A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442792;
	bh=J/Wy9gEFcG5Up1iNPTSTz+eRaxi9o/aqKnsb0gnXxCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rlGZpoPeOhsqZNM9dKO0sSCcZhnNVO2p3hlupuyq4JtQ5LPiaOOgfvLR6EcWtRP5Q
	 bvWN7rOfib5Q/JypXnOYFwm1m2eQF6B2M0+TBOvWfJ+Y55gm/Y5YAdX7qLbPbK5FqY
	 Q3QjDOoNX7tT2TK+PJ/KghZpSSwGDlt12Xz2Q9Ao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C210FF805BA; Mon,  7 Aug 2023 23:10:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05799F805BA;
	Mon,  7 Aug 2023 23:10:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 727C6F80588; Mon,  7 Aug 2023 23:10:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1DB9F80520
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1DB9F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=inTipy4P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442621; x=1722978621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J/Wy9gEFcG5Up1iNPTSTz+eRaxi9o/aqKnsb0gnXxCY=;
  b=inTipy4PZfQVDnAcA/nB6eGmGEkp+Qm0rRcZfI4TshznR5EDJ71ETd9Z
   ii7Ju9djzHR862cLZJmeEIMiE0vz4IcpzlkWiDLfiwZXk+LhByuTirpy+
   XeqPOgVq7RoFpY9becJmEg9vc0jsFfe7HQY4s14OJbFYsQmH24CJ7otIz
   XOwRWtCzsnC8x23lN5z2CaoYeX31NdCPzysg8t7SpXvmV3odeHEJv4bhG
   r+VNgZWYGV6EeE1+ZixoxRy2je2yfG8cgGI22J8hkfB79xytLMwEetvRP
   6Z2Yj52xvDDqjNpYBKmdA2Xcop5gE2ygOYud0sf6myzFcZMBdhPEW3IcM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244333"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244333"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465187"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465187"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 06/20] ASoC: SOF: Intel: LNL: Add support for Lunarlake
 platform
Date: Mon,  7 Aug 2023 16:09:45 -0500
Message-Id: <20230807210959.506849-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CMTNMM6ORDBBYXDRTAOMIW4CGT2BAZTG
X-Message-ID-Hash: CMTNMM6ORDBBYXDRTAOMIW4CGT2BAZTG
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add initial support for Lunarlake. For now only HDAudio interfaces are
supported, DMIC/SSP/SoundWire require additional work so that the DAIs
reuse the HDaudio DMA stream allocation.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig   | 16 ++++++++
 sound/soc/sof/intel/Makefile  |  4 +-
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/intel/lnl.c     | 66 ++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/pci-lnl.c | 72 +++++++++++++++++++++++++++++++++++
 5 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/intel/lnl.c
 create mode 100644 sound/soc/sof/intel/pci-lnl.c

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 69c1a370d3b6..9d0107932117 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -262,6 +262,22 @@ config SND_SOC_SOF_METEORLAKE
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
+config SND_SOC_SOF_INTEL_LNL
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	select SND_SOC_SOF_INTEL_IPC4
+
+config SND_SOC_SOF_LUNARLAKE
+	tristate "SOF support for Lunarlake"
+	default SND_SOC_SOF_PCI
+	select SND_SOC_SOF_INTEL_LNL
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Lunarlake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
 config SND_SOC_SOF_HDA_COMMON
 	tristate
 	select SND_SOC_SOF_INTEL_COMMON
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index fdb463c12e91..030574dbc998 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -7,7 +7,7 @@ snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-dai-ops.o hda-bus.o \
 				 skl.o hda-loader-skl.o \
-				 apl.o cnl.o tgl.o icl.o mtl.o hda-common-ops.o
+				 apl.o cnl.o tgl.o icl.o mtl.o lnl.o hda-common-ops.o
 
 snd-sof-intel-hda-mlink-objs := hda-mlink.o
 
@@ -31,6 +31,7 @@ snd-sof-pci-intel-cnl-objs := pci-cnl.o
 snd-sof-pci-intel-icl-objs := pci-icl.o
 snd-sof-pci-intel-tgl-objs := pci-tgl.o
 snd-sof-pci-intel-mtl-objs := pci-mtl.o
+snd-sof-pci-intel-lnl-objs := pci-lnl.o
 
 obj-$(CONFIG_SND_SOC_SOF_MERRIFIELD) += snd-sof-pci-intel-tng.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_SKL) += snd-sof-pci-intel-skl.o
@@ -39,3 +40,4 @@ obj-$(CONFIG_SND_SOC_SOF_INTEL_CNL) += snd-sof-pci-intel-cnl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_ICL) += snd-sof-pci-intel-icl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TGL) += snd-sof-pci-intel-tgl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_MTL) += snd-sof-pci-intel-mtl.o
+obj-$(CONFIG_SND_SOC_SOF_INTEL_LNL) += snd-sof-pci-intel-lnl.o
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3f7c6fb05e5d..fae3be291861 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -856,6 +856,7 @@ extern const struct sof_intel_dsp_desc ehl_chip_info;
 extern const struct sof_intel_dsp_desc jsl_chip_info;
 extern const struct sof_intel_dsp_desc adls_chip_info;
 extern const struct sof_intel_dsp_desc mtl_chip_info;
+extern const struct sof_intel_dsp_desc lnl_chip_info;
 
 /* Probes support */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
new file mode 100644
index 000000000000..535a0fd36f38
--- /dev/null
+++ b/sound/soc/sof/intel/lnl.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright(c) 2023 Intel Corporation. All rights reserved.
+
+/*
+ * Hardware interface for audio DSP on LunarLake.
+ */
+
+#include <linux/firmware.h>
+#include <sound/hda_register.h>
+#include <sound/sof/ipc4/header.h>
+#include <trace/events/sof_intel.h>
+#include "../ipc4-priv.h"
+#include "../ops.h"
+#include "hda.h"
+#include "hda-ipc.h"
+#include "../sof-audio.h"
+#include "mtl.h"
+#include "hda.h"
+#include <sound/hda-mlink.h>
+
+/* Check if an SDW IRQ occurred */
+static bool lnl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	return hdac_bus_eml_check_interrupt(bus, true,  AZX_REG_ML_LEPTR_ID_SDW);
+}
+
+static void lnl_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	hdac_bus_eml_enable_interrupt(bus, true,  AZX_REG_ML_LEPTR_ID_SDW, enable);
+}
+
+static int lnl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
+{
+	lnl_enable_sdw_irq(sdev, false);
+	mtl_disable_ipc_interrupts(sdev);
+	return mtl_enable_interrupts(sdev, false);
+}
+
+const struct sof_intel_dsp_desc lnl_chip_info = {
+	.cores_num = 5,
+	.init_core_mask = BIT(0),
+	.host_managed_cores_mask = BIT(0),
+	.ipc_req = MTL_DSP_REG_HFIPCXIDR,
+	.ipc_req_mask = MTL_DSP_REG_HFIPCXIDR_BUSY,
+	.ipc_ack = MTL_DSP_REG_HFIPCXIDA,
+	.ipc_ack_mask = MTL_DSP_REG_HFIPCXIDA_DONE,
+	.ipc_ctl = MTL_DSP_REG_HFIPCXCTL,
+	.rom_status_reg = MTL_DSP_ROM_STS,
+	.rom_init_timeout = 300,
+	.ssp_count = MTL_SSP_COUNT,
+	.d0i3_offset = MTL_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_ext,
+	.enable_sdw_irq = lnl_enable_sdw_irq,
+	.check_sdw_irq = lnl_dsp_check_sdw_irq,
+	.check_ipc_irq = mtl_dsp_check_ipc_irq,
+	.cl_init = mtl_dsp_cl_init,
+	.power_down_dsp = mtl_power_down_dsp,
+	.disable_interrupts = lnl_dsp_disable_interrupts,
+	.hw_ip_version = SOF_INTEL_ACE_2_0,
+};
+EXPORT_SYMBOL_NS(lnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
new file mode 100644
index 000000000000..55c757737a95
--- /dev/null
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2023 Intel Corporation. All rights reserved.
+//
+// Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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
+static const struct sof_dev_desc lnl_desc = {
+	.use_acpi_target_states	= true,
+	.machines               = snd_soc_acpi_intel_lnl_machines,
+	.alt_machines		= snd_soc_acpi_intel_lnl_sdw_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.chip_info		= &lnl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_INTEL_IPC4,
+	.dspless_mode_supported	= true,
+	.default_fw_path = {
+		[SOF_INTEL_IPC4] = "intel/sof-ipc4/lnl",
+	},
+	.default_tplg_path = {
+		[SOF_INTEL_IPC4] = "intel/sof-ace-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_INTEL_IPC4] = "sof-lnl.ri",
+	},
+	.nocodec_tplg_filename = "sof-lnl-nocodec.tplg",
+	/* the MTL ops are still used for now */
+	.ops = &sof_mtl_ops,
+	.ops_init = sof_mtl_ops_init,
+};
+
+/* PCI IDs */
+static const struct pci_device_id sof_pci_ids[] = {
+	{ PCI_DEVICE_DATA(INTEL, HDA_LNL_P, &lnl_desc) }, /* LNL-P */
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, sof_pci_ids);
+
+/* pci_driver definition */
+static struct pci_driver snd_sof_pci_intel_lnl_driver = {
+	.name = "sof-audio-pci-intel-lnl",
+	.id_table = sof_pci_ids,
+	.probe = hda_pci_intel_probe,
+	.remove = sof_pci_remove,
+	.shutdown = sof_pci_shutdown,
+	.driver = {
+		.pm = &sof_pci_pm,
+	},
+};
+module_pci_driver(snd_sof_pci_intel_lnl_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
+MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
-- 
2.39.2

