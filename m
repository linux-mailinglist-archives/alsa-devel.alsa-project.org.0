Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22802B42C
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B722D15ED;
	Sat, 27 Apr 2019 20:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B722D15ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388213;
	bh=2XOaOGG2a8y7GccMqBigwjYdWO1N+DbD5St8hmC4GKM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jAjh09xnEOlTlViWH63A1TOKYQbAllpiCjddFlEE52jT03/wSamdHVihm6tc/rP2z
	 TRz99B30hrjsuodL+TAJhP6KNIqDLaY6J0QNR7frulFGAqSKxaDXJah/akue33X4Pd
	 EAZY25dII6nGBWuTbgjFtlIl2RPqqC8VUDAO545k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 157CDF89784;
	Sat, 27 Apr 2019 19:54:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0989F89743; Sat, 27 Apr 2019 19:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A01B9F89723;
 Sat, 27 Apr 2019 19:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A01B9F89723
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xPC3Y988"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kuPfb4HSAZxTD71kzutu+/AW0bo38wNRMYFlt+WRi1U=; b=xPC3Y988tVZ7
 lg243PhB4Ag2c8kPj6VnXxdevnfDSkgV9IjGc79a6MWkvs23HklTqUGZTAxrlOfsSnW/ZIZ7s6XTE
 uJFsaZk07pfsfCvs2RVPhBtyHoGSDQYCXbyb7gqmRfsDts39MDAWVnx5DgrZaWcddaIy6m8EpVmgG
 BbKwo=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVN-0004oa-FP; Sat, 27 Apr 2019 17:52:53 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 52C0D441D59; Sat, 27 Apr 2019 18:52:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-17-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175246.52C0D441D59@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:46 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add ACPI device support" to the
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

   ASoC: SOF: Add ACPI device support

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

From cd679898cd323d958b35c014f97c575b4abb8ce2 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:08:59 -0500
Subject: [PATCH] ASoC: SOF: Add ACPI device support

