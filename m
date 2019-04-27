Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C987B42B
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EADE31645;
	Sat, 27 Apr 2019 20:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EADE31645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388166;
	bh=96M3tR7XreQx7a5B/rRtLKWhWQKynLr4dSEPkRmaU/g=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bd9rmwNWsD4QXrTYTtH7G3gCJHJkIa5CCYT/pCEpdYz7OYQrQB5yImeWfqIwvHaAZ
	 OZlOlhLgSYHNaJ5lCtHff3AOXVKtJAK2r+hi3/CIlb8GbFxl3iSi8ftGfMLty5be0j
	 Ln5/bmDgkvF2TgCIhlmpLkACkIOeE6pEC/ZPNJeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DBCDF89779;
	Sat, 27 Apr 2019 19:54:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65DD8F89747; Sat, 27 Apr 2019 19:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D945F89721;
 Sat, 27 Apr 2019 19:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D945F89721
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MWUv6MXP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=0yeu4lDOTQQBuJFUVnat+Ercht2nri2xPq87P4C5jk8=; b=MWUv6MXPgOp6
 owos5JqGbRXaUa4ZerTUO02c/JgN1H0UNoRqfUndrHNfiD/dwQdcTxcrs/Fkdp5LymONDGykSSKSH
 AWXBSN+Kt/pP6apXrNAdYy6TEe20x1rFoYDt6BFpzggufrySuZLAXzbMlKJ6Q/SeignWUcsk5C5tC
 KGKHE=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVM-0004oP-QN; Sat, 27 Apr 2019 17:52:53 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id BCD90441D58; Sat, 27 Apr 2019 18:52:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-18-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175245.BCD90441D58@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:45 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add PCI device support" to the
	asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Add PCI device support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a226893b85b3c35f6c7c168beb28de738211164a Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:09:00 -0500
Subject: [PATCH] ASoC: SOF: Add PCI device support

