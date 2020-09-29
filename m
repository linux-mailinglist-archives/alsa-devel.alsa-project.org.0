Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7923227D0ED
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 16:19:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFD3B1905;
	Tue, 29 Sep 2020 16:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFD3B1905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601389156;
	bh=RV3/hgWfd6yETKtRyr9FIp2/YAItxjlyb8Qf95ENurQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a4E1ARkbP/D34l3WwfId9v+baaGrnLoSAE3M89u68fa3FVauaqPWifbjUy10im4f5
	 shwZbB4kMzL/td0tJyqtJSLegSOtzwjbRe3T5sk5xRkMIYdncFT0ad0ORfRUHYpXpr
	 Lst/9rWX/qDgIOTizyr6aulzyj71jEmvxNHUKMck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4BC8F80331;
	Tue, 29 Sep 2020 16:14:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EAFEF8033F; Tue, 29 Sep 2020 16:14:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89330F80334
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 16:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89330F80334
IronPort-SDR: tR4xvZZ2AOUMQMMlLemlqcEWexYAlUI+xWWAdiWnqeG0buyP839q8cr5ZNR4FcRByn7yb+zd13
 /PwyQqECQX/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="223788226"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="223788226"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 07:13:54 -0700
IronPort-SDR: 1oJZCwqlYgrA1tW9Iv88MATCPtVMnaUiaZhkuKyzndmIjJN3XHF2I0SHZzfOcg8vKqKjSJE9SK
 uQI9SG5X3Htw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="457294408"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 29 Sep 2020 07:13:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v10 07/14] ASoC: Intel: catpt: Device driver lifecycle
Date: Tue, 29 Sep 2020 16:12:40 +0200
Message-Id: <20200929141247.8058-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929141247.8058-1-cezary.rojewski@intel.com>
References: <20200929141247.8058-1-cezary.rojewski@intel.com>
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

Implement ACPI device probing and removal functions as well as handlers
for its PM capabilities. Device probing also takes care of enumerating
ADSP subsystem components.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/device.c | 348 +++++++++++++++++++++++++++++++++
 1 file changed, 348 insertions(+)
 create mode 100644 sound/soc/intel/catpt/device.c

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
new file mode 100644
index 000000000000..96a4c1584720
--- /dev/null
+++ b/sound/soc/intel/catpt/device.c
@@ -0,0 +1,348 @@
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
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include "core.h"
+#include "registers.h"
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
+		goto release_dma_chan;
+	}
+
+	ret = catpt_dsp_stall(cdev, true);
+	if (ret)
+		goto release_dma_chan;
+
+	ret = catpt_store_memdumps(cdev, chan);
+	if (ret) {
+		dev_err(cdev->dev, "store memdumps failed: %d\n", ret);
+		goto release_dma_chan;
+	}
+
+	ret = catpt_store_module_states(cdev, chan);
+	if (ret) {
+		dev_err(cdev->dev, "store module states failed: %d\n", ret);
+		goto release_dma_chan;
+	}
+
+	ret = catpt_store_streams_context(cdev, chan);
+	if (ret)
+		dev_err(cdev->dev, "store streams ctx failed: %d\n", ret);
+
+release_dma_chan:
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
+	/* reconfigure SSP devices after Dx transition */
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
+	if (!module_is_live(dev->driver->owner)) {
+		dev_info(dev, "module unloading, skipping suspend\n");
+		return 0;
+	}
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
+		goto err_dmac_probe;
+	}
+
+	ret = catpt_first_boot_firmware(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "first fw boot failed: %d\n", ret);
+		goto err_boot_fw;
+	}
+
+	ret = catpt_register_plat_component(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "register plat comp failed: %d\n", ret);
+		goto err_boot_fw;
+	}
+
+	ret = catpt_register_board(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "register board failed: %d\n", ret);
+		goto err_reg_board;
+	}
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
+err_reg_board:
+	snd_soc_unregister_component(cdev->dev);
+err_boot_fw:
+	catpt_dmac_remove(cdev);
+err_dmac_probe:
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
+		.name = "intel_catpt",
+		.acpi_match_table = catpt_ids,
+		.pm = &catpt_dev_pm,
+	},
+};
+module_platform_driver(catpt_acpi_driver);
+
+MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
+MODULE_DESCRIPTION("Intel LPT/WPT AudioDSP driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

