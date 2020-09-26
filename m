Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4904227980A
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Sep 2020 11:01:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4393218E4;
	Sat, 26 Sep 2020 11:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4393218E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601110912;
	bh=dUGPp18k5uIlM6tS636wiHSNiGwPie+CZESi67mm9Xc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dGa1OaR8tuSCYaE3Z+eBvky+mVqSD+VYmQWIgoWkgoMO1XtlVrWJoh0Q1dCbGt0WV
	 0fE7SB7jzkBzkAkvWmJtSbyfU3uNS84Vkw3KrO8UyDaw5LHZ2crjnzC1+CGnp7jS+G
	 +QZClbeB2uVVLwLtqfl8Q+1nWN3q6FbULTIZqdZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1720EF80290;
	Sat, 26 Sep 2020 10:59:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C786F80259; Sat, 26 Sep 2020 10:59:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67364F800FD
 for <alsa-devel@alsa-project.org>; Sat, 26 Sep 2020 10:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67364F800FD
IronPort-SDR: mGtj7WV82/t0V0O2oaWSnJZ8nim2v6PIMT5EZ/Q1+BPHlp+etZnXpjd+hfHUlGt5AW1ptrI16k
 3mZV1TVw6o9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="149389318"
X-IronPort-AV: E=Sophos;i="5.77,305,1596524400"; d="scan'208";a="149389318"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2020 01:59:20 -0700
IronPort-SDR: rumAij+R9cB0ZIHAgXoWlI0widpY2WTUz8FZ1UEqnWSepsMtSe/zk3UE4e3Z9HLsz606dIIGvF
 IKrLeaRt+tmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,305,1596524400"; d="scan'208";a="414198395"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2020 01:59:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v9 01/14] ASoC: Intel: Add catpt base members
Date: Sat, 26 Sep 2020 10:58:57 +0200
Message-Id: <20200926085910.21948-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926085910.21948-1-cezary.rojewski@intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