Add support for PCI based DSP devices.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 373 ++++++++++++++++++++++++++++++++++++
 1 file changed, 373 insertions(+)
 create mode 100644 sound/soc/sof/sof-pci-dev.c

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
new file mode 100644
index 000000000000..b778dffb2d25
--- /dev/null
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//
+
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/pm_runtime.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include <sound/sof.h>
+#include "ops.h"
+
+/* platform specific devices */
+#include "intel/shim.h"
+#include "intel/hda.h"
+
+static char *fw_path;
+module_param(fw_path, charp, 0444);
+MODULE_PARM_DESC(fw_path, "alternate path for SOF firmware.");
+
+static char *tplg_path;
+module_param(tplg_path, charp, 0444);
+MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
+static const struct sof_dev_desc bxt_desc = {
+	.machines		= snd_soc_acpi_intel_bxt_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.resindex_dma_base	= -1,
+	.chip_info = &apl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-apl.ri",
+	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
+	.ops = &sof_apl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
+static const struct sof_dev_desc glk_desc = {
+	.machines		= snd_soc_acpi_intel_glk_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.resindex_dma_base	= -1,
+	.chip_info = &apl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-glk.ri",
+	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
+	.ops = &sof_apl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
+static struct snd_soc_acpi_mach sof_tng_machines[] = {
+	{
+		.id = "INT343A",
+		.drv_name = "edison",
+		.sof_fw_filename = "sof-byt.ri",
+		.sof_tplg_filename = "sof-byt.tplg",
+	},
+	{}
+};
+
+static const struct sof_dev_desc tng_desc = {
+	.machines		= sof_tng_machines,
+	.resindex_lpe_base	= 3,	/* IRAM, but subtract IRAM offset */
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= 0,
+	.irqindex_host_ipc	= -1,
+	.resindex_dma_base	= -1,
+	.chip_info = &tng_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-byt.ri",
+	.nocodec_tplg_filename = "sof-byt.tplg",
+	.ops = &sof_tng_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
+static const struct sof_dev_desc cnl_desc = {
+	.machines		= snd_soc_acpi_intel_cnl_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.resindex_dma_base	= -1,
+	.chip_info = &cnl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-cnl.ri",
+	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
+	.ops = &sof_cnl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
+static const struct sof_dev_desc cfl_desc = {
+	.machines		= snd_soc_acpi_intel_cnl_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.resindex_dma_base	= -1,
+	.chip_info = &cnl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-cnl.ri",
+	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
+	.ops = &sof_cnl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
+static const struct sof_dev_desc icl_desc = {
+	.machines               = snd_soc_acpi_intel_icl_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.resindex_dma_base      = -1,
+	.chip_info = &cnl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-icl.ri",
+	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
+	.ops = &sof_cnl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_SKYLAKE)
+static const struct sof_dev_desc skl_desc = {
+	.machines		= snd_soc_acpi_intel_skl_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.resindex_dma_base	= -1,
+	.chip_info = &skl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-skl.ri",
+	.nocodec_tplg_filename = "sof-skl-nocodec.tplg",
+	.ops = &sof_skl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_KABYLAKE)
+static const struct sof_dev_desc kbl_desc = {
+	.machines		= snd_soc_acpi_intel_kbl_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.resindex_dma_base	= -1,
+	.chip_info = &skl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-kbl.ri",
+	.nocodec_tplg_filename = "sof-kbl-nocodec.tplg",
+	.ops = &sof_skl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+static const struct dev_pm_ops sof_pci_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
+	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
+			   NULL)
+};
+
+static void sof_pci_probe_complete(struct device *dev)
+{
+	dev_dbg(dev, "Completing SOF PCI probe");
+
+	/* allow runtime_pm */
+	pm_runtime_set_autosuspend_delay(dev, SND_SOF_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+
+	/*
+	 * runtime pm for pci device is "forbidden" by default.
+	 * so call pm_runtime_allow() to enable it.
+	 */
+	pm_runtime_allow(dev);
+
+	/* follow recommendation in pci-driver.c to decrement usage counter */
+	pm_runtime_put_noidle(dev);
+}
+
+static int sof_pci_probe(struct pci_dev *pci,
+			 const struct pci_device_id *pci_id)
+{
+	struct device *dev = &pci->dev;
+	const struct sof_dev_desc *desc =
+		(const struct sof_dev_desc *)pci_id->driver_data;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_sof_pdata *sof_pdata;
+	const struct snd_sof_dsp_ops *ops;
+	int ret;
+
+	dev_dbg(&pci->dev, "PCI DSP detected");
+
+	/* get ops for platform */
+	ops = desc->ops;
+	if (!ops) {
+		dev_err(dev, "error: no matching PCI descriptor ops\n");
+		return -ENODEV;
+	}
+
+	sof_pdata = devm_kzalloc(dev, sizeof(*sof_pdata), GFP_KERNEL);
+	if (!sof_pdata)
+		return -ENOMEM;
+
+	ret = pcim_enable_device(pci);
+	if (ret < 0)
+		return ret;
+
+	ret = pci_request_regions(pci, "Audio DSP");
+	if (ret < 0)
+		return ret;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
+	/* force nocodec mode */
+	dev_warn(dev, "Force to use nocodec mode\n");
+	mach = devm_kzalloc(dev, sizeof(*mach), GFP_KERNEL);
+	if (!mach) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+	ret = sof_nocodec_setup(dev, sof_pdata, mach, desc, ops);
+	if (ret < 0)
+		goto release_regions;
+
+#else
+	/* find machine */
+	mach = snd_soc_acpi_find_machine(desc->machines);
+	if (!mach) {
+		dev_warn(dev, "warning: No matching ASoC machine driver found\n");
+	} else {
+		mach->mach_params.platform = dev_name(dev);
+		sof_pdata->fw_filename = mach->sof_fw_filename;
+		sof_pdata->tplg_filename = mach->sof_tplg_filename;
+	}
+#endif /* CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE */
+
+	sof_pdata->name = pci_name(pci);
+	sof_pdata->machine = mach;
+	sof_pdata->desc = (struct sof_dev_desc *)pci_id->driver_data;
+	sof_pdata->dev = dev;
+	sof_pdata->platform = dev_name(dev);
+
+	/* alternate fw and tplg filenames ? */
+	if (fw_path)
+		sof_pdata->fw_filename_prefix = fw_path;
+	else
+		sof_pdata->fw_filename_prefix =
+			sof_pdata->desc->default_fw_path;
+
+	if (tplg_path)
+		sof_pdata->tplg_filename_prefix = tplg_path;
+	else
+		sof_pdata->tplg_filename_prefix =
+			sof_pdata->desc->default_tplg_path;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
+	/* set callback to enable runtime_pm */
+	sof_pdata->sof_probe_complete = sof_pci_probe_complete;
+#endif
+	/* call sof helper for DSP hardware probe */
+	ret = snd_sof_device_probe(dev, sof_pdata);
+	if (ret) {
+		dev_err(dev, "error: failed to probe DSP hardware!\n");
+		goto release_regions;
+	}
+
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
+	sof_pci_probe_complete(dev);
+#endif
+
+	return ret;
+
+release_regions:
+	pci_release_regions(pci);
+
+	return ret;
+}
+
+static void sof_pci_remove(struct pci_dev *pci)
+{
+	/* call sof helper for DSP hardware remove */
+	snd_sof_device_remove(&pci->dev);
+
+	/* follow recommendation in pci-driver.c to increment usage counter */
+	pm_runtime_get_noresume(&pci->dev);
+
+	/* release pci regions and disable device */
+	pci_release_regions(pci);
+}
+
+/* PCI IDs */
+static const struct pci_device_id sof_pci_ids[] = {
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
+	{ PCI_DEVICE(0x8086, 0x119a),
+		.driver_data = (unsigned long)&tng_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
+	/* BXT-P & Apollolake */
+	{ PCI_DEVICE(0x8086, 0x5a98),
+		.driver_data = (unsigned long)&bxt_desc},
+	{ PCI_DEVICE(0x8086, 0x1a98),
+		.driver_data = (unsigned long)&bxt_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
+	{ PCI_DEVICE(0x8086, 0x3198),
+		.driver_data = (unsigned long)&glk_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
+	{ PCI_DEVICE(0x8086, 0x9dc8),
+		.driver_data = (unsigned long)&cnl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
+	{ PCI_DEVICE(0x8086, 0xa348),
+		.driver_data = (unsigned long)&cfl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_KABYLAKE)
+	{ PCI_DEVICE(0x8086, 0x9d71),
+		.driver_data = (unsigned long)&kbl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_SKYLAKE)
+	{ PCI_DEVICE(0x8086, 0x9d70),
+		.driver_data = (unsigned long)&skl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
+	{ PCI_DEVICE(0x8086, 0x34C8),
+		.driver_data = (unsigned long)&icl_desc},
+#endif
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, sof_pci_ids);
+
+/* pci_driver definition */
+static struct pci_driver snd_sof_pci_driver = {
+	.name = "sof-audio-pci",
+	.id_table = sof_pci_ids,
+	.probe = sof_pci_probe,
+	.remove = sof_pci_remove,
+	.driver = {
+		.pm = &sof_pci_pm,
+	},
+};
+module_pci_driver(snd_sof_pci_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
