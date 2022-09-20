Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1D5BE6E3
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2205163D;
	Tue, 20 Sep 2022 15:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2205163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663679996;
	bh=ycyzkBkXleZvFFFnnbPapWsO8RywyTCUsr9UQY3Msf4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HFtNwS8mQCdA8BznZePQmIH5pCNQxcXwz1/g0Daw9bJCrvF1L4OlJo0GS6RfGNE41
	 KI6qJqwbMLuKJgUvkqflyyZMHm3mxnDPxEci0nb2+EqvGVBkYycIomf4VwQ1hMXjo/
	 f/h8TSHvgxzeFScBcTmRSvk236wTQwhxeNOG8g70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DD30F80563;
	Tue, 20 Sep 2022 15:17:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3682BF8055C; Tue, 20 Sep 2022 15:17:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5215F80539
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5215F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="e3wRCzI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663679862; x=1695215862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ycyzkBkXleZvFFFnnbPapWsO8RywyTCUsr9UQY3Msf4=;
 b=e3wRCzI05zxRaaeRMtzJxNSQJ1i+yezDaKl85ZiQESxwMgrO1rdOMnVd
 OMIZ8yGhrI8uPBeUiL/9ysAAYgWeNFyoqhhIu1zr5g3GmxI4fXuG6iUmJ
 tYUIcpeC6OkOStq/NaXMRraFtPl+we0pGBGOlyQiNebSWf2eoObUstMJx
 XAbHp8FD4SsBAory62T4mZnj3l/3fgIrE5MavntAQILlaIpYBIGdirzGj
 XVoAHQPY3fZXWWAa+eSh5CgzRC4lU6CtUv61YKC3kd2n/xDLa0yplVwvZ
 Axun3J3HUOqQQwBoYWDKygPfYWJjZ4u4fHNZ8TrzBoTToqi5ieMZkF0wT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282719158"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="282719158"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="652089698"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/4] ASoC: SOF: Intel: add initial SKL/KBL hardware support
Date: Tue, 20 Sep 2022 15:16:59 +0200
Message-Id: <20220920131700.133103-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
References: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

In preparation of the IPCv4 IPC support, this patch adds
support for SkyLake and KabyLake boot and descriptors
used when probing the PCI driver.

The work was initially contributed in 2018 by Liam Girdwood and Zhu
Yingjiang, and abandoned due to firmware signature issues. With the
upcoming support of IPC v4, and hence the Intel closed-source
firmware, it's time to re-add this capability.

The SKL ops will be added in the next patch.

Tested with the IPC4 and closed-source firmware on Dell XPS 9350
and KBL NUC with HDaudio codecs. The SSP and DMIC interfaces are not
supported at this time.

Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig          | 25 ++++++++
 sound/soc/sof/intel/Makefile         |  4 ++
 sound/soc/sof/intel/hda-ipc.c        |  8 +++
 sound/soc/sof/intel/hda-loader-skl.c |  7 +--
 sound/soc/sof/intel/hda.c            |  2 +
 sound/soc/sof/intel/hda.h            |  4 ++
 sound/soc/sof/intel/pci-skl.c        | 89 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/skl.c            | 70 ++++++++++++++++++++++
 8 files changed, 204 insertions(+), 5 deletions(-)
 create mode 100644 sound/soc/sof/intel/pci-skl.c
 create mode 100644 sound/soc/sof/intel/skl.c

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 3f54678e810ba..7af495fb61256 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -95,6 +95,31 @@ config SND_SOC_SOF_MERRIFIELD
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
+config SND_SOC_SOF_INTEL_SKL
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_IPC4
+
+config SND_SOC_SOF_SKYLAKE
+	tristate "SOF support for SkyLake"
+	default SND_SOC_SOF_PCI
+	select SND_SOC_SOF_INTEL_SKL
+	help
+	  This adds support for the Intel(R) platforms using the SkyLake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+	  This is intended only for developers and not a recommend option for distros.
+
+config SND_SOC_SOF_KABYLAKE
+	tristate "SOF support for KabyLake"
+	default SND_SOC_SOF_PCI
+	select SND_SOC_SOF_INTEL_SKL
+	help
+	  This adds support for the Intel(R) platforms using the KabyLake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+	  This is intended only for developers and not a recommend option for distros.
+
 config SND_SOC_SOF_INTEL_APL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index a079159bb2f02..8b8ea03617850 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -6,7 +6,9 @@ snd-sof-acpi-intel-bdw-objs := bdw.o
 snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-bus.o \
+				 skl.o hda-loader-skl.o \
 				 apl.o cnl.o tgl.o icl.o mtl.o hda-common-ops.o
