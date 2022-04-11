Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7164FC5B6
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F38174D;
	Mon, 11 Apr 2022 22:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F38174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708576;
	bh=oWtnpqk77GmGdhmu0AAsx8eMc/vn6Uotit6DWrE7L7E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i9YO+0UDHTOrdgX1BU7Hj93Vs+walMoIpcCUsJXHSg3JtJFp8R42jpQ7R1+FSt7tA
	 YZs/Wb1059l0WFDRDwVg3oBxk/tkRXMnNdYqd5JUjoHPc8blfFp2KqOBsszmp0iOtx
	 grjef7S9bcmmDlUrQ5QMRgPkmQ2Vg4lf8ffG3s6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D95FF805A9;
	Mon, 11 Apr 2022 22:18:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACFE7F80557; Mon, 11 Apr 2022 22:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F1AAF80529
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F1AAF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cK3jlrzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708287; x=1681244287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oWtnpqk77GmGdhmu0AAsx8eMc/vn6Uotit6DWrE7L7E=;
 b=cK3jlrzctCtXhgqkDDPGUB1fQV7vyOacUmh4JcmGqyOpBDdhOtUqL2WV
 f9wdh4eXFk9dKHGIJsrpgfoTf3pNS7An5KcIXkbyReW84iLNGZGGcf8RT
 vBff8wl0AuVXXJSX+7pLCzjBqYPG9kfv7Kp62nxIy9GOVp30XGbb4aMCE
 XMYL4sjkQ2AcT1DdyovLbJW67YI9pTb2PPNmqi18LfWClY55viPmge3mH
 jL2N3d8aSPGX+Gl7RZNidjplYaBquq+WlQeVLffZIen+L8kxNwbgbXnm+
 j3YCcUFMihWfDA5VZ1AzUv+JFagCMP6lVOO0STtJQTiFiND35h1dhEEox Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090853"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090853"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135713"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/16] ASoC: SOF: Intel: add initial SKL/KBL hardware support
Date: Mon, 11 Apr 2022 15:17:26 -0500
Message-Id: <20220411201727.77971-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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
support for SkyLake and KabyLake boot and code loader and descriptors
used when probing the PCI driver.

The work was initially contributed in 2018 by Liam Girdwood and Zhu
Yingjiang, and abandoned due to firmware signature issues. With the
upcoming support of IPC v4, and hence the Intel closed-source
firmware, it's time to re-add this capability.

The SKL ops are left empty at this time since the driver cannot be
tested with the SOF firmware. The ops will be populated when the IPC4
is added during the next kernel cycles.

Tested with the IPC4 and closed-source firmware on Dell XPS 9350
and KBL NUC with HDaudio codecs. The SSP and DMIC interfaces are not
supported at this time.

Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig          |  24 ++
 sound/soc/sof/intel/Makefile         |   4 +
 sound/soc/sof/intel/hda-dsp.c        |   4 +-
 sound/soc/sof/intel/hda-ipc.c        |   8 +
 sound/soc/sof/intel/hda-loader-skl.c | 583 +++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c            |   2 +
 sound/soc/sof/intel/hda.h            |  12 +
 sound/soc/sof/intel/pci-skl.c        |  89 ++++
 sound/soc/sof/intel/skl.c            |  69 ++++
 9 files changed, 793 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-loader-skl.c
 create mode 100644 sound/soc/sof/intel/pci-skl.c
 create mode 100644 sound/soc/sof/intel/skl.c

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 172419392b33..b7b0934547e7 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -92,6 +92,30 @@ config SND_SOC_SOF_MERRIFIELD
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
+config SND_SOC_SOF_INTEL_SKL
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
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
index b9d51dc39ffa..b34dd9161ca2 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -6,7 +6,9 @@ snd-sof-acpi-intel-bdw-objs := bdw.o
 snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-bus.o \
+				 skl.o hda-loader-skl.o \
 				 apl.o cnl.o tgl.o icl.o hda-common-ops.o
+
 snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-probes.o
 
 snd-sof-intel-hda-objs := hda-codec.o
