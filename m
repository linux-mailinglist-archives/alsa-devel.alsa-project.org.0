Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB11099F0D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:40:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B472950;
	Thu, 22 Aug 2019 20:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B472950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566499258;
	bh=p3DrSwKnOT1YSnwUS/uU5FL1FqZ7IleJQi01U4bF7PI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UBNTyYVfHr6jk5ykoDvOi6Pv1R+D/8qCbRRDSNSC9wxXRSCLLD0jt5UIWukY2m8jm
	 0fflvrDd2oiGVrFivLGhRoWrdaj7JXk8O4PvbLYnSzTyqHeAHWxfe1R2LnKMP45yba
	 Rm9JaRqIBWwdjLsPgH5PkBCqxe17YoRkoAP+WgJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58811F80673;
	Thu, 22 Aug 2019 20:33:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AA2DF80611; Thu, 22 Aug 2019 20:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF04FF805F6
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF04FF805F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tsKeUqyq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=C2lMqTFvDmosDIog22xvM6Xk2xx+WSAG4fQOvcDUIm0=; b=tsKeUqyq7fuL
 2zaTBhRSUeLyC/8aPNerVe9/av2g3dKkSMGHrVhW7k8i3EwDuT2ppO4mp4vzVgY88OAc1G0tjtz8f
 8YThIZjZFwXA81BJ1d1TtYMPB9ztzVrnPZ//MQkdZ6kr1DfeJuM4S7ia9AaP/Asc6XaIpq7R2Epav
 150ow=;
Received: from 92.40.26.78.threembb.co.uk ([92.40.26.78]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i0rtR-0007fl-K7; Thu, 22 Aug 2019 18:33:06 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 75E0AD02CE9; Thu, 22 Aug 2019 19:32:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190821164730.7385-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190822183257.75E0AD02CE9@fitzroy.sirena.org.uk>
Date: Thu, 22 Aug 2019 19:32:57 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, tiwai@suse.de, shengjiu.wang@nxp.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 nicoleotsuka@gmail.com, Mark Brown <broonie@kernel.org>, linux-imx@nxp.com,
 viorel.suman@nxp.com, festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: SOF: Add OF DSP device support" to the
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

   ASoC: SOF: Add OF DSP device support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From b9132b89933177286fb427bd03affcebc4d649e1 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 21 Aug 2019 11:47:29 -0500
Subject: [PATCH] ASoC: SOF: Add OF DSP device support

Add support for device tree based SOF DSP devices.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190821164730.7385-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Kconfig      |  10 +++
 sound/soc/sof/Makefile     |   3 +
 sound/soc/sof/sof-of-dev.c | 143 +++++++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 sound/soc/sof/sof-of-dev.c

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index fb01f0ca6027..01acb580b817 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -36,6 +36,16 @@ config SND_SOC_SOF_ACPI
 	  Say Y if you need this option
 	  If unsure select "N".
 
+config SND_SOC_SOF_OF
+	tristate "SOF OF enumeration support"
+	depends on OF || COMPILE_TEST
+	select SND_SOC_SOF
+	select SND_SOC_SOF_OPTIONS
+	help
+	  This adds support for Device Tree enumeration. This option is
+	  required to enable i.MX8 devices.
+	  Say Y if you need this option. If unsure select "N".
+
 config SND_SOC_SOF_OPTIONS
 	tristate
 	help
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 585fb6917489..772c452d1ae2 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -5,6 +5,8 @@ snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 
 snd-sof-pci-objs := sof-pci-dev.o
 snd-sof-acpi-objs := sof-acpi-dev.o
+snd-sof-of-objs := sof-of-dev.o
+
 snd-sof-nocodec-objs := nocodec.o
 
 obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
@@ -12,6 +14,7 @@ obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
 
 
 obj-$(CONFIG_SND_SOC_SOF_ACPI) += snd-sof-acpi.o
+obj-$(CONFIG_SND_SOC_SOF_OF) += snd-sof-of.o
 obj-$(CONFIG_SND_SOC_SOF_PCI) += snd-sof-pci.o
 
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
new file mode 100644
index 000000000000..28a9692974e5
--- /dev/null
+++ b/sound/soc/sof/sof-of-dev.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// Copyright 2019 NXP
+//
+// Author: Daniel Baluta <daniel.baluta@nxp.com>
+//
+
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <sound/sof.h>
+
+#include "ops.h"
+
+extern struct snd_sof_dsp_ops sof_imx8_ops;
+
+/* platform specific devices */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
+static struct sof_dev_desc sof_of_imx8qxp_desc = {
+	.default_fw_path = "imx/sof",
+	.default_tplg_path = "imx/sof-tplg",
+	.nocodec_fw_filename = "sof-imx8.ri",
+	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
+	.ops = &sof_imx8_ops,
+};
+#endif
+
+static const struct dev_pm_ops sof_of_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
+	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
+			   NULL)
+};
+
+static void sof_of_probe_complete(struct device *dev)
+{
+	/* allow runtime_pm */
+	pm_runtime_set_autosuspend_delay(dev, SND_SOF_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+}
+
+static int sof_of_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct sof_dev_desc *desc;
+	/*TODO: create a generic snd_soc_xxx_mach */
+	struct snd_soc_acpi_mach *mach;
+	struct snd_sof_pdata *sof_pdata;
+	const struct snd_sof_dsp_ops *ops;
+	int ret;
+
+	dev_info(&pdev->dev, "DT DSP detected");
+
+	sof_pdata = devm_kzalloc(dev, sizeof(*sof_pdata), GFP_KERNEL);
+	if (!sof_pdata)
+		return -ENOMEM;
+
+	desc = device_get_match_data(dev);
+	if (!desc)
+		return -ENODEV;
+
+	/* get ops for platform */
+	ops = desc->ops;
+	if (!ops) {
+		dev_err(dev, "error: no matching DT descriptor ops\n");
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
+	/* TODO: implement case where we actually have a codec */
+	return -ENODEV;
+#endif
+
+	if (mach)
+		mach->mach_params.platform = dev_name(dev);
+
+	sof_pdata->machine = mach;
+	sof_pdata->desc = desc;
+	sof_pdata->dev = &pdev->dev;
+	sof_pdata->platform = dev_name(dev);
+
+	/* TODO: read alternate fw and tplg filenames from DT */
+	sof_pdata->fw_filename_prefix = sof_pdata->desc->default_fw_path;
+	sof_pdata->tplg_filename_prefix = sof_pdata->desc->default_tplg_path;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
+	/* set callback to enable runtime_pm */
+	sof_pdata->sof_probe_complete = sof_of_probe_complete;
+#endif
+	 /* call sof helper for DSP hardware probe */
+	ret = snd_sof_device_probe(dev, sof_pdata);
+	if (ret) {
+		dev_err(dev, "error: failed to probe DSP hardware\n");
+		return ret;
+	}
+
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
+	sof_of_probe_complete(dev);
+#endif
+
+	return ret;
+}
+
+static int sof_of_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	/* call sof helper for DSP hardware remove */
+	snd_sof_device_remove(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id sof_of_ids[] = {
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
+	{ .compatible = "fsl,imx8qxp-dsp", .data = &sof_of_imx8qxp_desc},
+#endif
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sof_of_ids);
+
+/* DT driver definition */
+static struct platform_driver snd_sof_of_driver = {
+	.probe = sof_of_probe,
+	.remove = sof_of_remove,
+	.driver = {
+		.name = "sof-audio-of",
+		.pm = &sof_of_pm,
+		.of_match_table = sof_of_ids,
+	},
+};
+module_platform_driver(snd_sof_of_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