Declare base structures, registers and extension routines for the catpt
solution.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 sound/soc/intel/catpt/core.h      |  86 ++++++++++++++
 sound/soc/intel/catpt/dsp.c       | 138 +++++++++++++++++++++++
 sound/soc/intel/catpt/loader.c    |  46 ++++++++
 sound/soc/intel/catpt/registers.h | 179 ++++++++++++++++++++++++++++++
 4 files changed, 449 insertions(+)
 create mode 100644 sound/soc/intel/catpt/core.h
 create mode 100644 sound/soc/intel/catpt/dsp.c
 create mode 100644 sound/soc/intel/catpt/loader.c
 create mode 100644 sound/soc/intel/catpt/registers.h

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
new file mode 100644
index 000000000000..48952e93d86f
--- /dev/null
+++ b/sound/soc/intel/catpt/core.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ *
+ * Author: Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#ifndef __SND_SOC_INTEL_CATPT_CORE_H
+#define __SND_SOC_INTEL_CATPT_CORE_H
+
+#include <linux/dma/dw.h>
+#include "registers.h"
+
+struct catpt_dev;
+
+void catpt_sram_init(struct resource *sram, u32 start, u32 size);
+void catpt_sram_free(struct resource *sram);
+struct resource *
+catpt_request_region(struct resource *root, resource_size_t size);
+
+static inline bool catpt_resource_overlapping(struct resource *r1,
+					      struct resource *r2,
+					      struct resource *ret)
+{
+	if (!resource_overlaps(r1, r2))
+		return false;
+	ret->start = max(r1->start, r2->start);
+	ret->end = min(r1->end, r2->end);
+	return true;
+}
+
+struct catpt_module_type {
+	bool loaded;
+	u32 entry_point;
+	u32 persistent_size;
+	u32 scratch_size;
+	/* DRAM, initial module state */
+	u32 state_offset;
+	u32 state_size;
+
+	struct list_head node;
+};
+
+struct catpt_spec {
+	struct snd_soc_acpi_mach *machines;
+	u8 core_id;
+	u32 host_dram_offset;
+	u32 host_iram_offset;
+	u32 host_shim_offset;
+	u32 host_dma_offset[CATPT_DMA_COUNT];
+	u32 host_ssp_offset[CATPT_SSP_COUNT];
+	u32 dram_mask;
+	u32 iram_mask;
+	void (*pll_shutdown)(struct catpt_dev *cdev, bool enable);
+	int (*power_up)(struct catpt_dev *cdev);
+	int (*power_down)(struct catpt_dev *cdev);
+};
+
+struct catpt_dev {
+	struct device *dev;
+	struct dw_dma_chip *dmac;
+
+	void __iomem *pci_ba;
+	void __iomem *lpe_ba;
+	u32 lpe_base;
+	int irq;
+
+	const struct catpt_spec *spec;
+	struct completion fw_ready;
+
+	struct resource dram;
+	struct resource iram;
+	struct resource *scratch;
+};
+
+int catpt_dmac_probe(struct catpt_dev *cdev);
+void catpt_dmac_remove(struct catpt_dev *cdev);
+struct dma_chan *catpt_dma_request_config_chan(struct catpt_dev *cdev);
+int catpt_dma_memcpy_todsp(struct catpt_dev *cdev, struct dma_chan *chan,
+			   dma_addr_t dst_addr, dma_addr_t src_addr,
+			   size_t size);
+int catpt_dma_memcpy_fromdsp(struct catpt_dev *cdev, struct dma_chan *chan,
+			     dma_addr_t dst_addr, dma_addr_t src_addr,
+			     size_t size);
+
+#endif
diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
new file mode 100644
index 000000000000..c78da206a9fe
--- /dev/null
+++ b/sound/soc/intel/catpt/dsp.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include "core.h"
+#include "registers.h"
+
+static bool catpt_dma_filter(struct dma_chan *chan, void *param)
+{
+	return param == chan->device->dev;
+}
+
+/*
+ * Either engine 0 or 1 can be used for image loading.
+ * Align with Windows driver equivalent and stick to engine 1.
+ */
+#define CATPT_DMA_DEVID		1
+#define CATPT_DMA_DSP_ADDR_MASK	GENMASK(31, 20)
+
+struct dma_chan *catpt_dma_request_config_chan(struct catpt_dev *cdev)
+{
+	struct dma_slave_config config;
+	struct dma_chan *chan;
+	dma_cap_mask_t mask;
+	int ret;
+
+	dma_cap_zero(mask);
+	dma_cap_set(DMA_MEMCPY, mask);
+
+	chan = dma_request_channel(mask, catpt_dma_filter, cdev->dev);
+	if (!chan) {
+		dev_err(cdev->dev, "request channel failed\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	memset(&config, 0, sizeof(config));
+	config.direction = DMA_MEM_TO_DEV;
+	config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	config.src_maxburst = 16;
+	config.dst_maxburst = 16;
+
+	ret = dmaengine_slave_config(chan, &config);
+	if (ret) {
+		dev_err(cdev->dev, "slave config failed: %d\n", ret);
+		dma_release_channel(chan);
+		return ERR_PTR(ret);
+	}
+
+	return chan;
+}
+
+static int catpt_dma_memcpy(struct catpt_dev *cdev, struct dma_chan *chan,
+			    dma_addr_t dst_addr, dma_addr_t src_addr,
+			    size_t size)
+{
+	struct dma_async_tx_descriptor *desc;
+	enum dma_status status;
+
+	desc = dmaengine_prep_dma_memcpy(chan, dst_addr, src_addr, size,
+					 DMA_CTRL_ACK);
+	if (!desc) {
+		dev_err(cdev->dev, "prep dma memcpy failed\n");
+		return -EIO;
+	}
+
+	/* enable demand mode for dma channel */
+	catpt_updatel_shim(cdev, HMDC,
+			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id),
+			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id));
+	dmaengine_submit(desc);
+	status = dma_wait_for_async_tx(desc);
+	/* regardless of status, disable access to HOST memory in demand mode */
+	catpt_updatel_shim(cdev, HMDC,
+			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id), 0);
+
+	return (status == DMA_COMPLETE) ? 0 : -EPROTO;
+}
+
+int catpt_dma_memcpy_todsp(struct catpt_dev *cdev, struct dma_chan *chan,
+			   dma_addr_t dst_addr, dma_addr_t src_addr,
+			   size_t size)
+{
+	return catpt_dma_memcpy(cdev, chan, dst_addr | CATPT_DMA_DSP_ADDR_MASK,
+				src_addr, size);
+}
+
+int catpt_dma_memcpy_fromdsp(struct catpt_dev *cdev, struct dma_chan *chan,
+			     dma_addr_t dst_addr, dma_addr_t src_addr,
+			     size_t size)
+{
+	return catpt_dma_memcpy(cdev, chan, dst_addr,
+				src_addr | CATPT_DMA_DSP_ADDR_MASK, size);
+}
+
+int catpt_dmac_probe(struct catpt_dev *cdev)
+{
+	struct dw_dma_chip *dmac;
+	int ret;
+
+	dmac = devm_kzalloc(cdev->dev, sizeof(*dmac), GFP_KERNEL);
+	if (!dmac)
+		return -ENOMEM;
+
+	dmac->regs = cdev->lpe_ba + cdev->spec->host_dma_offset[CATPT_DMA_DEVID];
+	dmac->dev = cdev->dev;
+	dmac->irq = cdev->irq;
+
+	ret = dma_coerce_mask_and_coherent(cdev->dev, DMA_BIT_MASK(31));
+	if (ret)
+		return ret;
+	/*
+	 * Caller is responsible for putting device in D0 to allow
+	 * for I/O and memory access before probing DW.
+	 */
+	ret = dw_dma_probe(dmac);
+	if (ret)
+		return ret;
+
+	cdev->dmac = dmac;
+	return 0;
+}
+
+void catpt_dmac_remove(struct catpt_dev *cdev)
+{
+	/*
+	 * As do_dma_remove() juggles with pm_runtime_get_xxx() and
+	 * pm_runtime_put_xxx() while both ADSP and DW 'devices' are part of
+	 * the same module, caller makes sure pm_runtime_disable() is invoked
+	 * before removing DW to prevent postmortem resume and suspend.
+	 */
+	dw_dma_remove(cdev->dmac);
+}
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
new file mode 100644
index 000000000000..3a7e5b396a86
--- /dev/null
+++ b/sound/soc/intel/catpt/loader.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
+#include "core.h"
+
+void catpt_sram_init(struct resource *sram, u32 start, u32 size)
+{
+	sram->start = start;
+	sram->end = start + size - 1;
+}
+
+void catpt_sram_free(struct resource *sram)
+{
+	struct resource *res, *save;
+
+	for (res = sram->child; res;) {
+		save = res->sibling;
+		release_resource(res);
+		kfree(res);
+		res = save;
+	}
+}
+
+struct resource *
+catpt_request_region(struct resource *root, resource_size_t size)
+{
+	struct resource *res = root->child;
+	resource_size_t addr = root->start;
+
+	for (;;) {
+		if (res->start - addr >= size)
+			break;
+		addr = res->end + 1;
+		res = res->sibling;
+		if (!res)
+			return NULL;
+	}
+
+	return __request_region(root, addr, size, NULL, 0);
+}
diff --git a/sound/soc/intel/catpt/registers.h b/sound/soc/intel/catpt/registers.h
new file mode 100644
index 000000000000..a051d8b36d88
--- /dev/null
+++ b/sound/soc/intel/catpt/registers.h
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ *
+ * Author: Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#ifndef __SND_SOC_INTEL_CATPT_REGS_H
+#define __SND_SOC_INTEL_CATPT_REGS_H
+
+#include <linux/bitops.h>
+#include <linux/iopoll.h>
+#include <uapi/linux/pci_regs.h>
+
+#define CATPT_SHIM_REGS_SIZE	4096
+#define CATPT_DMA_REGS_SIZE	1024
+#define CATPT_DMA_COUNT		2
+#define CATPT_SSP_COUNT		2
+#define CATPT_SSP_REGS_SIZE	512
+
+/* DSP Shim registers */
+
+#define CATPT_SHIM_CS1		0x00
+#define CATPT_SHIM_ISC		0x18
+#define CATPT_SHIM_ISD		0x20
+#define CATPT_SHIM_IMC		0x28
+#define CATPT_SHIM_IMD		0x30
+#define CATPT_SHIM_IPCC		0x38
+#define CATPT_SHIM_IPCD		0x40
+#define CATPT_SHIM_CLKCTL	0x78
+#define CATPT_SHIM_CS2		0x80
+#define CATPT_SHIM_LTRC		0xE0
+#define CATPT_SHIM_HMDC		0xE8
+
+#define CATPT_CS_LPCS		BIT(31)
+#define CATPT_CS_SFCR(ssp)	BIT(27 + (ssp))
+#define CATPT_CS_S1IOCS		BIT(23)
+#define CATPT_CS_S0IOCS		BIT(21)
+#define CATPT_CS_PCE		BIT(15)
+#define CATPT_CS_SDPM(ssp)	BIT(11 + (ssp))
+#define CATPT_CS_STALL		BIT(10)
+#define CATPT_CS_DCS		GENMASK(6, 4)
+/* b100 DSP core & audio fabric high clock */
+#define CATPT_CS_DCS_HIGH	(0x4 << 4)
+#define CATPT_CS_SBCS(ssp)	BIT(2 + (ssp))
+#define CATPT_CS_RST		BIT(1)
+
+#define CATPT_ISC_IPCDB		BIT(1)
+#define CATPT_ISC_IPCCD		BIT(0)
+#define CATPT_ISD_DCPWM		BIT(31)
+#define CATPT_ISD_IPCCB		BIT(1)
+#define CATPT_ISD_IPCDD		BIT(0)
+
+#define CATPT_IMC_IPCDB		BIT(1)
+#define CATPT_IMC_IPCCD		BIT(0)
+#define CATPT_IMD_IPCCB		BIT(1)
+#define CATPT_IMD_IPCDD		BIT(0)
+
+#define CATPT_IPCC_BUSY		BIT(31)
+#define CATPT_IPCC_DONE		BIT(30)
+#define CATPT_IPCD_BUSY		BIT(31)
+#define CATPT_IPCD_DONE		BIT(30)
+
+#define CATPT_CLKCTL_CFCIP	BIT(31)
+#define CATPT_CLKCTL_SMOS	GENMASK(25, 24)
+
+#define CATPT_HMDC_HDDA(e, ch)	BIT(8 * (e) + (ch))
+
+/* defaults to reset SHIM registers to after each power cycle */
+#define CATPT_CS_DEFAULT	0x8480040E
+#define CATPT_ISC_DEFAULT	0x0
+#define CATPT_ISD_DEFAULT	0x0
+#define CATPT_IMC_DEFAULT	0x7FFF0003
+#define CATPT_IMD_DEFAULT	0x7FFF0003
+#define CATPT_IPCC_DEFAULT	0x0
+#define CATPT_IPCD_DEFAULT	0x0
+#define CATPT_CLKCTL_DEFAULT	0x7FF
+#define CATPT_CS2_DEFAULT	0x0
+#define CATPT_LTRC_DEFAULT	0x0
+#define CATPT_HMDC_DEFAULT	0x0
+
+/* PCI Configuration registers */
+
+#define CATPT_PCI_PMCAPID	0x80
+#define CATPT_PCI_PMCS		(CATPT_PCI_PMCAPID + PCI_PM_CTRL)
+#define CATPT_PCI_VDRTCTL0	0xA0
+#define CATPT_PCI_VDRTCTL2	0xA8
+
+#define CATPT_VDRTCTL2_DTCGE	BIT(10)
+#define CATPT_VDRTCTL2_DCLCGE	BIT(1)
+#define CATPT_VDRTCTL2_CGEALL	0xF7F
+
+/* LPT PCI Configuration bits */
+
+#define LPT_VDRTCTL0_DSRAMPGE(b)	BIT(16 + (b))
+#define LPT_VDRTCTL0_DSRAMPGE_MASK	GENMASK(31, 16)
+#define LPT_VDRTCTL0_ISRAMPGE(b)	BIT(6 + (b))
+#define LPT_VDRTCTL0_ISRAMPGE_MASK	GENMASK(15, 6)
+#define LPT_VDRTCTL0_D3SRAMPGD		BIT(2)
+#define LPT_VDRTCTL0_D3PGD		BIT(1)
+#define LPT_VDRTCTL0_APLLSE		BIT(0)
+
+/* WPT PCI Configuration bits */
+
+#define WPT_VDRTCTL0_DSRAMPGE(b)	BIT(12 + (b))
+#define WPT_VDRTCTL0_DSRAMPGE_MASK	GENMASK(31, 12)
+#define WPT_VDRTCTL0_ISRAMPGE(b)	BIT(2 + (b))
+#define WPT_VDRTCTL0_ISRAMPGE_MASK	GENMASK(11, 2)
+#define WPT_VDRTCTL0_D3SRAMPGD		BIT(1)
+#define WPT_VDRTCTL0_D3PGD		BIT(0)
+
+#define WPT_VDRTCTL2_APLLSE		BIT(31)
+
+/* defaults to reset SSP registers to after each power cycle */
+#define CATPT_SSC0_DEFAULT		0x0
+#define CATPT_SSC1_DEFAULT		0x0
+#define CATPT_SSS_DEFAULT		0xF004
+#define CATPT_SSIT_DEFAULT		0x0
+#define CATPT_SSD_DEFAULT		0xC43893A3
+#define CATPT_SSTO_DEFAULT		0x0
+#define CATPT_SSPSP_DEFAULT		0x0
+#define CATPT_SSTSA_DEFAULT		0x0
+#define CATPT_SSRSA_DEFAULT		0x0
+#define CATPT_SSTSS_DEFAULT		0x0
+#define CATPT_SSCR2_DEFAULT		0x0
+#define CATPT_SSPSP2_DEFAULT		0x0
+
+/* Physically the same block, access address differs between host and dsp */
+#define CATPT_DSP_DRAM_OFFSET		0x400000
+#define catpt_to_host_offset(offset)	((offset) & ~(CATPT_DSP_DRAM_OFFSET))
+#define catpt_to_dsp_offset(offset)	((offset) | CATPT_DSP_DRAM_OFFSET)
+
+#define CATPT_MEMBLOCK_SIZE	0x8000
+#define catpt_num_dram(cdev)	(hweight_long((cdev)->spec->dram_mask))
+#define catpt_num_iram(cdev)	(hweight_long((cdev)->spec->iram_mask))
+#define catpt_dram_size(cdev)	(catpt_num_dram(cdev) * CATPT_MEMBLOCK_SIZE)
+#define catpt_iram_size(cdev)	(catpt_num_iram(cdev) * CATPT_MEMBLOCK_SIZE)
+
+/* registry I/O helpers */
+
+#define catpt_shim_addr(cdev) \
+	((cdev)->lpe_ba + (cdev)->spec->host_shim_offset)
+#define catpt_dma_addr(cdev, dma) \
+	((cdev)->lpe_ba + (cdev)->spec->host_dma_offset[dma])
+#define catpt_ssp_addr(cdev, ssp) \
+	((cdev)->lpe_ba + (cdev)->spec->host_ssp_offset[ssp])
+#define catpt_inbox_addr(cdev) \
+	((cdev)->lpe_ba + (cdev)->ipc.config.inbox_offset)
+#define catpt_outbox_addr(cdev) \
+	((cdev)->lpe_ba + (cdev)->ipc.config.outbox_offset)
+
+#define catpt_writel_ssp(cdev, ssp, reg, val) \
+	writel(val, catpt_ssp_addr(cdev, ssp) + (reg))
+
+#define catpt_readl_shim(cdev, reg) \
+	readl(catpt_shim_addr(cdev) + CATPT_SHIM_##reg)
+#define catpt_writel_shim(cdev, reg, val) \
+	writel(val, catpt_shim_addr(cdev) + CATPT_SHIM_##reg)
+#define catpt_updatel_shim(cdev, reg, mask, val) \
+	catpt_writel_shim(cdev, reg, \
+			  (catpt_readl_shim(cdev, reg) & ~(mask)) | (val))
+
+#define catpt_readl_poll_shim(cdev, reg, val, cond, delay_us, timeout_us) \
+	readl_poll_timeout(catpt_shim_addr(cdev) + CATPT_SHIM_##reg, \
+			   val, cond, delay_us, timeout_us)
+
+#define catpt_readl_pci(cdev, reg) \
+	readl(cdev->pci_ba + CATPT_PCI_##reg)
+#define catpt_writel_pci(cdev, reg, val) \
+	writel(val, cdev->pci_ba + CATPT_PCI_##reg)
+#define catpt_updatel_pci(cdev, reg, mask, val) \
+	catpt_writel_pci(cdev, reg, \
+			 (catpt_readl_pci(cdev, reg) & ~(mask)) | (val))
+
+#define catpt_readl_poll_pci(cdev, reg, val, cond, delay_us, timeout_us) \
+	readl_poll_timeout((cdev)->pci_ba + CATPT_PCI_##reg, \
+			   val, cond, delay_us, timeout_us)
+
+#endif
-- 
2.17.1