@@ -20,12 +22,14 @@ obj-$(CONFIG_SND_SOC_SOF_HDA_COMMON) += snd-sof-intel-hda-common.o
 obj-$(CONFIG_SND_SOC_SOF_HDA) += snd-sof-intel-hda.o
 
 snd-sof-pci-intel-tng-objs := pci-tng.o
+snd-sof-pci-intel-skl-objs := pci-skl.o
 snd-sof-pci-intel-apl-objs := pci-apl.o
 snd-sof-pci-intel-cnl-objs := pci-cnl.o
 snd-sof-pci-intel-icl-objs := pci-icl.o
 snd-sof-pci-intel-tgl-objs := pci-tgl.o
 
 obj-$(CONFIG_SND_SOC_SOF_MERRIFIELD) += snd-sof-pci-intel-tng.o
+obj-$(CONFIG_SND_SOC_SOF_INTEL_SKL) += snd-sof-pci-intel-skl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_APL) += snd-sof-pci-intel-apl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_CNL) += snd-sof-pci-intel-cnl.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_ICL) += snd-sof-pci-intel-icl.o
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index ad11df345be7..97a34c243383 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -113,7 +113,7 @@ static int hda_dsp_core_reset_leave(struct snd_sof_dev *sdev, unsigned int core_
 	return ret;
 }
 
-static int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask)
+int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	/* stall core */
 	snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
@@ -125,7 +125,7 @@ static int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_
 	return hda_dsp_core_reset_enter(sdev, core_mask);
 }
 
-static bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask)
+bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	int val;
 	bool is_enable;
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 0395638c43ae..f3ef1dfcf519 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -214,6 +214,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 /* Check if an IPC IRQ occurred */
 bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	bool ret = false;
 	u32 irq_status;
 