+
 snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-probes.o
 
 snd-sof-intel-hda-objs := hda-codec.o
@@ -20,6 +22,7 @@ obj-$(CONFIG_SND_SOC_SOF_HDA_COMMON) += snd-sof-intel-hda-common.o
 obj-$(CONFIG_SND_SOC_SOF_HDA) += snd-sof-intel-hda.o
 
 snd-sof-pci-intel-tng-objs := pci-tng.o
+snd-sof-pci-intel-skl-objs := pci-skl.o
 snd-sof-pci-intel-apl-objs := pci-apl.o
 snd-sof-pci-intel-cnl-objs := pci-cnl.o
 snd-sof-pci-intel-icl-objs := pci-icl.o
@@ -27,6 +30,7 @@ snd-sof-pci-intel-tgl-objs := pci-tgl.o
 snd-sof-pci-intel-mtl-objs := pci-mtl.o
 
 obj-$(CONFIG_SND_SOC_SOF_MERRIFIELD) += snd-sof-pci-intel-tng.o
+obj-$(CONFIG_SND_SOC_SOF_INTEL_SKL) += snd-sof-pci-intel-skl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_APL) += snd-sof-pci-intel-apl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_CNL) += snd-sof-pci-intel-cnl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_ICL) += snd-sof-pci-intel-icl.o
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index c597ef491d383..9b3667c705e47 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -304,6 +304,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 /* Check if an IPC IRQ occurred */
 bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	bool ret = false;
 	u32 irq_status;
 
@@ -319,6 +320,13 @@ bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 	if (irq_status & HDA_DSP_ADSPIS_IPC)
 		ret = true;
 
+	/* CLDMA message ? */
+	if (irq_status & HDA_DSP_ADSPIS_CL_DMA) {
+		hda->code_loading = 0;
+		wake_up(&hda->waitq);
+		ret = false;
+	}
+
 out:
 	return ret;
 }
diff --git a/sound/soc/sof/intel/hda-loader-skl.c b/sound/soc/sof/intel/hda-loader-skl.c
index 6f7e7444f11c1..0193fb3964a05 100644
--- a/sound/soc/sof/intel/hda-loader-skl.c
+++ b/sound/soc/sof/intel/hda-loader-skl.c
@@ -93,17 +93,14 @@
 
 /* Buffer Descriptor List Lower Base Address */
 #define HDA_CL_SD_BDLPLBA_SHIFT		7
-#define HDA_CL_SD_BDLPLBA_MASK		(0x1ffffff << HDA_CL_SD_BDLPLBA_SHIFT)
+#define HDA_CL_SD_BDLPLBA_MASK		GENMASK(31, 7)
 #define HDA_CL_SD_BDLPLBA(x)		\
 	((BDL_ALIGN(lower_32_bits(x)) << HDA_CL_SD_BDLPLBA_SHIFT) & \
 	 HDA_CL_SD_BDLPLBA_MASK)
 
 /* Buffer Descriptor List Upper Base Address */
-#define HDA_CL_SD_BDLPUBA_SHIFT		0
-#define HDA_CL_SD_BDLPUBA_MASK		(0xffffffff << HDA_CL_SD_BDLPUBA_SHIFT)
 #define HDA_CL_SD_BDLPUBA(x)		\
-		((upper_32_bits(x) << HDA_CL_SD_BDLPUBA_SHIFT) & \
-		 HDA_CL_SD_BDLPUBA_MASK)
+			(upper_32_bits(x))
 
 /* Software Position in Buffer Enable */
 #define HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_SHIFT	0
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index eec54c8bb0e9a..f7068a7e2e818 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1136,6 +1136,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 
 	INIT_DELAYED_WORK(&hdev->d0i3_work, hda_dsp_d0i3_work);
 
+	init_waitqueue_head(&hdev->waitq);
+
 	hdev->nhlt = intel_nhlt_init(sdev->dev);
 
 	return 0;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 6ad8dafce098e..2013a94020c62 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -419,6 +419,7 @@
 #endif
 
 /* Intel HD Audio SRAM Window 0*/
+#define HDA_DSP_SRAM_REG_ROM_STATUS_SKL	0x8000
 #define HDA_ADSP_SRAM0_BASE_SKL		0x8000
 
 /* Firmware status window */
@@ -774,6 +775,8 @@ int hda_dsp_dais_suspend(struct snd_sof_dev *sdev);
  */
 extern struct snd_sof_dsp_ops sof_hda_common_ops;
 
+extern struct snd_sof_dsp_ops sof_skl_ops;
+int sof_skl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_apl_ops;
 int sof_apl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_cnl_ops;
@@ -785,6 +788,7 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_mtl_ops;
 int sof_mtl_ops_init(struct snd_sof_dev *sdev);
 
