Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2B426A9D1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 18:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71B6816B6;
	Tue, 15 Sep 2020 18:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71B6816B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600187500;
	bh=wtczT6GwjobjJxP+Gck8KBge9W+6764c3XDHfKWT+u0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yviawu5qhU2irTU7zPA9mrcqkvTkHQ8nwO6hYHE+R9aJRXRgC5loawjflFDlsWoK6
	 Puljcg8WBXTAm+h22w8RzdA662vkKkHjNp3gRdbIDekKtHK1fbHUOtFdx1wrucJwyp
	 dsU4nIZKTwJHHHv8H1BSLiVyPQ8QseiU2c/aFs0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18EBBF80290;
	Tue, 15 Sep 2020 18:30:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D88F6F8028B; Tue, 15 Sep 2020 18:30:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEF41F80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 18:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF41F80146
IronPort-SDR: PaMz61K0LDfPcMLl/QndVAgLrdDaqu1iIaq0vAMV07UHvatOK4HFpUXh/RDguNe5R14peVUXuX
 HioT5hqWuB5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="177365859"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="177365859"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 09:30:27 -0700
IronPort-SDR: d/ywKo+5MJezOrZSUouUz+yaEfZrxHL0/hMk18p1vQeNY/kCIQ9nJ9zn0B+xLmpSmbU5DfEoZU
 K6e3DtS5erVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="302218632"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 15 Sep 2020 09:30:23 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 01/13] ASoC: Intel: Add catpt device
Date: Tue, 15 Sep 2020 18:29:32 +0200
Message-Id: <20200915162944.16241-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915162944.16241-1-cezary.rojewski@intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