@@ -229,6 +230,13 @@ bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
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
new file mode 100644
index 000000000000..02f3b4384205
--- /dev/null
+++ b/sound/soc/sof/intel/hda-loader-skl.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+//
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <sound/hdaudio_ext.h>
+#include <sound/sof.h>
+#include <sound/pcm_params.h>
+
+#include "../sof-priv.h"
+#include "../ops.h"
+#include "hda.h"
+
+#define HDA_SKL_WAIT_TIMEOUT		500	/* 500 msec */
+#define HDA_SKL_CLDMA_MAX_BUFFER_SIZE	(32 * PAGE_SIZE)
+
+/* Stream Reset */
+#define HDA_CL_SD_CTL_SRST_SHIFT	0
+#define HDA_CL_SD_CTL_SRST(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_SRST_SHIFT)
+
+/* Stream Run */
+#define HDA_CL_SD_CTL_RUN_SHIFT		1
+#define HDA_CL_SD_CTL_RUN(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_RUN_SHIFT)
+
+/* Interrupt On Completion Enable */
+#define HDA_CL_SD_CTL_IOCE_SHIFT	2
+#define HDA_CL_SD_CTL_IOCE(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_IOCE_SHIFT)
+
+/* FIFO Error Interrupt Enable */
+#define HDA_CL_SD_CTL_FEIE_SHIFT	3
+#define HDA_CL_SD_CTL_FEIE(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_FEIE_SHIFT)
+
+/* Descriptor Error Interrupt Enable */
+#define HDA_CL_SD_CTL_DEIE_SHIFT	4
+#define HDA_CL_SD_CTL_DEIE(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_DEIE_SHIFT)
+
+/* FIFO Limit Change */
+#define HDA_CL_SD_CTL_FIFOLC_SHIFT	5
+#define HDA_CL_SD_CTL_FIFOLC(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_FIFOLC_SHIFT)
+
+/* Stripe Control */
+#define HDA_CL_SD_CTL_STRIPE_SHIFT	16
+#define HDA_CL_SD_CTL_STRIPE(x)		(((x) & 0x3) << \
+					HDA_CL_SD_CTL_STRIPE_SHIFT)
+
+/* Traffic Priority */
+#define HDA_CL_SD_CTL_TP_SHIFT		18
+#define HDA_CL_SD_CTL_TP(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_TP_SHIFT)
+
+/* Bidirectional Direction Control */
+#define HDA_CL_SD_CTL_DIR_SHIFT		19
+#define HDA_CL_SD_CTL_DIR(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_DIR_SHIFT)
+
+/* Stream Number */
+#define HDA_CL_SD_CTL_STRM_SHIFT	20
+#define HDA_CL_SD_CTL_STRM(x)		(((x) & 0xf) << \
+					HDA_CL_SD_CTL_STRM_SHIFT)
+
+#define HDA_CL_SD_CTL_INT(x)	\
+		(HDA_CL_SD_CTL_IOCE(x) | \
+		HDA_CL_SD_CTL_FEIE(x) | \
+		HDA_CL_SD_CTL_DEIE(x))
+
+#define HDA_CL_SD_CTL_INT_MASK	\
+		(HDA_CL_SD_CTL_IOCE(1) | \
+		HDA_CL_SD_CTL_FEIE(1) | \
+		HDA_CL_SD_CTL_DEIE(1))
+
+#define DMA_ADDRESS_128_BITS_ALIGNMENT	7
+#define BDL_ALIGN(x)			((x) >> DMA_ADDRESS_128_BITS_ALIGNMENT)
+
+/* Buffer Descriptor List Lower Base Address */
+#define HDA_CL_SD_BDLPLBA_SHIFT		7
+#define HDA_CL_SD_BDLPLBA_MASK		(0x1ffffff << HDA_CL_SD_BDLPLBA_SHIFT)
+#define HDA_CL_SD_BDLPLBA(x)		\
+	((BDL_ALIGN(lower_32_bits(x)) << HDA_CL_SD_BDLPLBA_SHIFT) & \
+	 HDA_CL_SD_BDLPLBA_MASK)
+
+/* Buffer Descriptor List Upper Base Address */
+#define HDA_CL_SD_BDLPUBA_SHIFT		0
+#define HDA_CL_SD_BDLPUBA_MASK		(0xffffffff << HDA_CL_SD_BDLPUBA_SHIFT)
+#define HDA_CL_SD_BDLPUBA(x)		\
+		((upper_32_bits(x) << HDA_CL_SD_BDLPUBA_SHIFT) & \
+		 HDA_CL_SD_BDLPUBA_MASK)
+
+/* Software Position in Buffer Enable */
+#define HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_SHIFT	0
+#define HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_MASK	\
+			(1 << HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_SHIFT)
+
+#define HDA_CL_SPBFIFO_SPBFCCTL_SPIBE(x)	\
+			(((x) << HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_SHIFT) & \
+			 HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_MASK)
+
+#define HDA_CL_DMA_SD_INT_COMPLETE		0x4
+
+static int cl_skl_cldma_setup_bdle(struct snd_sof_dev *sdev,
+				   struct snd_dma_buffer *dmab_data,
+				   __le32 **bdlp, int size, int with_ioc)
+{
+	phys_addr_t addr = virt_to_phys(dmab_data->area);
+	__le32 *bdl = *bdlp;
+
+	/*
+	 * This code is simplified by using one fragment of physical memory and assuming
+	 * all the code fits. This could be improved with scatter-gather but the firmware
+	 * size is limited by DSP memory anyways
+	 */
+	bdl[0] = cpu_to_le32(lower_32_bits(addr));
+	bdl[1] = cpu_to_le32(upper_32_bits(addr));
+	bdl[2] = cpu_to_le32(size);
+	bdl[3] = (!with_ioc) ? 0 : cpu_to_le32(0x01);
+
+	return 1; /* one fragment */
+}
+
+static void cl_skl_cldma_stream_run(struct snd_sof_dev *sdev, bool enable)
+{
+	int sd_offset = SOF_HDA_ADSP_LOADER_BASE;
+	unsigned char val;
+	int retries;
+	u32 run = enable ? 0x1 : 0;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_RUN(1), HDA_CL_SD_CTL_RUN(run));
+
+	retries = 300;
+	do {
+		udelay(3);
+
+		/* waiting for hardware to report the stream Run bit set */
+		val = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+				       sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL);
+		val &= HDA_CL_SD_CTL_RUN(1);
+		if (enable && val)
+			break;
+		else if (!enable && !val)
+			break;
+	} while (--retries);
+
+	if (retries == 0)
+		dev_err(sdev->dev, "%s: failed to set Run bit=%d enable=%d\n",
+			__func__, val, enable);
+}
+
+static void cl_skl_cldma_stream_clear(struct snd_sof_dev *sdev)
+{
+	int sd_offset = SOF_HDA_ADSP_LOADER_BASE;
+
+	/* make sure Run bit is cleared before setting stream register */
+	cl_skl_cldma_stream_run(sdev, 0);
+
+	/* Disable the Interrupt On Completion, FIFO Error Interrupt,
+	 * Descriptor Error Interrupt and set the cldma stream number to 0.
+	 */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_INT_MASK, HDA_CL_SD_CTL_INT(0));
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_STRM(0xf), HDA_CL_SD_CTL_STRM(0));
+
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL, HDA_CL_SD_BDLPLBA(0));
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU, 0);
+
+	/* Set the Cyclic Buffer Length to 0. */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_CBL, 0);
+	/* Set the Last Valid Index. */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_LVI, 0);
+}
+
+static void cl_skl_cldma_setup_spb(struct snd_sof_dev *sdev,
+				   unsigned int size, bool enable)
+{
+	int sd_offset = SOF_DSP_REG_CL_SPBFIFO;
+
+	if (enable)
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+					sd_offset + SOF_HDA_ADSP_REG_CL_SPBFIFO_SPBFCCTL,
+					HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_MASK,
+					HDA_CL_SPBFIFO_SPBFCCTL_SPIBE(1));
+
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SPBFIFO_SPIB, size);
+}
+
+static void cl_skl_cldma_set_intr(struct snd_sof_dev *sdev, bool enable)
+{
+	u32 val = enable ? HDA_DSP_ADSPIC_CL_DMA : 0;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
+				HDA_DSP_ADSPIC_CL_DMA, val);
+}
+
+static void cl_skl_cldma_cleanup_spb(struct snd_sof_dev *sdev)
+{
+	int sd_offset = SOF_DSP_REG_CL_SPBFIFO;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SPBFIFO_SPBFCCTL,
+				HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_MASK,
+				HDA_CL_SPBFIFO_SPBFCCTL_SPIBE(0));
+
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SPBFIFO_SPIB, 0);
+}
+
+static void cl_skl_cldma_setup_controller(struct snd_sof_dev *sdev,
+					  struct snd_dma_buffer *dmab_bdl,
+					  unsigned int max_size, u32 count)
+{
+	int sd_offset = SOF_HDA_ADSP_LOADER_BASE;
+
+	/* Clear the stream first and then set it. */
+	cl_skl_cldma_stream_clear(sdev);
+
+	/* setting the stream register */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL,
+			  HDA_CL_SD_BDLPLBA(dmab_bdl->addr));
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
+			  HDA_CL_SD_BDLPUBA(dmab_bdl->addr));
+
+	/* Set the Cyclic Buffer Length. */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_CBL, max_size);
+	/* Set the Last Valid Index. */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_LVI, count - 1);
+
+	/* Set the Interrupt On Completion, FIFO Error Interrupt,
+	 * Descriptor Error Interrupt and the cldma stream number.
+	 */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_INT_MASK, HDA_CL_SD_CTL_INT(1));
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_STRM(0xf),
+				HDA_CL_SD_CTL_STRM(1));
+}
+
+static int cl_stream_prepare_skl(struct snd_sof_dev *sdev,
+				 struct snd_dma_buffer *dmab,
+				 struct snd_dma_buffer *dmab_bdl)
+
+{
+	unsigned int bufsize = HDA_SKL_CLDMA_MAX_BUFFER_SIZE;
+	__le32 *bdl;
+	int frags;
+	int ret;
+
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev, bufsize, dmab);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: failed to alloc fw buffer: %x\n", __func__, ret);
+		return ret;
+	}
+
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev, bufsize, dmab_bdl);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: failed to alloc blde: %x\n", __func__, ret);
+		snd_dma_free_pages(dmab);
+		return ret;
+	}
+
+	bdl = (__le32 *)dmab_bdl->area;
+	frags = cl_skl_cldma_setup_bdle(sdev, dmab, &bdl, bufsize, 1);
+	cl_skl_cldma_setup_controller(sdev, dmab_bdl, bufsize, frags);
+
+	return ret;
+}
+
+static void cl_cleanup_skl(struct snd_sof_dev *sdev,
+			   struct snd_dma_buffer *dmab,
+			   struct snd_dma_buffer *dmab_bdl)
+{
+	cl_skl_cldma_cleanup_spb(sdev);
+	cl_skl_cldma_stream_clear(sdev);
+	snd_dma_free_pages(dmab);
+	snd_dma_free_pages(dmab_bdl);
+}
+
+static int cl_dsp_init_skl(struct snd_sof_dev *sdev,
+			   struct snd_dma_buffer *dmab,
+			   struct snd_dma_buffer *dmab_bdl)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	unsigned int status;
+	u32 flags;
+	int ret;
+
+	/* check if the init_core is already enabled, if yes, reset and make it run,
+	 * if not, powerdown and enable it again.
+	 */
+	if (hda_dsp_core_is_enabled(sdev, chip->init_core_mask)) {
+		/* if enabled, reset it, and run the init_core. */
+		ret = hda_dsp_core_stall_reset(sdev, chip->init_core_mask);
+		if (ret < 0)
+			goto err;
+
+		ret = hda_dsp_core_run(sdev, chip->init_core_mask);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: dsp core start failed %d\n", __func__, ret);
+			goto err;
+		}
+	} else {
+		/* if not enabled, power down it first and then powerup and run
+		 * the init_core.
+		 */
+		ret = hda_dsp_core_reset_power_down(sdev, chip->init_core_mask);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: dsp core0 disable fail: %d\n", __func__, ret);
+			goto err;
+		}
+		ret = hda_dsp_enable_core(sdev, chip->init_core_mask);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: dsp core0 enable fail: %d\n", __func__, ret);
+			goto err;
+		}
+	}
+
+	/* prepare DMA for code loader stream */
+	ret = cl_stream_prepare_skl(sdev, dmab, dmab_bdl);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: dma prepare fw loading err: %x\n", __func__, ret);
+		return ret;
+	}
+
+	/* enable the interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
+				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
+
+	/* enable IPC DONE interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, chip->ipc_ctl,
+				HDA_DSP_REG_HIPCCTL_DONE,
+				HDA_DSP_REG_HIPCCTL_DONE);
+
+	/* enable IPC BUSY interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, chip->ipc_ctl,
+				HDA_DSP_REG_HIPCCTL_BUSY,
+				HDA_DSP_REG_HIPCCTL_BUSY);
+
+	/* polling the ROM init status information. */
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
+					    chip->rom_status_reg, status,
+					    ((status & HDA_DSP_ROM_STS_MASK)
+					     == HDA_DSP_ROM_INIT),
+					    HDA_DSP_REG_POLL_INTERVAL_US,
+					    chip->rom_init_timeout *
+					    USEC_PER_MSEC);
+	if (ret < 0)
+		goto err;
+
+	return ret;
+
+err:
+	flags = SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX;
+
+	snd_sof_dsp_dbg_dump(sdev, "Boot failed\n", flags);
+	cl_cleanup_skl(sdev, dmab, dmab_bdl);
+	hda_dsp_core_reset_power_down(sdev, chip->init_core_mask);
+	return ret;
+}
+
+static void cl_skl_cldma_fill_buffer(struct snd_sof_dev *sdev,
+				     struct snd_dma_buffer *dmab,
+				     unsigned int bufsize,
+				     unsigned int copysize,
+				     const void *curr_pos,
+				     bool intr_enable)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+
+	/* copy the image into the buffer with the maximum buffer size. */
+	unsigned int size = (bufsize == copysize) ? bufsize : copysize;
+
+	memcpy(dmab->area, curr_pos, size);
+
+	/* Set the wait condition for every load. */
+	hda->code_loading = 1;
+
+	/* Set the interrupt. */
+	if (intr_enable)
+		cl_skl_cldma_set_intr(sdev, true);
+
+	/* Set the SPB. */
+	cl_skl_cldma_setup_spb(sdev, size, true);
+
+	/* Trigger the code loading stream. */
+	cl_skl_cldma_stream_run(sdev, true);
+}
+
+static int cl_skl_cldma_wait_interruptible(struct snd_sof_dev *sdev,
+					   bool intr_wait)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	int sd_offset = SOF_HDA_ADSP_LOADER_BASE;
+	u8 cl_dma_intr_status;
+
+	/*
+	 * Wait for CLDMA interrupt to inform the binary segment transfer is
+	 * complete.
+	 */
+	if (!wait_event_timeout(hda->waitq, !hda->code_loading,
+				msecs_to_jiffies(HDA_SKL_WAIT_TIMEOUT))) {
+		dev_err(sdev->dev, "cldma copy timeout\n");
+		dev_err(sdev->dev, "ROM code=%#x: FW status=%#x\n",
+			snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_ROM_ERROR),
+			snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->rom_status_reg));
+		return -EIO;
+	}
+
+	/* now check DMA interrupt status */
+	cl_dma_intr_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					      sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS);
+
+	if (!(cl_dma_intr_status & HDA_CL_DMA_SD_INT_COMPLETE)) {
+		dev_err(sdev->dev, "cldma copy failed\n");
+		return -EIO;
+	}
+
+	dev_dbg(sdev->dev, "cldma buffer copy complete\n");
+	return 0;
+}
+
+static int
+cl_skl_cldma_copy_to_buf(struct snd_sof_dev *sdev,
+			 struct snd_dma_buffer *dmab,
+			 const void *bin,
+			 u32 total_size, u32 bufsize)
+{
+	unsigned int bytes_left = total_size;
+	const void *curr_pos = bin;
+	int ret;
+
+	if (total_size <= 0)
+		return -EINVAL;
+
+	while (bytes_left > 0) {
+		if (bytes_left > bufsize) {
+			dev_dbg(sdev->dev, "cldma copy %#x bytes\n", bufsize);
+
+			cl_skl_cldma_fill_buffer(sdev, dmab, bufsize, bufsize, curr_pos, true);
+
+			ret = cl_skl_cldma_wait_interruptible(sdev, false);
+			if (ret < 0) {
+				dev_err(sdev->dev, "%s: fw failed to load. %#x bytes remaining\n",
+					__func__, bytes_left);
+				return ret;
+			}
+
+			bytes_left -= bufsize;
+			curr_pos += bufsize;
+		} else {
+			dev_dbg(sdev->dev, "cldma copy %#x bytes\n", bytes_left);
+
+			cl_skl_cldma_set_intr(sdev, false);
+			cl_skl_cldma_fill_buffer(sdev, dmab, bufsize, bytes_left, curr_pos, false);
+			return 0;
+		}
+	}
+
+	return bytes_left;
+}
+
+static int cl_copy_fw_skl(struct snd_sof_dev *sdev,
+			  struct snd_dma_buffer *dmab)
+
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	const struct firmware *fw =  plat_data->fw;
+	struct firmware stripped_firmware;
+	unsigned int bufsize = HDA_SKL_CLDMA_MAX_BUFFER_SIZE;
+	int ret;
+
+	stripped_firmware.data = plat_data->fw->data + plat_data->fw_offset;
+	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
+
+	dev_dbg(sdev->dev, "firmware size: %#zx buffer size %#x\n", fw->size, bufsize);
+
+	ret = cl_skl_cldma_copy_to_buf(sdev, dmab, stripped_firmware.data,
+				       stripped_firmware.size, bufsize);
+	if (ret < 0)
+		dev_err(sdev->dev, "%s: fw copy failed %d\n", __func__, ret);
+
+	return ret;
+}
+
+int hda_dsp_cl_boot_firmware_skl(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	struct snd_dma_buffer dmab_bdl;
+	struct snd_dma_buffer dmab;
+	unsigned int reg;
+	u32 flags;
+	int ret;
+
+	ret = cl_dsp_init_skl(sdev, &dmab, &dmab_bdl);
+
+	/* retry enabling core and ROM load. seemed to help */
+	if (ret < 0) {
+		ret = cl_dsp_init_skl(sdev, &dmab, &dmab_bdl);
+		if (ret < 0) {
+			dev_err(sdev->dev, "Error code=%#x: FW status=%#x\n",
+				snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_ROM_ERROR),
+				snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->rom_status_reg));
+			dev_err(sdev->dev, "Core En/ROM load fail:%d\n", ret);
+			return ret;
+		}
+	}
+
+	dev_dbg(sdev->dev, "ROM init successful\n");
+
+	/* at this point DSP ROM has been initialized and should be ready for
+	 * code loading and firmware boot
+	 */
+	ret = cl_copy_fw_skl(sdev, &dmab);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: load firmware failed : %d\n", __func__, ret);
+		goto err;
+	}
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
+					    chip->rom_status_reg, reg,
+					    ((reg & HDA_DSP_ROM_STS_MASK)
+					     == HDA_DSP_ROM_RFW_START),
+					    HDA_DSP_REG_POLL_INTERVAL_US,
+					    HDA_DSP_BASEFW_TIMEOUT_US);
+
+	dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
+
+	cl_skl_cldma_stream_run(sdev, false);
+	cl_cleanup_skl(sdev, &dmab, &dmab_bdl);
+
+	if (!ret)
+		return chip->init_core_mask;
+
+	return ret;
+
+err:
+	flags = SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX;
+
+	snd_sof_dsp_dbg_dump(sdev, "Boot failed\n", flags);
+
+	/* power down DSP */
+	hda_dsp_core_reset_power_down(sdev, chip->init_core_mask);
+	cl_skl_cldma_stream_run(sdev, false);
+	cl_cleanup_skl(sdev, &dmab, &dmab_bdl);
+
+	dev_err(sdev->dev, "%s: load fw failed err: %d\n", __func__, ret);
+	return ret;
+}
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index d34cd4d341c5..61c924ec6df3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -999,6 +999,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 
 	INIT_DELAYED_WORK(&hdev->d0i3_work, hda_dsp_d0i3_work);
 