+extern const struct sof_intel_dsp_desc skl_chip_info;
 extern const struct sof_intel_dsp_desc apl_chip_info;
 extern const struct sof_intel_dsp_desc cnl_chip_info;
 extern const struct sof_intel_dsp_desc icl_chip_info;
diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
new file mode 100644
index 0000000000000..2b803f8b32e99
--- /dev/null
+++ b/sound/soc/sof/intel/pci-skl.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
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
+
+static struct sof_dev_desc skl_desc = {
+	.machines		= snd_soc_acpi_intel_skl_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.chip_info = &skl_chip_info,
+	.irqindex_host_ipc	= -1,
+	.ipc_supported_mask	= BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_INTEL_IPC4,
+	.default_fw_path = {
+		[SOF_INTEL_IPC4] = "intel/avs/skl",
+	},
+	.default_tplg_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
+	.nocodec_tplg_filename = "sof-skl-nocodec.tplg",
+	.ops = &sof_skl_ops,
+};
+
+static struct sof_dev_desc kbl_desc = {
+	.machines		= snd_soc_acpi_intel_kbl_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.chip_info = &skl_chip_info,
+	.irqindex_host_ipc	= -1,
+	.ipc_supported_mask	= BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_INTEL_IPC4,
+	.default_fw_path = {
+		[SOF_INTEL_IPC4] = "intel/avs/kbl",
+	},
+	.default_tplg_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
+	.nocodec_tplg_filename = "sof-kbl-nocodec.tplg",
+	.ops = &sof_skl_ops,
+};
+
+/* PCI IDs */
+static const struct pci_device_id sof_pci_ids[] = {
+	/* Sunrise Point-LP */
+	{ PCI_DEVICE(0x8086, 0x9d70), .driver_data = (unsigned long)&skl_desc},
+	/* KBL */
+	{ PCI_DEVICE(0x8086, 0x9d71), .driver_data = (unsigned long)&kbl_desc},
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, sof_pci_ids);
+
+/* pci_driver definition */
+static struct pci_driver snd_sof_pci_intel_skl_driver = {
+	.name = "sof-audio-pci-intel-skl",
+	.id_table = sof_pci_ids,
+	.probe = hda_pci_intel_probe,
+	.remove = sof_pci_remove,
+	.shutdown = sof_pci_shutdown,
+	.driver = {
+		.pm = &sof_pci_pm,
+	},
+};
+module_pci_driver(snd_sof_pci_intel_skl_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
+MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
new file mode 100644
index 0000000000000..446a7afddfdbe
--- /dev/null
+++ b/sound/soc/sof/intel/skl.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+//
+
+/*
+ * Hardware interface for audio DSP on Skylake and Kabylake.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/pci.h>
+#include <linux/pm_runtime.h>
+#include <sound/hdaudio_ext.h>
+#include <sound/pcm_params.h>
+#include <sound/sof.h>
+
+#include "../sof-priv.h"
+#include "../ops.h"
+#include "hda.h"
+#include "../sof-audio.h"
+
+#define SRAM_MEMORY_WINDOW_BASE 0x8000
+
+static const __maybe_unused struct snd_sof_debugfs_map skl_dsp_debugfs[] = {
+	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000},
+	{"pp", HDA_DSP_PP_BAR,  0, 0x1000},
+	{"dsp", HDA_DSP_BAR,  0, 0x10000},
+};
+
+static int __maybe_unused skl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	return SRAM_MEMORY_WINDOW_BASE + (0x2000 * id);
+}
+
+/* skylake ops */
+struct snd_sof_dsp_ops sof_skl_ops = {
+	/*
+	 * the ops are left empty at this stage since the SOF releases do not
+	 * support SKL/KBL.
+	 * The ops will be populated when support for the Intel IPC4 is added
+	 * to the SOF driver
+	 */
+};
+EXPORT_SYMBOL(sof_skl_ops);
+
+const struct sof_intel_dsp_desc skl_chip_info = {
+	.cores_num = 2,
+	.init_core_mask = 1,
+	.host_managed_cores_mask = GENMASK(1, 0),
+	.ipc_req = HDA_DSP_REG_HIPCI,
+	.ipc_req_mask = HDA_DSP_REG_HIPCI_BUSY,
+	.ipc_ack = HDA_DSP_REG_HIPCIE,
+	.ipc_ack_mask = HDA_DSP_REG_HIPCIE_DONE,
+	.ipc_ctl = HDA_DSP_REG_HIPCCTL,
+	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS_SKL,
+	.rom_init_timeout	= 300,
+	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_1_5,
+};
+EXPORT_SYMBOL_NS(skl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.34.1