Add support ACPI based SOF DSP devices.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-acpi-dev.c | 312 +++++++++++++++++++++++++++++++++++
 1 file changed, 312 insertions(+)
 create mode 100644 sound/soc/sof/sof-acpi-dev.c

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
new file mode 100644
index 000000000000..e9cf69874b5b
--- /dev/null
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -0,0 +1,312 @@
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
+#include <linux/acpi.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include <sound/sof.h>
+#ifdef CONFIG_X86
+#include <asm/iosf_mbi.h>
+#endif
+
+#include "ops.h"
+
+/* platform specific devices */
+#include "intel/shim.h"
+
+static char *fw_path;
+module_param(fw_path, charp, 0444);
+MODULE_PARM_DESC(fw_path, "alternate path for SOF firmware.");
+
+static char *tplg_path;
+module_param(tplg_path, charp, 0444);
+MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HASWELL)
+static const struct sof_dev_desc sof_acpi_haswell_desc = {
+	.machines = snd_soc_acpi_intel_haswell_machines,
+	.resindex_lpe_base = 0,
+	.resindex_pcicfg_base = 1,
+	.resindex_imr_base = -1,
+	.irqindex_host_ipc = 0,
+	.chip_info = &hsw_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-hsw.ri",
+	.nocodec_tplg_filename = "sof-hsw-nocodec.tplg",
+	.ops = &sof_hsw_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+static const struct sof_dev_desc sof_acpi_broadwell_desc = {
+	.machines = snd_soc_acpi_intel_broadwell_machines,
+	.resindex_lpe_base = 0,
+	.resindex_pcicfg_base = 1,
+	.resindex_imr_base = -1,
+	.irqindex_host_ipc = 0,
+	.chip_info = &bdw_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-bdw.ri",
+	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
+	.ops = &sof_bdw_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+
+/* BYTCR uses different IRQ index */
+static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
+	.machines = snd_soc_acpi_intel_baytrail_machines,
+	.resindex_lpe_base = 0,
+	.resindex_pcicfg_base = 1,
+	.resindex_imr_base = 2,
+	.irqindex_host_ipc = 0,
+	.chip_info = &byt_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-byt.ri",
+	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
+	.ops = &sof_byt_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+
+static const struct sof_dev_desc sof_acpi_baytrail_desc = {
+	.machines = snd_soc_acpi_intel_baytrail_machines,
+	.resindex_lpe_base = 0,
+	.resindex_pcicfg_base = 1,
+	.resindex_imr_base = 2,
+	.irqindex_host_ipc = 5,
+	.chip_info = &byt_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-byt.ri",
+	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
+	.ops = &sof_byt_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+
+#ifdef CONFIG_X86 /* TODO: move this to common helper */
+
+static bool is_byt_cr(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int status;
+
+	if (iosf_mbi_available()) {
+		u32 bios_status;
+		status = iosf_mbi_read(BT_MBI_UNIT_PMC, /* 0x04 PUNIT */
+				       MBI_REG_READ, /* 0x10 */
+				       0x006, /* BIOS_CONFIG */
+				       &bios_status);
+
+		if (status) {
+			dev_err(dev, "could not read PUNIT BIOS_CONFIG\n");
+		} else {
+			/* bits 26:27 mirror PMIC options */
+			bios_status = (bios_status >> 26) & 3;
+
+			if (bios_status == 1 || bios_status == 3) {
+				dev_info(dev, "Detected Baytrail-CR platform\n");
+				return true;
+			}
+
+			dev_info(dev, "BYT-CR not detected\n");
+		}
+	} else {
+		dev_info(dev, "IOSF_MBI not available, no BYT-CR detection\n");
+	}
+
+	if (platform_get_resource(pdev, IORESOURCE_IRQ, 5) == NULL) {
+		/*
+		 * Some devices detected as BYT-T have only a single IRQ listed,
+		 * causing platform_get_irq with index 5 to return -ENXIO.
+		 * The correct IRQ in this case is at index 0, as on BYT-CR.
+		 */
+		dev_info(dev, "Falling back to Baytrail-CR platform\n");
+		return true;
+	}
+
+	return false;
+}
+#else
+static int is_byt_cr(struct platform_device *pdev)
+{
+	return 0;
+}
+#endif
+
+static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
+	.machines = snd_soc_acpi_intel_cherrytrail_machines,
+	.resindex_lpe_base = 0,
+	.resindex_pcicfg_base = 1,
+	.resindex_imr_base = 2,
+	.irqindex_host_ipc = 5,
+	.chip_info = &cht_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-cht.ri",
+	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
+	.ops = &sof_cht_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+
+#endif
+
+static const struct dev_pm_ops sof_acpi_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
+	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
+			   NULL)
+};
+
+static void sof_acpi_probe_complete(struct device *dev)
+{
+	/* allow runtime_pm */
+	pm_runtime_set_autosuspend_delay(dev, SND_SOF_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+}
+
+static int sof_acpi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct sof_dev_desc *desc;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_sof_pdata *sof_pdata;
+	const struct snd_sof_dsp_ops *ops;
+	int ret;
+
+	dev_dbg(&pdev->dev, "ACPI DSP detected");
+
+	sof_pdata = devm_kzalloc(dev, sizeof(*sof_pdata), GFP_KERNEL);
+	if (!sof_pdata)
+		return -ENOMEM;
+
+	desc = device_get_match_data(dev);
+	if (!desc)
+		return -ENODEV;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+	if (desc == &sof_acpi_baytrail_desc && is_byt_cr(pdev))
+		desc = &sof_acpi_baytrailcr_desc;
+#endif
+
+	/* get ops for platform */
+	ops = desc->ops;
+	if (!ops) {
+		dev_err(dev, "error: no matching ACPI descriptor ops\n");
+		return -ENODEV;
+	}
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
+	/* force nocodec mode */
+	dev_warn(dev, "Force to use nocodec mode\n");
+	mach = devm_kzalloc(dev, sizeof(*mach), GFP_KERNEL);
+	if (!mach)
+		return -ENOMEM;
+	ret = sof_nocodec_setup(dev, sof_pdata, mach, desc, ops);
+	if (ret < 0)
+		return ret;
+#else
+	/* find machine */
+	mach = snd_soc_acpi_find_machine(desc->machines);
+	if (!mach) {
+		dev_warn(dev, "warning: No matching ASoC machine driver found\n");
+	} else {
+		sof_pdata->fw_filename = mach->sof_fw_filename;
+		sof_pdata->tplg_filename = mach->sof_tplg_filename;
+	}
+#endif
+
+	if (mach) {
+		mach->mach_params.platform = dev_name(dev);
+		mach->mach_params.acpi_ipc_irq_index = desc->irqindex_host_ipc;
+	}
+
+	sof_pdata->machine = mach;
+	sof_pdata->desc = desc;
+	sof_pdata->dev = &pdev->dev;
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
+	sof_pdata->sof_probe_complete = sof_acpi_probe_complete;
+#endif
+	/* call sof helper for DSP hardware probe */
+	ret = snd_sof_device_probe(dev, sof_pdata);
+	if (ret) {
+		dev_err(dev, "error: failed to probe DSP hardware!\n");
+		return ret;
+	}
+
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
+	sof_acpi_probe_complete(dev);
+#endif
+
+	return ret;
+}
+
+static int sof_acpi_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	/* call sof helper for DSP hardware remove */
+	snd_sof_device_remove(&pdev->dev);
+
+	return 0;
+}
+
+static const struct acpi_device_id sof_acpi_match[] = {
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HASWELL)
+	{ "INT33C8", (unsigned long)&sof_acpi_haswell_desc },
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+	{ "INT3438", (unsigned long)&sof_acpi_broadwell_desc },
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+	{ "80860F28", (unsigned long)&sof_acpi_baytrail_desc },
+	{ "808622A8", (unsigned long)&sof_acpi_cherrytrail_desc },
+#endif
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, sof_acpi_match);
+
+/* acpi_driver definition */
+static struct platform_driver snd_sof_acpi_driver = {
+	.probe = sof_acpi_probe,
+	.remove = sof_acpi_remove,
+	.driver = {
+		.name = "sof-audio-acpi",
+		.pm = &sof_acpi_pm,
+		.acpi_match_table = ACPI_PTR(sof_acpi_match),
+	},
+};
+module_platform_driver(snd_sof_acpi_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