+	init_waitqueue_head(&hdev->waitq);
+
 	return 0;
 
 free_ipc_irq:
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 36445482a122..e100e1597f29 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -359,6 +359,7 @@
 #endif
 
 /* Intel HD Audio SRAM Window 0*/
+#define HDA_DSP_SRAM_REG_ROM_STATUS_SKL	0x8000
 #define HDA_ADSP_SRAM0_BASE_SKL		0x8000
 
 /* Firmware status window */
@@ -449,6 +450,9 @@ struct sof_intel_hda_dev {
 
 	/* FW clock config, 0:HPRO, 1:LPRO */
 	bool clk_config_lpro;
+
+	wait_queue_head_t waitq;
+	bool code_loading;
 };
 
 static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
@@ -497,6 +501,7 @@ int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 int hda_dsp_core_get(struct snd_sof_dev *sdev, int core);
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
+bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask);
 
 int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 			    const struct sof_dsp_power_state *target_state);
@@ -696,6 +701,8 @@ extern struct snd_soc_dai_driver skl_dai[];
  */
 extern struct snd_sof_dsp_ops sof_hda_common_ops;
 
+extern struct snd_sof_dsp_ops sof_skl_ops;
+int sof_skl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_apl_ops;
 int sof_apl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_cnl_ops;
@@ -705,6 +712,7 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_icl_ops;
 int sof_icl_ops_init(struct snd_sof_dev *sdev);
 
+extern const struct sof_intel_dsp_desc skl_chip_info;
 extern const struct sof_intel_dsp_desc apl_chip_info;
 extern const struct sof_intel_dsp_desc cnl_chip_info;
 extern const struct sof_intel_dsp_desc icl_chip_info;
@@ -754,4 +762,8 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_f
 
 extern int sof_hda_position_quirk;
 
+/* SKL/KBL */
+int hda_dsp_cl_boot_firmware_skl(struct snd_sof_dev *sdev);
+int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask);
+
 #endif
diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
new file mode 100644
index 000000000000..2b803f8b32e9
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
index 000000000000..e13c8a4b4634
--- /dev/null
+++ b/sound/soc/sof/intel/skl.c
@@ -0,0 +1,69 @@
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
+};
+EXPORT_SYMBOL_NS(skl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.30.2