Declare base structures, registers and device routines for the catpt
solution. Catpt deprecates and is a direct replacement for
sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point both.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h      | 187 ++++++++++++++++
 sound/soc/intel/catpt/device.c    | 354 ++++++++++++++++++++++++++++++
 sound/soc/intel/catpt/registers.h | 178 +++++++++++++++
 3 files changed, 719 insertions(+)
 create mode 100644 sound/soc/intel/catpt/core.h
 create mode 100644 sound/soc/intel/catpt/device.c
 create mode 100644 sound/soc/intel/catpt/registers.h

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
new file mode 100644
index 000000000000..57d89960acc0
--- /dev/null
+++ b/sound/soc/intel/catpt/core.h
@@ -0,0 +1,187 @@
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
+#include <linux/irqreturn.h>
+#include "messages.h"
+#include "registers.h"
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
+struct catpt_ipc_msg {
+	union {
+		u32 header;
+		union catpt_global_msg rsp;
+	};
+	void *data;
+	size_t size;
+};
+
+struct catpt_ipc {
+	struct device *dev;
+
+	struct catpt_ipc_msg rx;
+	struct catpt_fw_ready config;
+	u32 default_timeout;
+	bool ready;
+
+	spinlock_t lock;
+	struct mutex mutex;
+	struct completion done_completion;
+	struct completion busy_completion;
+};
+
+void catpt_ipc_init(struct catpt_ipc *ipc, struct device *dev);
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
+	struct catpt_ipc ipc;
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
+
+	struct catpt_mixer_stream_info mixer;
+	struct catpt_module_type modules[CATPT_MODULE_COUNT];
+	struct catpt_ssp_device_format devfmt[CATPT_SSP_COUNT];
+	struct list_head stream_list;
+	spinlock_t list_lock;
+	struct mutex clk_mutex;
+
+	struct catpt_dx_context dx_ctx;
+	void *dxbuf_vaddr;
+	dma_addr_t dxbuf_paddr;
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
+void lpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable);
+void wpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable);
+int lpt_dsp_power_up(struct catpt_dev *cdev);
+int lpt_dsp_power_down(struct catpt_dev *cdev);
+int wpt_dsp_power_up(struct catpt_dev *cdev);
+int wpt_dsp_power_down(struct catpt_dev *cdev);
+int catpt_dsp_stall(struct catpt_dev *cdev, bool stall);
+void catpt_dsp_update_srampge(struct catpt_dev *cdev, struct resource *sram,
+			      unsigned long mask);
+int catpt_dsp_update_lpclock(struct catpt_dev *cdev);
+irqreturn_t catpt_dsp_irq_handler(int irq, void *dev_id);
+irqreturn_t catpt_dsp_irq_thread(int irq, void *dev_id);
+
+/*
+ * IPC handlers may return positive values which denote successful
+ * HOST <-> DSP communication yet failure to process specific request.
+ * Use below macro to convert returned non-zero values appropriately
+ */
+#define CATPT_IPC_ERROR(err) (((err) < 0) ? (err) : -EREMOTEIO)
+
+int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
+			       struct catpt_ipc_msg request,
+			       struct catpt_ipc_msg *reply, int timeout);
+int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
+		       struct catpt_ipc_msg *reply);
+
+int catpt_first_boot_firmware(struct catpt_dev *cdev);
+int catpt_boot_firmware(struct catpt_dev *cdev, bool restore);
+int catpt_store_streams_context(struct catpt_dev *cdev, struct dma_chan *chan);
+int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *chan);
+int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan);
+int catpt_coredump(struct catpt_dev *cdev);
+
+int catpt_sysfs_create(struct catpt_dev *cdev);
+void catpt_sysfs_remove(struct catpt_dev *cdev);
+
+#include <sound/memalloc.h>
+#include <uapi/sound/asound.h>
+
+struct snd_pcm_substream;
+struct catpt_stream_template;
+
+struct catpt_stream_runtime {
+	struct snd_pcm_substream *substream;
+
+	struct catpt_stream_template *template;
+	struct catpt_stream_info info;
+	struct resource *persistent;
+	struct snd_dma_buffer pgtbl;
+
+	bool allocated;
+	bool prepared;
+
+	struct list_head node;
+};
+
+int catpt_register_plat_component(struct catpt_dev *cdev);
+void catpt_stream_update_position(struct catpt_dev *cdev,
+				  struct catpt_stream_runtime *stream,
+				  struct catpt_notify_position *pos);
+struct catpt_stream_runtime *
+catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id);
+int catpt_arm_stream_templates(struct catpt_dev *cdev);
+
+#endif
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
new file mode 100644
index 000000000000..9fe9b3582d6c
--- /dev/null
+++ b/sound/soc/intel/catpt/device.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+// Special thanks to:
+//    Marcin Barlik <marcin.barlik@intel.com>
+//    Piotr Papierkowski <piotr.papierkowski@intel.com>
+//
+// for sharing LPT-LP and WTP-LP AudioDSP architecture expertise and
+// helping backtrack its historical background
+//
+
+#include <linux/acpi.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/pci.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include "core.h"
+#include "registers.h"
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
+
+static int __maybe_unused catpt_suspend(struct device *dev)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dev);
+	struct dma_chan *chan;
+	int ret;
+
+	chan = catpt_dma_request_config_chan(cdev);
+	if (IS_ERR(chan))
+		return PTR_ERR(chan);
+
+	memset(&cdev->dx_ctx, 0, sizeof(cdev->dx_ctx));
+	ret = catpt_ipc_enter_dxstate(cdev, CATPT_DX_STATE_D3, &cdev->dx_ctx);
+	if (ret) {
+		ret = CATPT_IPC_ERROR(ret);
+		goto exit;
+	}
+
+	ret = catpt_dsp_stall(cdev, true);
+	if (ret)
+		goto exit;
+
+	ret = catpt_store_memdumps(cdev, chan);
+	if (ret) {
+		dev_err(cdev->dev, "store memdumps failed: %d\n", ret);
+		goto exit;
+	}
+
+	ret = catpt_store_module_states(cdev, chan);
+	if (ret) {
+		dev_err(cdev->dev, "store module states failed: %d\n", ret);
+		goto exit;
+	}
+
+	ret = catpt_store_streams_context(cdev, chan);
+	if (ret) {
+		dev_err(cdev->dev, "store streams ctx failed: %d\n", ret);
+		goto exit;
+	}
+exit:
+	dma_release_channel(chan);
+	if (ret)
+		return ret;
+	return cdev->spec->power_down(cdev);
+}
+
+static int __maybe_unused catpt_resume(struct device *dev)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dev);
+	int ret, i;
+
+	ret = cdev->spec->power_up(cdev);
+	if (ret)
+		return ret;
+
+	if (!module_is_live(dev->driver->owner)) {
+		dev_info(dev, "module unloading, skipping fw boot\n");
+		return 0;
+	}
+
+	ret = catpt_boot_firmware(cdev, true);
+	if (ret) {
+		dev_err(cdev->dev, "boot firmware failed: %d\n", ret);
+		return ret;
+	}
+
+	/* reconfigure SSP devices after dx transition */
+	for (i = 0; i < CATPT_SSP_COUNT; i++) {
+		if (cdev->devfmt[i].iface == UINT_MAX)
+			continue;
+
+		ret = catpt_ipc_set_device_format(cdev, &cdev->devfmt[i]);
+		if (ret)
+			return CATPT_IPC_ERROR(ret);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused catpt_runtime_suspend(struct device *dev)
+{
+	return catpt_suspend(dev);
+}
+
+static int __maybe_unused catpt_runtime_resume(struct device *dev)
+{
+	return catpt_resume(dev);
+}
+
+static const struct dev_pm_ops catpt_dev_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(catpt_suspend, catpt_resume)
+	SET_RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_runtime_resume, NULL)
+};
+
+/* machine board owned by CATPT is removed with this hook */
+static void board_pdev_unregister(void *data)
+{
+	platform_device_unregister(data);
+}
+
+static int catpt_register_board(struct catpt_dev *cdev)
+{
+	const struct catpt_spec *spec = cdev->spec;
+	struct snd_soc_acpi_mach *mach;
+	struct platform_device *board;
+
+	mach = snd_soc_acpi_find_machine(spec->machines);
+	if (!mach) {
+		dev_info(cdev->dev, "no machines present\n");
+		return 0;
+	}
+
+	mach->mach_params.platform = "catpt-platform";
+	board = platform_device_register_data(NULL, mach->drv_name,
+					PLATFORM_DEVID_NONE,
+					(const void *)mach, sizeof(*mach));
+	if (IS_ERR(board)) {
+		dev_err(cdev->dev, "board register failed\n");
+		return PTR_ERR(board);
+	}
+
+	return devm_add_action_or_reset(cdev->dev, board_pdev_unregister,
+					board);
+}
+
+static int catpt_probe_components(struct catpt_dev *cdev)
+{
+	int ret;
+
+	ret = cdev->spec->power_up(cdev);
+	if (ret)
+		return ret;
+
+	ret = catpt_dmac_probe(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "DMAC probe failed: %d\n", ret);
+		goto dmac_err;
+	}
+
+	ret = catpt_first_boot_firmware(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "first fw boot failed: %d\n", ret);
+		goto boot_fw_err;
+	}
+
+	ret = catpt_register_plat_component(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "register plat comp failed: %d\n", ret);
+		goto boot_fw_err;
+	}
+
+	ret = catpt_register_board(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "register board failed: %d\n", ret);
+		goto board_err;
+	}
+
+	ret = catpt_sysfs_create(cdev);
+	if (ret)
+		goto board_err;
+
+	/* reflect actual ADSP state in pm_runtime */
+	pm_runtime_set_active(cdev->dev);
+
+	pm_runtime_set_autosuspend_delay(cdev->dev, 2000);
+	pm_runtime_use_autosuspend(cdev->dev);
+	pm_runtime_mark_last_busy(cdev->dev);
+	pm_runtime_enable(cdev->dev);
+	return 0;
+
+board_err:
+	snd_soc_unregister_component(cdev->dev);
+boot_fw_err:
+	catpt_dmac_remove(cdev);
+dmac_err:
+	cdev->spec->power_down(cdev);
+
+	return ret;
+}
+
+static void catpt_dev_init(struct catpt_dev *cdev, struct device *dev,
+			   const struct catpt_spec *spec)
+{
+	cdev->dev = dev;
+	cdev->spec = spec;
+	init_completion(&cdev->fw_ready);
+	INIT_LIST_HEAD(&cdev->stream_list);
+	spin_lock_init(&cdev->list_lock);
+	mutex_init(&cdev->clk_mutex);
+
+	/*
+	 * Mark both device formats as uninitialized. Once corresponding
+	 * cpu_dai's pcm is created, proper values are assigned.
+	 */
+	cdev->devfmt[CATPT_SSP_IFACE_0].iface = UINT_MAX;
+	cdev->devfmt[CATPT_SSP_IFACE_1].iface = UINT_MAX;
+
+	catpt_ipc_init(&cdev->ipc, dev);
+
+	catpt_sram_init(&cdev->dram, spec->host_dram_offset,
+			catpt_dram_size(cdev));
+	catpt_sram_init(&cdev->iram, spec->host_iram_offset,
+			catpt_iram_size(cdev));
+}
+
+static int catpt_acpi_probe(struct platform_device *pdev)
+{
+	const struct catpt_spec *spec;
+	struct catpt_dev *cdev;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int ret;
+
+	spec = device_get_match_data(dev);
+	if (!spec)
+		return -ENODEV;
+
+	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
+	if (!cdev)
+		return -ENOMEM;
+
+	catpt_dev_init(cdev, dev, spec);
+
+	/* map DSP bar address */
+	cdev->lpe_ba = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(cdev->lpe_ba))
+		return PTR_ERR(cdev->lpe_ba);
+	cdev->lpe_base = res->start;
+
+	/* map PCI bar address */
+	cdev->pci_ba = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(cdev->pci_ba))
+		return PTR_ERR(cdev->pci_ba);
+
+	/* alloc buffer for storing DRAM context during dx transitions */
+	cdev->dxbuf_vaddr = dmam_alloc_coherent(dev, catpt_dram_size(cdev),
+						&cdev->dxbuf_paddr, GFP_KERNEL);
+	if (!cdev->dxbuf_vaddr)
+		return -ENOMEM;
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+	cdev->irq = ret;
+
+	platform_set_drvdata(pdev, cdev);
+
+	ret = devm_request_threaded_irq(dev, cdev->irq, catpt_dsp_irq_handler,
+					catpt_dsp_irq_thread,
+					IRQF_SHARED, "AudioDSP", cdev);
+	if (ret)
+		return ret;
+
+	return catpt_probe_components(cdev);
+}
+
+static int catpt_acpi_remove(struct platform_device *pdev)
+{
+	struct catpt_dev *cdev = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(cdev->dev);
+
+	snd_soc_unregister_component(cdev->dev);
+	catpt_dmac_remove(cdev);
+	cdev->spec->power_down(cdev);
+
+	catpt_sram_free(&cdev->iram);
+	catpt_sram_free(&cdev->dram);
+
+	catpt_sysfs_remove(cdev);
+
+	return 0;
+}
+
+static struct catpt_spec lpt_desc = {
+	.machines = snd_soc_acpi_intel_haswell_machines,
+	.core_id = 0x01,
+	.host_dram_offset = 0x000000,
+	.host_iram_offset = 0x080000,
+	.host_shim_offset = 0x0E7000,
+	.host_dma_offset = { 0x0F0000, 0x0F8000 },
+	.host_ssp_offset = { 0x0E8000, 0x0E9000 },
+	.dram_mask = LPT_VDRTCTL0_DSRAMPGE_MASK,
+	.iram_mask = LPT_VDRTCTL0_ISRAMPGE_MASK,
+	.pll_shutdown = lpt_dsp_pll_shutdown,
+	.power_up = lpt_dsp_power_up,
+	.power_down = lpt_dsp_power_down,
+};
+
+static struct catpt_spec wpt_desc = {
+	.machines = snd_soc_acpi_intel_broadwell_machines,
+	.core_id = 0x02,
+	.host_dram_offset = 0x000000,
+	.host_iram_offset = 0x0A0000,
+	.host_shim_offset = 0x0FB000,
+	.host_dma_offset = { 0x0FE000, 0x0FF000 },
+	.host_ssp_offset = { 0x0FC000, 0x0FD000 },
+	.dram_mask = WPT_VDRTCTL0_DSRAMPGE_MASK,
+	.iram_mask = WPT_VDRTCTL0_ISRAMPGE_MASK,
+	.pll_shutdown = wpt_dsp_pll_shutdown,
+	.power_up = wpt_dsp_power_up,
+	.power_down = wpt_dsp_power_down,
+};
+
+static const struct acpi_device_id catpt_ids[] = {
+	{ "INT33C8", (unsigned long)&lpt_desc },
+	{ "INT3438", (unsigned long)&wpt_desc },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, catpt_ids);
+
+static struct platform_driver catpt_acpi_driver = {
+	.probe = catpt_acpi_probe,
+	.remove = catpt_acpi_remove,
+	.driver = {
+		.name = "catpt_adsp",
+		.acpi_match_table = catpt_ids,
+		.pm = &catpt_dev_pm,
+	},
+};
+module_platform_driver(catpt_acpi_driver);
+
+MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
+MODULE_DESCRIPTION("Intel LPT/WPT AudioDSP driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/intel/catpt/registers.h b/sound/soc/intel/catpt/registers.h
new file mode 100644
index 000000000000..47280d82842e
--- /dev/null
+++ b/sound/soc/intel/catpt/registers.h
@@ -0,0 +1,178 @@
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

